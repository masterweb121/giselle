<?php

namespace Giselle\Controllers;

class AboutController extends ControllerBase
{

    public function indexAction()
    {
    	// $this->view->showCategories = true;
    	$this->view->setTemplateBefore('public');
    }

}