<?php

namespace Giselle\Acl;

use Phalcon\Mvc\User\Component,
	Phalcon\Acl\Adapter\Memory as AclMemory,
	Phalcon\Acl\Role as AclRole,
	Phalcon\Acl\Resource as AclResource,
	Giselle\Models\Users,
	Giselle\Models\Profiles;

/**
 * Giselle\Acl\Acl
 *
 *
 */
class Acl extends Component
{

	private $_acl;

	private $_privateResources = array(
		'users' => array('index', 'search', 'edit', 'create', 'delete', 'changePassword'),
		'profiles' => array('index', 'search', 'edit', 'create', 'delete'),
		'permissions' => array('index'),

		'documents' => array('index', 'search', 'shared', 'loadsettings', 'savesettings', 
			'build', 'delete', 'view', 'reorder', 'add_chapter', 'rename_chapter', 'delete_chapter',
			'add_editor', 'delete_editor', 
			'export', 'exportStatus'),
		'chapters' => array('view'),
	);

	private $_actionDescriptions = array(
		'index' => 'Access',
		'search' => 'Search',
		'create' => 'Create',
		'edit' => 'Edit',
		'delete' => 'Delete',
		'changePassword' => 'Change password',

		'loadsettings' => 'Load settings',
		'savesettings' => 'Save settings',
		'build' => 'Build',

		'export' => 'Export',
	);

	/**
	 * Checks if a controller is private or not
	 *
	 * @param string $controllerName
	 * @return boolean
	 */
	public function isPrivate($controllerName)
	{
		return isset($this->_privateResources[$controllerName]);
	}

	/**
	 * Checks if the current profile is allowed to access a resource
	 *
	 * @param string $profile
	 * @param string $controller
	 * @param string $action
	 * @return boolean
	 */
	public function isAllowed($profile, $controller, $action)
	{
		return $this->getAcl()->isAllowed($profile, $controller, $action);
	}

	/**
	 * Returns the ACL list
	 *
	 * @return Phalcon\Acl\Adapter\Memory
	 */
	public function getAcl()
	{
		// Check if the ACL is already created
		if (is_object($this->_acl)) {
			return $this->_acl;
		}

		// Not available - use version cached in APC if available
		if (function_exists('apc_fetch')) {
			$acl = apc_fetch('docadmin-acl');
			if (is_object($acl)) {
				$this->_acl = $acl;
				return $acl;
			}
		}
		
		// Still not available, create again - this will cache to apc if apc is loaded
		if (!is_object($acl)) {
                        $this->_acl = $this->rebuild();
                        return $this->_acl;
                }

		return $this->_acl;
	}

	/**
	 * Returns the permissions assigned to a profile
	 *
	 * @param Profiles $profile
	 * @return array
	 */
	public function getPermissions(Profiles $profile)
	{
		$permissions = array();
		foreach ($profile->getPermissions() as $permission) {
			$permissions[$permission->resource . '.' . $permission->action] = true;
		}
		return $permissions;
	}

	/**
	 * Returns all the resoruces and their actions available in the application
	 *
	 * @return array
	 */
	public function getResources()
	{
		return $this->_privateResources;
	}

	/**
	 * Returns the action description according to its simplified name
	 *
	 * @param string $action
	 * @return $action
	 */
	public function getActionDescription($action)
	{
		if (isset($this->_actionDescriptions[$action])) {
			return $this->_actionDescriptions[$action];
		} else {
			return $action;
		}
	}

	/**
	 * Rebuils the access list into a file
	 *
	 */
	public function rebuild()
	{

		$acl = new AclMemory();

		$acl->setDefaultAction(\Phalcon\Acl::DENY);

		//Register roles
		$profiles = Profiles::find('active = "Y"');

		foreach ($profiles as $profile) {
			$acl->addRole(new AclRole($profile->name));
		}

		foreach ($this->_privateResources as $resource => $actions) {
			$acl->addResource(new AclResource($resource), $actions);
		}

		//Grant acess to private area to role Users
		foreach ($profiles as $profile) {

			//Grant permissions in "permissions" model
			foreach ($profile->getPermissions() as $permission) {
				$acl->allow($profile->name, $permission->resource, $permission->action);
			}

			//Always grant these permissions
			$acl->allow($profile->name, 'users', 'changePassword');

		}
		
		// Store to APC cache if available - otherwise it will recreate every time
 		if (function_exists('apc_store')) {
                   	apc_store('docadmin-acl', $acl);

                }

		return $acl;
	}

}
