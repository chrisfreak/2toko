<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * A class to manipulate files or folders
 *
 * @author chrisfreak
 */

require_once TOKO_LIB_PATH . 'exceptions/FileException.php';

class FileUtil {
    private $tobeCopied;

    public function __construct($tobeCopied) {
        $this->tobeCopied = $tobeCopied;
    }
    
    /**
     * (PHP 4, PHP 5)<br/>
     *  Copy file or folders recursively
     *  @param dest The destination where the file will be copied to.
     *  @param overwrite TRUE if you want to overwrite the files. Other wise false. Default value = TRUE.
     *  @param recurVar This should NOT be used in external. This parameter meant for recursive purpose only.
     *  @return True if the copying mechanism succeed
     */
    public function copy($dest, $overwrite = TRUE , $recurVar = NULL){
        
        $source = $this->tobeCopied;
        
        if (isset($recurVar)) {
            $source = $recurVar;
        }

        // Simple copy for a file
        if (is_file($source)) {
            if (is_dir($dest)) {
                throw new FileException("'$dest' is a directory, not file.", 1);
            }            
            
            if (!$overwrite && is_file($dest)) {
                throw new FileException("'$dest' is exist already.", 2);
            }
            
            if ($source != "install.sql") {
                $c = copy($source, $dest);
                chmod($dest, 0755);
                return $c;
            }
            exit;
        }
        
        if (!is_file($source) && !is_dir($source)) {
            throw new FileException("'$source' does not exist.", 3);
        }
        
        // Directory recursive copy //

        // Make destination directory
        if (!is_dir($dest)) {
            $subDir = explode("/", $dest);
        
            $tempDir = "";
            for($i = 0; $i < count($subDir); $i++) {
                $tempDir .= $subDir[$i];

                if ($i < ( count($subDir) - 1)) {
                    $tempDir .= "/";
                }

                if (!is_dir($tempDir)) {
                    $oldumask = umask(0);

                    mkdir($tempDir, 0755);
                    umask($oldumask);
                }
            }
        }
        

        // Loop through the folder
        $dir = dir($source);        
        while (false !== ($entry = $dir->read())) {

            // Skip pointers
            if ($entry == "." || $entry == ".." || $entry == "install.sql") {
                continue;
            }

            // Deep copy directories
            if ($dest !== "$source/$entry") {
                $this->copy("$dest/$entry", $overwrite, "$source/$entry");
            }
        }

        // Clean up
        $dir->close();
        
        return TRUE;
    }
    
    public function delete($safe=true){        
        if (is_dir($this->tobeCopied)) {
            if ($safe) {
                return rmdir($this->tobeCopied);
            }

            $objects = scandir($this->tobeCopied);            
            
            foreach ($objects as $object) {
                if ($object != "." && $object != "..") {
                    if (filetype($this->tobeCopied."/".$object) == "dir") rrmdir($this->tobeCopied."/".$object); else unlink($this->tobeCopied."/".$object);
                }
            }
            reset($objects);
            rmdir($this->tobeCopied);
            
            return true;
        }
      
        $unlink = unlink($this->tobeCopied);
        return $unlink;
    }
}

?>
