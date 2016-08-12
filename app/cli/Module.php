<?php

namespace Ashanty\Cli;

/**
 * Cli Module
 *
 * @package     Ashanty
 * @category    Module
 * @version     1.0
 */
class Module implements \Phalcon\Mvc\ModuleDefinitionInterface
{

    /**
     * Register a specific autoloader for the module
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @param mixed $di dependency Injector
     *
     * @return void
     */
    public function registerAutoloaders(\Phalcon\DiInterface $di = null)
    {
        $loader = new \Phalcon\Loader();

        $loader->registerNamespaces(array(
            'Ashanty\Cli\Tasks' => __DIR__ . '/tasks/',
        ));

        $loader->register();
    }

    /**
     * Register specific services for the module
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @param object $di dependency Injector
     *
     * @return void
     */
    public function registerServices(\Phalcon\DiInterface $di)
    {
        //Registering a dispatcher
        $di->set('dispatcher', function() {
            //Create/Get an EventManager
            $eventsManager = new \Phalcon\Events\Manager();
            //Attach a listener
            $eventsManager->attach("dispatch", function($event, $dispatcher, $exception) {
                //controller or action doesn't exist
                if ($event->getType() == 'beforeException') {
                    switch ($exception->getCode()) {
                        case \Phalcon\Cli\Dispatcher::EXCEPTION_HANDLER_NOT_FOUND:
                        case \Phalcon\Dispatcher::EXCEPTION_ACTION_NOT_FOUND:
                            $dispatcher->forward(array(
                                'task' => 'main',
                                'action' => 'notFound'
                            ));
                            return false;
                    }
                }
            });

            //$dispatcher = new \Phalcon\Mvc\Dispatcher();
            $dispatcher = new \Phalcon\Cli\Dispatcher();
            //Set default namespace to frontend module
            $dispatcher->setDefaultNamespace("Ashanty\Cli\Tasks");
            //Bind the EventsManager to the dispatcher
            $dispatcher->setEventsManager($eventsManager);

            return $dispatcher;
        });

        //Registering the view component
        $di->set('view', function() use($di) {
            $view = new \Phalcon\Mvc\View();
            $view->setViewsDir(ROOT_PATH . '/app/frontend/views/');
            $view->registerEngines(\Ashanty\Library\Tool::registerEngines($view, $di));
            return $view;
        });
    }

}
