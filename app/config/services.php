<?php

use Phalcon\DI\FactoryDefault,
	Phalcon\Mvc\View,
	Phalcon\Crypt,
	Phalcon\Mvc\Dispatcher,
	Phalcon\Mvc\Url as UrlResolver,
	//Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter,
	Phalcon\Db\Adapter\Pdo\Postgresql as DbAdapter,
	Phalcon\Mvc\View\Engine\Volt as VoltEngine,
	Phalcon\Mvc\Model\Metadata\Files as MetaDataAdapter,
	// Phalcon\Session\Adapter\Files as SessionAdapter,
	Phalcon\Session\Adapter\Memcache as SessionAdapter,
	Phalcon\Flash\Direct as Flash;

use Giselle\Auth\Auth,
	Giselle\Acl\Acl,
	Giselle\Mail\Mail;

/**
 * The FactoryDefault Dependency Injector automatically register the right services providing a full stack framework
 */
$di = new FactoryDefault();

/**
 * Register the global configuration as config
 */
$di->set('config', $config);

/**
 * The URL component is used to generate all kind of urls in the application
 */
$di->set('url', function() use ($config) {
	$url = new UrlResolver();
	$url->setBaseUri($config->application->baseUri);
	return $url;
}, true);

/**
 * Setting up the view component
 */
$di->set('view', function() use ($config) {

	$view = new View();

	// temporary info just to show something into the purple bar
	$view->title = 'Giselle';

	$view->setViewsDir($config->application->viewsDir);

	$view->registerEngines(array(
		'.volt' => function($view, $di) use ($config) {

			$volt = new VoltEngine($view, $di);

			$volt->setOptions(array(
				'compiledPath' => $config->application->cacheDir . 'volt/',
				'compiledSeparator' => '_',
				'compileAlways'	=> true,
			));

			return $volt;
		}
	));

	return $view;
}, true);

/**
 * Database connection is created based in the parameters defined in the configuration file
 */
$di->setShared('db', function() use ($config) {
	return new DbAdapter(array(
		'host' => $config->database->host,
		'username' => $config->database->username,
		'password' => $config->database->password,
		'dbname' => $config->database->dbname
	));
});

/**
 * If the configuration specify the use of metadata adapter use it or use memory otherwise
 */
$di->set('modelsMetadata', function() use ($config) {
	return new MetaDataAdapter(array(
		'metaDataDir' => $config->application->cacheDir . 'metaData/'
	));
});

/**
 * Start the session the first time some component request the session service
 */
/*$di->set('session', function() {
	$session = new SessionAdapter();
	$session->start();
	return $session;
});*/

/**
* Start a memcache session 
*/
$di->set('session', function() use ($config) {

    $memcache = new Phalcon\Session\Adapter\Memcache(array(
        'host'          => $config->session->host,     // mandatory
        'port'          => $config->session->port,           // optional (standard: 11211)
        'lifetime'      => $config->session->expires,            // optional (standard: 8600)
        'prefix'        => $config->session->prefix,         // optional (standard: [empty_string]), means memcache key is my-app_31231jkfsdfdsfds3
        'persistent'    => $config->session->persistent            // optional (standard: false)
    ));

    $memcache->start();
    
    return $memcache;
});

/**
 * Crypt service
 */
$di->set('crypt', function() use ($config) {
	$crypt = new Crypt();
	$crypt->setKey($config->application->cryptSalt);
	return $crypt;
});

/**
 * Dispatcher use a default namespace
 */
$di->set('dispatcher', function() {
	$dispatcher = new Dispatcher();
	$dispatcher->setDefaultNamespace('Giselle\Controllers');
	return $dispatcher;
});

/**
 * Loading routes from the routes.php file
 */
$di->set('router', function() {
	return require __DIR__ . '/routes.php';
});

/**
 * Flash service with custom CSS classes
 */
$di->set('flash', function(){
	return new Flash(array(
		'error' => 'alert alert-error',
		'success' => 'alert alert-success',
		'notice' => 'alert alert-info',
	));
});

/**
 * Custom authentication component
 */
$di->set('auth', function(){
	return new Auth();
});

/**
 * Mail service uses AmazonSES
 */
$di->set('mail', function() {
	return new Mail();
});

/**
 * Access Control List
 */
$di->set('acl', function() {
	return new Acl();
});

$di->set('modelsManager', function() {
	return new Phalcon\Mvc\Model\Manager();
});


/**
 * Helper Pad
 */
$di->set('pad', function() {
	return new Pad();
});

/**
 * NavBar component
 */
$di->set('navbar', function() {
	return new \Giselle\UI\NavBar();
});
/**
 * Search component
 */
$di->set('searchBuilder', function() {
	return new \Giselle\Search\Builder();
});

/**
 * CategoriesBar component
 */
$di->set('categories_bar', function() {
	return new \Giselle\UI\CategoriesBar();
});


/**
 * Use a plain php memcache instance
 *
 * @return \Memcache instance
 */
$di->setShared('MoreSecurityMemcache', function() use($config){ 
	
	$memcache = new \Memcache;
	$memcache->connect($config->session->host, $config->session->port) or die ("Could not connect");

	return $memcache;
});


//Set the views cache service
$di->set('viewCache', function() use($config) {

	$_config = $config->cache->view;
	
	$front = new \Phalcon\Cache\Frontend\Output(array(
		'lifetime' => $_config->lifetime
	));

	$cache = new \Phalcon\Cache\Backend\Memcache($front, array(
		'host'          => $config->session->host, 
        'port'          => $config->session->port, 
        'prefix'        => $_config->prefix,
        'persistent'    => $config->session->persistent
	));

	return $cache;
});

//Set the views cache service
$di->set('modelsCache', function() use($config) {

	$_config = $config->cache->models;

	$front = new \Phalcon\Cache\Frontend\Data(array(
		'lifetime' => $_config->lifetime
	));

	$cache = new \Phalcon\Cache\Backend\Memcache($front, array(
		'host'          => $config->session->host, 
        'port'          => $config->session->port, 
        'prefix'        => $_config->prefix,
        'persistent'    => $config->session->persistent
	));

	return $cache;
});

//Set the views cache service
$di->set('dataCache', function() use($config) {

	$_config = $config->cache->data;

	$front = new \Phalcon\Cache\Frontend\Data(array(

		'lifetime' => $_config->lifetime
	));

	$cache = new \Phalcon\Cache\Backend\Memcache($front, array(
		'host'          => $config->session->host, 
        'port'          => $config->session->port, 
        'prefix'        => $_config->prefix,
        'persistent'    => $config->session->persistent
	));

	return $cache;
});


if (isset($config->application->debug) and $config->application->debug) {
 	// see queries
	$_queries = array();
	$ev = new \Phalcon\Events\Manager();
	$ev->attach('db', function($event, $connection) use(&$_queries) {
	if ($event->getType() == 'beforeQuery') {
		$_queries[] = $connection->getSqlStatement();
	}

	});
	$di->get('db')->setEventsManager($ev);
}
