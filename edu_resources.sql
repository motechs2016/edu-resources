/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.11 : Database - edu_resources
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`edu_resources` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `edu_resources`;

/*Table structure for table `academy` */

DROP TABLE IF EXISTS `academy`;

CREATE TABLE `academy` (
  `academy_id` int(11) NOT NULL AUTO_INCREMENT,
  `academy_name` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `english_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`academy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `academy` */

insert  into `academy`(`academy_id`,`academy_name`,`english_name`) values (1,'理学院','School of Sciences'),(2,'材料与纺织学院','School of Materials and Textiles'),(3,'服装学院','Fashion School & Engineering'),(4,'信息学院','School of Informatics and Electronics'),(5,'机械与自动控制学院','School of Mechanical Engineering and Aut'),(6,'建筑工程学院','School of Civil Engineering and Architec'),(7,'生命科学学院','School of Life Science'),(8,'经济管理学院','School of Economics and Management'),(9,'艺术与设计学院','School of Art and Design'),(10,'法政学院','Law School'),(11,'外国语学院','School of Foreign Languages'),(12,'文化传播学院','School of Culture and Communication'),(13,'艺术与设计学院','School of Art and Design'),(14,'马克思主义学院','College of Marxism'),(15,'启新学院','Qixin School'),(16,'继续教育学院','College of Continuing Education'),(17,'科技与艺术学院','Higher Vocational College');

/*Table structure for table `account_categories` */

DROP TABLE IF EXISTS `account_categories`;

CREATE TABLE `account_categories` (
  `acc_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_categoty_name` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`acc_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `account_categories` */

insert  into `account_categories`(`acc_category_id`,`acc_categoty_name`) values (1,'管理员'),(2,'教师'),(3,'学生');

/*Table structure for table `audit` */

DROP TABLE IF EXISTS `audit`;

CREATE TABLE `audit` (
  `audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `audit_des` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `audit` */

insert  into `audit`(`audit_id`,`audit_des`) values (1,'待审核'),(2,'审核通过'),(3,'审核未通过'),(4,'文件转换中'),(5,'转换失败');

/*Table structure for table `class` */

DROP TABLE IF EXISTS `class`;

CREATE TABLE `class` (
  `class_id` char(10) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `major_id` char(10) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `class_name` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`class_id`,`major_id`),
  KEY `FK_class` (`major_id`),
  CONSTRAINT `FK_class` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `class` */

insert  into `class`(`class_id`,`major_id`,`class_name`) values ('5401','D1','信息管理与信息系统(1)班'),('5402','D1','信息管理与信息系统(2)班'),('5701','D2','电子商务(2)班'),('5702','D2','电子商务(2)班');

/*Table structure for table `course_items` */

DROP TABLE IF EXISTS `course_items`;

CREATE TABLE `course_items` (
  `course_id` char(10) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `chapter_id` int(11) NOT NULL DEFAULT '0',
  `chapter_name` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `is_parent_node` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`course_id`,`chapter_id`),
  CONSTRAINT `FK_course_items` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `course_items` */

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `course_id` char(10) CHARACTER SET utf8 NOT NULL,
  `course_name` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `english_name` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `c_category_id` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `description` text,
  `note` text,
  PRIMARY KEY (`course_id`),
  KEY `FK_courses` (`c_category_id`),
  CONSTRAINT `FK_courses` FOREIGN KEY (`c_category_id`) REFERENCES `courses_categories` (`c_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `courses` */

insert  into `courses`(`course_id`,`course_name`,`english_name`,`c_category_id`,`description`,`note`) values ('02524','计算机基础概论','Introduction to Computer Basics','A','',''),('02530','C程序设计','C Programming','A','',''),('02537','VB数据库开发应用技术','the Development and Applications Technol','A','',''),('04503','职业发展与就业指导','Career Development and Employment Guidan','A','',''),('04507','大学生心理健康教育','Students\' Mental Health Education','A','',''),('07501','形势与政策','Current Issues and Policies','A','',''),('08501','军事理论','Military Theory','A','',''),('26433','名著选读','Introduction to Classical Literary Works','A','',''),('47542','平面图形与动画制作','Plane Figure and Animation Creation','B0401','',''),('51501','财政学','Public Finance','B0304','',''),('51523','国际贸易理论与实务B','International Trade Theories and Practic','B0302','',''),('51536','宏观经济学B','Macro-economics B','B01','',''),('51537','货币银行学','Monetary Banking','B0304','',''),('51550','经贸英语','Business English','B0302','',''),('51567','微观经济学B','Microeconomics B','B01','',''),('51599','资本运营','Capital Operation','B0204','',''),('51640','经济法','Economic Law','B01','',''),('51904','经济法*','Economic Law','B0301','',''),('51906','国际金融*','International Finance','B0304','',''),('51907','中国对外贸易概论*','Introduction to Chinese Foreign Trade','B0302','',''),('51909','国际贸易体制*','International Trade System','B0302','',''),('51914','国际贸易地理*','Geography of International Trade','B0302','',''),('51916','国际服务贸易*','International Service Trade','B0302','',''),('51917','国际结算*','International Settlement','B0302','',''),('51926','外贸函电*','International Business Communication','B0302','',''),('51927','外贸洽谈*','International Business Negotiation','B0302','',''),('51928','国际商法*','International Business Law','B0302','',''),('51933','计量经济学*','Econometrics','B0301','',''),('51934','证券投资分析*','Investment in security','B0304','',''),('51935','国际商务*','International Business','B0302','',''),('51936','世界经济*','World Economy','B0301','',''),('51937','国际技术贸易*','International Technical Trade','B0302','',''),('51938','国际投资与跨国公司*','Multinational Corporations and Foreign I','B0302','',''),('51939','对外贸易运输与保险*','Transportation and Insurance in Foreign ','B0302','',''),('51940','外汇理论与实务*','Foreign Exchange Theories and Practice','B0302','',''),('51941','国际市场营销*','International Marketing','B0202','',''),('51942','国际投资学*','International Investment','B0201','',''),('51943','跨国经营概论*','Introduction to Multinational Corporatio','B0201','',''),('51953','国际经济学*','International Economics','B0301','',''),('52503','财务管理B','Financial Management B','B01','',''),('52506','成本会计','Cost Accounting','B0204','',''),('52507','高级财务管理','Advanced Financial Management','B0204','',''),('52513','国际税收','International Taxation','B0204','',''),('52515','会计理论专题','Accounting Theories','B0204','',''),('52516','会计信息系统','Accounting information System','B0204','',''),('52518','会计学B','Accounting B','B01','',''),('52535','资产评估','Asset Evaluation','B0204','',''),('52543','计算机财务管理','Computerized Financial Management','B0204','',''),('52549','高级财务会计','Advanced Financial Accounting','B0204','',''),('52554','会计学原理(双语)','Principles of Accounting(Bilingual)','B0204','',''),('52555','财务分析','Financial Analysis','B0204','',''),('52556','审计学','Auditing','B0204','',''),('52557','金融企业会计','Financial Enterprises Accounting','B0204','',''),('52569','税法','Tax Law','B0204','',''),('52571','中级财务会计','Intermediate Financial Accounting','B0204','',''),('52572','管理会计(双语)','Managerial Accounting(Bilingual)','B0204','',''),('52573','公司战略与风险管理','Corporate Strategy and Risk Management','B0204','',''),('52574','内部控制','Internal Control','B0204','',''),('52701','税收筹划','Taxation Planning','B0204','',''),('52904','财务管理*','Financial Management','B0204','',''),('52905','会计前沿研究*','Accounting Frontier Research','B0204','',''),('53514','管理学B','Management B','B01','',''),('53515','管理学学科专题讲座','Special Lectures on Management Science','B04','',''),('53518','管理学原著阅读','Selective Readings of Classic Works on M','B01','',''),('53547','人力资源管理','Human Resource Management','B0203','',''),('53562','生产与运作管理B','Production and Operation Management B','B0201','',''),('53571','市场营销学C','Marketing C','B01','',''),('53624','战略管理','Strategic Mangement','B0201','',''),('53679','创业投资与融资管理','Entrepreneurial Financial and Investment','B0201','',''),('53812','创业管理','Entrepreneurial Management','B0201','',''),('53901','管理学*','Management','B02','',''),('54503','Web开发技术','Web Programming','B04','',''),('54505','XML标记语言及应用','XML (Extensible Markup Language) and App','B04','',''),('54519','供应链与物流管理','Supply Chain and Logisctics Management','B0201','',''),('54526','管理运筹学A','Management Operation A','B04','',''),('54530','计算机网络A','Computer Network A','B04','',''),('54537','客户关系管理系统','Customer Relationship Management System','B04','',''),('54539','企业资源计划系统','Enterprise Resource Planning System','B0401','',''),('54542','数据结构','Data Structure','B04','',''),('54555','信息系统分析、设计与实现A','Information System Analysis, Design and ','B0401','',''),('54582','IT项目管理','IT Project Management','B04','',''),('54603','管理科学学科导论','Introduction to Management Science','B04','',''),('54606','数据库原理与应用','Database Principles and Application','B04','',''),('54616','管理统计B','Management Statistics B','B01','',''),('54618','管理信息系统(双语)','Management Information System(Bilingual)','B04','',''),('54653','面向对象程序设计','Object-Oriented Programming','B04','',''),('54665','网络营销(双语)','Network Marketing(Bilingual)','B0202','',''),('54669','电子商务(双语)','Electronic Business(Bilingual)','B0402','',''),('54670','软件开发工具','Software Development Tools','B04','',''),('54671','商业智能与数据挖掘','Business Intelligence and Data Mining','B04','',''),('54674','网络创业管理','Network Entreprenerial Management','B0401','',''),('54676','信息技术应用前沿','IT Application Frontier','B04','',''),('54677','电子商务运营管理','E-Business Operation Management','B0402','',''),('54683','计算机操作系统B','Computer Operating System','B0401','',''),('54684','高级数据库管理','Advanced Database Management','B0401','',''),('54685','软件开发技术专题','Case Study on Software Development','B0401','',''),('54686','知识系统工程','Knowledge System Engineering','B04','',''),('54901','电子商务*','Electronic Commerce','B0402','',''),('54903','物流管理*','Management of Logistics','B0402','',''),('59528','金融学','Finance','B0304','',''),('63522','高等数学A1','Advanced Mathematics A1','A','',''),('63523','高等数学A2','Advanced Mathematics A2','A','',''),('63564','线性代数A','Linear Algebra A','A','',''),('67526','社会心理学','Social Psychology','A','',''),('74509','思想道德修养与法律基础','Ideological and Ethical Cultivation and ','A','',''),('74510','中国近现代史纲要','The Outline of Modern Chinese History','A','',''),('74514','毛泽东思想和中国特色社会主义理论体系概论1','Introduction to Mao Zedong Thought and t','A','',''),('74515','毛泽东思想和中国特色社会主义理论体系概论2','Introduction to Mao Zedong Thought and t','A','',''),('74516','马克思主义基本原理概论','Introduction to the Basic Principles of ','A','','');

/*Table structure for table `courses_categories` */

DROP TABLE IF EXISTS `courses_categories`;

CREATE TABLE `courses_categories` (
  `c_category_id` char(10) CHARACTER SET utf8 NOT NULL,
  `c_category_name` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `parent_id` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `is_parent_node` int(11) DEFAULT NULL,
  `LEVEL` int(11) DEFAULT NULL,
  PRIMARY KEY (`c_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `courses_categories` */

insert  into `courses_categories`(`c_category_id`,`c_category_name`,`parent_id`,`is_parent_node`,`LEVEL`) values ('A','通识教育类','',1,1),('B','经济管理类','',1,1),('B01','经济管理基础类','B',0,2),('B02','工商管理大类','B',1,2),('B0201','工商管理类','B02',0,3),('B0202','市场营销类','B02',0,3),('B0203','人力资源管理类','B02',0,3),('B0204','会计学类','B02',0,3),('B03','经济学大类','B',1,2),('B0301','经济学类','B03',0,3),('B0302','国际贸易类','B03',0,3),('B0303','经济统计类','B03',0,3),('B0304','金融学类','B03',0,3),('B04','管理科学与工程大类','B',1,2),('B0401','信息管理与信息系统类','B04',0,3),('B0402','电子商务类','B04',0,3);

/*Table structure for table `major` */

DROP TABLE IF EXISTS `major`;

CREATE TABLE `major` (
  `major_id` char(10) CHARACTER SET utf8 NOT NULL,
  `major_name` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `academy_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_parent_node` int(11) DEFAULT NULL,
  `LEVEL` int(11) DEFAULT NULL,
  PRIMARY KEY (`major_id`),
  KEY `FK_major` (`academy_id`),
  CONSTRAINT `FK_major` FOREIGN KEY (`academy_id`) REFERENCES `academy` (`academy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `major` */

insert  into `major`(`major_id`,`major_name`,`academy_id`,`parent_id`,`is_parent_node`,`LEVEL`) values ('A','工商管理系',8,0,1,1),('A1','工商管理专业',8,0,0,2),('A2','市场营销专业',8,0,0,2),('A3','人力资源管理专业',8,0,0,2),('B','经济系',8,0,1,1),('B1','经济学专业',8,0,0,2),('B2','统计学专业',8,0,0,2),('C','国际贸易系',8,0,1,1),('C1','国际贸易专业',8,0,0,2),('C2','金融学专业',8,0,0,2),('D','管理科学与工程系',8,0,1,1),('D1','信息管理与信息系统专业',8,0,0,2),('D2','电子商务专业',8,0,0,2),('E','会计系',8,0,1,1),('E1','会计学专业',8,0,0,2),('F','学院办公室',8,0,0,1),('G','学生工作办公室',8,0,0,1),('H','经济管理实验教学中心',8,0,0,1),('K','MBA中心',8,0,0,1);

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `menu_id` char(10) CHARACTER SET utf8 NOT NULL,
  `menu_title` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(40) DEFAULT NULL,
  `is_parent_node` int(11) DEFAULT NULL,
  `parent_id` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `LEVEL` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menu` */

insert  into `menu`(`menu_id`,`menu_title`,`url`,`is_parent_node`,`parent_id`,`LEVEL`) values ('01','系统管理','',1,'',1),('0101','基础设置','',0,'01',2),('0102','用户管理','',0,'01',2),('0103','权限管理','',0,'01',2),('02','资源管理','',1,'',1),('0201','知识库统计分析','',0,'02',2),('0202','知识库维护','',0,'02',2),('0203','知识库标签管理','',0,'02',2),('0204','问题管理','',0,'02',2),('03','我要学习','',1,'',1),('0301','学习任务','',0,'03',2),('0302','我的问题','',0,'03',2),('0303','我的收藏','',0,'03',2),('0304','我的笔记','',0,'03',2),('0305','任务发布','',0,'03',2),('04','我要搜索','',0,'',1),('05','我要分享','',1,'',1),('0501','上传文件','',0,'05',2),('0502','发表文章','',0,'05',2),('0503','创建知识包','',0,'05',2),('0504','知识维护','',0,'05',2),('0505','知识审核','',0,'05',2),('06','我要提问','',0,'',1);

/*Table structure for table `privilege` */

DROP TABLE IF EXISTS `privilege`;

CREATE TABLE `privilege` (
  `privi_id` int(11) NOT NULL AUTO_INCREMENT,
  `privi_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`privi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `privilege` */

insert  into `privilege`(`privi_id`,`privi_name`) values (1,'allow'),(2,'deny'),(3,'not set');

/*Table structure for table `privilege_setting` */

DROP TABLE IF EXISTS `privilege_setting`;

CREATE TABLE `privilege_setting` (
  `acc_category_id` int(11) NOT NULL DEFAULT '0',
  `menu_id` char(10) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `privi_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`acc_category_id`,`menu_id`,`privi_id`),
  KEY `FK_privilege_setting_2` (`menu_id`),
  KEY `FK_privilege_setting_3` (`privi_id`),
  CONSTRAINT `FK_privilege_setting_3` FOREIGN KEY (`privi_id`) REFERENCES `privilege` (`privi_id`),
  CONSTRAINT `FK_privilege_setting_1` FOREIGN KEY (`acc_category_id`) REFERENCES `account_categories` (`acc_category_id`),
  CONSTRAINT `FK_privilege_setting_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `privilege_setting` */

insert  into `privilege_setting`(`acc_category_id`,`menu_id`,`privi_id`) values (1,'01',1),(1,'0101',1),(1,'0102',1),(1,'0103',1),(1,'02',1),(1,'0201',1),(1,'0202',1),(1,'0203',1),(1,'0204',1),(1,'03',1),(1,'0301',1),(1,'0302',1),(1,'0303',1),(1,'0304',1),(1,'0305',1),(1,'04',1),(1,'05',1),(1,'0501',1),(1,'0502',1),(1,'0503',1),(1,'0504',1),(1,'0505',1),(1,'06',1),(2,'03',1),(2,'0301',1),(2,'0302',1),(2,'0303',1),(2,'0304',1),(2,'0305',1),(2,'04',1),(2,'05',1),(2,'0501',1),(2,'0502',1),(2,'0503',1),(2,'0504',1),(2,'06',1),(3,'0301',1),(3,'0302',1),(3,'0303',1),(3,'0304',1),(3,'04',1),(3,'05',1),(3,'0502',1),(3,'06',1),(2,'01',2),(2,'0101',2),(2,'0102',2),(2,'0103',2),(2,'02',2),(2,'0201',2),(2,'0202',2),(2,'0203',2),(2,'0204',2),(2,'0505',2),(3,'01',2),(3,'0101',2),(3,'0102',2),(3,'0103',2),(3,'02',2),(3,'0201',2),(3,'0202',2),(3,'0203',2),(3,'0204',2),(3,'03',2),(3,'0305',2),(3,'0501',2),(3,'0503',2),(3,'0504',2),(3,'0505',2);

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `FK_question_1` (`userid`),
  KEY `FK_question_2` (`status_id`),
  CONSTRAINT `FK_question_2` FOREIGN KEY (`status_id`) REFERENCES `question_status` (`status_id`),
  CONSTRAINT `FK_question_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `question` */

/*Table structure for table `question_reply` */

DROP TABLE IF EXISTS `question_reply`;

CREATE TABLE `question_reply` (
  `question_id` int(11) NOT NULL DEFAULT '0',
  `reply_id` int(11) NOT NULL DEFAULT '0',
  `reply_content` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `reply_date` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `is_accept` int(11) DEFAULT NULL,
  PRIMARY KEY (`question_id`,`reply_id`),
  KEY `FK_question_reply_2` (`userid`),
  CONSTRAINT `FK_question_reply_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `FK_question_reply_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `question_reply` */

/*Table structure for table `question_status` */

DROP TABLE IF EXISTS `question_status`;

CREATE TABLE `question_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_des` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `question_status` */

insert  into `question_status`(`status_id`,`status_des`) values (1,'待解决'),(2,'已解决'),(3,'关闭'),(4,'过期');

/*Table structure for table `release_task` */

DROP TABLE IF EXISTS `release_task`;

CREATE TABLE `release_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_title` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `task_content` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `class_id` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `release_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `FK_release_task_1` (`userid`),
  KEY `FK_release_task_2` (`class_id`),
  CONSTRAINT `FK_release_task_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `FK_release_task_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `release_task` */

/*Table structure for table `resource_categories` */

DROP TABLE IF EXISTS `resource_categories`;

CREATE TABLE `resource_categories` (
  `resource_category_id` char(10) CHARACTER SET utf8 NOT NULL,
  `resource_category_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `parent_id` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `is_parent_node` int(11) DEFAULT NULL,
  `LEVEL` int(11) DEFAULT NULL,
  PRIMARY KEY (`resource_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `resource_categories` */

insert  into `resource_categories`(`resource_category_id`,`resource_category_name`,`parent_id`,`is_parent_node`,`LEVEL`) values ('A','电子课件','',1,1),('A1','电子课件ppt','A',0,2),('A2','电子教案','A',0,2),('A3','电子讲义','A',0,2),('B','电子视频','',0,1),('C','电子图书','',0,1),('D','教学文件','',1,1),('D1','教学大纲','D',0,2),('D2','考试大纲','D',0,2),('D3','课程简介','D',0,2),('E','实验教学','',1,1),('E1','实验报告格式规范','E',0,2),('E2','实验指导书','E',0,2),('E3','实验报告范例','E',0,2),('F','信息系统实例','',1,1),('F1','开源系统实例','F',0,2),('F2','信息系统演示版','F',0,2),('G','案例库','',0,1),('H','学科竞赛作品','',1,1),('H1','挑战杯竞赛作品','H',0,2),('H2','电子商务竞赛作品','H',0,2),('H3','会计信息化竞赛作品','H',0,2),('H4','ERP沙盘作品','H',0,2),('X','其它资源','',0,1);

/*Table structure for table `resource_evaluate` */

DROP TABLE IF EXISTS `resource_evaluate`;

CREATE TABLE `resource_evaluate` (
  `resource_id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `evaluate_content` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `evaluate_time` datetime DEFAULT NULL,
  KEY `FK_resource_evaluate` (`userid`),
  CONSTRAINT `FK_resource_evaluate` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `resource_evaluate` */

/*Table structure for table `resource_heat` */

DROP TABLE IF EXISTS `resource_heat`;

CREATE TABLE `resource_heat` (
  `resource_id` int(11) NOT NULL,
  `click_num` int(11) DEFAULT NULL,
  `study_num` int(11) DEFAULT NULL,
  `collection_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`resource_id`),
  CONSTRAINT `FK_resource_heat` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `resource_heat` */

/*Table structure for table `resource_items` */

DROP TABLE IF EXISTS `resource_items`;

CREATE TABLE `resource_items` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `key_words` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `course_id` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `uploaddate` datetime DEFAULT NULL,
  `translate_path` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `FK_resource_items_1` (`course_id`,`chapter_id`),
  KEY `FK_resource_items_2` (`userid`),
  CONSTRAINT `FK_resource_items_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `FK_resource_items_1` FOREIGN KEY (`course_id`, `chapter_id`) REFERENCES `course_items` (`course_id`, `chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `resource_items` */

/*Table structure for table `resources` */

DROP TABLE IF EXISTS `resources`;

CREATE TABLE `resources` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_category_id` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `audit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `FK_resources_1` (`resource_category_id`),
  KEY `FK_resources_2` (`audit_id`),
  CONSTRAINT `FK_resources_2` FOREIGN KEY (`audit_id`) REFERENCES `audit` (`audit_id`),
  CONSTRAINT `FK_resources_1` FOREIGN KEY (`resource_category_id`) REFERENCES `resource_categories` (`resource_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `resources` */

/*Table structure for table `student_items` */

DROP TABLE IF EXISTS `student_items`;

CREATE TABLE `student_items` (
  `userid` int(11) NOT NULL,
  `NAME` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `academy_id` int(11) DEFAULT NULL,
  `major_id` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `class_id` char(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `FK_student_items_2` (`academy_id`),
  KEY `FK_student_items_3` (`major_id`),
  KEY `FK_student_items_4` (`class_id`),
  CONSTRAINT `FK_student_items_4` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `FK_student_items_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `FK_student_items_2` FOREIGN KEY (`academy_id`) REFERENCES `academy` (`academy_id`),
  CONSTRAINT `FK_student_items_3` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `student_items` */

/*Table structure for table `study_collection` */

DROP TABLE IF EXISTS `study_collection`;

CREATE TABLE `study_collection` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `resource_id` int(11) NOT NULL DEFAULT '0',
  `collect_time` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`,`resource_id`),
  KEY `FK_study_collection_2` (`resource_id`),
  CONSTRAINT `FK_study_collection_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`),
  CONSTRAINT `FK_study_collection_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_collection` */

/*Table structure for table `study_history` */

DROP TABLE IF EXISTS `study_history`;

CREATE TABLE `study_history` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `resource_id` int(11) NOT NULL DEFAULT '0',
  `last_study_time` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`,`resource_id`),
  KEY `FK_study_history_2` (`resource_id`),
  CONSTRAINT `FK_study_history_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`),
  CONSTRAINT `FK_study_history_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_history` */

/*Table structure for table `study_note` */

DROP TABLE IF EXISTS `study_note`;

CREATE TABLE `study_note` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `note_title` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `note_content` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `FK_study_note` (`userid`),
  CONSTRAINT `FK_study_note` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_note` */

/*Table structure for table `study_task` */

DROP TABLE IF EXISTS `study_task`;

CREATE TABLE `study_task` (
  `task_id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `upload_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `FK_study_note_2` (`userid`),
  CONSTRAINT `FK_study_note_1` FOREIGN KEY (`task_id`) REFERENCES `release_task` (`task_id`),
  CONSTRAINT `FK_study_note_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_task` */

/*Table structure for table `teacher_items` */

DROP TABLE IF EXISTS `teacher_items`;

CREATE TABLE `teacher_items` (
  `userid` int(11) NOT NULL,
  `NAME` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `academy_id` int(11) DEFAULT NULL,
  `major_id` char(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `FK_teacher_items_2` (`academy_id`),
  KEY `FK_teacher_items_3` (`major_id`),
  CONSTRAINT `FK_teacher_items_3` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`),
  CONSTRAINT `FK_teacher_items_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `FK_teacher_items_2` FOREIGN KEY (`academy_id`) REFERENCES `academy` (`academy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `teacher_items` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(40) DEFAULT NULL,
  `PASSWORD` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `nonce` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `acc_category_id` int(11) DEFAULT NULL,
  `STATUS` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `FK_users` (`acc_category_id`),
  CONSTRAINT `FK_users` FOREIGN KEY (`acc_category_id`) REFERENCES `account_categories` (`acc_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
