<?php

/**
 * Description of CMS
 *
 * @author chrisfreak
 */

if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'models/entities.php';
class CMS extends Entities {
    public $id;
    public $name;
    public $version;
    public $installation;
    public $enabled;
    
    /* FACADES */
    public function findById($id) {
        return new Plan(
            R::load('cms',$id)
        );
    }
    
    public function findAll() {
        return $this->listBeans(
            R::find('cms', 'enabled != :enabled', array(
                'enabled' => 0
            ))
        );
    }
}

?>
