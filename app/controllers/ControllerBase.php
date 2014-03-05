<?php

namespace Giselle\Controllers;

use Phalcon\Mvc\Controller,
	Phalcon\Mvc\Dispatcher;

/**
 * ControllerBase
 *
 * This is the base controller for all controllers in the application
 */
class ControllerBase extends Controller
{

	/*public function moreSecurityOk(){

		$memcache = $this->di->getShared('MoreSecurityMemcache');

		//Logged in user has the key stored in "secureauthcookie" in memcache
		$key = isset($_COOKIE['secureauthcookie']) ? $_COOKIE['secureauthcookie'] : null;

		return (is_string($key) and is_string($memcache->get($key)));
	}*/

	
	public function beforeExecuteRoute(Dispatcher $dispatcher)
	{
		
		//Get the current identity no matter if resource is private
		$identity = $this->auth->getIdentity();
		
		$controllerName = $dispatcher->getControllerName();

		//Only check permissions on private controllers
		if ($this->acl->isPrivate($controllerName)) {


			//If there is no identity available the user is redirected to index/index
			if (!is_array($identity)) {

				$this->flash->notice('You don\'t have access to this module: private');

				$dispatcher->forward(array(
					'controller' => 'index',
					'action' => 'index'
				));
				return false;
			}


			//Check if the user have permission to the current option
			$actionName = $dispatcher->getActionName();
			if (!$this->acl->isAllowed($identity['profile'], $controllerName, $actionName)) {

				$this->flash->notice('You don\'t have access to this module: ' . $controllerName . ':' . $actionName);

				if ($this->acl->isAllowed($identity['profile'], $controllerName, 'index')) {
					$dispatcher->forward(array(
						'controller' => $controllerName,
						'action' => 'index'
					));
				} else {
					$dispatcher->forward(array(
						'controller' => 'user_control',
						'action' => 'index'
					));
				}

				return false;
			}

		}

		// all ok but now see for logged in users that extra security check apply
		// and of course not when you log in
		if ($controllerName != 'session' and is_array($identity)){

			/*if ( ! $this->moreSecurityOk()){ 
				// delete session
				$this->flash->notice('You don\'t have access to this module: ' . $controllerName . ':' . $actionName);
				$dispatcher->forward(array(
						'controller' => 'session',
						'action' => 'logout'
					));

			}*/
		}
	}
}