/*
 Navicat Premium Data Transfer

 Source Server         : myLocal
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : localhost:3306
 Source Schema         : schooljob

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 25/03/2020 22:20:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `kind` int(11) NULL DEFAULT NULL COMMENT '用户类型（0 管理员 1学生）',
  `sex` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `isdel` int(255) NULL DEFAULT NULL COMMENT '是否删除（0 否 1 是）',
  `status` int(255) NULL DEFAULT NULL COMMENT '状态（0 禁用 1启用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES (1, 'admin', 'admin', 0, '女', '123', '123', 0, 0);
INSERT INTO `sysuser` VALUES (2, 'username', 'password', 1, '男', '15056408321', '2568819232@qq.com', 0, 1);

SET FOREIGN_KEY_CHECKS = 1;
