INSERT INTO profiles
VALUES
(1,'Administrators','Y'),
(2,'Users', 'Y'),
(3,'Read-Only', 'Y');

insert into permissions VALUES 
(1,2,'users','index')
,(2,2,'users','search')
,(3,2,'users','edit')
,(4,2,'users','changePassword')
,(5,2,'profiles','index')
,(6,2,'profiles','search')
,(7,2,'documents','index')
,(8,2,'documents','search')
,(9,2,'documents','shared')
,(10,2,'documents','loadsettings')
,(11,2,'documents','savesettings')
,(12,2,'documents','build')
,(13,2,'documents','delete')
,(14,2,'documents','view')
,(15,2,'documents','reorder')
,(16,2,'documents','add_chapter')
,(17,2,'documents','rename_chapter')
,(18,2,'documents','delete_chapter')
,(19,2,'documents','add_editor')
,(20,2,'documents','delete_editor')
,(21,2,'chapters','view')
,(22,3,'users','index')
,(23,3,'users','search')
,(24,3,'profiles','index')
,(25,3,'profiles','search')
,(26,3,'documents','index')
,(27,3,'documents','search')
,(28,3,'documents','shared')
,(29,3,'documents','loadsettings')
,(30,3,'documents','view')
,(31,3,'chapters','view')
,(32,1,'users','index')
,(33,1,'users','search')
,(34,1,'users','edit')
,(35,1,'users','create')
,(36,1,'users','delete')
,(37,1,'users','changePassword')
,(38,1,'profiles','index')
,(39,1,'profiles','search')
,(40,1,'profiles','edit')
,(41,1,'profiles','create')
,(42,1,'profiles','delete')
,(43,1,'permissions','index')
,(44,1,'documents','index')
,(45,1,'documents','search')
,(46,1,'documents','shared')
,(47,1,'documents','loadsettings')
,(48,1,'documents','savesettings')
,(49,1,'documents','build')
,(50,1,'documents','delete')
,(51,1,'documents','view')
,(52,1,'documents','reorder')
,(53,1,'documents','add_chapter')
,(54,1,'documents','rename_chapter')
,(55,1,'documents','delete_chapter')
,(56,1,'documents','add_editor')
,(57,1,'documents','delete_editor')
,(58,1,'chapters','view')

,(59,2,'documents','export')
,(60,2,'documents','exportStatus');

INSERT INTO users
VALUES
(1, 'Admin Gabriel', 'admin@mob.ro', '$2a$08$HVNWNvx8So43yygXmv1BdeIIsKutwP1uNQAHAaWwGGUnJg4VzWCPS', 'N', 1, 'N', 'N', 'Y'),
(2, 'Editor Gabriel', 'bg@mob.ro', '$2a$08$aWC7Jqxvn2Fn0mCsWoAR9O8grkZq.r/UCqgs18qR3VTmf/La90j/m', 'N', 2, 'N', 'N', 'Y'),
(3, 'Editor Braila', 'gb@mob.ro', '$2a$08$9bwqvsZctavty2NsUZ8AnO6ByPRxVie2RDQywEUi8wtmT3toEu/nO', 'N', 2, 'N', 'N', 'Y');

INSERT INTO semaphore VALUES('Y');