<?php

namespace Ashanty;

use \Ashanty\Library\Auth;
use \Ashanty\Library\I18n;
use \Ashanty\Library\Email;
use \Phalcon\Debug\Dump;

/**
 * Bootstrap
 *
 * @package     Ashanty
 * @category    Application
 * @version     1.0
 */
class Bootstrap extends \Phalcon\Mvc\Application
{

    private $_di;
    private $_config;

    /**
     * Bootstrap constructor - set the dependency Injector
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @param \Phalcon\DiInterface $di
     */
    public function __construct(\Phalcon\DiInterface $di)
    {

        // Include Composer
        require ROOT_PATH . '/app/vendor/autoload.php';

        $this->_di = $di;

        $loaders = array('config', 'request', 'loader', 'timezone', 'i18n', 'db', 'filter', 'flash', 'crypt', 'auth', 'session', 'cookie', 'cache', 'url', 'router', 'breadcrumbs', 'tool');

        // Register services
        foreach ($loaders as $service) {
            $this->$service();
        }

        // Register modules
        $this->registerModules(array(
            'frontend' => array(
                'className' => 'Ashanty\Frontend\Module',
                'path' => ROOT_PATH . '/app/frontend/Module.php'
            ),
            'backend' => array(
                'className' => 'Ashanty\Backend\Module',
                'path' => ROOT_PATH . '/app/backend/Module.php',
                'alias' => 'admin'
            ),
        ));

        // Register the app itself as a service
        $this->_di->set('app', $this);

        // Set the dependency Injector
        parent::__construct($this->_di);


    }

