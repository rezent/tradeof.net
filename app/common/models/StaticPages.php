<?php

namespace Ashanty\Models;

/**
 * Role Model
 *
 * @package     Ashanty
 * @category    Model
 * @version     1.0
 */
class StaticPages extends \Phalcon\Mvc\Model
{

    public $id;
    public $title;
    public $hTitle;
    public $description;
    public $content;
    public $url;
}
