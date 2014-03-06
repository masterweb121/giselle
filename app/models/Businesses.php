<?php namespace Giselle\Models;

use \Phalcon\Mvc\Model;

class Businesses extends Model
{
	public
	$id, $name;

	public function initialize(){

		$this->setSource('businesses');
	}
}