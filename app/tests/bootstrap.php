<?php // index.php for testing, lock & load Phalcon

ob_start();// avoid headers_sent because of phpUnit echos

error_reporting(E_ALL);

$root = realpath(dirname(__DIR__));
define('ROOT_PATH', $root);

set_include_path(
    ROOT_PATH . PATH_SEPARATOR . get_include_path()
);

// autoload phpunit files 
include __DIR__ . '/../../../../phpUnitTest/vendor/autoload.php';
// Here, set up Phalcon. Use app settings or load yours
$config = include ROOT_PATH . '/config/config.php';
include ROOT_PATH . '/config/loader.php';

// autoload Guzzle
include __DIR__ . '/../../../../guzzle/vendor/autoload.php';


include ROOT_PATH . '/config/services.php';
