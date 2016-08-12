<?php

namespace Ashanty\Frontend\Controllers;

use \Ashanty\Library\Tool;
use \Ashanty\Models\Articles;
use \Phalcon\Paginator\Adapter\Model as PaginatorModel;

/**
 * Article Controller
 *
 * @package     Ashanty
 * @category    Controller
 * @version     1.0
 */
class ArticlesController extends IndexController
{

    public function indexAction()
    {
        $this->breadcrumbs->add(__('Articles'), '/articles');

        $modelArticles = new Articles();
        $dataArray = $modelArticles::find()->toArray();
        $this->view->articlesArray = $dataArray;
    }

    public function viewAction()
    {

        $url = $this->dispatcher->getParam("post");

        $modelArticles = new Articles();
        $dataArray = $modelArticles::find(array(
	        	"conditions" => "url = ?1",
	        	"bind" => array(1 => $url)
        	))->toArray();

        if(count($dataArray) == 0) parent::notFoundAction();

		$this->breadcrumbs->add(__('Articles'), '/articles');
		$this->breadcrumbs->add(__($dataArray[0]['hTitle']), $dataArray[0]['url']);
		$this->tag->setTitle($dataArray[0]['title']);
        $this->view->articlesArray = $dataArray;
    }

}
