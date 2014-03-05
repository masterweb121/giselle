<?php

namespace Giselle\Models;

use Phalcon\Mvc\Model,
	Phalcon\Mvc\Model\Validator\InclusionIn;

/**
 * Giselle\Models\DocumentsCompressed
 *
 * All the compressed documents
 * Keep it separate. Don't establish any relationships with other models to prevent database reading its html field
 */
class Exports extends Model
{

	/**
	 * @var integer
	 */
	public $documentsId;

	public $converted;


	/**
	 * @var string
	 */
	public $html,

	$format_one, $format_two, $format_three;

	/**
	 * @var array
	 * map formats supported for export to short descriptions
	 */
	public static $formats = array(
		'pdf' => 'Portable Document Format',
		'docx' => 'Microsoft Word 2010 onwards',
		'html' => 'HTML Document',
		'rtf' => 'Rich Text Format',
		'xml' => 'DocBook',
		'html' => 'XHTML Document',
		'doc' => 'Microsof Word 97 / 200 / XP',
		'odt' => 'Open Document Text',
		'xml' => 'Microsoft Office Open XML',
		'ltx' => 'LaTeX 2',
		'sxw' => 'Open Office Text Document',
		'txt' => 'Plain Text',
	);

	public function beforeSave()
    {
        // assure a valid default value exists
        if (is_null($this->converted)) $this->converted = 'N';
    }

    public function validation()
    {
    	// format fields
    	$fields = array('format_one', 'format_two', 'format_three');
    	foreach ($fields as $format) {
    		// empty value allowed
    		if ( ! is_string($this->$format)) continue;
    		// validate
	        $this->validate(new InclusionIn(
	            array(
	                'field'  => $format,
	                'domain' => array_keys(static::$formats),
	                'message' => 'Not a valid format',
	            )
	        ));
    	}

        return ! $this->validationHasFailed();
    }


	/**
	 * Get from a bytea type field the document stored compressed
	 * and decode it as initial
	 *
	 * @return string 
	 */
	public function getDocument(){	

		$sql = 'SELECT encode(html, \'base64\') AS html FROM exports WHERE "documentsId"=? limit 1';
		$pdo = $this->getReadConnection()->query($sql, array($this->documentsId));
		$result = $pdo->fetch();
		$result = (count($result))
		? base64_decode($result[0])
		: '';

		return $result;
	}


	/**
	 * Get unconverted jobs for conversion script
	 *
	 * @return Phalcon\Model\Recordset found jobs
	 */
	public function findJobs() {

		return $this->find("converted='N'");
	}

}
