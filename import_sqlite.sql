-- SQLite version of import.sql

DROP TABLE IF EXISTS user;
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
CREATE UNIQUE INDEX idx_user_name ON user(name);

INSERT INTO user (id, name, password, nickname, created_at, updated_at, avator) VALUES
(1, 'agent', 'b33aed8f3134996703dc39f9a7c95783', 'Open Source LiveChat Support', '2020-06-27 19:32:41', '2020-07-04 09:32:20', '/static/images/4.jpg');

DROP TABLE IF EXISTS visitor;
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
);

DROP TABLE IF EXISTS chat_message;
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

DROP TABLE IF EXISTS kefu_config;
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

INSERT INTO kefu_config (id, title, content, logo, copyright) VALUES
(1, 'GOFLY在线客服系统', '欢迎使用GOFLY在线客服系统', '/static/images/logo.png', '©2020 gofly.online');

DROP TABLE IF EXISTS kefu_captcha;
CREATE TABLE kefu_captcha (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 visitor_id TEXT NOT NULL DEFAULT '',
 code TEXT NOT NULL DEFAULT '',
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME,
 deleted_at DATETIME
);

DROP TABLE IF EXISTS kefu_ipblack;
CREATE TABLE kefu_ipblack (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 ip TEXT NOT NULL DEFAULT '',
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME,
 deleted_at DATETIME
);

DROP TABLE IF EXISTS kefu_notice;
CREATE TABLE kefu_notice (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 title TEXT NOT NULL DEFAULT '',
 content TEXT NOT NULL DEFAULT '',
 status INTEGER NOT NULL DEFAULT 0,
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME,
 deleted_at DATETIME
);

INSERT INTO kefu_notice (id, title, content, status) VALUES
(1, '系统公告', '欢迎使用GOFLY在线客服系统！', 1);
