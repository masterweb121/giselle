<?php

namespace Giselle\Controllers;

class IndexController extends ControllerBase
{

    public function indexAction()
    {
    	$this->view->setTemplateAfter('chrome');
    }

}

