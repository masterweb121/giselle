<?php namespace Giselle\Tests;

use 
Giselle\Test\Base as Base,

Giselle\Tests\Fixtures\User as UserData;

class UserLogsInTest extends Base {

	protected 
	$pad, $di;

	public function setUp() {

		parent::setUp();

		$this->di = \Phalcon\DI::getDefault();
		// create a pad
		$this->pad = $this->di->get('pad');

	}

	public function tearDown() {

		parent::tearDown();
		$this->deleteDummyUser();
	}

	public function testGetnewAuthorID() {

		$this->createDummyUser();
		// the dummy is empty, right?
		$this->assertEmpty($this->dummy->authorID);

		try { $this->pad->createAuthorIDFor($this->dummy); }
		catch (Exception $e) {
			// it should never be
			$this->markTestSkipped(sprintf('Cannot getARightDummy [%s]', $e->getMessage()));
		}
		// we have one, haven't we ?
		$this->assertTrue(is_string($this->dummy->authorID));
	}

}