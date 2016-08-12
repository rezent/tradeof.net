<?php

namespace Ashanty\Frontend\Controllers;

use \Ashanty\Library\Tool;
use \Ashanty\Models\CatalogCategories;
use \Ashanty\Models\CatalogProducts;
use \Ashanty\Models\Articles;
use \Phalcon\Mvc\Model\Resultset;

/**
 * Frontend Index Controller
 *
 * @package     Ashanty
 * @category    Controller
 * @version     1.0
 */
class IndexController extends \Phalcon\Mvc\Controller
{

    public $siteDesc;
    public $scripts = array();
    public $catalogArray = array();

    /**
     * Before Action
     *
     * @package     Ashanty
     * @version     1.0
     */
    public function beforeExecuteRoute($dispatcher)
    {
        // Set default title and description
        $this->tag->setTitle(__('LLC "TRADE OF"'));
        $this->siteDesc = __('LLC "TRADE OF"');

        // Add css and js to assets collection
        $this->assets->addCss('css/app.css');
        $this->assets->addJs('js/app.js');

        $this->view->tool = new Tool();
    }

    /**
     * Initialize
     *
     * @package     Ashanty
     * @version     1.0
     */
    public function initialize()
    {
        // Check the session lifetime
        if ($this->session->has('last_active') && time() - $this->session->get('last_active') > $this->config->session->options->lifetime) {
            $this->session->destroy();
        }

        $this->session->set('last_active', time());

        // Set the language from session
        if ($this->session->has('lang')) {
            $this->i18n->lang($this->session->get('lang'));
            // Set the language from cookie
        } elseif ($this->cookies->has('lang')) {
            $this->i18n->lang($this->cookies->get('lang')->getValue());
        }

        $categories = CatalogCategories::find();
        $categories->setHydrateMode(Resultset::HYDRATE_ARRAYS);
        $categories = $this->_getCats($categories);

        $this->catalogArray = $categories;
        $this->view->catalogArray = $this->catalogArray;
        $this->view->imgCatalog = $this->config->catalog->imgCatalog;

        $catProd = new CatalogProducts();
        $this->view->dataWidgetProd = $catProd::find(array('order' => "RAND()", 'limit' => $this->config->catalog->countWidgetProd))->toArray();

        $this->view->dataWidgetProd2 = $catProd::find(array('order' => "RAND()", 'limit' => $this->config->catalog->countWidgetProd2))->toArray();

        $artProd = new Articles();
        $this->view->dataWidgetArticles = $artProd::find(array('order' => "RAND()", 'limit' => $this->config->articles->countWidgetArticles))->toArray();

        $this->view->isProd = false;

        // Send langs to the view
        $this->view->setVars(array(
            // Translate langs before
            'siteLangs' => array_map('__', $this->config->i18n->langs->toArray()),
        ));
    }

    /**
     * Index Action
     *
     * @package     Ashanty
     * @version     1.0
     */
    public function indexAction()
    {
        $this->tag->setTitle(__('Home'));
        $this->siteDesc = __('Home');
    }

    /**
     * After Action
     *
     * @package     Ashanty
     * @version     1.0
     */
    public function afterExecuteRoute($dispatcher)
    {
        $is_ajax = $this->request->isAjax();

        if ($is_ajax) {
            $this->view->disableLevel(\Phalcon\Mvc\View::LEVEL_AFTER_TEMPLATE );
            $eventsManager = new \Phalcon\Events\Manager();
            $eventsManager->attach('view:afterRender', function ($event, $view) {
                $jsonArray = array(
                    'title' => \Phalcon\Tag::getTitle(false),
                    'content' => $view->getContent(),
                    'messages' => $this->flash->outputArray(),
                    'csrf' => $this->security->getSessionToken()
                );

                $view->setContent(json_encode($jsonArray));
            });
            $this->view->setEventsManager($eventsManager);
            $this->view->setVar("is_ajax", true);
            $this->response->setHeader('Content-Type', 'text/plain');
        } else {
            $this->view->setVar("is_ajax", false);
        }

        // Set final title and description
        $this->tag->setTitleSeparator(' — ');
        $this->tag->appendTitle($this->config->app->name);
        $this->view->setVar('siteDesc', mb_substr($this->filter->sanitize($this->siteDesc, 'string'), 0, 200, 'utf-8'));

        // Set scripts
        $this->view->setVar('scripts', $this->scripts);

        // Minify css and js collection
        \Ashanty\Library\Tool::assetsMinification();

    }

    /**
     * Not found Action
     *
     * @package     Ashanty
     * @version     1.0
     */
    public function notFoundAction()
    {
        // Send a HTTP 404 response header
        $this->response->setStatusCode(404, "Not Found");
        $this->view->disableLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        $this->view->setMainView('404');
        $this->assets->addCss('css/fonts.css');
    }

    public function _getCats($res)
    {

        $levels = array();
        $tree = array();
        $cur = array();

        foreach ($res as $rows){

            $cur = &$levels[$rows['id']];
            $cur['id'] = $rows['id'];
            $cur['id_parent'] = $rows['id_parent'];
            $cur['name'] = $rows['name'];
            $cur['img'] = $rows['img'];
            $cur['url'] = $rows['url'];

            if($rows['id_parent'] == 0){
                $tree[$rows['id']] = &$cur;
            }else{
                $levels[$rows['id_parent']]['children'][$rows['id']] = &$cur;
            }

        }
        return $tree;

    }


    public function retAction()
    {
        echo 'asd;';
    }
}
