<?php namespace Giselle\Models;

use 
Phalcon\Mvc\Model, 
Phalcon\Db;

class Cities extends Model
{
	public
	$id, $states_id, $name, $_main;

	public function initialize(){

		$this->setSource('cities');
	}

	public function businessesPerDistrict() {
		$sql = 'select 
		count(id), districts_name 
		from businesses_of_streets_of_districts_of_cities 
		where cities_id = %s
		group by (districts_name)';
		$sql = sprintf($sql, $this->id);
		$out = $this->getReadConnection()->query($sql);
		$out->setFetchMode(Db::FETCH_OBJ);
		return $out->fetchAll($out);
	}

}