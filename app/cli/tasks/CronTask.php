<?php

namespace Ashanty\Cli\Tasks;

/**
 * Cron CLI Task
 *
 * @package     Ashanty
 * @category    Task
 * @version     1.0
 */
class CronTask extends MainTask
{

    /**
     * Main Action
     *
     * @package     Ashanty
     * @version     1.0
     */
    public function mainAction()
    {
        echo "cronTask/mainAction\n";
    }

    public function testAction()
    {
        echo "cronTask/testAction\n";
        print_r($this->router->getParams());
    }

}
