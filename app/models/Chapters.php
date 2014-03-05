<?php

namespace Giselle\Models;

use Phalcon\Mvc\Model,
	Phalcon\Mvc\Model\Validator\Uniqueness;

/**
 * Giselle\Models\Chapters
 *
 * All the chapters registered in the application
 */
class Chapters extends Model
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
	 * @var string
	 */
	public $name;

	/**
	 * @var integer
	 */
	public $createdAt;
	
	/**
	 * @var integer
	 */
	public $sortOrder;	

	/**
	 * @var string
	 */
	public $padID;
	
	public function initialize()
	{
		$this->belongsTo('usersId', 'Giselle\Models\Users', 'id', array(			
			'reusable' => true
		));
		
		$this->belongsTo('documentsId', 'Giselle\Models\Documents', 'id', array(			
			'reusable' => true,
			'alias' => 'document',
		));
	}

}
