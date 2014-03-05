--
-- CREATE TABLE `email_confirmations` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `usersId` int(10) unsigned NOT NULL,
--   `code` char(32) NOT NULL,
--   `createdAt` int(10) unsigned NOT NULL,
--   `modifiedAt` int(10) unsigned DEFAULT NULL,
--   `confirmed` char(1) DEFAULT 'N',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 

CREATE SEQUENCE email_confirmations_id_seq;
CREATE TABLE email_confirmations (
    id INTEGER NOT NULL DEFAULT nextval('email_confirmations_id_seq'),
    "usersId" INTEGER NOT NULL,
    code CHAR(32) NOT NULL,
    "createdAt" INTEGER NOT NULL,
    "modifiedAt" INTEGER DEFAULT NULL,
    confirmed CHAR(1) DEFAULT 'N'
);
ALTER SEQUENCE email_confirmations_id_seq owned by email_confirmations.id;
ALTER TABLE email_confirmations ADD PRIMARY KEY (id);



-- CREATE TABLE `failed_logins` (
--   `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
--   `usersId` int(10) unsigned DEFAULT NULL,
--   `ipAddress` char(15) NOT NULL,
--   `attempted` int(11) unsigned NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `usersId` (`usersId`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 
CREATE SEQUENCE failed_logins_id_seq;
CREATE TABLE failed_logins (
    id INTEGER NOT NULL DEFAULT nextval('failed_logins_id_seq'),
    "usersId" INTEGER DEFAULT NULL,
    "ipAddress" CHAR(15) NOT NULL,
    attempted INTEGER NOT NULL    
);
ALTER SEQUENCE failed_logins_id_seq owned by failed_logins.id;
ALTER TABLE failed_logins ADD PRIMARY KEY (id);
CREATE INDEX failed_logins_key1 ON failed_logins ("usersId");



-- CREATE TABLE `password_changes` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `usersId` int(10) unsigned NOT NULL,
--   `ipAddress` char(15) NOT NULL,
--   `userAgent` varchar(48) NOT NULL,
--   `createdAt` int(10) unsigned NOT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 
CREATE SEQUENCE password_changes_id_seq;
CREATE TABLE password_changes (
    id INTEGER NOT NULL DEFAULT nextval('password_changes_id_seq'),
    "usersId" INTEGER NOT NULL,
    "ipAddress" CHAR(15) NOT NULL,
    "userAgent" VARCHAR(48) NOT NULL,
    "createdAt" INTEGER NOT NULL
);
ALTER SEQUENCE password_changes_id_seq owned by password_changes.id;
ALTER TABLE password_changes ADD PRIMARY KEY (id);



-- CREATE TABLE `permissions` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `profilesId` int(10) unsigned NOT NULL,
--   `resource` varchar(16) NOT NULL,
--   `action` varchar(16) NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `usersId` (`profilesId`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 
CREATE SEQUENCE permissions_id_seq;
CREATE TABLE permissions (
    id INTEGER NOT NULL DEFAULT nextval('permissions_id_seq'),
    "profilesId" INTEGER NOT NULL,
    resource VARCHAR(16) NOT NULL,
    action VARCHAR(16) NOT NULL    
);
ALTER SEQUENCE permissions_id_seq owned by permissions.id;
ALTER TABLE permissions ADD PRIMARY KEY (id);
CREATE INDEX permissions_key1 ON permissions ("profilesId");




-- CREATE TABLE `profiles` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `name` varchar(64) NOT NULL,
--   `active` char(1) NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `active` (`active`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 
-- INSERT INTO `profiles` (`name`,`active`) VALUES ('Administrators', 'Y'), ('Users', 'Y'), ('Read-Only', 'Y');
--
--
CREATE SEQUENCE profiles_id_seq;
CREATE TABLE profiles (
    id INTEGER NOT NULL DEFAULT nextval('profiles_id_seq'),    
    name VARCHAR(64) NOT NULL,
    active CHAR(1) NOT NULL    
);
ALTER SEQUENCE profiles_id_seq owned by profiles.id;
ALTER TABLE profiles ADD PRIMARY KEY (id);
CREATE INDEX profiles_key1 ON profiles (active);



-- CREATE TABLE `remember_tokens` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `usersId` int(10) unsigned NOT NULL,
--   `token` char(32) NOT NULL,
--   `userAgent` varchar(120) NOT NULL,
--   `createdAt` int(10) unsigned NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `token` (`token`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 
CREATE SEQUENCE remember_tokens_id_seq;
CREATE TABLE remember_tokens (
    id INTEGER NOT NULL DEFAULT nextval('remember_tokens_id_seq'),
    "usersId" INTEGER NOT NULL,
    token CHAR(32) NOT NULL,
    "userAgent" VARCHAR(120) NOT NULL,
    "createdAt" INTEGER NOT NULL    
);
ALTER SEQUENCE remember_tokens_id_seq owned by remember_tokens.id;
ALTER TABLE remember_tokens ADD PRIMARY KEY (id);
CREATE INDEX remember_tokens_key1 ON remember_tokens (token);



-- CREATE TABLE `reset_passwords` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `usersId` int(10) unsigned NOT NULL,
--   `code` varchar(48) NOT NULL,
--   `createdAt` int(10) unsigned NOT NULL,
--   `modifiedAt` int(10) unsigned DEFAULT NULL,
--   `reset` char(1) NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `usersId` (`usersId`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
CREATE SEQUENCE reset_passwords_id_seq;
CREATE TABLE reset_passwords (
    id INTEGER NOT NULL DEFAULT nextval('reset_passwords_id_seq'),
    "usersId" INTEGER NOT NULL,
    code VARCHAR(48) NOT NULL,
    "createdAt" INTEGER NOT NULL,
    "modifiedAt" INTEGER DEFAULT NULL,
    reset CHAR(1) NOT NULL
);
ALTER SEQUENCE reset_passwords_id_seq owned by reset_passwords.id;
ALTER TABLE reset_passwords ADD PRIMARY KEY (id);
CREATE INDEX reset_passwords_key1 ON reset_passwords ("usersId");



-- CREATE TABLE `success_logins` (
--   `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
--   `usersId` int(10) unsigned NOT NULL,
--   `ipAddress` char(15) NOT NULL,
--   `userAgent` varchar(120) NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `usersId` (`usersId`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
CREATE SEQUENCE success_logins_id_seq;
CREATE TABLE success_logins (
    id INTEGER NOT NULL DEFAULT nextval('success_logins_id_seq'),
    "usersId" INTEGER NOT NULL,
    "ipAddress" CHAR(15) NOT NULL,    
    "userAgent" VARCHAR(120) NOT NULL
);
ALTER SEQUENCE success_logins_id_seq owned by success_logins.id;
ALTER TABLE success_logins ADD PRIMARY KEY (id);
CREATE INDEX success_logins_key1 ON success_logins ("usersId");


-- CREATE TABLE `users` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `name` varchar(32) NOT NULL,
--   `email` varchar(48) NOT NULL,
--   `password` char(60) NOT NULL,
--   `mustChangePassword` char(1) DEFAULT NULL,
--   `profilesId` int(10) unsigned NOT NULL,
--   `banned` char(1) NOT NULL,
--   `suspended` char(1) NOT NULL,
--   `active` char(1) DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   KEY `profilesId` (`profilesId`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
CREATE SEQUENCE users_id_seq;
CREATE TABLE users (
    id INTEGER NOT NULL DEFAULT nextval('users_id_seq'),
    name VARCHAR(32) NOT NULL,
    email VARCHAR(48) NOT NULL,
    password CHAR(60) NOT NULL,
    "mustChangePassword" CHAR(1) DEFAULT NULL,
    "profilesId" INTEGER NOT NULL,
    banned CHAR(1) NOT NULL,
    suspended CHAR(1) NOT NULL,
    active CHAR(1) DEFAULT NULL,
    "authorID" character varying    
);
ALTER SEQUENCE users_id_seq owned by users.id;
ALTER TABLE users ADD PRIMARY KEY (id);
CREATE INDEX users_key1 ON users ("profilesId");

-- Data profiles
--COPY profiles (id, name, active) FROM stdin;
--1	Administrators	Y
--2	Users	Y
--3	Read-Only	Y
--\.

-- CREATE TABLE `documents` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `usersId` int(10) unsigned NOT NULL,
--   `name` varchar(64) NOT NULL,
--   `editorCreateChapter` char(1) NOT NULL DEFAULT 'N',
--   `editorDeleteChapter` char(1) NOT NULL DEFAULT 'N',
--   `editorReorderChapter` char(1) NOT NULL DEFAULT 'N',
--   `createdAt` int(10) unsigned NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `documents_key1` (`usersId`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE SEQUENCE documents_id_seq;
CREATE TABLE documents (
    id INTEGER NOT NULL DEFAULT nextval('documents_id_seq'),
    "usersId" INTEGER NOT NULL,    
    name VARCHAR(64) NOT NULL,
    "editorCreateChapter" CHAR(1) NOT NULL DEFAULT 'N',
    "editorDeleteChapter" CHAR(1) NOT NULL DEFAULT 'N',
    "editorReorderChapter" CHAR(1) NOT NULL DEFAULT 'N',
    "createdAt" INTEGER NOT NULL,
    "lastOpenedAt" INTEGER NOT NULL,
    "editorReadOnly" CHAR(1) NOT NULL DEFAULT 'N',
    "groupID" CHAR varying,
    "exportRequested" INTEGER
);
ALTER SEQUENCE documents_id_seq owned by documents.id;
ALTER TABLE documents ADD PRIMARY KEY (id);
CREATE INDEX documents_key1 ON documents ("usersId");


CREATE TABLE exports (
    "documentsId" INTEGER NOT NULL,       
    html bytea,
    "convertedAt" integer,
    converted character(1),
    converted_to_one character varying,
    converted_to_two character varying,
    converted_to_three character varying,
    format_one char varying,
    format_two char varying,
    format_three char varying
);
CREATE UNIQUE INDEX exports_key1 ON exports ("documentsId");
ALTER TABLE exports
  ADD CONSTRAINT exports_deleted_by_documents FOREIGN KEY ("documentsId")
      REFERENCES documents (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE;
ALTER TABLE exports
  ADD CONSTRAINT exports_pk PRIMARY KEY("documentsId");


-- CREATE TABLE `editors` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `usersId` int(10) unsigned NOT NULL,
--   `documentsId` int(10) unsigned NOT NULL,
--   `email` varchar(48) NOT NULL,
--   `createdAt` int(10) unsigned NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `editors_key1` (`usersId`),
--   KEY `editors_key2` (`documentsId`),
--   KEY `editors_key3` (`email`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE SEQUENCE editors_id_seq;
CREATE TABLE editors (
    id INTEGER NOT NULL DEFAULT nextval('editors_id_seq'), 
    "usersId" INTEGER NOT NULL,
    email VARCHAR(48) NOT NULL,
    "documentsId" INTEGER NOT NULL,    
    "createdAt" INTEGER NOT NULL,    
    "lastOpenedAt" INTEGER NOT NULL    
);
ALTER SEQUENCE editors_id_seq owned by editors.id;
ALTER TABLE editors ADD PRIMARY KEY (id);
ALTER TABLE editors
  ADD CONSTRAINT deleted_from_documents FOREIGN KEY ("documentsId") REFERENCES documents (id)
   ON UPDATE NO ACTION ON DELETE CASCADE;
CREATE INDEX editors_key1 ON editors ("usersId");
CREATE INDEX editors_key2 ON editors ("documentsId");
CREATE INDEX editors_key3 ON editors ("email");


-- CREATE TABLE `chapters` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `name` varchar(64) NOT NULL,
--   `usersId` int(10) unsigned NOT NULL,
--   `documentsId` int(10) unsigned NOT NULL,
--   `sortOrder` int(10) unsigned NOT NULL,
--   `createdAt` int(10) unsigned NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `chapters_key1` (`usersId`),
--   KEY `chapters_key2` (`documentsId`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Table: chapters

-- DROP TABLE chapters;
CREATE SEQUENCE chapters_id_seq;
CREATE TABLE chapters (
    id INTEGER NOT NULL DEFAULT nextval('chapters_id_seq'), 
    name VARCHAR(64) NOT NULL,
    "usersId" INTEGER NOT NULL,
    "documentsId" INTEGER NOT NULL,
    "sortOrder" INTEGER NOT NULL,    
    "createdAt" INTEGER NOT NULL
);
ALTER SEQUENCE chapters_id_seq owned by chapters.id;
ALTER TABLE chapters ADD PRIMARY KEY (id);
ALTER TABLE chapters
  ADD CONSTRAINT chapters_deleted_by_documents FOREIGN KEY ("documentsId")
      REFERENCES documents (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE;
CREATE INDEX chapters_key1 ON editors ("usersId");
CREATE INDEX chapters_key2 ON editors ("documentsId");

CREATE TABLE semaphore
(
  green CHAR(1)
)
