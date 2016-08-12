<?php

namespace Ashanty\Cli\Tasks;

/**
 * Main CLI Task
 *
 * @package     Ashanty
 * @category    Task
 * @version     1.0
 */
class MainTask extends \Phalcon\CLI\Task
{

    /**
     * Initialize
     *
     * @package     Ashanty
     * @version     1.0
     */
    public function initialize()
    {

    }

    /**
     * Main Action - display available tasks
     *
     * @package     Ashanty
     * @version     1.0
     */
    public function mainAction()
    {
        echo "-- CLI tasks --\n";
        foreach (new \DirectoryIterator(ROOT_PATH . '/app/cli/tasks') as $file) {
            if ($file->isDot() || $file->getBasename('.php') == 'MainTask') {
                continue;
            }
            $task = $file->getBasename('.php');
            echo strtolower(strstr($task, 'Task', TRUE)) . "\n";

            $f = new \ReflectionClass(__NAMESPACE__ . '\\' . $task);
            foreach ($f->getMethods() as $m) {
                if ($m->class == __NAMESPACE__ . '\\' . $task && $m->name != 'initialize') {
                    echo "\t" . strstr($m->name, 'Action', TRUE) . "\n";
                }
            }
        }
    }

    /**
     * Not found Action
     *
     * @package     Ashanty
     * @version     1.0
     */
    public function notFoundAction()
    {
        echo "Task not found\n";
    }

}
