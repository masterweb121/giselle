<?php namespace Giselle\Models;

use 
Phalcon\Mvc\Model,
Phalcon\Db;


class MainCities extends Model
{
	public
	$id, $states_id, $name, $_main;

	public function initialize(){

		$this->setSource('main_cities');
	}

	public static function countBusinessesPerCategory() {

		$records = $stats = array();
		$cities = MainCities::find();
		foreach ($cities as $city) {
			$sql = 'select categories_id, counted_businesses, category_name from count_businesses_city_categorised('.$city->id.')';
			$out = $city->getReadConnection()->query($sql);
			$out->setFetchMode(Db::FETCH_OBJ);
			$stats = $out->fetchAll($out);
			$records[$city->name] = $stats;
		}
		return $records;
	}
}