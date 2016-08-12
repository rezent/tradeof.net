<?php

namespace Ashanty\Extension;

/**
 * Validation
 *
 * @package     Ashanty
 * @category    Extension
 * @version     1.0
 */
class Validation extends \Phalcon\Validation
{

    /**
     * Translate the default message for validator type
     *
     * @package     Ashanty
     * @version     1.0
     *
     * @param string $type validator type
     *
     * @return string
     */
    public function getDefaultMessage($type)
    {
        // Translate dafault messages
        return __($this->_defaultMessages[$type]);
    }

}
