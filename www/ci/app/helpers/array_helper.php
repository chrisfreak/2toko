<?php

    if ( ! defined('BASEPATH')) exit('No direct script access allowed');
    
    /**
     * Searches a value in a one dimension array
     * 
     * @param type $v The value that wants to be searched
     * @param type $arr The array object     
     */
    function array_exists($v, $arr) {
        if (!is_array($arr)) {
            return false;
        }
        
        foreach($arr as $val) {
            if ($val === $v) {
                return true;
            }
        }
        
        return false;
    }

    /**
     * Change array key to a new key, copying its content
     * 
     * @param array $arr The array that you want to be altered
     * @param array $old The old key name(s) that you want to remove. Length of this array should be equal with new keys.
     * @param array $new The new key name(s) that replaces the old key(s). Length of this array should be equal with old keys.
     * 
     * @return array return new array with new keys
     */
    function alter_array_key($arr, $old, $new) {
        
        if(!is_array($old) || !is_array($new)) {
            return $arr;
        }
        
        if (count($old) !== count($new) && count($old) > 0) {
            return $arr;
        }
        
        for($i = 0; $i < count($old); $i++) {
            $oldKey = $old[$i];
            $newKey = $new[$i];
            
            $arr->$newKey = $arr->$oldKey;
            unset($arr->$oldKey);
        }
        
        return $arr;
    }
?>
