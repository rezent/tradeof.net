<?php

namespace Ashanty\Models;

/**
 * CatalogCategories Model
 *
 * @package     Ashanty
 * @category    Model
 * @version     1.0
 */
class CatalogCategories extends \Phalcon\Mvc\Model
{

	public $id;

	public $id_parent;

	public $name;

	public $img;

	public $url;

}