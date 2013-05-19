<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Description of DBUtil
 *
 * @author chrisfreak
 */

require_once TOKO_LIB_PATH . 'exceptions/DBException.php';

class DBUtil {
    
    private $host;
    private $account;
    private $username;
    private $password;
    private $dbPrefix = '';
    
    public function __construct() {
        include(APPPATH.'/config/database.php');
    
        // Database data        
        $this->host = $db[$active_group]['hostname'];
        $this->username = $db[$active_group]['username'];
        $this->password = $db[$active_group]['password'];
        $this->account = $db[$active_group]['database'];
        $this->dbPrefix = $db[$active_group]['toko_dbprefix'];
        
        $this->connectDatabase($this->host, $this->account, $this->username, $this->password);
    }
    
    public function createDatabase($dbName, $switch) {
        $dbName = $this->dbPrefix . $dbName;
        try {
            $prepare = $this->newPDOConnection()->prepare("CREATE DATABASE `$dbName`;");
            $this->execute($prepare);
        } catch (PDOException $e) {
            throw new DBException("Failed creating '$dbName' database.", 2);
            return false;
            exit;
        }

        if ($switch == TRUE) {
            $this->connectDatabase($this->host, $dbName, $this->username, $this->password);
        }

        return TRUE;

    }

    public function readSQLFile($sqlFile) {
        require_once TOKO_LIB_PATH . 'utils/SQLParser.php';

        try {
            $prepare = prepareSQLFile($this->newPDOConnection(), $sqlFile);
            $this->execute($prepare);
        } catch (PDOException $e) {
            throw new DBException("Failed executing '$sqlFile'.", 3);
            return FALSE;
            exit;
        }
    }
    
    private function connectDatabase($host, $account, $username, $password) {
        try {
            $setup = R::setup("mysql:host=$host; dbname=$account", $username, $password);

            $this->host = $host;
            $this->account = $account;
            $this->username = $username;
            $this->password = $password;
        } catch (PDOException $e) {
            throw new DBException("Failed to connect '$account' database on '$host' (host) with '$username' and '$password'.", 1);
        }
    }
    
    /**
     * Don't use this too often. It was meant to be private
     * @return \PDO
     */
    public function newPDOConnection() {
        $pdo = new PDO("mysql:host=$this->host;dbname=$this->account", $this->username, $this->password);
        return $pdo;
    }

    /**
     * This function execute a sql query using PDO prepare
     * Don't use this too often. It was meant to be private
     * @param type $prepare from PDO connection (contains mysql query)
     * @return result of the query
     * @throws DBException
     */
    public function execute($prepare) {
        if(isset($prepare)) {
            $exec = $prepare->execute();
            $errors = $prepare->errorInfo();
            if (isset($errors[1]) && isset($errors[2])) {
                $errors = $prepare->errorInfo();
                $sql = $prepare->queryString;
                
                throw new DBException("SQL: $sql. Message: $errors[2]", 5);
            }
            
            return $exec;
        }
    }
}

?>