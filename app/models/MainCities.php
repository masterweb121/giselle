<?php namespace Giselle\Models;

use \Phalcon\Mvc\Model;

class MainCities extends Model
{
	public
	$id, $states_id, $name, $_main;

	public function initialize(){

		$this->setSource('main_cities');
	}
}