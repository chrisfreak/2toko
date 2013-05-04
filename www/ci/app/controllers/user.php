<?php

/**
 * Description of user
 *
 * @author chrisfreak
 */
class User extends CI_Controller {
    private $data = array();
    
    public function __construct() {
        parent::__construct();
        
        $this->load->library('2toko/creation/impl/CMSSelector');
        
        // Helpers
        $this->load->helper('postvalidator');
        $this->load->helper('array');
        
        // Models
        $this->load->model('CMS', 'CMSModel');
        $this->data['CMSs'] = $this->CMSModel->findAll();
        
        // Views
        if (!$this->ion_auth->logged_in()) {
            redirect('home/');
        } else {
            $user = $this->ion_auth->user()->row();
            $group = $this->ion_auth->get_users_groups($user->id)->row();
            $user->group = $group;
            $this->data['user'] = $user;
        }
    }
    
    public function index($error = null) {
        $this->load->view('user/body', $this->data);
        if (isset($error)) {
            switch ($error) {
                default:
                case 'invalid':
                    $this->load->view('user/error', $this->data);
                break;
            }
        }
    }
    
    public function update() {
        $posts = $this->input->post();
        $company = $this->input->post('company');
        if (!validPosts($posts, 1, array('company'))) {
            redirect('user/index/invalid');
        } else {
            // Update the user
            $data = array(
                'company' => $company
            );
            
            $user = $this->data['user'];
            $this->ion_auth->update($user->id, $data);
            redirect('user/');
        }
    }
    
    public function start_toko($error = null) {
        if(isset($error)) {
            // Show the error if any
            $this->start_toko_error($error);
        } else {
            if (count($_POST) !== 0) {
                // Process the toko creation
                if ($this->validate_start_toko()) {
                    $this->start_toko_process();
                }
            } else {
                $this->load->view('user/start_toko', $this->data);
            }
        }
    }
    
    private function start_toko_error($error) {
        switch ($error) {
            default:
            case 'incomplete': {
                $this->data['error'] = 'incomplete information!';
            } break;
            case 'invalid': {
                $this->data['error'] = 'Invalid creation toko!';
            } break;
        }
        
        $this->load->view('user/start_toko', $this->data);
        $this->load->view('user/start_toko_error', $this->data);
    }
    
    private function start_toko_process() {
        $cmsId = $this->input->post('cms');
        $domainName = strtolower($this->input->post('domainName'));
        $username = $this->input->post('username');
        $password = $this->input->post('password');        
        
        $selectedCMS = $this->findCMS($cmsId);
        
        $this->cmsselector->init($this->data['user']->id, $selectedCMS, $domainName, $username, $password, $username);
        $processed = $this->cmsselector->process();
        if ($processed) {
            echo 'yatta!';
        } else {
            echo 'whhyy??';
        }
    }
    
    private function validate_start_toko() {
        $posts = $this->input->post();
        $cms = $this->input->post('cms');
        $password = $this->input->post('password');
        $password2 = $this->input->post('password2');
        $domainName = $this->input->post('domainName');
        
        if (!validPosts($posts, 5, array('cms', 'username', 'password', 'password2', 'domainName'))) {
            $this->start_toko_error('incomplete');
            return false;
        }
        
        if ($password !== $password2) {
            $this->start_toko_error('invalid');
            return false;
        }
        
        $CMSs = array();
        foreach($this->data['CMSs'] as $c) {
            array_push($CMSs, $c->id);
        }
        
        if(!array_exists($cms, $CMSs)) {
            $this->start_toko_error('invalid');
            return false;
        }
        
        $this->load->library('2toko/utils/StringUtil', array($domainName));
        if (!$this->stringutil->validDomain()) {
            $this->start_toko_error('invalid');
            return false;
        }
        
        $this->load->model('Tokos', 'TokosModel');
        if ($this->TokosModel->domainExist($domainName)) {
            $this->start_toko_error('invalid');
            return false;
        }
        
        return true;
    }
    
    private function findCMS($CMSid) {
        foreach($this->data['CMSs'] as $cms) {
            if ($cms->id === $CMSid) {
                return $cms;
            }
        }
        
        return null;
    }
}

?>
