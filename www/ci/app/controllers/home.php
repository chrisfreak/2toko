<?php

/**
 * Description of home
 *
 * @author chrisfreak
 */
class Home extends CI_Controller {
    
    private $data = array();
    
    public function __construct() {
        parent::__construct();
        
        // Models
        $this->load->model('Plan', 'planModel');
        $this->data['plans'] = $this->planModel->findAll();
        
        // Helpers
        $this->load->helper('postvalidator');
        $this->load->helper('array');
        
        // Views
        if (!$this->ion_auth->logged_in()) {
            // Not logged in
            $this->load->view('home/header_guest', $this->data);
        } else {
            // Is logged in
            $user = $this->ion_auth->user()->row();
            $this->data['user'] = $user;
            $this->load->view('home/header_user', $this->data);
        }
    }
    
    public function index() {
        $this->load->view('home/body', $this->data);
    }
    
    public function login($error = null) {
        
        if (isset($error)) {
            $this->login_error($error);
        } else {
            if ($this->login_validation()) {
                redirect('user/');
            }
        }
    }
    
    private function login_error($error) {
        switch ($error) {
            default:
            case 'incomplete': {
                $this->data['error'] = 'Please fill in completely';
            } break;
            case 'invalid': {
                $this->data['error'] = 'Usrname and password does not match';
            } break;
        }

        $this->load->view('home/login_error', $this->data);
    }
    
    private function login_validation() {
        $posts = $this->input->post();
        
        if (!validPosts($posts, 2)) {
            // Invalid posts
            redirect('home/login/incomplete');
            return false;
        }

        $username = $this->input->post('username');
        $password = $this->input->post('password');
        $this->ion_auth->login($username, $password, true);
        
        if (!$this->ion_auth->logged_in()) {
            // Invalid login credential
            redirect('home/login/invalid');
            return false;
        }
        
        return true;
    }
    
    public function logout() {
        $this->ion_auth->logout();
        redirect('home/');
    }
    
    public function signup($error = null) {        
        if (isset($error)) {
            // Show the error
            $this->signup_error($error);
        } else {
            if (count($_POST) !== 0) {
                // Process the sign up
                if ($this->validate_signup()) {
                    $this->signup_no_error();
                }
            } else {
                // Show the sign up form
                $this->load->view('/home/signup', $this->data);
            }
        }
    }
    
    private function signup_no_error() {
        $name = $this->input->post('name');
        $username = $this->input->post('username');
        $password = $this->input->post('password');
        $plan = $this->input->post('plan');

        $this->ion_auth->register($username, $password, $username, array(
            'first_name' => $name
        ), array($plan));
        
        $this->load->view('home/signup_thankyou', $this->data);
    }
    
    private function signup_error($error) {
        switch ($error) {
            default:
            case 'incomplete' : {
                $this->data['error'] = 'Fill in the fields!';
            } break;
            case 'invalid' : {
                $this->data['error'] = 'You have entered invalid information!';
            } break;
        }
        
        $this->load->view('/home/signup', $this->data);
        $this->load->view('home/signup_error', $this->data);
    }
    
    private function validate_signup() {
        $posts = $this->input->post();
        
        $name = $this->input->post('name');
        $username = $this->input->post('username');
        $password = $this->input->post('password');
        $password2 = $this->input->post('password2');
        $plan = $this->input->post('plan');
        
        if (!validPosts($posts, 5, array('name', 'username', 'password', 'password2', 'plan'))) {
            $this->signup_error('incomplete');
            return false;
        }
        
        $plans = array();
        foreach($this->data['plans'] as $p) {
            array_push($plans, $p->id);
        }
        
        if ($password !== $password2) {
            $this->signup_error('invalid');
            return false;
        }
                
        if(!array_exists($plan, $plans)) {
            $this->signup_error('invalid');
            return false;
        }
        
        $this->load->library('2toko/utils/StringUtil', array($username));
        if (!$this->stringutil->validEmail()) {
            $this->signup_error('invalid');
            return false;
        }
        
        if ($this->ion_auth->username_check($username)) {
            $this->signup_error('invalid');
            return false;
        }
        
        return true;
    }
}

?>
