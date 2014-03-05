<?php namespace Giselle\Models;

use Phalcon\Mvc\Model,
	Phalcon\Mvc\Model\Relation,
	Phalcon\Mvc\Model\Validator\Uniqueness,

	Giselle\Helpers\CacheKey;

/**
 * Giselle\Models\Documents
 *
 * All the documents registered in the application
 */
class Documents extends Model
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
	 * @var string
	 */
	public $name;
	
	/**
	 * @var string
	 */
	public $editorCreateChapter;
	
	/**
	 * @var string
	 */
	public $editorDeleteChapter;
	
	/**
	 * @var string
	 */
	public $editorReorderChapter;

	/**
	 * @var string
	 */
	public $editorReadOnly;

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
	public $groupID;

	/**
	 * @var integer
	 */
	public $exportRequested;

	
	public function initialize()
	{
		$this->belongsTo('usersId', 'Giselle\Models\Users', 'id', array(
			'alias'	=> 'owner',
			'reusable' => true
		));
		
		$this->hasMany('id', 'Giselle\Models\Editors', 'documentsId', array(
			'alias' => 'editors',
		));
		
		$this->hasMany('id', 'Giselle\Models\Chapters', 'documentsId', array(
			'alias' => 'chapters',
		));
	}


	/**
	 * Generate a unique key for cache
	 *
	 * @param  array $params array of strings
	 * @return string an unique key (hopefully)
	 */
	protected function _createKey() {

		return join(':', func_get_args());
	}


	/**
	 * Find a document for a user
	 * The User can be owner or just an editor
	 *
	 * @param  integer document id $id
	 * @param  integer user id $user_id
	 * @return Giselle\Models\Documents object | null
	 */
	public static function findForUser($id, $userid, $countEditors = null)
	{
		
		$di = \Phalcon\Di::getDefault();
		$mm = $di->getModelsManager();

		$query = $mm->createQuery('
			SELECT a.* FROM Giselle\Models\Documents a
			LEFT JOIN Giselle\Models\Editors b ON b.documentsId = a.id
			WHERE a.id = :document_id: AND (a.usersId = :user_id: OR b.usersId = :user_id:)'
		);

		if ($di->get('config')->cache->on) {

			$key = CacheKey::create(__METHOD__, $id, $userid);
			$query->cache(array('key' => $key, 'lifetime' => 10));
		}

		$documents = $query->execute(
			array(
				'document_id' 	=> $id,
				'user_id'		=> $userid,
			)
		);
		
		$doc = count($documents) ? $documents[0] : null;
		if ($countEditors) {
			$doc = array($doc, count($documents) - 1);
		}

		return $doc;
	}

	protected static function allowableSorting($options) {

		$allowable = array('name', 'createdAt', 'lastOpenedAt', 'numEditors', 'sharedLastOpenedAt');
		$filtered = array_intersect_key($options, array_combine($allowable, $allowable));
		$filtered = array_filter($filtered, function($el){
			return in_array(strtolower($el), array('asc', 'desc'));
		});

		return $filtered;
	}

	public static function getOwnedBy($userId, $sorting = null) {
		
		$di = \Phalcon\Di::getDefault();
		$mm = $di->getModelsManager();

		$counter = $mm->createBuilder()
			->addFrom('Giselle\Models\Documents', 'a')
			// need it to calculate how many editors has a document
			->leftJoin('Giselle\Models\Editors', 'a.id = b.documentsId', 'b')
			->where('a.usersId = :user_id:', array('user_id' => $userId));

		// then continue on a clone with real builder
		$builder = clone $counter;
		$builder	
			->columns(array('a.id, a.name, a.createdAt, a.lastOpenedAt', 'count(b.id) as numEditors'));

		$sorting = static::allowableSorting($sorting);
		foreach ($sorting as $field => $direction) {
			$builder->orderBy("a.$field $direction");
		}

		$builder
			->groupBy('a.id');	

		return array($builder, $counter);	
	}

	public static function getSharedWith($userId, $sorting = null) {
		
		/*$di = \Phalcon\Di::getDefault();
		$mm = $di->getModelsManager();

		$counter = $mm->createBuilder()
			->addFrom('Giselle\Models\Documents', 'a')
			->join('Giselle\Models\Editors', 'a.id = b.documentsId', 'b')
			->where('b.usersId = :user_id:', array('user_id' => $userId));

		$builder = clone $counter;
		$builder	
		->columns(array('a.id, a.name, a.createdAt, a.lastOpenedAt', 'count(b.id) as numEditors'))
		->orderBy('a.lastOpenedAt DESC') // !!! order by shared documents last opened
		->groupBy('a.id');*/	

		 
		$sql =	
		'SELECT  "doc"."id", "doc"."name", "doc"."createdAt", "doc"."lastOpenedAt", "doc"."numEditors", "c"."lastOpenedAt" as "sharedLastOpenedAt"
		FROM (
			SELECT "a"."id", "a"."name", "a"."createdAt", "a"."lastOpenedAt", COUNT("b"."id") as "numEditors" 
			FROM documents a 
			JOIN editors b 
			ON "b"."documentsId" = a.id 
			--WHERE "b"."usersId" = %s 
			GROUP BY a.id 
		) AS doc 
		JOIN editors c ON doc.id = "c"."documentsId"  WHERE "c"."usersId" = %s';

		$sorting = static::allowableSorting($sorting);
		$orderBy = '';
		foreach ($sorting as $field => $direction) {
			$orderBy .= " \"$field\" $direction";
		}
		if (empty($orderBy)) $orderBy = ' "sharedLastOpenedAt" DESC';
		$sql .= ' ORDER BY' . $orderBy;
		$records = sprintf($sql, $userId, $userId);
		$doc = new Documents;
		// $records = $doc->getReadConnection()->query($sql, array($userId, $userId));
		// $records = new Phalcon\Mvc\Model\Resultset\Simple(null, $doc, $records);

		/*$sql = "SELECT users.* FROM users";
        $user = new Users();
        $user->setHydrateMode(\Phalcon\Mvc\Model\Resultset::HYDRATE_RECORDS);
        // $u = new Resultset(null, $user, $user->getReadConnection()->query($sql));
        var_dump($user->getReadConnection()->query($sql));exit;
    */


		$sql =	
		'SELECT COUNT(*) as rowcount
		FROM documents a 
		JOIN editors b 
		ON "b"."documentsId" = a.id 
		WHERE "b"."usersId" = ?';
		$counter = $doc->getReadConnection()->query($sql, array($userId));
						 
		return array($records, $counter);	
	}

}
