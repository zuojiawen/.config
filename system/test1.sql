/*
 Navicat Premium Data Transfer

 Source Server         : wind_farm
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 127.0.0.1:3306
 Source Schema         : test1

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 07/02/2022 16:42:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
BEGIN;
INSERT INTO `alembic_version` VALUES ('2048f30f71ec');
COMMIT;

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `login_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_time` datetime DEFAULT NULL,
  `method_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `method_type_id` (`method_type_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`method_type_id`) REFERENCES `methods_type` (`id`),
  CONSTRAINT `logs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of logs
-- ----------------------------
BEGIN;
INSERT INTO `logs` VALUES (1, 7, '127.0.0.1', 'UserLogin: Count=    ,', '2022-02-06 19:28:14', NULL);
INSERT INTO `logs` VALUES (2, 7, '127.0.0.1', 'UserLogin: Count=    ,', '2022-02-07 15:28:22', NULL);
COMMIT;

-- ----------------------------
-- Table structure for methods_type
-- ----------------------------
DROP TABLE IF EXISTS `methods_type`;
CREATE TABLE `methods_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of methods_type
-- ----------------------------
BEGIN;
INSERT INTO `methods_type` VALUES (6, '修改损伤阈值');
INSERT INTO `methods_type` VALUES (2, '修改用户信息');
INSERT INTO `methods_type` VALUES (5, '修改结冰阈值');
INSERT INTO `methods_type` VALUES (3, '修改风场信息');
INSERT INTO `methods_type` VALUES (4, '修改风机');
INSERT INTO `methods_type` VALUES (1, '用户登录');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` int DEFAULT NULL,
  `permission` tinyint(1) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zc_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zctime` datetime DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `miss_number` int DEFAULT NULL,
  `miss_time` datetime DEFAULT NULL,
  `miss_flag` tinyint(1) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `count` (`count`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (7, 'admin', 'admin', 'pbkdf2:sha256:260000$hhgpgXxdEqZYGucA$45b1c5ef1f1d888eda0e273a029a0d5e37d277fed7a5da870bada75b76b81384', 2, 0, NULL, NULL, NULL, NULL, '2022-02-06 19:25:58', NULL, '127.0.0.1', '2022-02-07 15:28:22', 0, 0, NULL, 0, 1);
INSERT INTO `user` VALUES (8, 'test1', 'test1', 'pbkdf2:sha256:260000$Et8vxMfyRw7mnWKx$5352b5f902960805d68126022e0bfd695f608de72fb35c05e812a5b303bd63ed', 2, 1, NULL, NULL, NULL, NULL, '2022-02-06 19:26:22', NULL, NULL, '2022-02-06 19:26:22', 0, 0, NULL, 0, 1);
INSERT INTO `user` VALUES (9, 'test2', 'test2', 'pbkdf2:sha256:260000$VJJtXumr6RdAPO98$d584d75adebdbf9fcc38de84fc336c24783a0d9f741f05da2da6ed2e34422047', 2, 1, NULL, NULL, NULL, NULL, '2022-02-06 19:26:43', NULL, NULL, '2022-02-06 19:26:43', 0, 0, NULL, 0, 1);
INSERT INTO `user` VALUES (10, 'test3', 'test3', 'pbkdf2:sha256:260000$zDbxVlN0TzB1T7l3$27a8db35f6673c19a26fbfed487ea7f3d2b517c10ec5f48c7fc9981c640ffddd', 2, 1, NULL, NULL, NULL, NULL, '2022-02-06 19:26:52', NULL, NULL, '2022-02-06 19:26:52', 0, 0, NULL, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for wind_turbines
-- ----------------------------
DROP TABLE IF EXISTS `wind_turbines`;
CREATE TABLE `wind_turbines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `state` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wind_turbines
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wind_warning_records
-- ----------------------------
DROP TABLE IF EXISTS `wind_warning_records`;
CREATE TABLE `wind_warning_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `w_t_id` int NOT NULL,
  `w_w_t_id` int DEFAULT NULL,
  `warning_time` datetime DEFAULT NULL,
  `warning_data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `w_t_id` (`w_t_id`),
  KEY `w_w_t_id` (`w_w_t_id`),
  CONSTRAINT `wind_warning_records_ibfk_1` FOREIGN KEY (`w_t_id`) REFERENCES `wind_turbines` (`id`),
  CONSTRAINT `wind_warning_records_ibfk_2` FOREIGN KEY (`w_w_t_id`) REFERENCES `wind_warning_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wind_warning_records
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wind_warning_type
-- ----------------------------
DROP TABLE IF EXISTS `wind_warning_type`;
CREATE TABLE `wind_warning_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wind_warning_type
-- ----------------------------
BEGIN;
INSERT INTO `wind_warning_type` VALUES (1, '覆冰告警');
INSERT INTO `wind_warning_type` VALUES (2, '载荷数据');
INSERT INTO `wind_warning_type` VALUES (3, '叶片损伤');
INSERT INTO `wind_warning_type` VALUES (4, '叶片平衡');
INSERT INTO `wind_warning_type` VALUES (5, '法兰间隙');
INSERT INTO `wind_warning_type` VALUES (6, '法兰突变');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
