PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE user (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 name TEXT NOT NULL DEFAULT '',
 password TEXT NOT NULL DEFAULT '',
 nickname TEXT NOT NULL DEFAULT '',
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME,
 deleted_at DATETIME,
 avator TEXT NOT NULL DEFAULT ''
);
INSERT INTO user VALUES(1,'agent','b33aed8f3134996703dc39f9a7c95783','Open Source LiveChat Support','2020-06-27 19:32:41','2020-07-04 09:32:20',NULL,'/static/images/4.jpg');
CREATE TABLE visitor (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 name TEXT NOT NULL DEFAULT '',
 avator TEXT NOT NULL DEFAULT '',
 source_ip TEXT NOT NULL DEFAULT '',
 to_id INTEGER NOT NULL DEFAULT 0,
 status INTEGER NOT NULL DEFAULT 0,
 user_agent TEXT NOT NULL DEFAULT '',
 city TEXT NOT NULL DEFAULT '',
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME,
 deleted_at DATETIME
, visitor_id TEXT NOT NULL DEFAULT '', refer TEXT NOT NULL DEFAULT '', last_message TEXT NOT NULL DEFAULT '', client_ip TEXT NOT NULL DEFAULT '', extra TEXT NOT NULL DEFAULT '');
INSERT INTO visitor VALUES(1,'Guest','/static/images/2.png','::1','agent',0,'','','2025-12-30 07:52:20.502364+02:00','2025-12-30 07:53:08.747799+02:00',NULL,'test123','test','','::1','');
INSERT INTO visitor VALUES(2,'Guest','/static/images/2.png','::1','agent',1,'','','2025-12-30 07:52:35.228611+02:00','2025-12-30 07:56:52.750378+02:00',NULL,'4834772f-27ef-4369-b74c-a609cccb7cf0','Direct access','qeqe','::1','');
CREATE TABLE chat_message (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 visitor_id INTEGER NOT NULL DEFAULT 0,
 user_id INTEGER NOT NULL DEFAULT 0,
 content TEXT NOT NULL DEFAULT '',
 mes_type INTEGER NOT NULL DEFAULT 0,
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME,
 deleted_at DATETIME
);
CREATE TABLE kefu_config (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 title TEXT NOT NULL DEFAULT '',
 content TEXT NOT NULL DEFAULT '',
 logo TEXT NOT NULL DEFAULT '',
 copyright TEXT NOT NULL DEFAULT '',
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME,
 deleted_at DATETIME
);
INSERT INTO kefu_config VALUES(1,'GOFLY在线客服系统','欢迎使用GOFLY在线客服系统','/static/images/logo.png','©2020 gofly.online','2025-12-30 05:45:49',NULL,NULL);
CREATE TABLE kefu_captcha (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 visitor_id TEXT NOT NULL DEFAULT '',
 code TEXT NOT NULL DEFAULT '',
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME,
 deleted_at DATETIME
);
CREATE TABLE kefu_ipblack (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 ip TEXT NOT NULL DEFAULT '',
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME,
 deleted_at DATETIME
);
CREATE TABLE kefu_notice (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 title TEXT NOT NULL DEFAULT '',
 content TEXT NOT NULL DEFAULT '',
 status INTEGER NOT NULL DEFAULT 0,
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME,
 deleted_at DATETIME
);
INSERT INTO kefu_notice VALUES(1,'系统公告','欢迎使用GOFLY在线客服系统！',1,'2025-12-30 05:45:49',NULL,NULL);
INSERT INTO sqlite_sequence VALUES('user',1);
INSERT INTO sqlite_sequence VALUES('kefu_config',1);
INSERT INTO sqlite_sequence VALUES('kefu_notice',1);
INSERT INTO sqlite_sequence VALUES('visitor',2);
CREATE UNIQUE INDEX idx_user_name ON user(name);
COMMIT;
