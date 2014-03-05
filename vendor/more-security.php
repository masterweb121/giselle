<?php
/*
Creates Memcache record of current user session - can be used by auth_memcache
Not used directly by docadmin
*/

 $my_user=$user->name; // Set to full name of the user 
 $my_groups='DocAdmin'; // This is fine - hard code 
 if (isset($_SERVER["HTTP_X_FORWARDED_FOR"])) $my_remoteip=$_SERVER["HTTP_X_FORWARDED_FOR"]; 
 if (isset($_SERVER["HTTP_VIA"])) $my_remoteip=$_SERVER["HTTP_VIA"]; 
 if (!isset($my_remoteip)) $my_remoteip=$_SERVER["REMOTE_ADDR"]; 
 $my_expiretime=$config->session->expires;// Set to $session_expires from config.php 
 $my_send_pass_flag=false; 
 $my_mail=$user->email; // Set to user email 
 $my_name=$user->name; // set to full name of user 
 $my_secure=false; 
 $my_password=''; // leave blank 
 $my_cookie_name ='secureauthcookie'; // leave as is 
 $my_path='/'; 
 $my_domain =$config->application->securecookiedomain; // from config.php

 $di = \Phalcon\DI::getDefault();
 $memcache = $di->getShared('MoreSecurityMemcache'); 

 $key=md5(uniqid(rand(), true).$_SERVER["REMOTE_ADDR"].time());
 // contruct session value to be stored in memcached for the cookie session id. The format is important..
 $value="UserName=".$my_user."\r\n";
 $value.="Groups=".$my_groups."\r\n";
 $value.="RemoteIP=".$my_remoteip."\r\n";
 $value.="Expiration=".$my_expiretime."\r\n";
 if ($my_send_pass_flag!=FALSE) $value.="Password=".$my_password."\r\n";
 $value.="Email=".$my_mail."\r\n";
 $value.="Name=".$my_name."\r\n";
 // store value for the key in memcache deamon
 $memcache->set($key,$value,false,$my_expiretime);
 
 // set cookie session
 if ($my_expiretime!=0) setcookie($my_cookie_name,$key,time()+$my_expiretime,$my_path,$my_domain,$my_secure);
   else setcookie($my_cookie_name,$key,$my_expiretime,$my_path,$my_domain,$my_secure);
 header("Location: ");