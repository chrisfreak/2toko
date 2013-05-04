<form method="post">
    Pick CMS: <select name="cms">
        <?php foreach($CMSs as $cms): ?>
            <option value="<?php e($cms->id); ?>"><?php e($cms->name); ?></option>
        <?php endforeach; ?>
    </select>
    <p>Domain: <input type="text" name="domainName" /></p>
    <p>Username: <input type="text" name="username" /></p>
    <p>Password: <input type="password" name="password" /></p>
    <p>Repeat password: <input type="password" name="password2" /></p>
    <p><input type="submit" value="Start your own business!" /></p>
</form>

<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
