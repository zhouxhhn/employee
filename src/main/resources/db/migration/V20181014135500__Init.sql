drop TABLE  if exists e_user;
CREATE TABLE `e_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL COMMENT '姓名',
  `identity_card` varchar(250) DEFAULT NULL COMMENT '身份证号码',
  `cellphone` varchar(250) DEFAULT NULL COMMENT '手机号码',
  `sex` TINYINT(4) DEFAULT NULL COMMENT '性别',
  `type` TINYINT(4) DEFAULT NULL COMMENT '类型',
  `image_url` varchar(250) DEFAULT NULL COMMENT '图像url',
 `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) COMMENT='用户表';

drop TABLE  if exists e_app_update;
CREATE TABLE `e_app_update` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` varchar(250) DEFAULT NULL COMMENT '版本号',
  `version_id` TINYINT(4) DEFAULT NULL COMMENT '版本id',
  `url` varchar(250) DEFAULT NULL COMMENT 'app更新url',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) COMMENT='app更新表';

