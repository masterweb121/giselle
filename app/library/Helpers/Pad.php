<?php namespace Giselle\Helpers;

use Phalcon\Mvc\User\Component;

class Pad extends Component
{

	/**
	 * Create authorId from etherpad if field is blank
	 *
	 * @param  User $user
	 * @return string AuthorID saved value
	 */
	public function createAuthorIDFor($user){

		// need to get an etherpad AuthorID
		if ( ! $user->authorID) {
			
			$padClient = $this->getDI()->getPadClient();

			try
			{
				// get id from etherpad
				$author = $padClient->createAuthorIfNotExistsFor($user->id, $user->name); 
	  			$authorID = $author->authorID;
	  			// save
	  			$user->authorID = $authorID;
	  			$user->save();
  			} 

  			catch (\Phalcon\Mvc\Model\Exception $e){
  				throw $e;
  			}

  			catch (\Exception $e){
  				throw $e;
  			}

		}
		
		return $user->authorID;
	}
}