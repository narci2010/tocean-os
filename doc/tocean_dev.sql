/*
Navicat MySQL Data Transfer

Source Server         : 94
Source Server Version : 50723
Source Host           : 192.168.3.94:3306
Source Database       : tocean_dev

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-06-04 16:51:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for audio_engine
-- ----------------------------
DROP TABLE IF EXISTS `audio_engine`;
CREATE TABLE `audio_engine` (
  `engine_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `engine_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '引擎',
  `engine_desc` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`engine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of audio_engine
-- ----------------------------
INSERT INTO `audio_engine` VALUES ('1', 'xunfei', '讯飞', '0');
INSERT INTO `audio_engine` VALUES ('2', 'baidu', '百度', '0');
INSERT INTO `audio_engine` VALUES ('11', 'test', 'test', '0');
INSERT INTO `audio_engine` VALUES ('12', 'tst1', '测试', '1');
INSERT INTO `audio_engine` VALUES ('13', 'test2', '测试', '0');

-- ----------------------------
-- Table structure for audio_engine_param
-- ----------------------------
DROP TABLE IF EXISTS `audio_engine_param`;
CREATE TABLE `audio_engine_param` (
  `engine_id` bigint(20) DEFAULT NULL,
  `param_key` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `param_value` varchar(510) COLLATE utf8mb4_bin DEFAULT NULL,
  `param_type` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `param_desc` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  KEY `fk_audio_engine_id` (`engine_id`),
  CONSTRAINT `fk_audio_engine_id` FOREIGN KEY (`engine_id`) REFERENCES `audio_engine` (`engine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of audio_engine_param
-- ----------------------------
INSERT INTO `audio_engine_param` VALUES ('1', 'url', 'http://api.xfyun.cn/v1/service/v1/iat', 'string', '0', '域名');
INSERT INTO `audio_engine_param` VALUES ('1', 'X-Appid', '5b7b6362', 'string', '0', 'App ID');
INSERT INTO `audio_engine_param` VALUES ('2', 'grantType', 'client_credentials', 'string', '0', 'grantType');
INSERT INTO `audio_engine_param` VALUES ('1', 'secret key', '3a88cdbcd952cdb575545f4fc398c151', 'string', '0', 'secret key');
INSERT INTO `audio_engine_param` VALUES ('2', 'clientId', 'sGPT5QjfderWlPTuUYF1r8Eh', 'string', '0', 'API Key');
INSERT INTO `audio_engine_param` VALUES ('2', 'clientSecret', 'Dfa5v4UAVbkemdBav3KvLGS0sg0Hbs72', 'string', '0', 'secret Key');
INSERT INTO `audio_engine_param` VALUES ('2', 'url', 'http://vop.baidu.com/server_api', 'string', '0', '域名');
INSERT INTO `audio_engine_param` VALUES ('11', 'clientId', 'WyCBxdSgBz17xXP9RisbMHa8', 'string', '0', 'clientId');
INSERT INTO `audio_engine_param` VALUES ('11', 'clientSecret', 'Gaxq37oIGWw10krxNYK8qkKMA5EONIca', 'string', '0', 'clientSecret');
INSERT INTO `audio_engine_param` VALUES ('11', 'tokenUrl', 'https://openapi.baidu.com/oauth/2.0/token?grant_type={grantType}&client_id={clientId}&client_secret={clientSecret}', 'string', '0', 'tokenUrl');
INSERT INTO `audio_engine_param` VALUES ('11', 'url', 'http://vop.baidu.com/server_api', 'string', '0', 'url');
INSERT INTO `audio_engine_param` VALUES ('11', 'grantType', 'client_credentials', 'string', '0', 'grantType');
INSERT INTO `audio_engine_param` VALUES ('11', 'appid', '542341', 'string', '1', 'App ID');
INSERT INTO `audio_engine_param` VALUES ('11', 'secretkey', 'thfy3s4tg5665utuerd5', 'string', '1', 'secret Key');
INSERT INTO `audio_engine_param` VALUES ('11', 'clientvalue', 'xxx', 'xxx', '1', 'xxx');
INSERT INTO `audio_engine_param` VALUES (null, 't1', '2', 'string', '0', 'test');
INSERT INTO `audio_engine_param` VALUES ('13', 't1', '2', 'string', '0', 'tes');
INSERT INTO `audio_engine_param` VALUES ('13', 't2', 'g33', 'g', '0', '1');

-- ----------------------------
-- Table structure for audio_engine_param_copy
-- ----------------------------
DROP TABLE IF EXISTS `audio_engine_param_copy`;
CREATE TABLE `audio_engine_param_copy` (
  `engine_id` bigint(20) DEFAULT NULL COMMENT '编号',
  `param_key` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '键',
  `param_value` varchar(510) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '值',
  `param_type` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '类型',
  `status` int(2) DEFAULT '0' COMMENT '状态',
  `param_desc` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  KEY `fk_audio_engine_id` (`engine_id`),
  CONSTRAINT `audio_engine_param_copy_ibfk_1` FOREIGN KEY (`engine_id`) REFERENCES `audio_engine` (`engine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of audio_engine_param_copy
-- ----------------------------

-- ----------------------------
-- Table structure for excel_config
-- ----------------------------
DROP TABLE IF EXISTS `excel_config`;
CREATE TABLE `excel_config` (
  `excel_config_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `excel_config_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '关键词',
  `excel_config_tablename` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '表名',
  PRIMARY KEY (`excel_config_id`),
  UNIQUE KEY `key-tablename` (`excel_config_key`,`excel_config_tablename`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of excel_config
-- ----------------------------
INSERT INTO `excel_config` VALUES ('15', 'excel1', 'excel_config');
INSERT INTO `excel_config` VALUES ('34', 'key1', 'audio_engine,excel_config,audio_engine_param');
INSERT INTO `excel_config` VALUES ('35', 'key2', 'audio_engine,excel_config,audio_engine_param');
INSERT INTO `excel_config` VALUES ('1', 'studentKey', 'student,excel_config,audio_engine');
INSERT INTO `excel_config` VALUES ('16', 'student_test', 'student');
INSERT INTO `excel_config` VALUES ('12', 'test2', 'test1');
INSERT INTO `excel_config` VALUES ('18', 'teststu', 'student');

-- ----------------------------
-- Table structure for excel_config_exclude
-- ----------------------------
DROP TABLE IF EXISTS `excel_config_exclude`;
CREATE TABLE `excel_config_exclude` (
  `excel_config_exclude_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `excel_config_id` bigint(20) DEFAULT NULL,
  `excel_config_exclude_column` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`excel_config_exclude_id`),
  KEY `config-id` (`excel_config_id`) USING BTREE,
  CONSTRAINT `excel_config_exclude_ibfk_1` FOREIGN KEY (`excel_config_id`) REFERENCES `excel_config` (`excel_config_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of excel_config_exclude
-- ----------------------------
INSERT INTO `excel_config_exclude` VALUES ('1', '1', 'id,sex');
INSERT INTO `excel_config_exclude` VALUES ('11', '12', '');
INSERT INTO `excel_config_exclude` VALUES ('14', '15', 'excel_config_key');
INSERT INTO `excel_config_exclude` VALUES ('15', '16', 'name,age,sex');
INSERT INTO `excel_config_exclude` VALUES ('17', '18', 'remark,height,weight');
INSERT INTO `excel_config_exclude` VALUES ('32', '34', 'status,excel_config_tablename,status');
INSERT INTO `excel_config_exclude` VALUES ('33', '35', 'status,excel_config_tablename,status');

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_11', 'DEFAULT', '0 0-5 14 * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_13', 'DEFAULT', '0 0-5 14 * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler', 'TASK_11', 'DEFAULT', null, 'com.toceansoft.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400D07B226A6F624964223A31312C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A227465737432222C2263726F6E45787072657373696F6E223A223020302D35203134202A202A203F222C22737461747573223A302C2272656D61726B223A22E59CA8E6AF8FE5A4A9E4B88BE58D8832E782B9E588B0E4B88BE58D88323A3035E69C9FE997B4E79A84E6AF8F31E58886E9929FE8A7A6E58F91222C2263726561746554696D65223A224465632032392C203230313820343A33363A323620504D227D7800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler', 'TASK_13', 'DEFAULT', null, 'com.toceansoft.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400AB7B226A6F624964223A31332C226265616E4E616D65223A22746573743133222C226D6574686F644E616D65223A22746573746D6574686F6473222C22706172616D73223A227465737431222C2263726F6E45787072657373696F6E223A223020302D35203134202A202A203F222C22737461747573223A302C2272656D61726B223A22222C2263726561746554696D65223A224D617920362C203230313920353A34313A343820504D227D7800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'renji2.toceansoft.com1558577519058', '1559638266709', '15000');

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_11', 'DEFAULT', 'TASK_11', 'DEFAULT', null, '1546149600000', '-1', '5', 'PAUSED', 'CRON', '1546072586000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400D07B226A6F624964223A31312C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A227465737432222C2263726F6E45787072657373696F6E223A223020302D35203134202A202A203F222C22737461747573223A312C2272656D61726B223A22E59CA8E6AF8FE5A4A9E4B88BE58D8832E782B9E588B0E4B88BE58D88323A3035E69C9FE997B4E79A84E6AF8F31E58886E9929FE8A7A6E58F91222C2263726561746554696D65223A224465632032392C203230313820343A33363A323720504D227D7800);
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_13', 'DEFAULT', 'TASK_13', 'DEFAULT', null, '1559714400000', '-1', '5', 'WAITING', 'CRON', '1557135708000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400B17B226A6F624964223A31332C226265616E4E616D65223A22746573743133222C226D6574686F644E616D65223A22746573746D6574686F6473222C22706172616D73223A227465737431222C2263726F6E45787072657373696F6E223A223020302D35203134202A202A203F222C22737461747573223A302C2272656D61726B223A226265697A6875222C2263726561746554696D65223A224D617920362C203230313920353A34313A343820504D227D7800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('11', 'testTask', 'test2', null, '0 0-5 14 * * ?', '1', '在每天下午2点到下午2:05期间的每1分钟触发', '2018-12-29 16:36:27');
INSERT INTO `schedule_job` VALUES ('13', 'test13', 'testmethods', 'test1', '0 0-5 14 * * ?', '0', 'beizhu', '2019-05-06 17:41:48');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '12', 'testBean1', 'test', 'test', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'testBean1\' available', '1', '2019-02-21 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('2', '23', 'test3', 'test3', 'test3', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test3\' available', '6', '2019-02-22 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('3', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-07 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('4', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-07 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('5', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-07 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('6', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-07 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('7', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-07 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('8', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-07 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('9', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '5', '2019-05-08 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('10', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-08 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('11', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-08 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('12', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-08 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('13', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-08 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('14', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-08 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('15', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-09 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('16', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '2', '2019-05-09 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('17', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-09 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('18', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-09 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('19', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-09 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('20', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-09 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('21', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-10 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('22', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '3', '2019-05-10 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('23', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-10 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('24', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-10 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('25', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-10 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('26', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-10 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('27', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '7', '2019-05-11 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('28', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-11 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('29', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-11 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('30', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-11 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('31', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-11 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('32', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-11 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('33', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '9', '2019-05-12 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('34', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-12 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('35', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '3', '2019-05-12 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('36', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-12 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('37', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-12 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('38', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-12 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('39', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '2', '2019-05-13 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('40', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-13 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('41', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-13 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('42', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-13 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('43', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-13 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('44', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-13 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('45', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-14 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('46', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-14 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('47', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '16', '2019-05-14 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('48', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-14 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('49', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-14 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('50', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-14 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('51', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-15 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('52', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-15 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('53', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-15 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('54', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-15 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('55', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-15 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('56', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-15 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('57', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '8', '2019-05-16 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('58', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-16 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('59', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-16 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('60', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-16 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('61', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-16 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('62', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-16 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('63', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-17 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('64', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-17 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('65', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-17 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('66', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-17 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('67', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-17 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('68', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-17 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('69', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '13', '2019-05-18 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('70', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-18 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('71', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-18 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('72', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-18 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('73', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-18 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('74', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-18 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('75', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '3', '2019-05-23 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('76', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-23 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('77', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-23 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('78', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-23 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('79', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-23 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('80', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-23 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('81', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '18', '2019-05-24 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('82', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '2', '2019-05-24 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('83', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-24 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('84', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-24 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('85', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-24 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('86', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-24 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('87', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '2', '2019-05-25 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('88', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-25 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('89', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-25 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('90', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-25 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('91', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-25 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('92', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-25 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('93', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '4', '2019-05-26 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('94', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-26 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('95', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-26 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('96', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-26 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('97', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-26 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('98', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-26 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('99', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '3', '2019-05-27 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('100', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '4', '2019-05-27 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('101', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-27 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('102', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-27 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('103', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-27 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('104', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-27 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('105', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '4', '2019-05-28 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('106', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '4', '2019-05-28 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('107', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-28 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('108', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-28 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('109', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-28 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('110', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-28 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('111', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-29 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('112', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-29 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('113', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-29 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('114', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-29 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('115', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-29 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('116', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-29 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('117', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '2', '2019-05-30 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('118', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '2', '2019-05-30 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('119', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-30 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('120', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-30 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('121', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-30 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('122', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-30 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('123', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '3', '2019-05-31 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('124', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '2', '2019-05-31 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('125', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-05-31 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('126', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-31 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('127', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-31 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('128', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-05-31 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('129', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-06-01 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('130', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-06-01 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('131', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-06-01 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('132', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-06-01 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('133', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-06-01 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('134', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-06-01 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('135', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '2', '2019-06-02 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('136', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '2', '2019-06-02 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('137', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-06-02 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('138', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-06-02 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('139', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-06-02 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('140', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-06-02 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('141', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '2', '2019-06-03 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('142', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '2', '2019-06-03 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('143', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-06-03 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('144', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-06-03 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('145', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-06-03 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('146', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-06-03 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('147', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-06-04 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('148', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-06-04 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('149', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-06-04 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('150', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '1', '2019-06-04 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('151', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-06-04 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('152', '13', 'test13', 'testmethods', 'test1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test13\' available', '0', '2019-06-04 14:05:00');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '姓名',
  `age` varchar(11) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '性别',
  `address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址',
  `mobile` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号',
  `level` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '等级',
  `ramerk` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `height` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '身高',
  `weight` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '体重',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'abc', '1', '男', '深圳', '13562547845', '2', '0', '170', '54');
INSERT INTO `student` VALUES ('2', 'def', '2', '女', '广州', '15685478954', '6', '1', '185', '46');
INSERT INTO `student` VALUES ('3', 'dd', '4', '男', '深圳', '1.357354422E9', '5.0', '0.0', '170', '54');
INSERT INTO `student` VALUES ('4', '小山', '12', '女', null, null, null, null, null, null);
INSERT INTO `student` VALUES ('5', 'dd', '4', '男', '深圳', '1.357354422E9', '5.0', '0.0', '170', '54');
INSERT INTO `student` VALUES ('6', '小山', '12', '女', null, null, null, null, null, null);
INSERT INTO `student` VALUES ('7', 'dd', '4', '男', '深圳', '1.357354422E9', '5.0', '0.0', '170', '54');
INSERT INTO `student` VALUES ('8', '小山', '12', '女', null, null, null, null, null, null);
INSERT INTO `student` VALUES ('9', 'dd', '4', '男', '深圳', '1357354422', '5', '0', '170', '54');
INSERT INTO `student` VALUES ('10', '小山', '12', '女', null, null, null, null, null, null);
INSERT INTO `student` VALUES ('11', 'dd', '4', '男', '深圳', '1357354422', '5', '0', '170', '54');
INSERT INTO `student` VALUES ('12', '小山', '12', '女', null, null, null, null, null, null);
INSERT INTO `student` VALUES ('13', '熊大', '3', null, null, null, null, null, null, null);
INSERT INTO `student` VALUES ('14', 'dd', '4', '男', '深圳', '1357354422', '5', '0', '170', '54');
INSERT INTO `student` VALUES ('15', '小山', '12', '女', null, null, null, null, null, null);
INSERT INTO `student` VALUES ('16', 'dd', '4', '男', '深圳', '1357354422', '5', '0', '170', '54');
INSERT INTO `student` VALUES ('17', '小山', '12', '女', null, null, null, null, null, null);
INSERT INTO `student` VALUES ('33', '1', '1', null, '嗷嗷', '131111111111', '12', '12', '132', '122');
INSERT INTO `student` VALUES ('41', 'aa', '11', 'd', 'aa', 'dddd', 'a', null, null, null);
INSERT INTO `student` VALUES ('42', 'aa', '11', 'd', 'aa', 'dddd', 'a', null, null, null);
INSERT INTO `student` VALUES ('43', 'aa', 'aaa', 'd', 'aa', 'dddd', 'a', null, null, null);
INSERT INTO `student` VALUES ('44', '方法', null, 'f', 'dasf', '324234', '1', 'fdsafa', '33', '33');
INSERT INTO `student` VALUES ('45', '1', null, '3', '4', '5', '6', '7', '8', '1');
INSERT INTO `student` VALUES ('46', '1', null, '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `student` VALUES ('49', '小兰1', '1', null, '1', null, '1', '1', '1', '1');
INSERT INTO `student` VALUES ('53', 'AA', null, ' 男', '广州', null, '1', '1', '170', '55');
INSERT INTO `student` VALUES ('54', 'CC', null, '1', '1', null, '1', '1', '1', '1');

-- ----------------------------
-- Table structure for sys_ali_pay
-- ----------------------------
DROP TABLE IF EXISTS `sys_ali_pay`;
CREATE TABLE `sys_ali_pay` (
  `pay_id` bigint(20) NOT NULL COMMENT '主键',
  `app_id` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '应用的ID',
  `pid` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '商户的ID',
  `app_private_key` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '应用的私钥',
  `app_public_key` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '应用的公钥',
  `alipay_public_key` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '阿里支付的公钥',
  `app_sign_type` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '签名加密方式',
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_ali_pay
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":0,\"minioDomain\":\"http://192.168.3.94:9000\",\"minioPrefix\":\"security\",\"minioAccessKey\":\"admin\",\"minioSecretKey\":\"tocean788\",\"minioBucketName\":\"toceanoss2\",\"qiniuDomain\":\"http://pb7zofv1m.bkt.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuAccessKey\":\"Bwcv_GDJa_uP2AxXq0DxlQYtwi8BFmcbL6iLMNEZ\",\"qiniuSecretKey\":\"8k8Ds3PyneC9TpnPvoVs4-YzkXPMUuH9Zb1jlam4\",\"qiniuBucketName\":\"toceanoss\",\"aliyunDomain\":\"https://toceanoss.oss-cn-shenzhen.aliyuncs.com\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"https://oss-cn-shenzhen.aliyuncs.com\",\"aliyunAccessKeyId\":\"LTAI5fxk8YyhxMVc\",\"aliyunAccessKeySecret\":\"CdI0tpvi56ZGPY5c9DWAKGXTBE8LNW\",\"aliyunBucketName\":\"toceanoss\",\"qcloudDomain\":\"https://toceanoss-1251162377.file.myqcloud.com\",\"qcloudPrefix\":\"\",\"qcloudAppId\":1251162377,\"qcloudSecretId\":\"AKIDcCfXP80NzHSaYLiQ1VtafcP2XtMqM2Ob\",\"qcloudSecretKey\":\"RhmgeUiq7ELb1hLbcire4Tmy1xpwtfif\",\"qcloudBucketName\":\"toceanoss\",\"qcloudRegion\":\"gz\"}', '0', '云存储配置信息');
INSERT INTO `sys_config` VALUES ('2', 'SOCIAL_LOGIN_CONFIG_KEY', '{\"qqNeedBinding\":true,\"sinaNeedBinding\":true,\"wechatNeedBinding\":true,\"mpWechatNeedBinding\":false}', '0', '社交化登陸配置KEY');
INSERT INTO `sys_config` VALUES ('3', 'appname', 'ToceanOS-开发平台', '1', '系统名称');
INSERT INTO `sys_config` VALUES ('8', 'test3', '{}', '1', 'test3');
INSERT INTO `sys_config` VALUES ('11', '小兰1', '1', '1', null);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dict_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字典名称',
  `dict_code` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字典编码',
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `del_flag` int(11) DEFAULT NULL COMMENT '删除状态',
  `create_by` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', 'sex', 'sex', '性别', '0', 'narci', '2019-02-20 18:13:48', 'narci', '2019-02-20 18:13:48');
INSERT INTO `sys_dict` VALUES ('2', 'string', 'string', '测试', '0', 'string', '2019-02-20 18:13:48', 'string', '2019-02-20 18:13:48');

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item` (
  `dict_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dict_id` bigint(20) DEFAULT NULL COMMENT '字典id',
  `item_text` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字典项文本',
  `item_value` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字典项值',
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `sort_order` decimal(10,2) DEFAULT NULL COMMENT '排序',
  `status` int(11) DEFAULT NULL COMMENT '状态（1启用 0不启用）',
  `create_by` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`dict_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES ('1', '1', 'string', 'string', '男', '0.00', '0', 'string', '2019-02-20 18:13:48', 'string', '2019-02-20 18:13:48');

-- ----------------------------
-- Table structure for sys_lisence
-- ----------------------------
DROP TABLE IF EXISTS `sys_lisence`;
CREATE TABLE `sys_lisence` (
  `privateKey` varchar(1024) COLLATE utf8mb4_bin DEFAULT '' COMMENT '私钥',
  `publicKey` varchar(1024) COLLATE utf8mb4_bin DEFAULT '' COMMENT '公钥',
  `privateKey2` varchar(1024) COLLATE utf8mb4_bin DEFAULT '' COMMENT '私钥2',
  `publicKey2` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '公钥2',
  `systemUid` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '系统唯一标识',
  `signKey` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '授权key',
  `lisence_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `applyDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '申请日期',
  `grantDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '授权日期',
  `usingType` varchar(3) COLLATE utf8mb4_bin DEFAULT '' COMMENT '使用类型：dev开发，pro生成',
  `serverHost` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `systemName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dueDays` int(11) DEFAULT NULL,
  `serverUrl` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`lisence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_lisence
-- ----------------------------
INSERT INTO `sys_lisence` VALUES ('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', '30', '2019-02-26 01:45:14', '2019-02-26 09:45:14', 'PRO', null, null, null, null);
INSERT INTO `sys_lisence` VALUES ('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', '46', '2019-02-27 10:37:19', '2019-02-27 18:44:25', 'DEV', null, 'bbb', '331', null);
INSERT INTO `sys_lisence` VALUES ('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', '47', '2019-02-28 10:10:07', '2019-02-28 10:10:07', 'DEV', null, null, null, null);
INSERT INTO `sys_lisence` VALUES ('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', '56', '2019-03-01 01:42:21', '2019-03-01 01:42:21', 'DEV', '192.168.1.48', 'ToceanOS-开发平台', '1', 'http://192.168.1.48(8441)');
INSERT INTO `sys_lisence` VALUES ('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', '57', '2019-03-01 10:35:56', '2019-03-01 10:35:56', 'DEV', '192.168.1.13300CFE0332AAD192.168.1.133www.toceansoft.comOracle Corporation:1.8.0', null, '0', null);
INSERT INTO `sys_lisence` VALUES ('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', '58', '2019-03-04 01:52:36', '2019-03-04 01:52:36', 'DEV', '192.168.1.110', null, '0', 'http://192.168.1.110(8441)');
INSERT INTO `sys_lisence` VALUES ('MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAN0hTau8XXMFQFDiS9O72bc2rheYFyh+hneHFGLK2BpDhLAEV4K9OwkkLELglOHHohhssZQ/IJv1mUlpMiIkvwOaa1sgLRWTbgBuDUP1/e4e6BcbFKJUR1IyRcYsxGb/tKQVh8B2oC3zArtD9/t1c0gLgloFTyyQwtlwlsB0fUrbAgMBAAECgYB9GjtL/oxL51ukpvJJPoyEp63EcWogobxHYSd6YNHzweEOh9ZOg+ojWNCloVL5jSy6brvkZ/Z15XOsYZRYVrutK5OJ7FweRm7DCKHqEFF5KeCfpZk+IpaBA/Ye893l2xkmNzh4Rt0f2G1SZAItBA8dGopBWwJqurzn84RmQZVWiQJBAPscE/ykTgDFiUj83hdNinrjSZ/mxmWkXSZslmdLkhA8kmEX48MoEZ1RCtHOl7+HZvY5TS+9pivAexS4o1rLVNcCQQDhb8Kl6aHZek/q1NkpEy7fqyvLuLKYhobqXgYaPX00zC2f0LOvi2y6PnCTmnjYBacdbF/hXrILR72hvwRjnHWdAkAD5onA8ORtSqQ5SARDJGc0RXeNTk5iocz4ndMwQ5I/QlGbxH07ONIdOXcLj0P4K6hDxtwWE8ITB+hhiASxklr9AkEAjdMPs+1No1ItoOETVaH55UD8poel5AsOKbfJQwzYDjU9psNXp+KhHnJVxKZzzAOSZRJfJ5u5ixsxE+bmTfyKiQJAArGojPRbJY5VKbR3y/TMoU48F2qq8MAHoSlh9U99+w3GB+jRuONjkrYwufoipXGFwh3E5WYIcftEWAt8m+HQAw==', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDdIU2rvF1zBUBQ4kvTu9m3Nq4XmBcofoZ3hxRiytgaQ4SwBFeCvTsJJCxC4JThx6IYbLGUPyCb9ZlJaTIiJL8DmmtbIC0Vk24Abg1D9f3uHugXGxSiVEdSMkXGLMRm/7SkFYfAdqAt8wK7Q/f7dXNIC4JaBU8skMLZcJbAdH1K2wIDAQAB', 'MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAI8qIp2k5UPKRIb9TYKU52FEN8oAc+BD+mbWYSbFzZI4NJ32SQMPCZhx9oREp9FmF+CltIc6/YVlt0gRX0zjQtR9WGjJ/BNw/5CJhloVxckdSoSydCUwEaLb9XdiW/kzdLM5bBikO4ukt+Y68TUhnMTiFNw62612a4FiyJ8rUAdLAgMBAAECgYBhSKqZIVJBzJLggARJtdG9QNQASmpzfP4NH6SI6mUU9Wib5p4am/9TPi3cF6NKIewb1b5lHmrkWQhAyr1NzCi+n9oXhf2yI1bxZ5WnlDdponqce8MbKwWHOX6Gm1OPY6hZpUBGV3yjkUhcGtG2JEalraSNvL+MAEKIL9gNgkgGYQJBAOSnmHexZlW+nRCi5xURfLhyiJ7VzRxo6CTgqgUwcxj+9jji7dv88m83q3/kqoaK0Lm2cfr8rIhRtnrQjmngoDMCQQCgSTU3mb07BlX/PvIiruhB0qroJr+mqkS9gmmVcjDV+YrAcQDMETzGX3eKyU1rbyipfQjgFWcABXDNo88SgISJAkEAyDA7er+kWvnRxZj6PCXdThdoqbeCJpdqd68C7BwpCP9gTxnPKkVhdCIHUqe+7KBocc/cJuRFoev4mboylVwGpQJAJKHWmch3KQA/s0AtkqOqzTBagwgoEO0lHLKrcs5QPvbzMRwidIEUBLpY1c0/9mfHQUUkPCJoEecsarMfZjkdEQJBAIsCKa72GfhAsvMYjJbJsOLs/wz3oN0yu0YsF3uGIwtB5CTwkjHNMUjIUd/g1hgPKetKPFxQwojocAqHJYlekI4=', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCPKiKdpOVDykSG/U2ClOdhRDfKAHPgQ/pm1mEmxc2SODSd9kkDDwmYcfaERKfRZhfgpbSHOv2FZbdIEV9M40LUfVhoyfwTcP+QiYZaFcXJHUqEsnQlMBGi2/V3Ylv5M3SzOWwYpDuLpLfmOvE1IZzE4hTcOtutdmuBYsifK1AHSwIDAQAB', 'fdfP5siY+pSmh0akh6FmXm43Rm7ksf58gWMos0ujl47KT4uaGEd/XNdW0SiQMU/ICqB8qupkxt85FoiImPYjc0EX1L4mAT4zf3Lwmv8Prer19u1nl/mPayTYK/TxwGUVm2PRhroMvLhlcD920jhfnAjpJlXeZ9pRMb+nsHQMHHw=', 'UY/4YTEdiO6W3W5UOco9MGwKSCXeqShXaKsnxaA70TtY4xsjBvrVUGAcTHO0YS1xC2L0plhjfwd923TVC5Tyja/MLLMCd0cOUWEMGRFnNmS+cibZX7KbIFGsJPrtWQ8mqgjPa1+/Zdj+Zh3unxwqSI6k4sorcfCUTq0TIxyKfGk=', '59', '2019-03-11 15:23:54', '2019-03-11 15:23:54', 'DEV', '192.168.1.48', null, '0', null);
INSERT INTO `sys_lisence` VALUES ('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', '60', '2019-03-12 17:14:56', '2019-03-12 17:14:56', 'DEV', '192.168.239.1', null, '0', null);
INSERT INTO `sys_lisence` VALUES ('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', '61', '2019-03-19 05:38:30', null, 'PRO', '172.21.0.2', null, '0', null);
INSERT INTO `sys_lisence` VALUES ('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', '62', '2019-03-19 05:45:22', null, 'PRO', '172.21.0.2', null, '0', null);
INSERT INTO `sys_lisence` VALUES ('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', '63', '2019-03-20 03:05:02', null, 'PRO', '172.17.0.1', null, '0', null);
INSERT INTO `sys_lisence` VALUES ('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', '64', '2019-04-18 11:58:05', null, 'PRO', '172.21.0.2', null, '0', null);
INSERT INTO `sys_lisence` VALUES ('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', '65', '2019-04-18 14:52:13', null, 'PRO', '172.21.0.2', null, '0', null);
INSERT INTO `sys_lisence` VALUES ('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', '66', '2019-05-07 02:19:53', '2019-05-07 10:19:54', 'PRO', '172.21.0.2', null, '0', null);
INSERT INTO `sys_lisence` VALUES ('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', '67', '2019-05-07 02:19:49', '2019-05-07 10:19:50', 'DEV', '192.168.239.1', null, '3', null);
INSERT INTO `sys_lisence` VALUES ('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', '68', '2019-05-29 09:05:48', null, 'DEP', '192.168.1.110', null, '0', null);
INSERT INTO `sys_lisence` VALUES ('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', '69', '2019-06-03 14:34:16', null, 'DEP', '192.168.239.1', null, '0', null);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `is_display` bit(1) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', '/sysManage', '', '0', '', 'setting', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '用户列表', '/sysManage/userList', '', '1', '', 'user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', '/sysManage/roleManage', '', '1', '', 'roles', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', '/sysManage/menuManage', '', '1', '', 'menu', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'http://www.baidu.com', '', '1', '', 'sql', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', '/sysManage/scheduleManage', '', '1', '', 'schedule', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', '/sysManage/configManage', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', '', 'config', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', '/sysManage/sysLog', 'sys:log:list', '1', null, 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', '/sysManage/ossManage', 'sys:oss:all', '1', '', 'upload', '6');
INSERT INTO `sys_menu` VALUES ('31', '1', '授权管理', '/sysManage/syslisenceManage', '', '1', '', 'syslisence', '6');
INSERT INTO `sys_menu` VALUES ('32', '31', '查看', null, 'sys:syslisence:list,sys:syslisence:info', '2', null, null, '6');
INSERT INTO `sys_menu` VALUES ('33', '31', '新增', null, 'sys:syslisence:save', '2', null, null, '6');
INSERT INTO `sys_menu` VALUES ('34', '31', '修改', null, 'sys:syslisence:update', '2', null, null, '6');
INSERT INTO `sys_menu` VALUES ('35', '31', '删除', null, 'sys:syslisence:delete', '2', null, null, '6');
INSERT INTO `sys_menu` VALUES ('36', '31', '授权', null, 'sys:syslisence:grant', '2', null, null, '6');
INSERT INTO `sys_menu` VALUES ('43', '1', '代码生成', '/sysManage/codeGeneration', '', '1', '', 'code', '20');
INSERT INTO `sys_menu` VALUES ('44', '4', '社交设置', null, 'sys:social:all', '2', null, null, '0');
INSERT INTO `sys_menu` VALUES ('45', '45', '测试管理', 'Test2', '', '1', null, '', '0');
INSERT INTO `sys_menu` VALUES ('46', '45', 'test', 'Test1', '', '1', null, '', '0');
INSERT INTO `sys_menu` VALUES ('47', '0', '测试管理', '/testManage', '', '0', '', 'table', '0');
INSERT INTO `sys_menu` VALUES ('48', '47', 'Test1', '/testManage/test1', '', '1', '', 'nested', '0');
INSERT INTO `sys_menu` VALUES ('49', '47', 'Test2', '/testManage/test2', '', '1', '', 'password', '1');
INSERT INTO `sys_menu` VALUES ('50', '1', '社交管理', '/sysManage/socialManage', '', '0', '', 'users', '0');
INSERT INTO `sys_menu` VALUES ('51', '50', 'QQ账号', '/sysManage/socialManage/qqUser', '', '1', '', 'qq', '101');
INSERT INTO `sys_menu` VALUES ('52', '50', 'sina账号', '/sysManage/socialManage/sinaUser', '', '1', '', 'sina', '104');
INSERT INTO `sys_menu` VALUES ('53', '50', '微信账号', '/sysManage/socialManage/wechatUser', '', '1', '', 'wechat', '102');
INSERT INTO `sys_menu` VALUES ('54', '50', '绑定账号', 'BindUserList', '', '1', null, '', '0');
INSERT INTO `sys_menu` VALUES ('55', '50', '社交配置', '/sysManage/socialManage/sociaEdit', '', '1', '', 'setting', '103');
INSERT INTO `sys_menu` VALUES ('59', '50', '三级目录', '/sysManage/socialManage/testa', '', '0', '', 'table', '0');
INSERT INTO `sys_menu` VALUES ('60', '59', 'testb', '/sysManage/socialManage/testa/test31', '', '1', '', 'table', '0');
INSERT INTO `sys_menu` VALUES ('61', '59', 'Testc', 'Testc', '', '1', null, '', '0');
INSERT INTO `sys_menu` VALUES ('62', '1', '录音管理', '/sysManage/recordingManage', '', '1', '', 'recording', '20');
INSERT INTO `sys_menu` VALUES ('63', '1', 'Excel', '/sysManage/sysExcel', '', '1', '', 'excel', '21');
INSERT INTO `sys_menu` VALUES ('65', '1', 'Recording', '/sysManage/recording', 'recording', '1', '', 'recording', '12');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES ('1', 'https://pb7zofv1m.bkt.clouddn.com/upload/20181207/9e5b42cf1727420bafa5cdf8c61440c2.jpg', '2018-12-07 17:17:23');
INSERT INTO `sys_oss` VALUES ('2', 'http://pb7zofv1m.bkt.clouddn.com/upload/20181207/e9a5184f88d24a4a939469c2c301d1aa.png', '2018-12-07 17:21:04');
INSERT INTO `sys_oss` VALUES ('3', 'https://toceanoss.oss-cn-shenzhen.aliyuncs.com/20190125/0458a3892d8947ffa199aba97bfaf7a9.jpg', '2019-01-25 14:34:29');
INSERT INTO `sys_oss` VALUES ('4', 'https://toceanoss-1251162377.file.myqcloud.com/20190125/323f0a4db6084e5d9d7c3aab88a96ad2.jpg', '2019-01-25 14:50:20');
INSERT INTO `sys_oss` VALUES ('5', 'https://toceanoss.oss-cn-shenzhen.aliyuncs.com/20190305/2f499c5bff4a4c4cba57c0a4f02e3805.jpg', '2019-03-05 10:32:03');
INSERT INTO `sys_oss` VALUES ('6', 'http://pb7zofv1m.bkt.clouddn.com/upload/20190305/e214f914759b4081bbf0ae699b2186e2.jpg', '2019-03-05 10:37:52');
INSERT INTO `sys_oss` VALUES ('7', 'http://pb7zofv1m.bkt.clouddn.com/upload/20190305/b6730c59df33465f8c1b179b77e457da.png', '2019-03-05 10:57:22');
INSERT INTO `sys_oss` VALUES ('8', 'http://pb7zofv1m.bkt.clouddn.com/upload/20190306/345d4d63c1d24ae6b6592516d1b71057.png', '2019-03-06 13:34:38');
INSERT INTO `sys_oss` VALUES ('9', 'http://192.168.3.94:9000/20190307/6cd89233098f4f79bea7bc7286449ad8.png', '2019-03-07 16:12:54');
INSERT INTO `sys_oss` VALUES ('10', 'http://192.168.3.94:9000/toceanoss/20190307/a84c45e3771b435c9f8989eb7026c658.jpg', '2019-03-07 16:16:29');
INSERT INTO `sys_oss` VALUES ('11', 'http://192.168.3.94:9000/toceanoss/20190307/d5ad67b55a474d7885965874e98951b0.jpg', '2019-03-07 16:20:55');
INSERT INTO `sys_oss` VALUES ('12', 'http://192.168.3.94:9000/toceanoss/security/20190307/a7c1bf90227b43e288b44c9851ec2cdb.jpg', '2019-03-07 16:22:11');
INSERT INTO `sys_oss` VALUES ('13', 'http://192.168.3.94:9000/toceanoss/security/20190307/4580a0775b7d46f3b04d203af732c0f0.jpg', '2019-03-07 16:36:27');
INSERT INTO `sys_oss` VALUES ('14', 'http://192.168.3.94:9000/toceanoss2/security/20190307/43c219bf510d459285b134340f5e370d.jpg', '2019-03-07 17:03:37');
INSERT INTO `sys_oss` VALUES ('15', 'http://192.168.3.94:9000/toceanoss2/security/20190307/673d1d7b43784aeeab12f56882aa8a1a.png', '2019-03-07 17:40:39');
INSERT INTO `sys_oss` VALUES ('16', 'http://192.168.3.94:9000/toceanoss2/security/20190307/911bfed127534caf94debdfd727a8d50.png', '2019-03-07 17:42:29');
INSERT INTO `sys_oss` VALUES ('22', 'http://192.168.3.94:9000/toceanoss2/security/20190308/29fcc5e49e8d446a83570dfe17f6f30f.png', '2019-03-08 10:06:17');
INSERT INTO `sys_oss` VALUES ('28', 'http://192.168.3.94:9000/toceanoss2/security/20190309/13ac8bd3e2184e80b7124cb0e175d998.png', '2019-03-09 14:26:05');
INSERT INTO `sys_oss` VALUES ('29', 'http://192.168.3.94:9000/toceanoss2/security/20190309/16f1d167cb9f41a0ae80c73dd655d962.png', '2019-03-09 14:26:05');
INSERT INTO `sys_oss` VALUES ('30', 'http://192.168.3.94:9000/toceanoss2/security/20190309/12576e897751493187db567d587ec76b.mp4', '2019-03-09 14:26:22');
INSERT INTO `sys_oss` VALUES ('31', 'http://192.168.3.94:9000/toceanoss2/security/20190311/22ad4560cc8747aaaaafbd03845fc8ee.txt', '2019-03-11 14:14:27');
INSERT INTO `sys_oss` VALUES ('32', 'http://192.168.3.94:9000/toceanoss2/security/20190311/6ca8c368c2184d28ae9f36fd9e827c2b.txt', '2019-03-11 14:14:52');
INSERT INTO `sys_oss` VALUES ('33', 'http://192.168.3.94:9000/toceanoss2/security/20190316/d4d4a09be84b4263a916cf840f2b5897.jpg', '2019-03-16 10:14:22');
INSERT INTO `sys_oss` VALUES ('34', 'http://192.168.3.94:9000/toceanoss2/security/20190412/43d6c36748b14cff9a6d659a7feeb80b.txt', '2019-04-12 09:30:47');
INSERT INTO `sys_oss` VALUES ('35', 'http://192.168.3.94:9000/toceanoss2/security/20190412/1c557f17de83480eb374f0290bd84fe3.jpg', '2019-04-12 09:31:28');
INSERT INTO `sys_oss` VALUES ('36', 'http://192.168.3.94:9000/toceanoss2/security/20190412/336e1820dcad4991818b13c5e4b82e66.xlsx', '2019-04-12 17:00:07');
INSERT INTO `sys_oss` VALUES ('37', 'http://192.168.3.94:9000/toceanoss2/security/20190412/4a9f60b341ea4aaca0d0344e1c19bd9c.xlsx', '2019-04-12 18:05:04');
INSERT INTO `sys_oss` VALUES ('39', 'http://192.168.3.94:9000/toceanoss2/security/20190506/419884d5ac384035a79392fc6c5a8fa8.txt', '2019-05-06 16:26:58');

-- ----------------------------
-- Table structure for sys_qq_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_qq_user`;
CREATE TABLE `sys_qq_user` (
  `qq_user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `figureurl_2` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '大小为100×100像素的QQ空间头像URL。',
  `figureurl_1` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '大小为50×50像素的QQ空间头像URL。',
  `figureurl` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '大小为30×30像素的QQ空间头像URL。',
  `nickname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户在QQ空间的昵称',
  `figureurl_qq_1` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '大小为40×40像素的QQ头像URL。',
  `figureurl_qq_2` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '大小为100×100像素的QQ头像URL。需要注意，不是所有的用户都拥有QQ的100x100的头像，但40x40像素则是一定会有。',
  `gender` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '性别。 如果获取不到则默认返回"男"',
  `is_yellow_vip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `vip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `yellow_vip_level` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `level` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_yellow_year_vip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `openid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`qq_user_id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_qq_user
-- ----------------------------
INSERT INTO `sys_qq_user` VALUES ('2', null, null, 'http://qzapp.qlogo.cn/qzapp/101544881/B2996A2E3CCED4CA443CE4B86B9A9000/30', '12', null, null, '男', null, '0', null, '0', null, 'B2996A2E3CCED4CA443CE4B86B9A9000');
INSERT INTO `sys_qq_user` VALUES ('3', null, null, 'http://qzapp.qlogo.cn/qzapp/101544881/7B29A7F60AA7854122322A80EE686E0B/30', '你许清风', null, null, '男', null, '0', null, '0', null, '7B29A7F60AA7854122322A80EE686E0B');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', '', '1', '2018-11-12 10:37:07');
INSERT INTO `sys_role` VALUES ('4', 'test1', 'test1', '1', '2019-02-23 10:31:34');
INSERT INTO `sys_role` VALUES ('6', 'test21', '测试数据2', '1', '2019-04-25 18:04:28');
INSERT INTO `sys_role` VALUES ('7', 'developer', '开发者', '1', '2019-06-03 16:19:36');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1388 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('803', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('804', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('805', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('806', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('807', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('808', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('809', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('810', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('811', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('812', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('813', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('814', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('815', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('816', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('817', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('818', '1', '44');
INSERT INTO `sys_role_menu` VALUES ('819', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('820', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('821', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('822', '1', '8');
INSERT INTO `sys_role_menu` VALUES ('823', '1', '9');
INSERT INTO `sys_role_menu` VALUES ('824', '1', '10');
INSERT INTO `sys_role_menu` VALUES ('825', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('826', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('827', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('828', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('829', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('830', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('831', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('832', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('833', '1', '33');
INSERT INTO `sys_role_menu` VALUES ('834', '1', '34');
INSERT INTO `sys_role_menu` VALUES ('835', '1', '35');
INSERT INTO `sys_role_menu` VALUES ('836', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('837', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('838', '1', '43');
INSERT INTO `sys_role_menu` VALUES ('839', '1', '63');
INSERT INTO `sys_role_menu` VALUES ('840', '1', '47');
INSERT INTO `sys_role_menu` VALUES ('841', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('842', '1', '49');
INSERT INTO `sys_role_menu` VALUES ('1026', '4', '50');
INSERT INTO `sys_role_menu` VALUES ('1027', '4', '51');
INSERT INTO `sys_role_menu` VALUES ('1028', '4', '52');
INSERT INTO `sys_role_menu` VALUES ('1029', '4', '53');
INSERT INTO `sys_role_menu` VALUES ('1030', '4', '54');
INSERT INTO `sys_role_menu` VALUES ('1031', '4', '55');
INSERT INTO `sys_role_menu` VALUES ('1032', '4', '59');
INSERT INTO `sys_role_menu` VALUES ('1033', '4', '60');
INSERT INTO `sys_role_menu` VALUES ('1034', '4', '61');
INSERT INTO `sys_role_menu` VALUES ('1035', '4', '47');
INSERT INTO `sys_role_menu` VALUES ('1036', '4', '48');
INSERT INTO `sys_role_menu` VALUES ('1037', '4', '49');
INSERT INTO `sys_role_menu` VALUES ('1039', '4', '1');
INSERT INTO `sys_role_menu` VALUES ('1281', '6', '1');
INSERT INTO `sys_role_menu` VALUES ('1282', '6', '52');
INSERT INTO `sys_role_menu` VALUES ('1283', '6', '54');
INSERT INTO `sys_role_menu` VALUES ('1284', '6', '55');
INSERT INTO `sys_role_menu` VALUES ('1285', '6', '59');
INSERT INTO `sys_role_menu` VALUES ('1286', '6', '60');
INSERT INTO `sys_role_menu` VALUES ('1287', '6', '61');
INSERT INTO `sys_role_menu` VALUES ('1288', '6', '2');
INSERT INTO `sys_role_menu` VALUES ('1289', '6', '15');
INSERT INTO `sys_role_menu` VALUES ('1290', '6', '16');
INSERT INTO `sys_role_menu` VALUES ('1291', '6', '17');
INSERT INTO `sys_role_menu` VALUES ('1292', '6', '3');
INSERT INTO `sys_role_menu` VALUES ('1293', '6', '19');
INSERT INTO `sys_role_menu` VALUES ('1294', '6', '20');
INSERT INTO `sys_role_menu` VALUES ('1295', '6', '21');
INSERT INTO `sys_role_menu` VALUES ('1296', '6', '22');
INSERT INTO `sys_role_menu` VALUES ('1297', '6', '4');
INSERT INTO `sys_role_menu` VALUES ('1298', '6', '23');
INSERT INTO `sys_role_menu` VALUES ('1299', '6', '24');
INSERT INTO `sys_role_menu` VALUES ('1300', '6', '25');
INSERT INTO `sys_role_menu` VALUES ('1301', '6', '26');
INSERT INTO `sys_role_menu` VALUES ('1302', '6', '44');
INSERT INTO `sys_role_menu` VALUES ('1303', '6', '5');
INSERT INTO `sys_role_menu` VALUES ('1304', '6', '6');
INSERT INTO `sys_role_menu` VALUES ('1305', '6', '7');
INSERT INTO `sys_role_menu` VALUES ('1306', '6', '8');
INSERT INTO `sys_role_menu` VALUES ('1307', '6', '9');
INSERT INTO `sys_role_menu` VALUES ('1308', '6', '10');
INSERT INTO `sys_role_menu` VALUES ('1309', '6', '11');
INSERT INTO `sys_role_menu` VALUES ('1310', '6', '12');
INSERT INTO `sys_role_menu` VALUES ('1311', '6', '13');
INSERT INTO `sys_role_menu` VALUES ('1312', '6', '14');
INSERT INTO `sys_role_menu` VALUES ('1313', '6', '27');
INSERT INTO `sys_role_menu` VALUES ('1314', '6', '30');
INSERT INTO `sys_role_menu` VALUES ('1315', '6', '31');
INSERT INTO `sys_role_menu` VALUES ('1316', '6', '32');
INSERT INTO `sys_role_menu` VALUES ('1317', '6', '33');
INSERT INTO `sys_role_menu` VALUES ('1318', '6', '34');
INSERT INTO `sys_role_menu` VALUES ('1319', '6', '35');
INSERT INTO `sys_role_menu` VALUES ('1320', '6', '36');
INSERT INTO `sys_role_menu` VALUES ('1321', '6', '29');
INSERT INTO `sys_role_menu` VALUES ('1322', '6', '43');
INSERT INTO `sys_role_menu` VALUES ('1323', '6', '62');
INSERT INTO `sys_role_menu` VALUES ('1324', '6', '63');
INSERT INTO `sys_role_menu` VALUES ('1374', '7', '1');
INSERT INTO `sys_role_menu` VALUES ('1375', '7', '23');
INSERT INTO `sys_role_menu` VALUES ('1376', '7', '24');
INSERT INTO `sys_role_menu` VALUES ('1377', '7', '25');
INSERT INTO `sys_role_menu` VALUES ('1378', '7', '26');
INSERT INTO `sys_role_menu` VALUES ('1379', '7', '44');
INSERT INTO `sys_role_menu` VALUES ('1380', '7', '6');
INSERT INTO `sys_role_menu` VALUES ('1381', '7', '27');
INSERT INTO `sys_role_menu` VALUES ('1382', '7', '30');
INSERT INTO `sys_role_menu` VALUES ('1383', '7', '29');
INSERT INTO `sys_role_menu` VALUES ('1384', '7', '65');
INSERT INTO `sys_role_menu` VALUES ('1385', '7', '43');
INSERT INTO `sys_role_menu` VALUES ('1386', '7', '62');
INSERT INTO `sys_role_menu` VALUES ('1387', '7', '63');

-- ----------------------------
-- Table structure for sys_sina_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_sina_user`;
CREATE TABLE `sys_sina_user` (
  `sina_user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idstr` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字符串型的用户UID',
  `screenName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户昵称',
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '友好显示名称',
  `province` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT ' 用户所在省级ID',
  `city` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT ' 用户所在城市ID',
  `location` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT ' 用户所在地',
  `description` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户个人描述',
  `profileImageUrl` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户头像地址（中图），50×50像素',
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户博客地址',
  `weihao` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT ' 用户的微号',
  `gender` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT ' 性别，m：男、f：女、n：未知',
  `createdAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户创建（注册）时间',
  PRIMARY KEY (`sina_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_sina_user
-- ----------------------------
INSERT INTO `sys_sina_user` VALUES ('1', '2784461644', null, '拓胜Java培训', null, null, '广东 广州', '拓胜是一家集大型软件开发、IT培训（Java、web前端、UI、Android、软件测试）、人才外包服务等业务于一体的高科技公司。 官网地址： www.toceansoft.com http://test.toceansoft.com/', null, 'http://blog.sina.com.cn/toceansoft', '', 'm', null);
INSERT INTO `sys_sina_user` VALUES ('2', '6024107981', null, 'Garuda201609', null, null, '其他', '', null, '', '', 'm', null);

-- ----------------------------
-- Table structure for sys_table_ref
-- ----------------------------
DROP TABLE IF EXISTS `sys_table_ref`;
CREATE TABLE `sys_table_ref` (
  `ref_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ref_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '引用key',
  `ref_line` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '行数',
  `ref_table_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '引用表名',
  `ref_param` bigint(20) DEFAULT NULL COMMENT '列数',
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_table_ref
-- ----------------------------
INSERT INTO `sys_table_ref` VALUES ('138', 'key31', 'line1', 'student', '53');
INSERT INTO `sys_table_ref` VALUES ('139', 'key31', 'line1', 'audio_engine', '14');
INSERT INTO `sys_table_ref` VALUES ('140', 'key31', 'line2', 'student', '54');
INSERT INTO `sys_table_ref` VALUES ('141', 'key31', 'line2', 'audio_engine', '15');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_type` tinyint(4) DEFAULT NULL,
  `user_avatar` varchar(510) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e424e59d0d71824aa924261cf6bdf84d', '382628f2a04cad44b1c12c6f316735e4', 'admin@toceansoft.com', '13888888888', '1', '1', '2018-01-18 11:11:11', '0', null);
INSERT INTO `sys_user` VALUES ('2', 'admin1', '4fe7c5cf4fbcaf9d24de84e3f12e068f', '37eeb1b0cebd0bd5e0f3c7a9080f4a0a', 'admin1@qq.com', null, '1', '1', '2019-02-18 15:15:03', '0', null);
INSERT INTO `sys_user` VALUES ('3', 'admin2', '41c9a90827b6bd71882821920c3ef2f9', 'bbd89ecf78ef48536544dd69805f9d2d', 'admin2@qq.comc', '13111111111', '1', '1', '2019-02-18 16:47:25', '0', null);
INSERT INTO `sys_user` VALUES ('4', 'admin3', '', null, 'admin3@qq.com', '13111111111', '1', '1', '2019-02-18 17:16:51', '0', null);
INSERT INTO `sys_user` VALUES ('5', 'admin6', '', null, 'admin5@qq.com', '', '1', '1', '2019-02-18 17:33:29', '0', null);
INSERT INTO `sys_user` VALUES ('14', 'coolman', 'db9baa444b7f64ba4507f4ab7d4502be', 'fc566bfdc036acc7115f40c8a9cad703', 'naa@aa.net', '13633333333', '1', '1', '2019-03-04 18:14:02', '1', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1218485516,264644399&fm=27&gp=0.jpg');
INSERT INTO `sys_user` VALUES ('16', 'admin9', '302cbee8a9c9f518b6d513d1e51a543c', '10c6c6cf98fc120ce6f0d38c43674df2', 'ke5205190@qq.com', '13111111111', '1', '1', '2019-04-25 15:39:42', '2', '123');
INSERT INTO `sys_user` VALUES ('17', 'admin10', 'db3134eeb6c4a738a79e0388ac49cbc0', 'd346491e6d0ea38a7ffbc36b896e379f', 'ke@qq.com', '13111111111', '0', '1', '2019-04-25 16:46:28', '0', '1');
INSERT INTO `sys_user` VALUES ('18', 'admin11', 'a63aa69e1feb8d855d1d7eaf3ce357ca', 'c44321d658ea959c305050a0320b7068', 'ke@qq.com', '13111111111', '1', '1', '2019-05-17 14:08:43', '0', '');
INSERT INTO `sys_user` VALUES ('19', 'develop', '473a91a0696a336b593e3922b8fb0420', '915e193a1683fb78874ea6ef32cac890', 'develop@toceansoft.com', '13532312385', '1', '1', '2019-06-03 16:24:52', '0', '');

-- ----------------------------
-- Table structure for sys_user_qq_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_qq_user`;
CREATE TABLE `sys_user_qq_user` (
  `user_id` bigint(20) NOT NULL,
  `qq_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `qq_user_id` (`qq_user_id`),
  CONSTRAINT `sys_user_qq_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `sys_user_qq_user_ibfk_2` FOREIGN KEY (`qq_user_id`) REFERENCES `sys_qq_user` (`qq_user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_user_qq_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('64', '2', '1');
INSERT INTO `sys_user_role` VALUES ('65', '5', '1');
INSERT INTO `sys_user_role` VALUES ('72', '4', '4');
INSERT INTO `sys_user_role` VALUES ('73', '3', '4');
INSERT INTO `sys_user_role` VALUES ('75', '14', '1');
INSERT INTO `sys_user_role` VALUES ('84', '1', '1');
INSERT INTO `sys_user_role` VALUES ('87', '16', '4');
INSERT INTO `sys_user_role` VALUES ('90', '17', '4');
INSERT INTO `sys_user_role` VALUES ('91', '18', '4');
INSERT INTO `sys_user_role` VALUES ('92', '19', '7');

-- ----------------------------
-- Table structure for sys_user_sina_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_sina_user`;
CREATE TABLE `sys_user_sina_user` (
  `user_id` bigint(20) NOT NULL,
  `sina_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `sina_user_id` (`sina_user_id`),
  CONSTRAINT `sys_user_sina_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `sys_user_sina_user_ibfk_2` FOREIGN KEY (`sina_user_id`) REFERENCES `sys_sina_user` (`sina_user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_user_sina_user
-- ----------------------------
INSERT INTO `sys_user_sina_user` VALUES ('1', '1');
INSERT INTO `sys_user_sina_user` VALUES ('2', '2');

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(255) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNTU5NjMxMDE5LCJleHAiOjE1NTk3MTc0MTl9.dAmLA4hO9-3bsoS7oPOzmOj9Lx6XJPSPPx4PUZ8MeQTjmkL12LKl6oVaht0oEDJP-8I1nsVVMKtCke-lhvYD3A', '2019-06-05 14:50:20', '2019-06-04 14:50:20');
INSERT INTO `sys_user_token` VALUES ('2', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyIiwiaWF0IjoxNTUyMTE2NjQ5LCJleHAiOjE1NTIyMDMwNDl9.8LdU-ZFf2zVsQ_LFn5KMpPK1ppQY-Zxv3rvK6o-SlwmSUFYsJnEJA02PgKMajww27JunTXDtFOPaQDLPAI__fA', '2019-03-10 15:30:49', '2019-03-09 15:30:49');
INSERT INTO `sys_user_token` VALUES ('3', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNTU1MDYzNzI2LCJleHAiOjE1NTUxNTAxMjZ9.-ztu9L2OyB5P5yrAXSCkW3p_51hcEp_GTIXArjTLOj9Zzs1VrkfWRht7QDPbATwabihwfrzKEr81wwEWPrFTpw', '2019-04-13 18:08:46', '2019-04-12 18:08:46');
INSERT INTO `sys_user_token` VALUES ('4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI0IiwiaWF0IjoxNTU0OTUzMDYwLCJleHAiOjE1NTUwMzk0NjB9.mwOWQLiGswACFNNrZ924HfMEz_qiWZGsn28pCqxcSnGmYb2aJjpgjec6T5LPFM14GkAwfv6evxgqPoWtZ8AlbQ', '2019-04-12 11:24:20', '2019-04-11 11:24:20');
INSERT INTO `sys_user_token` VALUES ('5', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI1IiwiaWF0IjoxNTUyMzc2MDgzLCJleHAiOjE1NTI0NjI0ODN9.CrFQ_p6gBZE2xB_NCQmojZE9akuz6PwvKl_nEMYoV73k01sKyvuwNwGl6-24laBbgBa_C7lVzH0o_VO4UWW4XA', '2019-03-13 15:34:44', '2019-03-12 15:34:44');
INSERT INTO `sys_user_token` VALUES ('6', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI2IiwiaWF0IjoxNTUxODUzMTE0LCJleHAiOjE1NTE5Mzk1MTR9.pZPQ1zztZaZuTmTQXfcQaxHBjM1JTbfpGi_JFxkfk2p7PcXkw9Isgt6vXoKmYmwKHSkYUOa3nFSU1VVlTobQBA', '2019-03-07 14:18:35', '2019-03-06 14:18:35');
INSERT INTO `sys_user_token` VALUES ('12', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMiIsImlhdCI6MTU1MTUyNzM4OSwiZXhwIjoxNTUxNjEzNzg5fQ.mSdh1HpN9yv6eAipg-8aCwNnqY_Uvz3OCvh1bFCCPGNw8Y_SLX-VbgsiDqgK9MHC1aS1sUP4y5pn2shYB2bIdg', '2019-03-03 19:49:50', '2019-03-02 19:49:50');
INSERT INTO `sys_user_token` VALUES ('13', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMyIsImlhdCI6MTU1MjEwMzA0OCwiZXhwIjoxNTUyMTg5NDQ4fQ.OvsbucKKTVu8Kt9DmNRsO1n1eGBlnaEWO_MfgrI78EqRdxDTlXkFGV4-qpyVlw0-ieYgP-wMZqRcNKZSEqt-vQ', '2019-03-10 11:44:08', '2019-03-09 11:44:08');
INSERT INTO `sys_user_token` VALUES ('14', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNCIsImlhdCI6MTU1MTY5NDQ1MSwiZXhwIjoxNTUxNzgwODUxfQ._6gYrkd8zvUAA02MBslJ6niiCqdcCcsxti5AqNf-AcvRMtx68acSZGrKyb5HI60Np55VChVBMlnd23kkb73QIQ', '2019-03-05 18:14:11', '2019-03-04 18:14:11');
INSERT INTO `sys_user_token` VALUES ('15', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNSIsImlhdCI6MTU1MjExOTczNCwiZXhwIjoxNTUyMjA2MTM0fQ.-_cZeBHzOwDTegfY2kUY9er3_tZdemHmRz9zKYpJIMVUeXPONO60MDvcoIoY_BLBRJDZ-W-ccM9neFbtXwgoXg', '2019-03-10 16:22:14', '2019-03-09 16:22:14');
INSERT INTO `sys_user_token` VALUES ('16', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNiIsImlhdCI6MTU1MjEwMTIzNSwiZXhwIjoxNTUyMTg3NjM1fQ.v79zjV37mM9x0xT4BXq3BR2NCwf6g84CC_k8-HZ-gC-9WdeKU4mwsLB7PAPb2mtN8BCZayYoyZrXMsbF1-kUMw', '2019-03-10 11:13:55', '2019-03-09 11:13:55');
INSERT INTO `sys_user_token` VALUES ('17', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNyIsImlhdCI6MTU1MjEwMzY2NSwiZXhwIjoxNTUyMTkwMDY1fQ.pODNksztVivOgs_YBTVqW1eggvzBUz3_kCKbWyg7KTHdmx0BHt3cn-5cG8pXrmIh93y_c4vzU9C5_EnTKwL_JA', '2019-03-10 11:54:26', '2019-03-09 11:54:26');
INSERT INTO `sys_user_token` VALUES ('18', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxOCIsImlhdCI6MTU1ODA3MzMzNiwiZXhwIjoxNTU4MTU5NzM2fQ.kYDPFm_R8CyAHe54sypVGdEKA5GZz176pU5GGOQcK33Xhk8HJRmHPkm_uKcKQIq8FtZkKbIHT3oJm_JdtcyVaw', '2019-05-18 14:08:57', '2019-05-17 14:08:57');
INSERT INTO `sys_user_token` VALUES ('19', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxOSIsImlhdCI6MTU1OTU1MDM0NiwiZXhwIjoxNTU5NjM2NzQ2fQ.mcEhLyg4aIj1DrUonPSlWyD-K0N_zegl_w56rMLTIAE3tDhwI4aTr854LNFMmBlu6MMHU3hZO4X9TZOcy7ONcw', '2019-06-04 16:25:47', '2019-06-03 16:25:47');
INSERT INTO `sys_user_token` VALUES ('10000', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDAwMCIsImlhdCI6MTU0ODgxNjMxNCwiZXhwIjoxNTQ4OTAyNzE0fQ.wcoXZjvcS653A2lZNz9RPlYs19Sa3jww2kOmWuSiaMzcRLNFJkTJzbd-N-YZpihdQTlUvcT2GQh6ENZ-GwUWzw', '2019-01-31 10:45:14', '2019-01-30 10:45:14');
INSERT INTO `sys_user_token` VALUES ('10001', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDAwMSIsImlhdCI6MTU0ODgxNjI0NiwiZXhwIjoxNTQ4OTAyNjQ2fQ.NijVW2x0waqQJ_2MiuuSCd5rnR2H3uJZbkpL_m457yztvJypFZOaSdKIEd9zq2c2jcUsFF-zknXJT5ooCAWnkA', '2019-01-31 10:44:07', '2019-01-30 10:44:07');

-- ----------------------------
-- Table structure for sys_user_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_wechat_user`;
CREATE TABLE `sys_user_wechat_user` (
  `user_id` bigint(20) NOT NULL,
  `wechat_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_` (`user_id`) USING BTREE,
  UNIQUE KEY `wechat_user_id_` (`wechat_user_id`) USING BTREE,
  CONSTRAINT `sys_user_wechat_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `sys_user_wechat_user_ibfk_2` FOREIGN KEY (`wechat_user_id`) REFERENCES `sys_wechat_user` (`wechat_user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_user_wechat_user
-- ----------------------------
INSERT INTO `sys_user_wechat_user` VALUES ('1', '4');

-- ----------------------------
-- Table structure for sys_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_wechat_user`;
CREATE TABLE `sys_wechat_user` (
  `wechat_user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '普通用户的标识，对当前开发者帐号唯一',
  `nickname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '普通用户昵称',
  `sex` tinyint(4) DEFAULT NULL COMMENT '普通用户性别，1为男性，2为女性',
  `province` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT ' 普通用户个人资料填写的省份',
  `city` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '普通用户个人资料填写的城市',
  `country` varchar(56) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '国家，如中国为CN',
  `language` varchar(56) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '语言，如中文为zh_CN',
  `headimgurl` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户头像，最后一个数值代表正方形头像大小',
  `subscribe` int(11) DEFAULT NULL COMMENT '用户是否订阅该公众号标识',
  `subscribeTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '用户关注时间，为时间戳',
  `remark` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '公众号运营者对粉丝的备注',
  `groupid` int(11) DEFAULT NULL COMMENT '用户所在的分组ID',
  `subscribeScene` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '返回用户关注的渠道来源',
  `qrScene` int(11) DEFAULT NULL COMMENT ' 二维码扫码场景（开发者自定义）',
  `qrSceneStr` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '二维码扫码场景描述（开发者自定义）',
  PRIMARY KEY (`wechat_user_id`),
  UNIQUE KEY `openid` (`openid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_wechat_user
-- ----------------------------
INSERT INTO `sys_wechat_user` VALUES ('2', 'owpdi1fuFNrTIXedzlRIiOXktgac', 'Garuda', '1', 'Guangdong', 'Maoming', 'CN', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIAEbGSsWg11YB1zQEGVExMBt6UgA2e61ziabxdodEaia9OibOT9nHQC8ramoic1E9EahZhWj5mBf4bIQ/132', '0', null, null, '0', null, null, null);
INSERT INTO `sys_wechat_user` VALUES ('3', null, null, '0', null, null, null, null, null, '0', null, null, '0', null, null, null);
INSERT INTO `sys_wechat_user` VALUES ('4', 'owpdi1fe809M9mqADDi1Qu1il5GM', 'Narci.Lee@拓胜', '1', 'Guangdong', 'Guangzhou', 'CN', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/vi_32/ZjJia6PlsyS4ia80SOOT9h3gAYgCvuquPoUoXEXPUpPJOGkWHtticj6SsS4agicRaOUiam83kWflL7ic4nhrPjW9AciaQ/132', '0', null, null, '0', null, null, null);

-- ----------------------------
-- Table structure for sys_wechat_usermeta
-- ----------------------------
DROP TABLE IF EXISTS `sys_wechat_usermeta`;
CREATE TABLE `sys_wechat_usermeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wechat_user_id` bigint(20) DEFAULT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '元数据的key',
  `meta_value` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '元数据的value',
  PRIMARY KEY (`meta_id`),
  KEY `wechat_user_ids` (`wechat_user_id`) USING BTREE,
  CONSTRAINT `sys_wechat_usermeta_ibfk_1` FOREIGN KEY (`wechat_user_id`) REFERENCES `sys_wechat_user` (`wechat_user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_wechat_usermeta
-- ----------------------------

-- ----------------------------
-- Table structure for sys_weixin_pay
-- ----------------------------
DROP TABLE IF EXISTS `sys_weixin_pay`;
CREATE TABLE `sys_weixin_pay` (
  `pay_id` bigint(20) NOT NULL COMMENT '表的主键',
  `app_secret` varchar(512) COLLATE utf8mb4_bin NOT NULL COMMENT '服务号的应用密钥',
  `app_id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '微信服务号ID',
  `app_token` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '服务号的配置token',
  `app_mch_id` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '微信支付商户号',
  `app_payapi_key` varchar(512) COLLATE utf8mb4_bin NOT NULL COMMENT '商户对应的微信支付API密钥',
  `app_sign_type` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT '签名加密方式',
  `app_cert_path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信支付证书名称',
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_weixin_pay
-- ----------------------------

-- ----------------------------
-- Table structure for tb_app_update
-- ----------------------------
DROP TABLE IF EXISTS `tb_app_update`;
CREATE TABLE `tb_app_update` (
  `appid` varchar(50) DEFAULT NULL COMMENT 'APPID ',
  `update_content` varchar(500) DEFAULT NULL COMMENT '更新内容',
  `version_code` int(20) DEFAULT NULL COMMENT '版本码',
  `version_name` varchar(50) DEFAULT NULL COMMENT '版本号',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `app_file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `md5` varchar(255) DEFAULT NULL COMMENT 'MD5值',
  `size` varchar(50) DEFAULT NULL COMMENT '文件大小',
  `is_force` varchar(50) DEFAULT NULL COMMENT '是否强制安装',
  `is_ignorable` varchar(50) DEFAULT NULL COMMENT '是否可忽略该版本',
  `is_silent` varchar(50) DEFAULT NULL COMMENT '是否静默下载：有新版本时不提示直接下载',
  `upload_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP版本管理';

-- ----------------------------
-- Records of tb_app_update
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
