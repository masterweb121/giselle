<?php

$loader = new \Phalcon\Loader();

/**
 * We're a registering a set of directories taken from the configuration file
 */
$loader->registerNamespaces(array(
	'Giselle\Models' => $config->application->modelsDir,
	'Giselle\Controllers' => $config->application->controllersDir,
	'Giselle\Forms' => $config->application->formsDir,
	'Giselle\Tests' => $config->application->testDir . '/Test/',
	'Giselle' => $config->application->libraryDir,
))->registerDirs(
	array(
		$config->application->vendorDir,
	)
);

$loader->register();
