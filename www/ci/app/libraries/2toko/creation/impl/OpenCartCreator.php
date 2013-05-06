<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Description of OpenCartCreator
 *
 * @author chrisfreak
 */

require_once TOKO_LIB_PATH . 'creation/abstr/ICMSCreator.php';
require_once TOKO_LIB_PATH . 'creation/impl/CMSGenericCreator.php';
require_once TOKO_LIB_PATH . 'utils/FileUtil.php';
require_once TOKO_LIB_PATH . 'utils/DBUtil.php';
class OpenCartCreator extends CMSGenericCreator implements ICMSCreator {
    
    
    public $checkCMSname = 'opencart';
    
    function createFiles() {
        try {
            $fileUtil = new FileUtil($this->cms->installation);
            $fileUtil->copy($this->tokoPath, true);
        } catch (Exception $e) {
            return false;
        }
        
        return true;
    }
    
    function createDatabase() {
        if (isset($this->dbConnection)) {
            try {
                $this->dbConnection->createDatabase($this->domainName, true);
                $this->dbConnection->readSQLFile($this->cms->installation . '/install.sql');
            } catch (DBException $e) {
                return false;
            }
            
            return true;
        } else {
            exit('DB Connection not found!');
            return false;
        }        
    }
    
    function configureCMS() {
        include(APPPATH . '/config/database.php');
        
        $config = "
            // HTTP
            define('HTTP_SERVER', 'http://$this->domainName.$this->serverDomain/');
            define('HTTP_IMAGE', 'http://$this->domainName.$this->serverDomain/image/');
            define('HTTP_ADMIN', 'http://$this->domainName.$this->serverDomain/admin/');

            // HTTPS
            define('HTTPS_SERVER', 'https://$this->domainName.$this->serverDomain/');
            define('HTTPS_IMAGE', 'https://$this->domainName.$this->serverDomain/image/');

            // DIR
            define('DIR_APPLICATION', 'catalog/');
            define('DIR_SYSTEM', 'system/');
            define('DIR_DATABASE', 'system/database/');
            define('DIR_LANGUAGE', 'catalog/language/');
            define('DIR_TEMPLATE', 'catalog/view/theme/');
            define('DIR_CONFIG', 'system/config/');
            define('DIR_IMAGE', 'image/');
            define('DIR_CACHE', 'system/cache/');
            define('DIR_DOWNLOAD', 'download/');
            define('DIR_LOGS', 'system/logs/');

            // DB
            define('DB_DRIVER', '" . $db[$active_group]['dbdriver'] ."');
            define('DB_HOSTNAME', '" . $db[$active_group]['hostname'] ."');
            define('DB_USERNAME', '" . $db[$active_group]['username'] ."');
            define('DB_PASSWORD', '" . $db[$active_group]['password'] ."');
            define('DB_DATABASE',  '" . $db[$active_group]['toko_dbprefix'] . '_' . $this->domainName ."');
            define('DB_PREFIX', 'oc_');
            ";
        
        $config = '<?php'.
            $config .
            '?>';
        
        $filePath = $_SERVER['DOCUMENT_ROOT'] . "/$this->tokoPath" . "/config.php";
        $fHandler = fopen($filePath, 'w') or die("Cannot open the following file: $filePath");
        fwrite($fHandler, $config);
        fclose($fHandler);

        return true;
    }

}

?>
