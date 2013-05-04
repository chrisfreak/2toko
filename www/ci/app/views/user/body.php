<form method="post" action="<?php e(site_url('user/update/')); ?>">
    <p>Name: <?php e($user->first_name); ?></p>
    <p>Username: <?php e($user->username); ?></p>
    <p>Company: <input type="text" name="company" value="<?php e($user->company); ?>" /></p>
    <p>Plan: <?php e($user->group->name); ?></p>
    <p><input type="submit" value="Update your profile"/></p>
</form>

<p><a href="<?php e(site_url('home/')); ?>">Home</a><p>
<p><a href="<?php e(site_url('user/start_toko')); ?>">Start a new toko!</a><p>
<p><a href="<?php e(site_url('home/logout/')); ?>">Logout</a><p>
<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
