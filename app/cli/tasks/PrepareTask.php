<?php

namespace Ashanty\Cli\Tasks;

use Ashanty\Library\I18n;
use Ashanty\Library\Auth;

/**
 * Prepare CLI Task
 *
 * @package     Ashanty
 * @category    Task
 * @version     1.0
 */
class PrepareTask extends MainTask
{

    /**
     * Minify css and js collection
     *
     * @package     Ashanty
     * @version     1.0
     */
    public function assetAction()
    {
        foreach (array('css', 'js') as $asset) {
            foreach ($iterator = new \RecursiveIteratorIterator(new \RecursiveDirectoryIterator(ROOT_PATH . '/public/' . $asset, \RecursiveDirectoryIterator::SKIP_DOTS), \RecursiveIteratorIterator::SELF_FIRST) as $item) {
                if (!$item->isDir() && ($item->getExtension() == 'css' || $item->getExtension() == 'js')) {
                    $subPath = $iterator->getSubPathName();
                    $dir = strstr($subPath, $item->getFilename(), true);
                    $add = 'add' . ucfirst($asset);
                    $this->assets->$add($asset . '/' . $dir . $item->getFilename());
                }
            }
        }

        // Minify css and js collection
        \Ashanty\Library\Tool::assetsMinification();
    }

    /**
     * Chmod for folders
     *
     * @package     Ashanty
     * @version     1.0
     */
    public function chmodAction()
    {
        $dirs = array(
            '/app/common/cache',
            '/app/common/logs',
            '/public/min',
        );

        foreach ($dirs as $dir) {
            chmod(ROOT_PATH . $dir, 0777);
        }
    }

    /**
     * Remove data from public folder
     *
     * @package     Ashanty
     * @version     1.0
     */
    public function rmAction()
    {
        if ($this->config->app->env == 'development' || $this->config->app->env == 'testing') {
            exec('rm -R ' . ROOT_PATH . '/app/common/cache/*');
            exec('rm -R ' . ROOT_PATH . '/public/min/*');
        }
    }

    /**
     * Render views from volt files
     *
     * @package     Ashanty
     * @version     1.0
     */
    public function voltAction()
    {
        $this->view->setVars(array(
            'i18n' => I18n::instance(),
            'auth' => Auth::instance(),
        ));
        ob_start();
        $e = '';
        foreach (array('frontend', 'backend') as $module) {
            foreach ($iterator = new \RecursiveIteratorIterator(new \RecursiveDirectoryIterator(ROOT_PATH . '/app/' . $module . '/views/', \RecursiveDirectoryIterator::SKIP_DOTS), \RecursiveIteratorIterator::SELF_FIRST) as $item) {
                if (!$item->isDir() && $item->getExtension() == 'volt') {
                    $this->view->setViewsDir(ROOT_PATH . '/app/' . $module . '/views/');

                    $subPath = $iterator->getSubPathName();
                    $file = strstr($item->getFilename(), '.volt', true);
                    $dir = strstr($subPath, $item->getFilename(), true);

                    $e .= $this->view->partial($dir . $file);
                }
            }
        }
        ob_get_clean();
        //\Ashanty\Console::log($e);
    }

}
