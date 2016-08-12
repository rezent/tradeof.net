<?php

namespace Ashanty\Models;

/**
 * Role Model
 *
 * @package     Ashanty
 * @category    Model
 * @version     1.0
 */
class Roles extends \Phalcon\Mvc\Model
{

    /**
     * Role initialize
     *
     * @package     Ashanty
     * @version     1.0
     */
    public function initialize()
    {
        $this->hasMany('id', __NAMESPACE__ . '\RolesUsers', 'role_id', array(
            'alias' => 'RolesUsers',
        ));
    }

}
