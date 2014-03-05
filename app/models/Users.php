<?php

namespace Giselle\Models;

use Phalcon\Mvc\Model,
	Phalcon\Mvc\Model\Validator\Uniqueness;

/**
 * Giselle\Models\Users
 *
 * All the users registered in the application
 */
class Users extends Model
{
	/**
	 * @var integer
	 */
	public $id;

	/**
	 * @var string
	 */
	public $name;

	/**
	 * @var string
	 */
	public $email;

	/**
	 * @var string
	 */
	public $password;

	/**
	 * @var string
	 */
	public $mustChangePassword;

	/**
	 * @var string
	 */
	public $profilesId;

	/**
	 * @var string
	 */
	public $banned;

	/**
	 * @var string
	 */
	public $suspended;

	/**
	 * @var string
	 */
	public $active;

	/**
	 * @var string
	 */
	public $authorID;

	/**
	 * Before create the user assign a password
	 */
	public function beforeValidationOnCreate()
	{
		if (empty($this->password)) {

			//Generate a plain temporary password
			$tempPassword = preg_replace('/[^a-zA-Z0-9]/', '', base64_encode(openssl_random_pseudo_bytes(12)));

			//The user must change its password in first login
			$this->mustChangePassword = 'Y';

			//Use this password as default
			$this->password = $this->getDI()->getSecurity()->hash($tempPassword);

		} else {
			//The user must not change its password in first login
			$this->mustChangePassword = 'N';

		}

		//The account must be confirmed via e-mail
		$this->active = 'N';

		//The account is not suspended by default
		$this->suspended = 'N';

		//The account is not banned by default
		$this->banned = 'N';
	}

	/**
	 * Send a confirmation e-mail to the user if the account is not active
	 */
	public function afterSave()
	{
		if ($this->active == 'N') {

			$emailConfirmation = new EmailConfirmations();

			$emailConfirmation->usersId = $this->id;

			if ($emailConfirmation->save()) {
				$this->getDI()->getFlash()->notice(
					'A confirmation mail has been sent to ' . $this->email
				);
			}
		}
	}

	/**
	 * Validate that emails are unique across users
	 */
	public function validation()
	{

		$this->validate(new Uniqueness(
			array(
				"field"   => "email",
				"message" => "The email is already registered"
			)
		));

		return $this->validationHasFailed() != true;
	}

	public function initialize()
	{

		$this->belongsTo('profilesId', 'Giselle\Models\Profiles', 'id', array(
			'alias' => 'profile',
			'reusable' => true
		));

		$this->hasMany('id', 'Giselle\Models\SuccessLogins', 'usersId', array(
			'alias' => 'successLogins',
			'foreignKey' => array(
				'message' => 'User cannot be deleted because he/she has activity in the system'
			)
		));

		$this->hasMany('id', 'Giselle\Models\PasswordChanges', 'usersId', array(
			'alias' => 'passwordChanges',
			'foreignKey' => array(
				'message' => 'User cannot be deleted because he/she has activity in the system'
			)
		));

		$this->hasMany('id', 'Giselle\Models\ResetPasswords', 'usersId', array(
			'alias' => 'resetPasswords',
			'foreignKey' => array(
				'message' => 'User cannot be deleted because he/she has activity in the system'
			)
		));		
		
		
		$this->hasMany('id', 'Giselle\Models\Chapters', 'usersId', array(
			'alias' => 'chapters',
			'foreignKey' => array(
				'message' => 'User cannot be deleted because he/she has activity in the system'
			)
		));
	}
	
	public function updateEditors($id, $email)
	{
		// Update enrolled editors
		//$user = self::auth->getIdentity();
		//$this->db->query("UPDATE editors SET usersId = ? WHERE email = ? AND usersId = 0", array($this->request->getPost('email'), $user['id']));
		$phql = "UPDATE Giselle\Models\Editors SET usersId = :user_id: WHERE email = :email: AND usersId = 0";
		$this->getModelsManager()->executeQuery($phql, array('user_id' => $id, 'email' => $email));
	}


	/**
	 * This code creates a value in memcache storing the users name and various other information, and 
	 * also creates a cookie containing the key name
	 *
	 */
	public function startMoreSecurityFor($user){

		// get values 
		$config = $this->getDI()->getConfig();
		// to be used below
		include $config->application->vendorDir . 'more-security.php';
	}
	
	public function sentInvitation($email)
	{
		$this->getDI()->getMail()->send(
			array(
				$email => 'Test'
			),
			"You've got invitation",
			'invitation',
			array(
				'invitationUrl' => '/session/signup',
			)
		);
	}
	
	public function sentNotification($email)
	{
		$this->getDI()->getMail()->send(
			array(
				$email => 'Test'
			),
			"You've allowed to edit one of our document",
			'notification',
			array(
				'invitationUrl' => '/session/login',
			)
		);
	}

}
