<?php

/**
 * Description of CMSGenericCreator
 *
 * @author chrisfreak
 */
class CMSGenericCreator {
        public $user;
        public $admin;
        public $password;
        public $cms;
        public $dbConnection;
        public $tokoId;
        
        public $domainName;
        public $tokoPath; // base folder for each toko
        public $serverDomain; //base domain of the server

        public function __construct($user, $admin, $password, $cmsObj, $domainName) {
            include(APPPATH . '/config/config.php');
            
            $this->user = $user;
            $this->admin = $admin;
            $this->password = $password;
            $this->serverDomain = $config['2toko_domain'];
            $this->tokoPath = $config['2toko_tokosPath'] . $domainName;
            
            $this->cms = $cmsObj;
            $this->cms->installation = $config['2toko_installersPath'] . $this->cms->installation;   // overide the installer path to include 'installers'

            $this->domainName = $domainName;
            $this->dbConnection = new DBUtil();
        
            $this->init();
        }
    
        private function init() {
            if (!isset($this->cms->id) || $this->checkCMSname !== $this->cms->name) {
                exit('CMS object is not proper!');
                return;
            }

            // Insert to tokos table
            $toko = new Tokos();
            $this->tokoId = $toko->insert($this->user->id, $this->cms->id, $this->domainName);
            
            if (!isset($this->tokoId) || !is_int($this->tokoId)) {
                exit('Inserting toko failed!');
                return;
            }
        }
}

?>
