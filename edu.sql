CREATE DATABASE edu_resources USE edu_resources --DROP DATABASE edu_resources
/*****************uers*****************************/
CREATE TABLE users(
userid INT PRIMARY KEY AUTO_INCREMENT,
account VARCHAR(40),
PASSWORD NVARCHAR(60),
nonce NVARCHAR(60),
acc_category_id INT,
STATUS NVARCHAR(20)
)
/*****************account_categories********************************/
CREATE TABLE account_categories(
acc_category_id INT PRIMARY KEY AUTO_INCREMENT,
acc_categoty_name NVARCHAR(40)
) 
INSERT INTO account_categories(acc_categoty_name)VALUES('管理员')
INSERT INTO account_categories(acc_categoty_name) VALUES('教师')
INSERT INTO account_categories(acc_categoty_name) VALUES('学生')
/*********************academy***********************************/
CREATE TABLE academy(
academy_id INT PRIMARY KEY AUTO_INCREMENT,
academy_name NVARCHAR(40),
english_name VARCHAR(100)
)
INSERT INTO academy(academy_name,english_name) VALUES('理学院','School of Sciences')
INSERT INTO academy(academy_name,english_name) VALUES('材料与纺织学院','School of Materials and Textiles')
INSERT INTO academy(academy_name,english_name) VALUES('服装学院','Fashion School & Engineering')
INSERT INTO academy(academy_name,english_name) VALUES('信息学院','School of Informatics and Electronics')
INSERT INTO academy(academy_name,english_name) VALUES('机械与自动控制学院','School of Mechanical Engineering and Automation')
INSERT INTO academy(academy_name,english_name) VALUES('建筑工程学院','School of Civil Engineering and Architecture')
INSERT INTO academy(academy_name,english_name) VALUES('生命科学学院','School of Life Science')
INSERT INTO academy(academy_name,english_name) VALUES('经济管理学院','School of Economics and Management')
INSERT INTO academy(academy_name,english_name) VALUES('艺术与设计学院','School of Art and Design')
INSERT INTO academy(academy_name,english_name) VALUES('法政学院','Law School')
INSERT INTO academy(academy_name,english_name) VALUES('外国语学院','School of Foreign Languages')
INSERT INTO academy(academy_name,english_name) VALUES('文化传播学院','School of Culture and Communication')
INSERT INTO academy(academy_name,english_name) VALUES('艺术与设计学院','School of Art and Design')
INSERT INTO academy(academy_name,english_name) VALUES('马克思主义学院','College of Marxism')
INSERT INTO academy(academy_name,english_name) VALUES('启新学院','Qixin School')
INSERT INTO academy(academy_name,english_name) VALUES('继续教育学院','College of Continuing Education')
INSERT INTO academy(academy_name,english_name) VALUES('科技与艺术学院','Higher Vocational College')
/*********************major*********************************/
CREATE TABLE major(
major_id NCHAR(10) PRIMARY KEY,
major_name NVARCHAR(40),
academy_id INT,
parent_id NCHAR(10),
is_parent_node INT,
LEVEL INT
)
INSERT INTO major VALUES('A','工商管理系','8','',1,1)
INSERT INTO major VALUES('B','经济系','8','',1,1)
INSERT INTO major VALUES('C','国际贸易系','8','',1,1)
INSERT INTO major VALUES('D','管理科学与工程系','8','',1,1)
INSERT INTO major VALUES('E','会计系','8','',1,1)
INSERT INTO major VALUES('F','学院办公室','8','',0,1)
INSERT INTO major VALUES('G','学生工作办公室','8','',0,1)
INSERT INTO major VALUES('H','经济管理实验教学中心','8','',0,1)
INSERT INTO major VALUES('K','MBA中心','8','',0,1)
INSERT INTO major VALUES('A1','工商管理专业','8','A',0,2)
INSERT INTO major VALUES('A2','市场营销专业','8','A',0,2)
INSERT INTO major VALUES('A3','人力资源管理专业','8','A',0,2)
INSERT INTO major VALUES('B1','经济学专业','8','B',0,2)
INSERT INTO major VALUES('B2','统计学专业','8','B',0,2)
INSERT INTO major VALUES('C1','国际贸易专业','8','C',0,2)
INSERT INTO major VALUES('C2','金融学专业','8','C',0,2)
INSERT INTO major VALUES('D1','信息管理与信息系统专业','8','D',0,2)
INSERT INTO major VALUES('D2','电子商务专业','8','D',0,2)
INSERT INTO major VALUES('E1','会计学专业','8','E',0,2)
/********************class*******************************/
CREATE TABLE class(
class_id NCHAR(10),
major_id NCHAR(10),
class_name NVARCHAR(40),
PRIMARY KEY(class_id,major_id)
)
INSERT INTO class VALUES('115401','D1','11信息管理与信息系统(1)班');
INSERT INTO class VALUES('115402','D1','11信息管理与信息系统(2)班');
INSERT INTO class VALUES('115701','D2','11电子商务(2)班');
INSERT INTO class VALUES('115702','D2','11电子商务(2)班');
/********************student_items************************************/
CREATE TABLE student_items(
userid INT PRIMARY KEY,
NAME NVARCHAR(40),
academy_id INT,
major_id NCHAR(10),
class_id NCHAR(10)
)
/*
insert into student_items values('张三','8','D1','5401')
INSERT INTO student_items VALUES('李四','8','D1','5401')
INSERT INTO student_items VALUES('王五','8','D1','5402')
INSERT INTO student_items VALUES('赵六','8','D2','5701')
*/
/*********************teacher_items***********************************/
CREATE TABLE teacher_items(
userid INT PRIMARY KEY,
NAME NVARCHAR(40),
academy_id INT,
major_id NCHAR(10)
)
/**********************courses********************************************/
CREATE TABLE courses(
course_id NCHAR(10) PRIMARY KEY,
course_name NVARCHAR(40),
english_name NVARCHAR(100),
c_category_id NCHAR(10),
description TEXT,
note TEXT
)
INSERT INTO courses VALUES ('02524','计算机基础概论','Introduction to Computer Basics','A','','');
INSERT INTO courses VALUES ('02530','C程序设计','C Programming','A','','');
INSERT INTO courses VALUES ('02537','VB数据库开发应用技术','the Development and Applications Technology of Database based on VB','A','','');
INSERT INTO courses VALUES ('04503','职业发展与就业指导','Career Development and Employment Guidance','A','','');
INSERT INTO courses VALUES ('04507','大学生心理健康教育','Students'' Mental Health Education','A','','');
INSERT INTO courses VALUES ('07501','形势与政策','Current Issues and Policies','A','','');
INSERT INTO courses VALUES ('08501','军事理论','Military Theory','A','','');
INSERT INTO courses VALUES ('26433','名著选读','Introduction to Classical Literary Works','A','','');
INSERT INTO courses VALUES ('47542','平面图形与动画制作','Plane Figure and Animation Creation','B0401','','');
INSERT INTO courses VALUES ('51536','宏观经济学B','Macro-economics B','B01','','');
INSERT INTO courses VALUES ('51550','经贸英语','Business English','B0302','','');
INSERT INTO courses VALUES ('51567','微观经济学B','Microeconomics B','B01','','');
INSERT INTO courses VALUES ('51640','经济法','Economic Law','B01','','');
INSERT INTO courses VALUES ('51904','经济法*','Economic Law','B0301','','');
INSERT INTO courses VALUES ('51906','国际金融*','International Finance','B0304','','');
INSERT INTO courses VALUES ('51907','中国对外贸易概论*','Introduction to Chinese Foreign Trade','B0302','','');
INSERT INTO courses VALUES ('51909','国际贸易体制*','International Trade System','B0302','','');
INSERT INTO courses VALUES ('51914','国际贸易地理*','Geography of International Trade','B0302','','');
INSERT INTO courses VALUES ('51916','国际服务贸易*','International Service Trade','B0302','','');
INSERT INTO courses VALUES ('51917','国际结算*','International Settlement','B0302','','');
INSERT INTO courses VALUES ('51926','外贸函电*','International Business Communication','B0302','','');
INSERT INTO courses VALUES ('51927','外贸洽谈*','International Business Negotiation','B0302','','');
INSERT INTO courses VALUES ('51928','国际商法*','International Business Law','B0302','','');
INSERT INTO courses VALUES ('51933','计量经济学*','Econometrics','B0301','','');
INSERT INTO courses VALUES ('51934','证券投资分析*','Investment in security','B0304','','');
INSERT INTO courses VALUES ('51935','国际商务*','International Business','B0302','','');
INSERT INTO courses VALUES ('51936','世界经济*','World Economy','B0301','','');
INSERT INTO courses VALUES ('51937','国际技术贸易*','International Technical Trade','B0302','','');
INSERT INTO courses VALUES ('51938','国际投资与跨国公司*','Multinational Corporations and Foreign Investment','B0302','','');
INSERT INTO courses VALUES ('51939','对外贸易运输与保险*','Transportation and Insurance in Foreign Trade','B0302','','');
INSERT INTO courses VALUES ('51940','外汇理论与实务*','Foreign Exchange Theories and Practice','B0302','','');
INSERT INTO courses VALUES ('51941','国际市场营销*','International Marketing','B0202','','');
INSERT INTO courses VALUES ('51942','国际投资学*','International Investment','B0201','','');
INSERT INTO courses VALUES ('51943','跨国经营概论*','Introduction to Multinational Corporations','B0201','','');
INSERT INTO courses VALUES ('51953','国际经济学*','International Economics','B0301','','');
INSERT INTO courses VALUES ('52503','财务管理B','Financial Management B','B01','','');
INSERT INTO courses VALUES ('52518','会计学B','Accounting B','B01','','');
INSERT INTO courses VALUES ('52904','财务管理*','Financial Management','B0204','','');
INSERT INTO courses VALUES ('53514','管理学B','Management B','B01','','');
INSERT INTO courses VALUES ('53571','市场营销学C','Marketing C','B01','','');
INSERT INTO courses VALUES ('53624','战略管理','Strategic Mangement','B0201','','');
INSERT INTO courses VALUES ('53901','管理学*','Management','B02','','');
INSERT INTO courses VALUES ('54503','Web开发技术','Web Programming','B04','','');
INSERT INTO courses VALUES ('54505','XML标记语言及应用','XML (Extensible Markup Language) and Applications','B04','','');
INSERT INTO courses VALUES ('54519','供应链与物流管理','Supply Chain and Logisctics Management','B0201','','');
INSERT INTO courses VALUES ('54526','管理运筹学A','Management Operation A','B04','','');
INSERT INTO courses VALUES ('54530','计算机网络A','Computer Network A','B04','','');
INSERT INTO courses VALUES ('54537','客户关系管理系统','Customer Relationship Management System','B04','','');
INSERT INTO courses VALUES ('54539','企业资源计划系统','Enterprise Resource Planning System','B0401','','');
INSERT INTO courses VALUES ('54542','数据结构','Data Structure','B04','','');
INSERT INTO courses VALUES ('54555','信息系统分析、设计与实现A','Information System Analysis, Design and Realization A','B0401','','');
INSERT INTO courses VALUES ('54582','IT项目管理','IT Project Management','B04','','');
INSERT INTO courses VALUES ('54603','管理科学学科导论','Introduction to Management Science','B04','','');
INSERT INTO courses VALUES ('54606','数据库原理与应用','Database Principles and Application','B04','','');
INSERT INTO courses VALUES ('54616','管理统计B','Management Statistics B','B01','','');
INSERT INTO courses VALUES ('54618','管理信息系统(双语)','Management Information System(Bilingual)','B04','','');
INSERT INTO courses VALUES ('54653','面向对象程序设计','Object-Oriented Programming','B04','','');
INSERT INTO courses VALUES ('54664','数量经济学','Quantitative Economics','B0302','','');
INSERT INTO courses VALUES ('54665','网络营销(双语)','Network Marketing(Bilingual)','B0202','','');
INSERT INTO courses VALUES ('54669','电子商务(双语)','Electronic Business(Bilingual)','B0402','','');
INSERT INTO courses VALUES ('54670','软件开发工具','Software Development Tools','B04','','');
INSERT INTO courses VALUES ('54671','商业智能与数据挖掘','Business Intelligence and Data Mining','B04','','');
INSERT INTO courses VALUES ('54674','网络创业管理','Network Entreprenerial Management','B0401','','');
INSERT INTO courses VALUES ('54676','信息技术应用前沿','IT Application Frontier','B04','','');
INSERT INTO courses VALUES ('54677','电子商务运营管理','E-Business Operation Management','B0402','','');
INSERT INTO courses VALUES ('54683','计算机操作系统B','Computer Operating System','B0401','','');
INSERT INTO courses VALUES ('54684','高级数据库管理','Advanced Database Management','B0401','','');
INSERT INTO courses VALUES ('54685','软件开发技术专题','Case Study on Software Development','B0401','','');
INSERT INTO courses VALUES ('54686','知识系统工程','Knowledge System Engineering','B04','','');
INSERT INTO courses VALUES ('54901','电子商务*','Electronic Commerce','B0402','','');
INSERT INTO courses VALUES ('54903','物流管理*','Management of Logistics','B0402','','');
INSERT INTO courses VALUES ('63519','概率论与数理统计A','Probability Theory and Mathematical Statistics A','A','','');
INSERT INTO courses VALUES ('63522','高等数学A1','Advanced Mathematics A1','A','','');
INSERT INTO courses VALUES ('63523','高等数学A2','Advanced Mathematics A2','A','','');
INSERT INTO courses VALUES ('63564','线性代数A','Linear Algebra A','A','','');
INSERT INTO courses VALUES ('67526','社会心理学','Social Psychology','A','','');
INSERT INTO courses VALUES ('73508','英语2','College English 2','A','','');
INSERT INTO courses VALUES ('73509','英语3','College English 3','A','','');
INSERT INTO courses VALUES ('73510','英语4','College English 4','A','','');
INSERT INTO courses VALUES ('73553','英语5','College English 5','A','','');
INSERT INTO courses VALUES ('74509','思想道德修养与法律基础','Ideological and Ethical Cultivation and Foundations of Law','A','','');
INSERT INTO courses VALUES ('74510','中国近现代史纲要','The Outline of Modern Chinese History','A','','');
INSERT INTO courses VALUES ('74516','马克思主义基本原理概论','Introduction to the Basic Principles of Marxism','A','','');
INSERT INTO courses VALUES ('51501','财政学','Public Finance','B0304','','');
INSERT INTO courses VALUES ('51523','国际贸易理论与实务B','International Trade Theories and Practice B','B0302','','');
INSERT INTO courses VALUES ('51537','货币银行学','Monetary Banking','B0304','','');
INSERT INTO courses VALUES ('51599','资本运营','Capital Operation','B0204','','');
INSERT INTO courses VALUES ('52506','成本会计','Cost Accounting','B0204','','');
INSERT INTO courses VALUES ('52507','高级财务管理','Advanced Financial Management','B0204','','');
INSERT INTO courses VALUES ('52513','国际税收','International Taxation','B0204','','');
INSERT INTO courses VALUES ('52515','会计理论专题','Accounting Theories','B0204','','');
INSERT INTO courses VALUES ('52516','会计信息系统','Accounting information System','B0204','','');
INSERT INTO courses VALUES ('52535','资产评估','Asset Evaluation','B0204','','');
INSERT INTO courses VALUES ('52543','计算机财务管理','Computerized Financial Management','B0204','','');
INSERT INTO courses VALUES ('52549','高级财务会计','Advanced Financial Accounting','B0204','','');
INSERT INTO courses VALUES ('52554','会计学原理(双语)','Principles of Accounting(Bilingual)','B0204','','');
INSERT INTO courses VALUES ('52555','财务分析','Financial Analysis','B0204','','');
INSERT INTO courses VALUES ('52556','审计学','Auditing','B0204','','');
INSERT INTO courses VALUES ('52557','金融企业会计','Financial Enterprises Accounting','B0204','','');
INSERT INTO courses VALUES ('52569','税法','Tax Law','B0204','','');
INSERT INTO courses VALUES ('52571','中级财务会计','Intermediate Financial Accounting','B0204','','');
INSERT INTO courses VALUES ('52572','管理会计(双语)','Managerial Accounting(Bilingual)','B0204','','');
INSERT INTO courses VALUES ('52573','公司战略与风险管理','Corporate Strategy and Risk Management','B0204','','');
INSERT INTO courses VALUES ('52574','内部控制','Internal Control','B0204','','');
INSERT INTO courses VALUES ('52701','税收筹划','Taxation Planning','B0204','','');
INSERT INTO courses VALUES ('52905','会计前沿研究*','Accounting Frontier Research','B0204','','');
INSERT INTO courses VALUES ('53515','管理学学科专题讲座','Special Lectures on Management Science','B04','','');
INSERT INTO courses VALUES ('53518','管理学原著阅读','Selective Readings of Classic Works on Management Science','B01','','');
INSERT INTO courses VALUES ('53547','人力资源管理','Human Resource Management','B0203','','');
INSERT INTO courses VALUES ('53562','生产与运作管理B','Production and Operation Management B','B0201','','');
INSERT INTO courses VALUES ('53679','创业投资与融资管理','Entrepreneurial Financial and Investment Management','B0201','','');
INSERT INTO courses VALUES ('53812','创业管理','Entrepreneurial Management','B0201','','');
INSERT INTO courses VALUES ('59528','金融学','Finance','B0304','','');
GO
/*********************courses_categories**************************************/
CREATE TABLE courses_categories(
c_category_id NCHAR(10) PRIMARY KEY ,
c_category_name NVARCHAR(40),
parent_id NCHAR(10),
is_parent_node INT,
LEVEL INT
)
INSERT INTO courses_categories VALUES('A','通识教育类','',1,1);
INSERT INTO courses_categories VALUES('B','经济管理类','',1,1);
INSERT INTO courses_categories VALUES('B01','经济管理基础类','B',0,2);
INSERT INTO courses_categories VALUES('B02','工商管理大类','B',1,2);
INSERT INTO courses_categories VALUES('B0201','工商管理类','B02',0,3);
INSERT INTO courses_categories VALUES('B0202','市场营销类','B02',0,3);
INSERT INTO courses_categories VALUES('B0203','人力资源管理类','B02',0,3);
INSERT INTO courses_categories VALUES('B0204','会计学类','B02',0,3);
INSERT INTO courses_categories VALUES('B03','经济学大类','B',1,2);
INSERT INTO courses_categories VALUES('B0301','经济学类','B03',0,3);
INSERT INTO courses_categories VALUES('B0302','国际贸易类','B03',0,3);
INSERT INTO courses_categories VALUES('B0303','经济统计类','B03',0,3);
INSERT INTO courses_categories VALUES('B0304','金融学类','B03',0,3);
INSERT INTO courses_categories VALUES('B04','管理科学与工程大类','B',1,2);
INSERT INTO courses_categories VALUES('B0401','信息管理与信息系统类','B04',0,3);
INSERT INTO courses_categories VALUES('B0402','电子商务类','B04',0,3);
/**********************course_items******************************************/
CREATE TABLE course_items(
course_id NCHAR(10),
chapter_id INT,
chapter_name NVARCHAR(60),
is_parent_node INT,
parent_id INT,
LEVEL INT,    
PRIMARY KEY(course_id,chapter_id)
)
/***********************audit**************************************************/
CREATE TABLE audit(
audit_id INT PRIMARY KEY AUTO_INCREMENT,
audit_des NVARCHAR(20)
)
INSERT INTO audit(audit_des) VALUES('待审核');
INSERT INTO audit(audit_des) VALUES('审核通过');
INSERT INTO audit(audit_des) VALUES('审核未通过');
INSERT INTO audit(audit_des) VALUES('文件转换中');
INSERT INTO audit(audit_des) VALUES('转换失败');
/**********************resource_categories***********************************/
CREATE TABLE resource_categories(
resource_category_id NCHAR(10) PRIMARY KEY,
resource_category_name NVARCHAR(20),
parent_id  NCHAR(10),        
is_parent_node INT,         
LEVEL INT          
)
/*
INSERT INTO resource_categories VALUES('pdf')
INSERT INTO resource_categories VALUES('word')
INSERT INTO resource_categories VALUES('ppt')
INSERT INTO resource_categories VALUES('article')
INSERT INTO resource_categories VALUES('zip')
*/
INSERT INTO resource_categories VALUES('A','电子课件','',1,1);
INSERT INTO resource_categories VALUES('A1','电子课件ppt','A',0,2);
INSERT INTO resource_categories VALUES('A2','电子教案','A',0,2);
INSERT INTO resource_categories VALUES('A3','电子讲义','A',0,2);
INSERT INTO resource_categories VALUES('B','电子视频','',0,1);
INSERT INTO resource_categories VALUES('C','电子图书','',0,1);
INSERT INTO resource_categories VALUES('D','教学文件','',1,1);
INSERT INTO resource_categories VALUES('D1','教学大纲','D',0,2);
INSERT INTO resource_categories VALUES('D2','考试大纲','D',0,2);
INSERT INTO resource_categories VALUES('D3','课程简介','D',0,2);
INSERT INTO resource_categories VALUES('E','实验教学','',1,1);
INSERT INTO resource_categories VALUES('E1','实验报告格式规范','E',0,2);
INSERT INTO resource_categories VALUES('E2','实验指导书','E',0,2);
INSERT INTO resource_categories VALUES('E3','实验报告范例','E',0,2);
INSERT INTO resource_categories VALUES('F','信息系统实例','',1,1);
INSERT INTO resource_categories VALUES('F1','开源系统实例','F',0,2);
INSERT INTO resource_categories VALUES('F2','信息系统演示版','F',0,2);
INSERT INTO resource_categories VALUES('G','案例库','',0,1);
INSERT INTO resource_categories VALUES('H','学科竞赛作品','',1,1);
INSERT INTO resource_categories VALUES('H1','挑战杯竞赛作品','H',0,2);
INSERT INTO resource_categories VALUES('H2','电子商务竞赛作品','H',0,2);
INSERT INTO resource_categories VALUES('H3','会计信息化竞赛作品','H',0,2);
INSERT INTO resource_categories VALUES('H4','ERP沙盘作品','H',0,2);
INSERT INTO resource_categories VALUES('X','其它资源','',0,1);
/**********************resources*********************************************/
CREATE TABLE resources(
resource_id INT PRIMARY KEY AUTO_INCREMENT,
resource_category_id NCHAR(10),
path VARCHAR(100),
audit_id INT
)
/**********************resource_items****************************************/
CREATE TABLE resource_items(
resource_id INT PRIMARY KEY AUTO_INCREMENT,
resource_name NVARCHAR(40),
description NVARCHAR(255),
key_words NVARCHAR(100),
course_id NCHAR(10),
chapter_id INT,
userid INT,
uploaddate DATETIME,
translate_path NVARCHAR(100)
)
/***********************menu******************************************/
CREATE TABLE menu(
menu_id NCHAR(10) PRIMARY KEY,
menu_title NVARCHAR(40),
url VARCHAR(40),
is_parent_node INT,
parent_id NCHAR(10),
LEVEL INT
)
INSERT INTO menu VALUES('01','系统管理','','1','','1');
INSERT INTO menu VALUES('0101','基础设置','','0','01','2');
INSERT INTO menu VALUES('0102','用户管理','','0','01','2');
INSERT INTO menu VALUES('0103','权限管理','','0','01','2');
INSERT INTO menu VALUES('02','资源管理','','1','','1');
INSERT INTO menu VALUES('0201','知识库统计分析','','0','02','2');
INSERT INTO menu VALUES('0202','知识库维护','','0','02','2');
INSERT INTO menu VALUES('0203','知识库标签管理','','0','02','2');
INSERT INTO menu VALUES('0204','问题管理','','0','02','2');
INSERT INTO menu VALUES('03','我要学习','','1','','1');
INSERT INTO menu VALUES('0301','学习任务','','0','03','2');
INSERT INTO menu VALUES('0302','我的问题','','0','03','2');
INSERT INTO menu VALUES('0303','我的收藏','','0','03','2');
INSERT INTO menu VALUES('0304','我的笔记','','0','03','2');
INSERT INTO menu VALUES('0305','任务发布','','0','03','2');
INSERT INTO menu VALUES('04','我要搜索','','0','','1');
INSERT INTO menu VALUES('05','我要分享','','1','','1');
INSERT INTO menu VALUES('0501','上传文件','','0','05','2');
INSERT INTO menu VALUES('0502','发表文章','','0','05','2');
INSERT INTO menu VALUES('0503','创建知识包','','0','05','2');
INSERT INTO menu VALUES('0504','知识维护','','0','05','2');
INSERT INTO menu VALUES('0505','知识审核','','0','05','2');
INSERT INTO menu VALUES('06','我要提问','','0','','1');
/***********************privilege***************************************/
CREATE TABLE privilege(
privi_id INT PRIMARY KEY AUTO_INCREMENT,
privi_name VARCHAR(10)
)
INSERT INTO privilege(privi_name) VALUES('allow');
INSERT INTO privilege(privi_name) VALUES('deny');
INSERT INTO privilege(privi_name) VALUES('not set');
/***********************privilege_setting********************************/
CREATE TABLE privilege_setting(
acc_category_id INT,
menu_id NCHAR(10),
privi_id INT,
PRIMARY KEY(acc_category_id,menu_id,privi_id)
)
INSERT INTO privilege_setting VALUES('1','01','1');
INSERT INTO privilege_setting VALUES('1','0101','1');
INSERT INTO privilege_setting VALUES('1','0102','1');
INSERT INTO privilege_setting VALUES('1','0103','1');
INSERT INTO privilege_setting VALUES('1','02','1');
INSERT INTO privilege_setting VALUES('1','0201','1');
INSERT INTO privilege_setting VALUES('1','0202','1');
INSERT INTO privilege_setting VALUES('1','0203','1');
INSERT INTO privilege_setting VALUES('1','0204','1');
INSERT INTO privilege_setting VALUES('1','03','1');
INSERT INTO privilege_setting VALUES('1','0301','1');
INSERT INTO privilege_setting VALUES('1','0302','1');
INSERT INTO privilege_setting VALUES('1','0303','1');
INSERT INTO privilege_setting VALUES('1','0304','1');
INSERT INTO privilege_setting VALUES('1','0305','1');
INSERT INTO privilege_setting VALUES('1','04','1');
INSERT INTO privilege_setting VALUES('1','05','1');
INSERT INTO privilege_setting VALUES('1','0501','1');
INSERT INTO privilege_setting VALUES('1','0502','1');
INSERT INTO privilege_setting VALUES('1','0503','1');
INSERT INTO privilege_setting VALUES('1','0504','1');
INSERT INTO privilege_setting VALUES('1','0505','1');
INSERT INTO privilege_setting VALUES('1','06','1');
INSERT INTO privilege_setting VALUES('2','01','2');
INSERT INTO privilege_setting VALUES('2','0101','2');
INSERT INTO privilege_setting VALUES('2','0102','2');
INSERT INTO privilege_setting VALUES('2','0103','2');
INSERT INTO privilege_setting VALUES('2','02','2');
INSERT INTO privilege_setting VALUES('2','0201','2');
INSERT INTO privilege_setting VALUES('2','0202','2');
INSERT INTO privilege_setting VALUES('2','0203','2');
INSERT INTO privilege_setting VALUES('2','0204','2');
INSERT INTO privilege_setting VALUES('2','03','1');
INSERT INTO privilege_setting VALUES('2','0301','1');
INSERT INTO privilege_setting VALUES('2','0302','1');
INSERT INTO privilege_setting VALUES('2','0303','1');
INSERT INTO privilege_setting VALUES('2','0304','1');
INSERT INTO privilege_setting VALUES('2','0305','1');
INSERT INTO privilege_setting VALUES('2','04','1');
INSERT INTO privilege_setting VALUES('2','05','1');
INSERT INTO privilege_setting VALUES('2','0501','1');
INSERT INTO privilege_setting VALUES('2','0502','1');
INSERT INTO privilege_setting VALUES('2','0503','1');
INSERT INTO privilege_setting VALUES('2','0504','1');
INSERT INTO privilege_setting VALUES('2','0505','2');
INSERT INTO privilege_setting VALUES('2','06','1');
INSERT INTO privilege_setting VALUES('3','01','2');
INSERT INTO privilege_setting VALUES('3','0101','2');
INSERT INTO privilege_setting VALUES('3','0102','2');
INSERT INTO privilege_setting VALUES('3','0103','2');
INSERT INTO privilege_setting VALUES('3','02','2');
INSERT INTO privilege_setting VALUES('3','0201','2');
INSERT INTO privilege_setting VALUES('3','0202','2');
INSERT INTO privilege_setting VALUES('3','0203','2');
INSERT INTO privilege_setting VALUES('3','0204','2');
INSERT INTO privilege_setting VALUES('3','03','1');
INSERT INTO privilege_setting VALUES('3','0301','1');
INSERT INTO privilege_setting VALUES('3','0302','1');
INSERT INTO privilege_setting VALUES('3','0303','1');
INSERT INTO privilege_setting VALUES('3','0304','1');
INSERT INTO privilege_setting VALUES('3','0305','2');
INSERT INTO privilege_setting VALUES('3','04','1');
INSERT INTO privilege_setting VALUES('3','05','1');
INSERT INTO privilege_setting VALUES('3','0501','2');
INSERT INTO privilege_setting VALUES('3','0502','1');
INSERT INTO privilege_setting VALUES('3','0503','2');
INSERT INTO privilege_setting VALUES('3','0504','2');
INSERT INTO privilege_setting VALUES('3','0505','2');
INSERT INTO privilege_setting VALUES('3','06','1');
/*********************question_status*********************************/
CREATE TABLE question_status(
status_id INT PRIMARY KEY AUTO_INCREMENT,
status_des NVARCHAR(20)
)
INSERT INTO question_status(status_des) VALUES('待解决');
INSERT INTO question_status(status_des) VALUES('已解决');
INSERT INTO question_status(status_des) VALUES('关闭');
INSERT INTO question_status(status_des) VALUES('过期');
/*********************question****************************************/
CREATE TABLE question(
question_id INT PRIMARY KEY AUTO_INCREMENT,
title NVARCHAR(60),
content NVARCHAR(255),
userid INT,
create_date DATETIME,
status_id INT
)
/*********************question_reply**********************************/
CREATE TABLE question_reply(
question_id INT,
reply_id INT,
reply_content NVARCHAR(255),
reply_date DATETIME,
userid INT,
is_accept INT,
PRIMARY KEY(question_id,reply_id)
)
/**********************study_history***********************************/
CREATE TABLE study_history(
userid INT,
resource_id INT,
last_study_time DATETIME,
PRIMARY KEY(userid,resource_id)
)
/**********************study_collection***********************************/
CREATE TABLE study_collection(
userid INT,
resource_id INT,
collect_time DATETIME,
PRIMARY KEY(userid,resource_id)
)
/**********************study_note******************************************/
CREATE TABLE study_note(
note_id INT PRIMARY KEY AUTO_INCREMENT,
userid INT,
note_title NVARCHAR(40),
note_content NVARCHAR(255),
create_date DATETIME   
)
/*********************study_task***************************************/
CREATE TABLE study_task(
task_id INT PRIMARY KEY,
userid INT,
upload_path VARCHAR(100)
)
/**********************release_task*****************************************/
CREATE TABLE release_task( 
task_id INT PRIMARY KEY AUTO_INCREMENT,
task_title NVARCHAR(40),
task_content NVARCHAR(255),
major_id NCHAR(10),
class_id NCHAR(10),
userid INT,
release_time DATETIME,
end_time DATETIME
)
/********************resource_heat*****************************************/
CREATE TABLE resource_heat(
resource_id INT PRIMARY KEY,
click_num INT,
study_num INT,
collection_num INT
)
/********************resource_evaluate*********************************/
CREATE TABLE resource_evaluate(
resource_id INT,
userid INT,
evaluate_content NVARCHAR(100),
score INT,
evaluate_time DATETIME
)
/**************foreign_key**************************/
ALTER TABLE users ADD
CONSTRAINT FK_users FOREIGN KEY(acc_category_id) REFERENCES account_categories(acc_category_id)
go
ALTER TABLE student_items ADD
CONSTRAINT FK_student_items_1 FOREIGN KEY(userid) REFERENCES users(userid);
ALTER TABLE student_items ADD
CONSTRAINT FK_student_items_2 FOREIGN KEY(academy_id) REFERENCES academy(academy_id);
ALTER TABLE student_items ADD
CONSTRAINT FK_student_items_3 FOREIGN KEY(class_id,major_id) REFERENCES class(class_id,major_id);
--CONSTRAINT FK_student_items_4 FOREIGN KEY(class_id) REFERENCES class(class_id)
go
ALTER TABLE teacher_items ADD
CONSTRAINT FK_teacher_items_1 FOREIGN KEY(userid) REFERENCES users(userid);
ALTER TABLE teacher_items ADD
CONSTRAINT FK_teacher_items_2 FOREIGN KEY(academy_id) REFERENCES academy(academy_id);
ALTER TABLE teacher_items ADD
CONSTRAINT FK_teacher_items_3 FOREIGN KEY(major_id) REFERENCES major(major_id)
go
ALTER TABLE major ADD
CONSTRAINT FK_major FOREIGN KEY(academy_id) REFERENCES academy(academy_id)
go
ALTER TABLE class ADD
CONSTRAINT FK_class FOREIGN KEY(major_id) REFERENCES major(major_id) 
go
ALTER TABLE courses ADD
CONSTRAINT FK_courses FOREIGN KEY(c_category_id) REFERENCES courses_categories(c_category_id)
go
ALTER TABLE course_items ADD
CONSTRAINT FK_course_items FOREIGN KEY(course_id) REFERENCES courses(course_id)
go
ALTER TABLE resources ADD
CONSTRAINT FK_resources_1 FOREIGN KEY(resource_category_id) REFERENCES resource_categories(resource_category_id);
ALTER TABLE resources ADD
CONSTRAINT FK_resources_2 FOREIGN KEY(audit_id) REFERENCES audit(audit_id)
go
ALTER TABLE resource_items ADD
CONSTRAINT FK_resource_items_1 FOREIGN KEY(course_id,chapter_id) REFERENCES course_items(course_id,chapter_id);
ALTER TABLE resource_items ADD
CONSTRAINT FK_resource_items_2 FOREIGN KEY(userid) REFERENCES users(userid)
go
ALTER TABLE privilege_setting ADD
CONSTRAINT FK_privilege_setting_1 FOREIGN KEY(acc_category_id) REFERENCES account_categories(acc_category_id);
ALTER TABLE privilege_setting ADD
CONSTRAINT FK_privilege_setting_2 FOREIGN KEY(menu_id) REFERENCES menu(menu_id);
ALTER TABLE privilege_setting ADD
CONSTRAINT FK_privilege_setting_3 FOREIGN KEY(privi_id) REFERENCES privilege(privi_id)
go
ALTER TABLE question ADD
CONSTRAINT FK_question_1 FOREIGN KEY(userid) REFERENCES users(userid);
ALTER TABLE question ADD
CONSTRAINT FK_question_2 FOREIGN KEY(status_id) REFERENCES question_status(status_id)
go
ALTER TABLE question_reply ADD
CONSTRAINT FK_question_reply_1 FOREIGN KEY(question_id) REFERENCES question(question_id);
ALTER TABLE question_reply ADD
CONSTRAINT FK_question_reply_2 FOREIGN KEY(userid) REFERENCES users(userid)
go
ALTER TABLE study_history ADD
CONSTRAINT FK_study_history_1 FOREIGN KEY(userid) REFERENCES users(userid);
ALTER TABLE study_history ADD
CONSTRAINT FK_study_history_2 FOREIGN KEY(resource_id) REFERENCES resources(resource_id)
go
ALTER TABLE study_collection ADD
CONSTRAINT FK_study_collection_1 FOREIGN KEY(userid) REFERENCES users(userid);
ALTER TABLE study_collection ADD
CONSTRAINT FK_study_collection_2 FOREIGN KEY(resource_id) REFERENCES resources(resource_id)
go
ALTER TABLE study_note ADD
CONSTRAINT FK_study_note FOREIGN KEY(userid) REFERENCES users(userid)
go
ALTER TABLE study_task ADD
CONSTRAINT FK_study_note_1 FOREIGN KEY(task_id) REFERENCES release_task(task_id);
ALTER TABLE study_task ADD
CONSTRAINT FK_study_note_2 FOREIGN KEY(userid) REFERENCES users(userid)
go
ALTER TABLE release_task ADD   
CONSTRAINT FK_release_task_1 FOREIGN KEY(userid) REFERENCES users(userid);
ALTER TABLE release_task ADD
CONSTRAINT FK_release_task_2 FOREIGN KEY(class_id,major_id) REFERENCES class(class_id,major_id)
go
ALTER TABLE resource_heat ADD
CONSTRAINT FK_resource_heat FOREIGN KEY(resource_id) REFERENCES resources(resource_id)
go
ALTER TABLE resource_evaluate ADD
CONSTRAINT FK_resource_evaluate FOREIGN KEY(userid) REFERENCES users(userid)

