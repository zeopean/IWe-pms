CREATE DATABASE `iwe_pms` DEFAULT CHARACTER SET utf8mb4;

-- 部门表
DROP TABLE IF EXISTS  `iwe_department`;
CREATE TABLE iwe_department(
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id，主键',
  `company` VARCHAR(100) DEFAULT '' COMMENT '公司名称',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '部门名字',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '状态 0 不可用， 1 可用',
  `header_user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '负责人 userId',
  `create_time` DATETIME COMMENT '创建时间',
  `update_time` DATETIME COMMENT '更新时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COMMENT='部门表';


-- 群组表
DROP TABLE IF EXISTS  `iwe_group`;
CREATE TABLE iwe_group(
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '群组id，主键',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '群组名字',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '状态 0 不可用， 1 可用（若群组不可用，不能再有其它操作，只能查看历史信息）',
  `header_user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '负责人 userId',
  `group_type` TINYINT NOT NULL DEFAULT 0 COMMENT '群组属性 系统群组 0， 部门群组 1',
  `department_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '部门id',
  `create_time` DATETIME COMMENT '创建时间',
  `update_time` DATETIME COMMENT '更新时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COMMENT='群组表';




-- 用户.群组表
DROP TABLE IF EXISTS  `iwe_user_group`;
CREATE TABLE iwe_user_group(
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id，主键',
  `user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `group_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '群组id',
  `is_header` TINYINT NOT NULL DEFAULT 0 COMMENT '是否为群组负责人 0 否， 1 是',
  `header_user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '负责人 userId， 默认为0',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` DATETIME COMMENT '创建时间',
  `update_time` DATETIME COMMENT '更新时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COMMENT='用户.群组表';




-- 用户表
DROP TABLE IF EXISTS  `iwe_user`;
CREATE TABLE iwe_user(
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id，主键',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名字',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '状态',
  `role_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '角色id',
  `create_time` DATETIME COMMENT '创建时间',
  `update_time` DATETIME COMMENT '更新时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COMMENT='用户表';




-- 角色表
DROP TABLE IF EXISTS  `iwe_role`;
CREATE TABLE iwe_role(
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id，主键',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色名字',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '状态',
  `role_type` TINYINT NOT NULL DEFAULT 6 COMMENT '角色类型，0 系统管理人员，1 开发人员， 2 qa测试， 3 设计 ， 4 产品经理，5  运营， 6 观察者',
  `create_time` DATETIME COMMENT '创建时间',
  `update_time` DATETIME COMMENT '更新时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COMMENT='角色表';



-- 项目表
DROP TABLE IF EXISTS  `iwe_project`;
CREATE TABLE iwe_project(
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目id，主键',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '项目名字',
  `group_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '群组id',
  `project_type` TINYINT NOT NULL DEFAULT 6 COMMENT '项目类型 0 默认系统项目，1 群组项目，2 部门项目, 3 个人项目（群组负责人是自己） ',
  `header_user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '负责人 userId， 默认为0',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '状态',
  `complete_time` DATETIME COMMENT '项目完成时间',
  `create_time` DATETIME COMMENT '创建时间',
  `update_time` DATETIME COMMENT '更新时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COMMENT='项目表';




-- 项目完成项表
DROP TABLE IF EXISTS  `iwe_project_option`;
CREATE TABLE iwe_project_option(
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id，主键',
  `project_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '项目id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '项目完成项名字',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '状态',
  `header_user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '该项任务 负责人 userId',
  `complete_time` DATETIME COMMENT '项目完成时间',
  `create_time` DATETIME COMMENT '创建时间',
  `update_time` DATETIME COMMENT '更新时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COMMENT='项目完成项表';




-- 任务表
DROP TABLE IF EXISTS  `iwe_task`;
CREATE TABLE iwe_task(
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id，主键',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '任务名字',
  `task_type` TINYINT NOT NULL DEFAULT 1 COMMENT '任务类型，1 项目， 2 bug',
  `obect_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务类型id ',
  `sponsor_user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务发起人 userId',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '任务状态 0 准备阶段， 1 进行阶段，2 完成  ',
  `complete_time` DATETIME COMMENT '完成时间',
  `create_time` DATETIME COMMENT '创建时间',
  `update_time` DATETIME COMMENT '更新时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COMMENT='任务表';




-- 任务分发表
DROP TABLE IF EXISTS  `iwe_task_issue`;
CREATE TABLE iwe_task_issue(
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务分发id，主键',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '任务分发名字',
  `task_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务类型id ',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '任务状态 0 准备阶段， 1 进行阶段，2 完成  ',
  `sponsor_user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务发起人 userId',
  `header_user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '负责人 userId',
  `complete_time` DATETIME COMMENT '完成时间',
  `create_time` DATETIME COMMENT '创建时间',
  `update_time` DATETIME COMMENT '更新时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COMMENT='任务分发表';




-- bug（漏洞）记录表
DROP TABLE IF EXISTS  `iwe_bug`;
CREATE TABLE iwe_bug(
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'bug id，主键',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'bug 名字',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT 'bug 描述',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT 'bug 状态，0 未解决， 1 研发已解决，2 已分配，3 重新打开，4 打回， 5 已解决（关闭）',
  `sponsor_user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '任务发起人 userId',
  `header_user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '负责人 userId',
  `bug_type` TINYINT NOT NULL DEFAULT 0 COMMENT 'bug 类型，0 功能问题，1 设计问题，2 项目需求问题',
  `invite_user_ids` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'bug 协同处理，邀请他人',
  `level` TINYINT NOT NULL DEFAULT 1 COMMENT 'bug级别 1 一般错误， 2  功能错误， 3  性能错误， 4  严重错误',
  `solve_time` DATETIME COMMENT 'bug 解决 时间',
  `create_time` DATETIME COMMENT '创建时间',
  `update_time` DATETIME COMMENT '更新时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COMMENT='bug（漏洞）记录表';

-- bug（漏洞）详情表
DROP TABLE IF EXISTS  `iwe_bug_detail`;
CREATE TABLE iwe_bug_detail(
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'bug 详情 id，主键',
  `bug_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT 'bugId',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'bug 名字',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '状态',
  `version` VARCHAR(255) NOT NULL DEFAULT 'ver.1.0' COMMENT '版本信息',
  `note` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '注释',
  `platform` VARCHAR(255) NOT NULL DEFAULT 'Web' COMMENT 'bug发生平台',
  `attach_files` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '附件地址，多个文件用 【,】区分开',
  `create_time` DATETIME COMMENT '创建时间',
  `update_time` DATETIME COMMENT '更新时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COMMENT='bug（漏洞）详情表';


-- 文档 表
DROP TABLE IF EXISTS  `iwe_document`;
CREATE TABLE iwe_document(
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文档 id，主键',
  `name` varchar(50) NOT NULL COMMENT '文档 名字',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '文档 描述',
  `user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '用户 Id',
  `context` TEXT COMMENT '文档正文',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '文档状态 0 未发布， 1 已发布',
  `project_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '项目id 文档按项目显示，若文档属于全局，则使用系统项目 0 ',
  `create_time` DATETIME COMMENT '创建时间',
  `update_time` DATETIME COMMENT '更新时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COMMENT='文档 表';



-- 消息 表
DROP TABLE IF EXISTS  `iwe_notice`;
CREATE TABLE iwe_notice(
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息 id，主键',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '消息 名字',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '消息状态 0 编辑中， 1 已经发送， 2 已读',
  `from_user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '消息发送人 userId，消息发送人，为0 表示 系统消息',
  `to_user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '消息接受者 userId，消息接收人，为0 表示 所有人都接收',
  `notice_type` TINYINT NOT NULL DEFAULT 0 COMMENT '消息类型 0 表示系统消息， 1 表示项目， 2 表示 任务消息， 3 表示 bug消息， 4 表示文档消息',
  `create_time` DATETIME COMMENT '创建时间',
  `update_time` DATETIME COMMENT '更新时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COMMENT='消息 表';





