<?php namespace Giselle\Test; 

use \Giselle\Tests\Fixtures\User as UserData;


class Base extends \PHPUnit_Framework_TestCase {

	protected $dummy;

	public function setUp() {

		parent::setUp();

		if (!extension_loaded('phalcon'))
			$this->markTestSkipped("Phalcon extension not loaded");
	}

	public function tearDown() {
		parent::tearDown();
	}

	protected function createDummyUser() {

		$data = UserData::getARightDummy();
		$fields = UserData::$fields;

		$dummy = new \Giselle\Models\Users;
		$connection = $dummy->getWriteConnection();
		$success = $connection->insert('users', $data, $fields);
		if (!$success)
			$this->markTestSkipped('Cannot create a Dummy record');
		// hack to get id inserted -- only for Postgres
		$lastId = $connection->query('SELECT LASTVAL();')->fetch();

		$this->dummy = $dummy->findFirst($lastId);
	}

	protected function deleteDummyUser() {
		// Do not delete user using model. Models could have "invisible" restrictions and fail 
		$connection = $this->dummy->getWriteConnection();
		$success = $connection->delete('users', 'id=' . $this->dummy->id);
		if (!$success)
			$this->markTestSkipped('Cannot delete Dummy record');		
	}
}