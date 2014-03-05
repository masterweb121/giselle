<?php

namespace Giselle\Models;

use Phalcon\Mvc\Model,
	Phalcon\Mvc\Model\Validator\Uniqueness;

/**
 * Giselle\Models\Editors
 *
 * All the editors registered in the application
 */
class Editors extends Model
{
	/**
	 * @var integer
	 */
	public $id;

	/**
	 * @var integer
	 */
	public $usersId;
	
	/**
	 * @var integer
	 */
	public $documentsId;

	

	/**
	 * @var integer
	 */
	public $createdAt;

	/**
	 * @var integer
	 */
	public $lastOpenedAt;
	
	/**
	 * @var string
	 */
	public $email;
	
	public function initialize()
	{
		$this->belongsTo('usersId', 'Giselle\Models\Users', 'id', array(			
			'reusable' => true
		));
		
		$this->belongsTo('documentsId', 'Giselle\Models\Documents', 'id', array(			
			'reusable' => true
		));
	}

}
