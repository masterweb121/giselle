<?php

$router = new Phalcon\Mvc\Router();

$router->add('/businesses.json', array(
	'controller' => 'businesses_json'
));
$router->add('/categories.json', array(
	'controller' => 'categories_json'
));

$router->add('/confirm/{code}/{email}', array(
	'controller' => 'user_control',
	'action' => 'confirmEmail'
));

$router->add('/reset-password/{code}/{email}', array(
	'controller' => 'user_control',
	'action' => 'resetPassword'
));

return $router;