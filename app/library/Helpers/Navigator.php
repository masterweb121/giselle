<?php namespace Giselle\Helpers;

use Guzzle\Http\Client,
Guzzle\Plugin\Cookie\CookiePlugin,
Guzzle\Plugin\Cookie\CookieJar\ArrayCookieJar;

/* 
* Sample: 
* Navigator::on('http://sample.com')->get('/my-page')->findById('id')
*/

class Navigator {

	protected
	$cookieJar, $cookiePlugin, $client, $response,

	$doc, $xpath, $html;

	public static function on($url, $options = null) {

		$instance = new static;

		// all requests will share same cookies
		$instance->cookieJar = new ArrayCookieJar();
		$instance->cookiePlugin = new CookiePlugin($instance->cookieJar);
		$instance->client = new Client($url, $options);
		$instance->client->addSubscriber($instance->cookiePlugin);

		return $instance;
	}

	public function get($uri) {

		// visit like a browser by GET to set in place csrf
		$this->response = $this->client->get($uri)->send();

		return $this;
	}

	public function dom($selector = null) {

		$this->html = is_null($this->html)
		? $this->response->getBody()
		: $this->html;

		if (is_null($this->doc)) {
			$this->doc = new \DOMDocument();
			// malformed html will issues warnings
			@$this->doc->loadHTML($this->html . '');
		}

		if (is_null($this->xpath)) {
			$this->xpath = new \DOMXpath($this->doc);
		}

		if (is_null($selector))
			return $this->doc;
		else
			return $this->xpath->query($selector);

	}

	public function post($uri, $params = null) {

		$request = $this->client->post(
			$uri, null, $params
		);

		$this->response = $request->send();

		return $this;
	}

	public function cookies() {

		return $this->cookieJar->all();
	}

	public function hasCookie($cookieName) {

		$hasCookie = false;

		$cookies = $this->cookieJar->all();
		foreach($cookies as $cookie) {
			if ($cookie->getName() == $cookieName){
				$hasCookie = true;
				break;
			}
		}

		return $hasCookie;
	}


	public function response() {

		return is_null($this->response)
		? null
		: $this->response;
	}

	public function client() {
		
		return $this->client;
	}

	public function findById($id) {

		if (is_null($this->doc))
			$this->dom();

		$obj = $this->doc->getElementById($id);

		return $obj;
	}

}	