    /**
     * Register an autoloader
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function loader()
    {
        $loader = new \Phalcon\Loader();
        $loader->registerNamespaces(array(
            'Ashanty\Models' => ROOT_PATH . '/app/common/models/',
            'Ashanty\Library' => ROOT_PATH . '/app/common/library/',
            'Ashanty\Extension' => ROOT_PATH . '/app/common/extension/',
            'Ashanty\Helpers' => ROOT_PATH . '/app/common/helpers/'
        ))->register();
    }

    /**
     * Set the config service
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function config()
    {
        $config = new \Phalcon\Config\Adapter\Ini(ROOT_PATH . '/app/common/config/config.ini');
        $this->_di->set('config', $config);
        $this->_config = $config;
    }

    /**
     * Set the breadcrumbs
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function breadcrumbs()
    {
        $config = $this->_config;
        $this->_di->setShared('breadcrumbs', function() use ($config) {
            $breadcrumbs = new \Phalcon\Breadcrumbs;
            $breadcrumbs->setSeparator($config->app->breadcrumbsSeparator);
            $breadcrumbs->add(__('Home'), '/');
            $breadcrumbs->setTemplate(
                '<a href="{{link}}">{{label}}</a>', // linked
                '<li class="active">{{label}}</li>',         // not linked
                ''                    // first icon
            );
            return $breadcrumbs;
        });
    }

    /**
     * Set the time zone
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function timezone()
    {
        date_default_timezone_set($this->_config->app->timezone);
    }

    /**
     * Set the language service
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function i18n()
    {
        $this->_di->setShared('i18n', function() {
            return I18n::instance();
        });
    }

    /**
     * Set the security service
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function security()
    {
        $config = $this->_config;
        $this->_di->set('security', function() use ($config) {
            $security = new \Phalcon\Security();
            $security->setDefaultHash($config->security->key);
            return $security;
        });
    }

    /**
     * Set the crypt service
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function crypt()
    {
        $config = $this->_config;
        $this->_di->set('crypt', function() use ($config) {
            $crypt = new \Phalcon\Crypt();
            $crypt->setKey($config->crypt->key);
            $crypt->setPadding(\Phalcon\Crypt::PADDING_ZERO);
            return $crypt;
        });
    }

    /**
     * Set the auth service
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function auth()
    {
        $this->_di->setShared('auth', function() {
            return Auth::instance();
        });
    }

    /**
     * Set the filter service
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function filter()
    {
        $this->_di->set('filter', function() {
            $filter = new \Phalcon\Filter();
            $filter->add('repeat', new Extension\Repeat());
            $filter->add('escape', new Extension\Escape());
            return $filter;
        });
    }

    /**
     * Set the cookie service
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function cookie()
    {
        $this->_di->set('cookies', function() {
            $cookies = new \Phalcon\Http\Response\Cookies();
            return $cookies;
        });
    }

    /**
     * Set the database service
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function db()
    {
        $config = $this->_config;
        $this->_di->set('db', function() use ($config) {
            return new \Phalcon\Db\Adapter\Pdo\Mysql(array(
                "host" => $config->database->host,
                "username" => $config->database->username,
                "password" => $config->database->password,
                "dbname" => $config->database->dbname,
                "options" => array(
                    \PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'
                )
            ));
        });
    }

    /**
     * Set the flash service
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function flash()
    {
        $this->_di->set('flashSession', function() {
            $flash = new \Phalcon\Flash\Session(array(
                'warning' => 'alert alert-warning',
                'notice' => 'alert alert-info',
                'success' => 'alert alert-success',
                'error' => 'alert alert-danger',
                'dismissable' => 'alert alert-dismissable',
            ));
            return $flash;
        });
    }

    /**
     * Set the session service
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function session()
    {
        $this->_di->set('session', function() {
            $session = new \Phalcon\Session\Adapter\Files();
            $session->start();
            return $session;
        });
    }

    /**
     * Set the cache service
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function cache()
    {
        $config = $this->_config;
        foreach ($config->cache->services as $service => $section) {
            $this->_di->set($service, function() use ($config, $section) {
                // Load settings for some section
                $frontend = $config->$section;
                $backend = $config->{$frontend->backend};

                // Set adapters
                $adapterFrontend = "\Phalcon\Cache\Frontend\\" . $frontend->adapter;
                $adapterBackend = "\Phalcon\Cache\Backend\\" . $backend->adapter;

                // Set cache
                $frontCache = new $adapterFrontend($frontend->options->toArray());
                $cache = new $adapterBackend($frontCache, $backend->options->toArray());
                return $cache;
            });
        }
    }

    /**
     * Set the url service
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function url()
    {
        $config = $this->_config;
        $this->_di->set('url', function() use ($config) {
            $url = new \Phalcon\Mvc\Url();
            $url->setBaseUri($config->app->base_uri);
            $url->setStaticBaseUri($config->app->static_uri);
            return $url;
        });
    }

    /**
     * Set the request service
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function request()
    {
        $this->_di->set('request', function() {
            $request = new \Phalcon\Http\Request();
            return $request;
        });
    }

    /**
     * Set the static router service
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function router()
    {
        $this->_di->set('router', function() {
            $router = new \Phalcon\Mvc\Router(false);

            $router->setDefaults(array(
                'module' => 'frontend',
                'controller' => 'index',
                'action' => 'index'
            ));

            $frontend = new \Phalcon\Mvc\Router\Group(array(
                'module' => 'frontend',
            ));
            $frontend->add('/:controller/:action/:params', array(
                'controller' => 1,
                'action' => 2,
                'params' => 3,
            ));
            $frontend->add('/:controller/:int', array(
                'controller' => 1,
                'id' => 2,
            ));
            $frontend->add('/404', array(
                'controller' => 'index',
                'action' => 'notFound'
            ));
            /*$frontend->add('/:controller[/]?', array(
                'controller' => 1,
            ));*/
            $frontend->add('/ajax/([a-z0-9\-]+)/([a-z0-9\-]+)', array(
                'controller' => 'ajax',
                'action'    =>  1,
                'params'    => 2
            ));
            $frontend->add('/([a-z\-]+)', array(
                'controller' => 'static',
                'action' => 'index',
                'page' => 1,
            ));
            $frontend->add('/catalog', array(
                'controller' => 'catalog',
                'action' => 'index',
            ));
            $frontend->add('/catalog/([a-z\-]+)', array(
                'controller' => 'catalog',
                'action' => 'show',
                'category' => 1,
            ));
            $frontend->add('/catalog/([a-z\-]+)/([a-z\-]+)', array(
                'controller' => 'catalog',
                'action' => 'show',
                'category' => 1,
                'section' => 2,
            ));
            $frontend->add('/catalog/([a-z\-]+)/([a-z\-]+)/([a-z\-]+)', array(
                'controller' => 'catalog',
                'action' => 'show',
                'category' => 1,
                'section' => 2,
                'section2' => 3
            ));
            $frontend->add('/catalog/([a-z\-]+)/([a-z\-]+)/([a-z\-]+)/([a-z\-]+)', array(
                'controller' => 'catalog',
                'action' => 'show',
                'category' => 1,
                'section' => 2,
                'section2' => 3,
                'section3' => 4
            ));
            $frontend->add('/articles', array(
                'controller' => 'articles',
                'action' => 'index',
            ));
            $frontend->add('/articles/([a-z\-]+)', array(
                'controller' => 'articles',
                'action' => 'view',
                'post' => 1,
            ));
            $frontend->add('/');

