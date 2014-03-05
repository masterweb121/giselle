<?php namespace Giselle\Tests;

use 
Giselle\Test\Base as Base,

Giselle\Tests\Fixtures\User as UserData,

Giselle\Helpers\Navigator,
Guzzle\Http\Client,
Guzzle\Plugin\Cookie\CookiePlugin,
Guzzle\Plugin\Cookie\CookieJar\ArrayCookieJar;

class UserHasLoggedInTest extends Base {

	protected 
	$di, $memcacheKey, 
	$cookieName = 'secureauthcookie', // if name is changed in more-security.php testCookieExistence will fail
	$dummyPassword = 'dummydummy';

	public function setUp() {

		parent::setUp();

		$this->di = \Phalcon\DI::getDefault();
		// create a user
		$this->createPasswordedDummy();
	}

	protected function createPasswordedDummy() {

		$this->createDummyUser();
		// need a hashed password due to auth component
		$this->dummy->update(array('password' => $this->di->get('security')->hash($this->dummyPassword))); 
	}

	public function tearDown() {

		parent::tearDown();
		$this->deleteDummyUser();
	}

	protected function includeMoreSecurity() {

		$_SERVER["REMOTE_ADDR"] = '127.0.0.1';
		$config = $this->di->getConfig();
		$user = $this->dummy;
		include $config->application->vendorDir . 'more-security.php';

		$this->memcacheKey = $key;		 
	}

	public function _testMemcacheKey() {

		$this->includeMoreSecurity();

		$memcache = $this->di->get('MoreSecurityMemcache');
		$this->assertTrue(is_string($memcache->get($this->memcacheKey)));
		$this->di->get('MoreSecurityMemcache')->delete($this->memcacheKey);
	}

	public function testAuthCookieLifeAndDeath() {

		$navigator = Navigator::on('http://' . $this->di->get('config')->application->publicUrl, array('redirect.disable' => false));
		// notify app that this request is in test mode; app should implement an propper behaviour when tested
		$navigator->client()->setDefaultOption('headers/Test-Docadmin', '1');
		// SHOULD be no cookies yet
		$this->assertEmpty($navigator->cookies());

		// go to login form, grab csrf
		$csrf = $navigator->get('/session/login')->findById('csrf')->getAttribute('value');
		// at least phpsesid should be here
		$this->assertNotEmpty($navigator->cookies());

		// authenticate
		$params = array(
	    	'email' => $this->dummy->email, 
	    	'password' => $this->dummyPassword,
	    	'csrf'=> $csrf
	    );
		$hasCookie = $navigator->post('/session/login', $params)->hasCookie($this->cookieName);
		// our auth cookie has to be here
		$this->assertTrue($hasCookie);

		// logout now
		$hasCookie = $navigator->get('/session/logout')->hasCookie($this->cookieName);
		// our auth cookie has to be no more
		$this->assertTrue( ! $hasCookie);
	}
}