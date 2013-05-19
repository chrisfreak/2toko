<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Description of CMSSelector
 *
 * @author chrisfreak
 */

require_once TOKO_LIB_PATH . 'utils/StringUtil.php';
require_once TOKO_LIB_PATH . 'creation/abstr/ICMSSelector.php';
require_once TOKO_LIB_PATH . 'creation/impl/OpenCartCreator.php';

class CMSSelector implements ICMSSelector {
    
    private $user;
    private $cms;
    private $domainName;
    private $admin;
    private $password;
    private $email;    
    
    public function init($user, $cmsObj, $domainName, $admin, $password, $email) {        
        
        if (get_class($cmsObj) !== 'CMS') {
            exit('wrong type of object: It should be CMS object');
            return false;
        }
        
        $this->user = $user;
        $this->cms = $cmsObj;
        $this->domainName = $domainName;
        $this->admin = $admin;
        $this->password = $password;
        $this->email = $email;
        
    }

    public function process() {
        if (!isset($this->user) || !isset($this->cms) || !isset($this->admin) || 
                !isset($this->password) || !isset($this->email) || !isset($this->domainName)) {
            exit('Variables has not been initialized yet! Call init first!');
            return;
        }
        
        $cmsCreator;
        switch($this->cms) {
            default:
            case 'opencart':
                $cmsCreator = new OpenCartCreator($this->user, $this->admin, $this->password, $this->cms, $this->domainName);
                break;
        }
        
        if (!$cmsCreator->createDatabase() || !$cmsCreator->createFiles() || !$cmsCreator->configureCMS()) {
            return false;
            exit('Something went wrong');
        }

        return true;
    }
}

?>
