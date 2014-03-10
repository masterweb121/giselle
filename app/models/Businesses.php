<?php namespace Giselle\Models;

use 
Phalcon\Mvc\Model,
Phalcon\Mvc\Model\Query\Builder;

class Businesses extends Model
{
	public
	$id, $name, $lat, $lng, $categories_id, $categories_parent_id;

	public function initialize(){

		$this->setSource('businesses');
	}
}