/********************others****************************************/
SELECT m.menu_id, m.menu_title, m.url, m.is_parent_node, m.parent_id, m.level,privi_id
						FROM menu m
						LEFT JOIN privilege_setting ps ON m.menu_id = ps.menu_id
						WHERE acc_category_id = 3 AND LEVEL = 1 AND privi_id = 1
SELECT MAX(LEVEL) AS LEVEL FROM courses_categories

SELECT c.course_id, c.course_name, c.english_name, c.c_category_id,
						   cc.c_category_name, c.description, c.note
						FROM courses c
						LEFT JOIN courses_categories cc ON c.c_category_id = cc.c_category_id	

SELECT u.*, ac.acc_categoty_name
						FROM users u
						LEFT JOIN account_categories ac ON u.acc_category_id = ac.acc_category_id
;WITH tmp AS 
(SELECT m.menu_id, m.menu_title, m.url, m.is_parent_node, m.parent_id, m.level FROM menu m 
LEFT JOIN privilege_setting ps ON m.menu_id = ps.menu_id
WHERE acc_category_id = 1 AND privi_id = 1)
,tmp1 AS ( SELECT menu_id,parent_id FROM tmp
UNION ALL SELECT b.menu_id,b.parent_id FROM tmp1 AS a,tmp AS b 
WHERE b.menu_id=a.parent_id)
SELECT COUNT(*) AS n FROM tmp WHERE menu_id IN (SELECT menu_id FROM tmp1) 

