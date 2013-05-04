<?php

/**
 * Description of CustomException
 *
 * @author chrisfreak
 */
class CustomException extends Exception {
    
    public function __construct($message, $code, $previous = NULL) {
        
        if (defined('DEBUG') && DEBUG === TRUE) {
            echo 'ERROR!';
            echo '<br>';
            echo 'Message : ' . $message;
            echo '<br>';
            echo 'Code : ' . $code;
            echo '<br>';
            echo 'Previous : ' . $previous;
            echo '<br>';
            var_dump(debug_backtrace());
        }
        
        parent::__construct($message, $code, $previous);
    }
}

?>
