<?php

return new \Phalcon\Config(array(

   'session' => array(
            'host'          => '127.0.0.1',
            'port'          => '11211',
            'persistent'    => 'true',
            'expires'       => '8600',
            'prefix'        => 'gis',
    ),

	'database' => array(
                'adapter'     => 'Postgresql',
                'host'        => '127.0.0.1',
                'username'    => 'postgres',
                'password'    => 'postgres',
                'dbname'      => 'gis',
	),

	'api' => array('googlemaps' => 'AIzaSyARaSH5_69FXXGfgYIr0Wk9e3mG66h-sbQ'),

	'application' => array(
		'controllersDir' => PROJECT.'app/controllers/',
		'vendorDir' 	 => PROJECT.'vendor/',
		'modelsDir'      => PROJECT.'app/models/',
		'formsDir'       => PROJECT.'app/forms/',
		'viewsDir'       => PROJECT.'app/views/',
		'libraryDir'     => PROJECT.'app/library/',
		'pluginsDir'     => PROJECT.'app/plugins/',
		'cacheDir'       => PROJECT.'app/cache/',
		'testDir' 	 	 => PROJECT.'app/tests/',
		'baseUri'        => '/',
		'publicUrl'		 => '//giselle.dev',
        'securecookiedomain'   => '.giselle.dev',
		'debug'          => true,
		'cryptSalt'		 => '$9diko$.f#11',
		'logFile'        => PROJECT.'logs/access.log'
	),

	'models' => array('limit' => 20),

	'cache' => array(
		'on'	=> false,
		'models' => array('lifetime' => 5, 'prefix' => 'my-models'),
		'data' => array('lifetime' => 5, 'prefix' => 'my-data'),
		'view' => array('lifetime' => 40, 'prefix' => 'my-view'),

		'lifetime' => array('padView' => 5)
	),

	'mail' => array(
		'fromName' => 'Gis App',
		'fromEmail' => 'innermond@yahoo.com',
		'smtp' => array(
			'server' => 'smtp.gmail.com',
			'port' => 587,
			'security' => 'tls',
			'username' => '',
			'password' => '',
		)
	),
));
