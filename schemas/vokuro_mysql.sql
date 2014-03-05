
 CREATE TABLE `email_confirmations` (
   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `usersId` int(10) unsigned NOT NULL,
   `code` char(32) NOT NULL,
   `createdAt` int(10) unsigned NOT NULL,
   `modifiedAt` int(10) unsigned DEFAULT NULL,
   `confirmed` char(1) DEFAULT 'N',
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 





 CREATE TABLE `failed_logins` (
   `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
   `usersId` int(10) unsigned DEFAULT NULL,
   `ipAddress` char(15) NOT NULL,
   `attempted` int(11) unsigned NOT NULL,
   PRIMARY KEY (`id`),
   KEY `usersId` (`usersId`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 




 CREATE TABLE `password_changes` (
   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `usersId` int(10) unsigned NOT NULL,
   `ipAddress` char(15) NOT NULL,
   `userAgent` varchar(48) NOT NULL,
   `createdAt` int(10) unsigned NOT NULL,
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 




 CREATE TABLE `permissions` (
   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `profilesId` int(10) unsigned NOT NULL,
   `resource` varchar(16) NOT NULL,
   `action` varchar(16) NOT NULL,
   PRIMARY KEY (`id`),
   KEY `usersId` (`profilesId`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 





 CREATE TABLE `profiles` (
   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `name` varchar(64) NOT NULL,
   `active` char(1) NOT NULL,
   PRIMARY KEY (`id`),
   KEY `active` (`active`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
 INSERT INTO `profiles` (`name`,`active`) VALUES ('Administrators', 'Y'), ('Users', 'Y'), ('Read-Only', 'Y');






 CREATE TABLE `remember_tokens` (
   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `usersId` int(10) unsigned NOT NULL,
   `token` char(32) NOT NULL,
   `userAgent` varchar(120) NOT NULL,
   `createdAt` int(10) unsigned NOT NULL,
   PRIMARY KEY (`id`),
   KEY `token` (`token`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 



 CREATE TABLE `reset_passwords` (
   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `usersId` int(10) unsigned NOT NULL,
   `code` varchar(48) NOT NULL,
   `createdAt` int(10) unsigned NOT NULL,
   `modifiedAt` int(10) unsigned DEFAULT NULL,
   `reset` char(1) NOT NULL,
   PRIMARY KEY (`id`),
   KEY `usersId` (`usersId`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;





 CREATE TABLE `success_logins` (
   `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
   `usersId` int(10) unsigned NOT NULL,
   `ipAddress` char(15) NOT NULL,
   `userAgent` varchar(120) NOT NULL,
   PRIMARY KEY (`id`),
   KEY `usersId` (`usersId`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;




 CREATE TABLE `users` (
   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `name` varchar(32) NOT NULL,
   `email` varchar(48) NOT NULL,
   `password` char(60) NOT NULL,
   `mustChangePassword` char(1) DEFAULT NULL,
   `profilesId` int(10) unsigned NOT NULL,
   `banned` char(1) NOT NULL,
   `suspended` char(1) NOT NULL,
   `active` char(1) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `profilesId` (`profilesId`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;



 CREATE TABLE `documents` (
   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `usersId` int(10) unsigned NOT NULL,
   `name` varchar(64) NOT NULL,
   `editorCreateChapter` char(1) NOT NULL DEFAULT 'N',
   `editorDeleteChapter` char(1) NOT NULL DEFAULT 'N',
   `editorReorderChapter` char(1) NOT NULL DEFAULT 'N',
   `createdAt` int(10) unsigned NOT NULL,
   PRIMARY KEY (`id`),
   KEY `documents_key1` (`usersId`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


 CREATE TABLE `editors` (
   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `usersId` int(10) unsigned NOT NULL,
   `documentsId` int(10) unsigned NOT NULL,
   `email` varchar(48) NOT NULL,
   `createdAt` int(10) unsigned NOT NULL,
   PRIMARY KEY (`id`),
   KEY `editors_key1` (`usersId`),
   KEY `editors_key2` (`documentsId`),
   KEY `editors_key3` (`email`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;



 CREATE TABLE `chapters` (
   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `name` varchar(64) NOT NULL,
   `usersId` int(10) unsigned NOT NULL,
   `documentsId` int(10) unsigned NOT NULL,
   `sortOrder` int(10) unsigned NOT NULL,
   `createdAt` int(10) unsigned NOT NULL,
   PRIMARY KEY (`id`),
   KEY `chapters_key1` (`usersId`),
   KEY `chapters_key2` (`documentsId`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

