<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 *
 * @author chrisfreak
 */
interface ICMSCreator {
    function createFiles();
    function createDatabase();
    function configureCMS();
}

?>