            $router->mount($frontend);

            /**
             * Define routes for each module
             */
            //foreach ($this->getModules() as $module => $options) {
            foreach (array('backend' => array('alias' => 'admin')) as $module => $options) {
                $group = new \Phalcon\Mvc\Router\Group(array(
                    'module' => $module,
                ));
                $group->setPrefix('/' . (isset($options['alias']) ? $options['alias'] : $module));

                $group->add('/:controller/:action/:params', array(
                    'controller' => 1,
                    'action' => 2,
                    'params' => 3,
                ));
                $group->add('/:controller/:int', array(
                    'controller' => 1,
                    'id' => 2,
                ));
                $group->add('/:controller[/]?', array(
                    'controller' => 1,
                ));
                $group->add('[/]?', array());

                $router->mount($group);
            }

            $router->notFound(array(
                'controller' => 'index',
                'action' => 'notFound'
            ));

            return $router;
        });
    }

    /**
     * HMVC request in the application
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @param array $location location to run the request
     *
     * @return mixed response
     */
    public function HMVCrequest($location)
    {
        $dispatcher = clone $this->getDI()->get('dispatcher');

        if (isset($location['controller'])) {
            $dispatcher->setControllerName($location['controller']);
        } else {
            $dispatcher->setControllerName('index');
        }

        if (isset($location['action'])) {
            $dispatcher->setActionName($location['action']);
        } else {
            $dispatcher->setActionName('index');
        }

        if (isset($location['params'])) {
            if (is_array($location['params'])) {
                $dispatcher->setParams($location['params']);
            } else {
                $dispatcher->setParams((array) $location['params']);
            }
        } else {
            $dispatcher->setParams(array());
        }

        $dispatcher->dispatch();

        $response = $dispatcher->getReturnedValue();
        if ($response instanceof \Phalcon\Http\ResponseInterface) {
            return $response->getContent();
        }

        return $response;
    }

    /**
     * Log message into file, notify the admin on stagging/production
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @param mixed $messages messages to log
     */
    public static function log($messages)
    {
        $config = \Phalcon\DI::getDefault()->getShared('config');
        $dump = new Dump();
        if ($config->app->env == "development") {
            if(is_array($messages)){
                foreach ($messages as $key => $message) {
                    echo $dump->one($message, $key);
                }
            }else {
                echo $dump->one($messages);
            }
            exit();
        } else {
            $logger = new \Phalcon\Logger\Adapter\File(ROOT_PATH . '/app/common/logs/' . date('Ymd') . '.log', array('mode' => 'a+'));
            $log = '';

            if (is_array($messages) || $messages instanceof \Countable) {
                foreach ($messages as $key => $message) {
                    if (in_array($key, array('alert', 'debug', 'error', 'info', 'notice', 'warning'))) {
                        $logger->$key($message);
                    } else {
                        $logger->log($message);
                    }
                    $log .= $dump->one($message, $key);
                }
            } else {
                $logger->log($messages);
                $log .= $dump->one($messages);
            }

            if ($config->app->env != "testing") {
                $email = new Email();
                $email->prepare(__('Something is wrong!'), $config->app->admin, 'error', array('log' => $log));

                if ($email->Send() !== true) {
                    $logger->log($email->ErrorInfo);
                }
            }

            $logger->close();
        }
    }

    /**
     * Set the exception
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    public static function exception($e)
    {
            $dump = '';
            $dump .=  get_class($e). "\n";
            $dump .= $e->getMessage(). "\n";
            $dump .= "File=". $e->getFile(). "\n";
            $dump .= "Line=". $e->getLine(). "\n";
            $dump .= $e->getTraceAsString();
            $dump .= $e->getPrevious();

            \Ashanty\Bootstrap::log($dump);
    }

    /**
     * Set the tool
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @return void
     */
    protected function tool()
    {
        $this->_di->set('tool', function() {
            $tool = new \Ashanty\Library\Tool();
            return $tool;
        });
    }

}
