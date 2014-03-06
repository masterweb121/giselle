<?php namespace Giselle\Controllers;

use 
Phalcon\Db\Column,
Giselle\Models\Businesses;

class BusinessesJsonController extends ControllerBase
{
	public function indexAction() {

    	$this->view->disable();

    	$q = $this->request->get('q');
    	$lat = $this->request->get('lat');
    	$lng = $this->request->get('lng');

    	if ( ! $lat or ! $lng)
	    	$options = array(
	    		'conditions' => "name like ?1",
	    		'bind' => array(1 => $q.'%'),
	    	);

	    else {
	    	$distance = sprintf('( round( cast(earth_distance(ll_to_earth(%s, %s), _location)/1000 as numeric), 2) ) as distance_from', $lat, $lng);
	    	$options = array(
	    		'columns' => 'id, name, ' . $distance,
	    		'conditions' => "name like ?1",
	    		'bind' => array(1 => $q.'%'),
	    		'order'	=> 'distance_from ASC'
	    	);
	    }	

    	echo $this->getJson($options);
	}

	private function getJson($options = array()) {

		$default = array('columns' => 'id, name','limit' => 10);
		$options += $default;
		// var_export($options);
		// var_export(Businesses::find($options)->toArray());exit;
		return json_encode(Businesses::find($options)->toArray());
	}
}