SELECT c_category_id, c_category_name, parent_id, is_parent_node, LEVEL
						FROM courses_categories
SELECT cc.*,cc1.c_category_name FROM courses_categories cc
LEFT JOIN courses_categories cc1 ON cc.parent_id = cc1.c_category_id
SELECT * FROM courses_categories

SELECT c.course_id, c.course_name, c.english_name, c.c_category_id,
						   cc.c_category_name, c.description, c.note, cc.parent_id, cc1.c_category_name 
						FROM courses c
						LEFT JOIN courses_categories cc ON c.c_category_id = cc.c_category_id
						LEFT JOIN courses_categories cc1 ON cc.parent_id = cc1.c_category_id
						WHERE cc.c_category_id = 'B02' OR cc.parent_id = 'B02'
SELECT resource_category_id, resource_category_name, parent_id, is_parent_node, LEVEL
						FROM resource_categories
						WHERE LEVEL = 2
SELECT r.resource_id, r.resource_category_id, rc.resource_category_name, ri.resource_name, ri.description,
					ri.key_words, ri.course_id, ri.chapter_id, ri.userid AS uploader, ri.uploaddate, r.audit_id, a.audit_des,
					r.path, ri.translate_path
						FROM resources r 
						LEFT JOIN resource_categories rc ON rc.resource_category_id = r.resource_category_id
						LEFT JOIN resource_items ri ON ri.resource_id = r.resource_id
						LEFT JOIN audit a ON a.audit_id = r.audit_id
SELECT re.resource_id, re.userid, re.evaluate_content, re.score, re.evaluate_time, u.account
						FROM resource_evaluate re
						LEFT JOIN users u ON u.userid = re.userid
						WHERE re.resource_id = ?
SELECT AVG(score) AS avg_grade FROM resource_evaluate WHERE 
SELECT u.userid, u.account, u.acc_category_id, ac.acc_categoty_name
						FROM users u
						LEFT JOIN account_categories ac ON u.acc_category_id = ac.acc_category_id