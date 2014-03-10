<?php namespace Giselle\Controllers;

use 
Giselle\Models\MainCities, 
Giselle\Models\Cities;

class CitiesController extends ControllerBase
{
	public function indexAction() {

    	$this->view->setTemplateAfter('chrome');

		$stats = MainCities::countBusinessesPerCategory();
		// var_export($stats);exit;
		$this->view->stats = $stats;

	}

	public function detailAction() {

	}


	public function viewAction($id) {

		$City = Cities::findFirst($id);
		if ( ! $City) {
			$this->flash->error('There is no city found');

			$this->dispatcher->forward(array(
				'action' => 'index'
			));
		}

		// find districts
		$districts = $City->businessesPerDistrict();
		$this->view->districts = $districts;
		$this->view->city = (object)$City->toArray();

	}
}