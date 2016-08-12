<?php
namespace Ashanty\Frontend\Controllers;

/**
 * Ajax Controller
 *
 * @package     Ashanty
 * @category    Controller
 * @version     1.0
 */
class AjaxController extends IndexController
{

	public function indexAction()
	{
		echo 'Ok';
		echo $is_ajax;
	}

	public function lolAction()
	{
		 $year = $this->dispatcher->getParam(0);
		 echo $year;
		 echo $is_ajax;
		 $this->view->disable();
	}

}