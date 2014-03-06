<?php namespace Giselle\Models;

use \Phalcon\Mvc\Model;

class Cities extends Model
{
	public
	$id, $states_id, $name, $_main;

	public function initialize(){

		$this->setSource('cities');
	}

	public function findMain($options = array()) {

		$options = array('conditions' => 'main = true');
		static::find($options);
	}
}