<?php

/**
 * Description of tokos
 *
 * @author chrisfreak
 */

if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'models/entities.php';
class Tokos extends Entities {
    public $id;
    public $user_id;
    public $cms_id;
    public $domain_name;
    public $db_size;
    public $file_size;
    public $created_on;
    public $disabled;
    
    public function setCreation_date() {
        $curTime = new DateTime();
        $this->created_on = $curTime->getTimestamp();
    }
    
    public function getCreation_date() {
        if (isset($this->created_on)) {
            return new DateTime("@$this->created_on");
        }
        
        return null;
    }

    /* FACADES */
    public function findById($id) {
        return new Plan(
            R::load('tokos',$id)
        );
    }
    
    public function findAll() {
        return $this->listBeans(
            R::findAll('tokos')
        );
    }
    
    public function domainExist($domain_name) {
        $r = (R::findOne('tokos', 'domain_name = :domain_name', array(
            'domain_name' => $domain_name
        )));
        return isset($r);
    }
    
    public function insert($user_id, $cms_id, $domain_name){
        $tokos = new Tokos();
        $tokos->user_id = $user_id;
        $tokos->cms_id = $cms_id;
        $tokos->domain_name = $domain_name;
        $tokos->disabled = 0;
        $tokos->setCreation_date();
        
        $bean = $tokos->getRedbean();

        return R::store($bean);
    }
}

?>
