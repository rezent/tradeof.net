<?php
/**
 * index.php
 *
 * Ashanty базируется на:
 * Base-app 2.0 https://github.com/mruz/base-app автор Mariusz Łączak mruz
 *
 * @package     Ashanty
 * @version     1.0
 * @author      Igor Astashenko hitlowww@gmail.com
 */
use \Ashanty\Common\Tool;
// Включаем показ ошибок
error_reporting(E_ALL);
ini_set('display_errors', 'On');

// Старт счетчиков памяти и времени выполнения скрипта
if (!defined('START_TIME')) define('START_TIME', microtime(TRUE));
if (!defined('START_MEMORY')) define('START_MEMORY', memory_get_usage());

if (!defined('SITETIME')) define('SITETIME', time());

try {
    // Глобальная функция перевода
    if (!function_exists('__')) {
        /**
         * Функция перевода строки
         *
         * @param string $string строка для перевода
         * @param array $values массив замены слов
         *
         * @return string переведенная строка
         */
        function __($string, array $values = NULL)
        {
            return \Ashanty\Library\I18n::instance()->_($string, $values);
        }

    }

    if (!defined('ROOT_PATH')) define('ROOT_PATH', dirname(__DIR__));

    // Function
    #require_once ROOT_PATH . '/app/common/includes/Function.php';

    // Точка входа в систему
    require_once ROOT_PATH . '/app/Bootstrap.php';

    $app = new \Ashanty\Bootstrap(new \Phalcon\DI\FactoryDefault());
    // Вывод ответа на запрос
    $out = $app->handle()->getContent();
    $out = str_replace(
        array(
            '{memory}',
            '{time}'
            ),
        array(
            \Ashanty\Library\Tool::byteSize(memory_get_usage() - START_MEMORY),
            round( microtime(1) - START_TIME, 4 )
            ),
        $out
        );

    echo $out;
} catch (\Phalcon\Assets\Exception $e) {
    \Ashanty\Bootstrap::exception($e);
} catch (\Phalcon\Exception $e) {
    \Ashanty\Bootstrap::exception($e);
} catch (\PDOException $e) {
    \Ashanty\Bootstrap::exception($e);
} catch (\Exception $e) {
    \Ashanty\Bootstrap::exception($e);
}