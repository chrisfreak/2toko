<?php

/**
 * Description of CMSGenericCreator
 *
 * @author chrisfreak
 */
class CMSGenericCreator {
        public $userId;
        public $admin;
        public $password;
        public $cms;
        public $dbConnection;
        public $tokoId;
        
        public $domainName;
        public $tokoPath = "tokos"; // base folder for each toko
        public $serverDomain = "test.com"; // base domain of the server

        public function __construct($userId, $admin, $password, $cmsObj, $domainName) {
            $this->userId = $userId;
            $this->admin = $admin;
            $this->password = $password;            
            
            $this->cms = $cmsObj;
            $this->cms->installation = 'installers/' . $this->cms->installation;   // overide the installer path to include 'installers
            
            $this->domainName = $domainName;
            $this->dbConnection = new DBUtil();
            
            $this->tokoPath .= "/$domainName";
        
            $this->init();
        }
    
        private function init() {
            if (!isset($this->cms->id) || $this->checkCMSname !== $this->cms->name) {
                exit('CMS object is not proper!');
                return;
            }

            // Insert to tokos table
            $toko = new Tokos();
            $this->tokoId = $toko->insert($this->userId, $this->cms->id, $this->domainName);
            
            if (!isset($this->tokoId) || !is_int($this->tokoId)) {
                exit('Inserting toko failed!');
                return;
            }
        }
}

?>
