<?php namespace Giselle\Controllers;

use Giselle\Models\MainCities;

class CitiesController extends ControllerBase
{
	public function indexAction() {

    	$this->view->setTemplateAfter('chrome');
    	MainCities::find();

	}

	public function detailAction() {

	}
}