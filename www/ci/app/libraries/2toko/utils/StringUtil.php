<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Description of StringUtil
 *
 * @author chrisfreak
 */
class StringUtil {
    private $str;
    public function __construct($str) {
        if (is_array($str)) {
            $this->str = $str[0];
        } else {
            $this->str = $str;
        }
    }
    
    /**
     *  This function converts email (username) to db and filesystem friendly string
     */
    public function email2dbname() {
        $r =  str_replace("@", "_at_", $this->str);
        return $r;
    }
    
    /**
     *  This function revert db or filesystem name to its original email (username)
     */
    public function dbname2email() {
        return str_replace("_at_", "@", $this->str);
    }
    
    /**
     * This function checks if it valids domain. It only allows alphanumeric characters only
     */
    public function validDomain() {
        if (preg_match('/[^a-z0-9]/i', $this->str)) {
            return false;
        }
        
        return true;
    }
    
    /**
     *  Source: http://www.linuxjournal.com/article/9585?page=0,3
     */
    public function validEmail() {
        $isValid = true;
        $atIndex = strrpos($this->str, "@");
        if (is_bool($atIndex) && !$atIndex) {
            $isValid = false;
        } else {
            $domain = substr($this->str, $atIndex+1);
            $local = substr($this->str, 0, $atIndex);
            $localLen = strlen($local);
            $domainLen = strlen($domain);
            
            if ($localLen < 1 || $localLen > 64) {
                // local part length exceeded
                $isValid = false;
            } else if ($domainLen < 1 || $domainLen > 255) {
                // domain part length exceeded
                $isValid = false;
            } else if ($local[0] == '.' || $local[$localLen-1] == '.') {
                // local part starts or ends with '.'
                $isValid = false;
            } else if (preg_match('/\\.\\./', $local)) {
                // local part has two consecutive dots
                $isValid = false;
            } else if (!preg_match('/^[A-Za-z0-9\\-\\.]+$/', $domain)) {
                // character not valid in domain part
                $isValid = false;
            } else if (preg_match('/\\.\\./', $domain)) {
                // domain part has two consecutive dots
                $isValid = false;
            } else if (!preg_match('/^(\\\\.|[A-Za-z0-9!#%&`_=\\/$\'*+?^{}|~.-])+$/', str_replace("\\\\","",$local))) {
                // character not valid in local part unless 
                // local part is quoted
                if (!preg_match('/^"(\\\\"|[^"])+"$/', str_replace("\\\\","",$local))) {
                    $isValid = false;
                }
            }
            
            if ($isValid && !(checkdnsrr($domain,"MX") || checkdnsrr($domain,"A"))) {
                // domain not found in DNS
                $isValid = false;
            }
        }
        
        return $isValid;
    }
    
    public function generateZencartPass() {
        // generate salt
        $salt = $this->generateRandomString(2);
        return md5($salt . $this->str) . ':' . $salt;
    }
    
    public function generateRandomString($length = 5) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, strlen($characters) - 1)];
        }
        return $randomString;
    }
}

?>
