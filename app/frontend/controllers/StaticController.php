<?php

namespace Ashanty\Frontend\Controllers;

use \Ashanty\Common\Tool;
use \Ashanty\Models\StaticPages;

/**
 * Static Controller
 *
 * @package     Ashanty
 * @category    Controller
 * @version     1.0
 */
class StaticController extends IndexController
{



    public function indexAction()
    {
        $modelPage = new StaticPages();

        $param = $this->dispatcher->getParam("page");

        $pol = $modelPage::find(array(
                'conditions' => "url = ?1",
                'bind' => array(1 => $param)
            ))->toArray();

        if(count($pol) != 0) {

            $this->tag->setTitle($pol[0]['title']);
            $this->view->hTitle = $pol[0]['hTitle'];
            $this->view->content = $pol[0]['content'];
            $this->breadcrumbs->add($pol[0]['hTitle'], $pol[0]['url']);

        } else parent::notFoundAction();


    }
}
