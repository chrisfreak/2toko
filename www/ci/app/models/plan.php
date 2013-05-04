<?php

/**
 * Description of plan
 *
 * @author chrisfreak
 */

if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'models/entities.php';
class Plan extends Entities{
    public $id;
    public $name;
    public $description;
    
    /* FACADES */
    public function findById($id) {
        return new Plan(
            R::load('groups',$id)
        );
    }
    
    public function findAll() {
        return $this->listBeans(
            R::find('groups', 'id != :id', array(
                'id' => 1
            ))                
        );
    }
}

?>
