<?php
    if ( ! defined('BASEPATH')) exit('No direct script access allowed');

    function validPost($data) {
        if (!isset($data)) {
            return false;
        }
        
        if ($data == '') {
            return false;
        }
        
        return true;
    }
    
    function validPosts($posts, $count = 0, $contains = array()) {
        if(!isset($posts) || !is_array($posts)) {
            return false;
        }
        
        if ($count > 0 && count($posts) !== $count) {
            return false;
        }
        
        foreach ($posts as $v) {
            if (!validPost($v)) {
                return false;
            }
        }
        
        if (isset($contains) && is_array($contains) && count($contains) > 0) {
            foreach($contains as $key) {
                if (!array_key_exists($key, $posts)) {
                    return false;
                }
            }
        }
        
        return true;
    }
?>
