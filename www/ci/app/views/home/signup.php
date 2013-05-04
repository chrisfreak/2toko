<p>Signup form</p>
<form method="post" action="<?php e(site_url('home/signup/')); ?>">
    <p>Name: <input type="text" name="name" /></p>
    <p>Username: <input type="text" name="username" /></p>
    <p>Password: <input type="password" name="password" /></p>
    <p>Repeat password: <input type="password" name="password2" /></p>
    <p>
        Plan: <select name="plan">
            <?php foreach($plans as $plan): ?>
                <option value="<?php e($plan->id); ?>"><?php e($plan->name); ?></option>
            <?php endforeach; ?>
        </select>
        
    </p>
    <p><input type="submit" value="Join 2toko.com" /></p>
</form>
<p><a href="<?php e(site_url('home/')); ?>">Home</a></p>
<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
