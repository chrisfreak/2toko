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
        
        // Frontend config
        $configStringFrontend = file_get_contents($this->cms->installation . '/config.php');       
        //$configStringFrontend = $this->replaceConfigStrings($configStringFrontend);
        $configStringFrontend = str_replace('{subdomain}', $this->domainName, $configStringFrontend);
        $configStringFrontend = str_replace('{domain}', $this->serverDomain, $configStringFrontend);
        $configStringFrontend = str_replace('{dbDriver}', $db[$active_group]['dbdriver'], $configStringFrontend);
        $configStringFrontend = str_replace('{dbHost}', $db[$active_group]['hostname'], $configStringFrontend);
        $configStringFrontend = str_replace('{dbUsername}', $db[$active_group]['username'], $configStringFrontend);
        $configStringFrontend = str_replace('{dbPass}', $db[$active_group]['password'], $configStringFrontend);
        $configStringFrontend = str_replace('{dbName}', $db[$active_group]['toko_dbprefix'] . $this->domainName, $configStringFrontend);
        $configStringFrontend = str_replace('{dbPrefix}', 'oc_', $configStringFrontend);
        
        $configPathFrontend = $_SERVER['DOCUMENT_ROOT'] . "/$this->tokoPath" . "/config.php";
        $fHandlerFrontend = fopen($configPathFrontend, 'w') or die("Cannot open the following file: $configPathFrontend");
        fwrite($fHandlerFrontend, $configStringFrontend);
        fclose($fHandlerFrontend);
        
        // Admin config
        $configStringAdmin = file_get_contents($this->cms->installation . '/admin/config.php');       
        //$configStringAdmin = $this->replaceConfigStrings($configStringAdmin);
        $configStringAdmin = str_replace('{subdomain}', $this->domainName, $configStringAdmin);
        $configStringAdmin = str_replace('{domain}', $this->serverDomain, $configStringAdmin);
        $configStringAdmin = str_replace('{dbDriver}', $db[$active_group]['dbdriver'], $configStringAdmin);
        $configStringAdmin = str_replace('{dbHost}', $db[$active_group]['hostname'], $configStringAdmin);
        $configStringAdmin = str_replace('{dbUsername}', $db[$active_group]['username'], $configStringAdmin);
        $configStringAdmin = str_replace('{dbPass}', $db[$active_group]['password'], $configStringAdmin);
        $configStringAdmin = str_replace('{dbName}', $db[$active_group]['toko_dbprefix'] . $this->domainName, $configStringAdmin);
        $configStringAdmin = str_replace('{dbPrefix}', 'oc_', $configStringAdmin);
        
        $configPathAdmin = $_SERVER['DOCUMENT_ROOT'] . "/$this->tokoPath" . "/admin/config.php";
        $fHandlerAdmin = fopen($configPathFrontend, 'w') or die("Cannot open the following file: $configPathAdmin");
        fwrite($fHandlerAdmin, $configStringAdmin);
        fclose($fHandlerAdmin);
        return true;
    }
    
    private function replaceConfigStrings($config) {
        include(APPPATH . '/config/database.php');
        
        $config = str_replace('{subdomain}', $this->domainName, $config);
        $config = str_replace('{domain}', $this->serverDomain, $config);
        $config = str_replace('{dbDriver}', $db[$active_group]['dbdriver'], $config);
        $config = str_replace('{dbHost}', $db[$active_group]['hostname'], $config);
        $config = str_replace('{dbUsername}', $db[$active_group]['username'], $config);
        $config = str_replace('{dbPass}', $db[$active_group]['password'], $config);
        $config = str_replace('{dbName}', $db[$active_group]['toko_dbprefix'] . $this->domainName, $config);
        $config = str_replace('{dbPrefix}', 'oc_', $config);
    }

}

?>
