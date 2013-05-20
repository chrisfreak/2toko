<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Description of ZenCartCreator
 *
 * @author chrisfreak
 */

require_once TOKO_LIB_PATH . 'creation/abstr/ICMSCreator.php';
require_once TOKO_LIB_PATH . 'creation/impl/CMSGenericCreator.php';
require_once TOKO_LIB_PATH . 'utils/FileUtil.php';
require_once TOKO_LIB_PATH . 'utils/DBUtil.php';
class ZenCartCreator extends CMSGenericCreator implements ICMSCreator {
    
    public $checkCMSname    = 'zencart';
    public $tablePrefix     = 'zen_';
    
    public function createFiles() {
        try {
            $fileUtil = new FileUtil($this->cms->installation);
            $fileUtil->copy($this->tokoPath, true);
        } catch (Exception $e) {
            return false;
        }
        
        return true;
    }

    public function createDatabase() {
        if (isset($this->dbConnection)) {
            try {
                // Create database and populate
                $this->dbConnection->createDatabase($this->domainName, true);
                $this->dbConnection->readSQLFile($this->cms->installation . '/install.sql');
                
                // Modify zen configuration
                $query = 'INSERT INTO ' . $this->tablePrefix . 'user(`user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `code`, `ip`, `status`, `date_added`) ';
                $query .= "VALUES(1, '$this->admin', '$this->password', '', '" . $this->user->first_name . "', '" . $this->user->last_name . "', '" . $this->user->email . "', 0, '" . $this->user->ip_address . "', 1, NOW())";
                $prepare = $this->dbConnection->newPDOConnection()->prepare($query);
                $this->dbConnection->execute($prepare);
            } catch (DBException $e) {
                return false;
            }
            
            return true;
        } else {
            exit('DB Connection not found!');
            return false;
        }
    }

    public function configureCMS() {
        // Zen front configuration
        $configStringFrontend = file_get_contents($this->cms->installation . '/config.php');       
        $configStringFrontend = $this->replaceConfigStrings($configStringFrontend);
        
        $configPathFrontend = $_SERVER['DOCUMENT_ROOT'] . "/$this->tokoPath" . "/config.php";
        $fHandlerFrontend = fopen($configPathFrontend, 'w') or die("Cannot open the following file: $configPathFrontend");
        fwrite($fHandlerFrontend, $configStringFrontend);
        fclose($fHandlerFrontend);
        
        // Zen admin config
        $configStringAdmin = file_get_contents($this->cms->installation . '/admin/includes/configure.php');       
        $configStringAdmin = $this->replaceConfigStrings($configStringAdmin);
        
        $configPathAdmin = $_SERVER['DOCUMENT_ROOT'] . "/$this->tokoPath" . "/admin/includes/configure.php";
        $fHandlerAdmin = fopen($configPathAdmin, 'w') or die("Cannot open the following file: $configPathAdmin");
        fwrite($fHandlerAdmin, $configStringAdmin);
        fclose($fHandlerAdmin);
        return true;
    }
    
    private function replaceConfigStrings($config) {
        include(APPPATH . '/config/database.php');
        
        $config = str_replace('{subdomain}', $this->domainName, $config);
        $config = str_replace('{domain}', $this->serverDomain, $config);
        $config = str_replace('{basePath}', $_SERVER['DOCUMENT_ROOT'] . "/$this->tokoPath", $config);
        $config = str_replace('{dbDriver}', $db[$active_group]['dbdriver'], $config);
        $config = str_replace('{dbHost}', $db[$active_group]['hostname'], $config);
        $config = str_replace('{dbUsername}', $db[$active_group]['username'], $config);
        $config = str_replace('{dbPass}', $db[$active_group]['password'], $config);
        $config = str_replace('{dbName}', $db[$active_group]['toko_dbprefix'] . $this->domainName, $config);
        $config = str_replace('{dbPrefix}', $this->tablePrefix, $config);
        
        return $config;
    }
}

?>
