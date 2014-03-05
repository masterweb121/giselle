<?php namespace Giselle\Tests\Fixtures;


class User {

	static $fields = array('name', 'email', 'password', 'mustChangePassword', 'profilesId', 'banned', 'suspended', 'active');

	public static function getARightDummy() {

		return $dataWeKnowItsRight = array('Dummy', 'dummy@dummy.com', '$2a$08$mKblu1GYuoYDrhgFRTLNSehL.25XrDtV8OZWQhgLZBGz3Y3j7YKBW', 'N', 1, 'N', 'N', 'Y');
	} 

	public static function getUser() {

		$data = array('name' => 'Dummy', 'email' => 'test@test.com');
		$u = new \Giselle\Models\Users;
		$u->assign($data);

		return $u;
	}
}