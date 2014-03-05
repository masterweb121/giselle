<?php

namespace Giselle\Controllers;

use Giselle\Forms\LoginForm,
	Giselle\Forms\SignUpForm,
	Giselle\Forms\ForgotPasswordForm,
	Giselle\Auth\Auth,
	Giselle\Auth\Exception as AuthException,
	Giselle\Models\Users,
	Giselle\Models\ResetPasswords;

class SessionController extends ControllerBase
{

	public function initialize()
	{
		$this->view->setTemplateBefore('public');
	}

	public function indexAction()
	{

	}

	public function signupAction()
	{
		$form = new SignUpForm();

		if ($this->request->isPost()) {

			if ($form->isValid($this->request->getPost()) != false) {

				$user = new Users();

				$user->assign(array(
					'name' => $this->request->getPost('name', 'striptags'),
					'email' => $this->request->getPost('email'),
					'password' => $this->security->hash($this->request->getPost('password')),
					'profilesId' => 2
				));

				if ($user->save()) {					
					return $this->dispatcher->forward(array(
						'controller' => 'index',
						'action' => 'index'
					));
				}

				$this->flash->error($user->getMessages());
			}

		}

		$this->view->form = $form;
	}

	/**
	 * Starts a session in the admin backend
	 */
	public function loginAction()
	{

		$form = new LoginForm();

		try {

			if (!$this->request->isPost()) {
				if ($this->auth->hasRememberMe()) {
					return $this->auth->loginWithRememberMe();
				}

			} else {

				if ($form->isValid($this->request->getPost()) == false) {
					foreach ($form->getMessages() as $message) {
						$this->flash->error($message);
					}
				} else {

					$this->auth->check(array(
						'email' => $this->request->getPost('email'),
						'password' => $this->request->getPost('password'),
						'remember' => $this->request->getPost('remember')
					));
					
					$userIdentity = $this->auth->getIdentity();
					$u = new Users();
					$u->updateEditors($userIdentity['id'], $this->request->getPost('email'));

					// user to be checked
					$user = $u->findFirst($userIdentity['id']);
					// When a user logs in, check whether the authorID field in the users table need authorID value from ethernet
					$this->pad->createAuthorIDFor($user);

					// This code creates a value in memcache storing the users name and various other information, and 
					// also creates a cookie containing the key name
					$u->startMoreSecurityFor($user);
					
					return $this->response->redirect('documents');
				}
			}

		} 

		catch (AuthException $e) {
			$this->flash->error($e->getMessage());
		} 

		catch (\Exception $e) {
			$this->flash->error($e->getMessage());
		}

		$this->view->form = $form;
	}

	/**
	 * Shows the forgot password form
	 */
	public function forgotPasswordAction()
	{
		$form = new ForgotPasswordForm();

		if ($this->request->isPost()) {

			if ($form->isValid($this->request->getPost()) == false) {
				foreach ($form->getMessages() as $message) {
					$this->flash->error($message);
				}
			} else {

				$user = Users::findFirstByEmail($this->request->getPost('email'));
				if (!$user) {
					$this->flash->success('There is no account associated to this email');
				} else {

					$resetPassword = new ResetPasswords();
					$resetPassword->usersId = $user->id;
					if ($resetPassword->save()) {
						$this->flash->success('Success! Please check your messages for an email reset password');
					} else {
						foreach ($resetPassword->getMessages() as $message) {
							$this->flash->error($message);
						}
					}
				}
			}
		}

		$this->view->form = $form;
	}

	/**
	 * Closes the session
	 */
	public function logoutAction()
	{
		$this->auth->remove();

		// Delete the cookie created for non-php security layer
		$_COOKIE['secureauthcookie'] = null;
		unset($_COOKIE['secureauthcookie']);
		// use same domain & path when created (in more-security.php) to delete
		setcookie('secureauthcookie', '', -1, $this->config->application->baseUri, $this->config->application->securecookiedomain);

		return $this->response->redirect('session/login');
	}

}

