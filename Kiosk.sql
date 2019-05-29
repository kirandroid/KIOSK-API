--------------------------------------------------------
--  File created - Wednesday-May-29-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence AI
--------------------------------------------------------

   CREATE SEQUENCE  "ROOT"."AI"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 333 CACHE 100 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USERS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ROOT"."USERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 19 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ACTIVITY
--------------------------------------------------------

  CREATE TABLE "ROOT"."ACTIVITY" 
   (	"ACT_ID" NUMBER, 
	"ACT_NAME" VARCHAR2(50 BYTE), 
	"ACT_IMAGE" VARCHAR2(200 BYTE), 
	"ACT_DESCRIPTION" VARCHAR2(1000 BYTE), 
	"ACT_TYPE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BOOKING
--------------------------------------------------------

  CREATE TABLE "ROOT"."BOOKING" 
   (	"BOOKED_DATE" NUMBER, 
	"EVENT_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"BOOKING_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table EVENT
--------------------------------------------------------

  CREATE TABLE "ROOT"."EVENT" 
   (	"EVENT_ID" NUMBER, 
	"TITLE" NVARCHAR2(60), 
	"IMAGE_URL" VARCHAR2(200 BYTE), 
	"DESCRIPTION" VARCHAR2(1000 BYTE), 
	"SEAT_NUMBER" NUMBER, 
	"CREATED_AT" NUMBER, 
	"UPDATED_AT" NUMBER, 
	"EVENT_DATE" NUMBER, 
	"EVENT_TYPE" VARCHAR2(20 BYTE), 
	"EVENT_STATUS" VARCHAR2(20 BYTE), 
	"EVENT_END_DATE" NUMBER, 
	"SEAT_LEFT" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table HTMLDB_PLAN_TABLE
--------------------------------------------------------

  CREATE TABLE "ROOT"."HTMLDB_PLAN_TABLE" 
   (	"STATEMENT_ID" VARCHAR2(30 BYTE), 
	"PLAN_ID" NUMBER, 
	"TIMESTAMP" DATE, 
	"REMARKS" VARCHAR2(4000 BYTE), 
	"OPERATION" VARCHAR2(30 BYTE), 
	"OPTIONS" VARCHAR2(255 BYTE), 
	"OBJECT_NODE" VARCHAR2(128 BYTE), 
	"OBJECT_OWNER" VARCHAR2(30 BYTE), 
	"OBJECT_NAME" VARCHAR2(30 BYTE), 
	"OBJECT_ALIAS" VARCHAR2(65 BYTE), 
	"OBJECT_INSTANCE" NUMBER(*,0), 
	"OBJECT_TYPE" VARCHAR2(30 BYTE), 
	"OPTIMIZER" VARCHAR2(255 BYTE), 
	"SEARCH_COLUMNS" NUMBER, 
	"ID" NUMBER(*,0), 
	"PARENT_ID" NUMBER(*,0), 
	"DEPTH" NUMBER(*,0), 
	"POSITION" NUMBER(*,0), 
	"COST" NUMBER(*,0), 
	"CARDINALITY" NUMBER(*,0), 
	"BYTES" NUMBER(*,0), 
	"OTHER_TAG" VARCHAR2(255 BYTE), 
	"PARTITION_START" VARCHAR2(255 BYTE), 
	"PARTITION_STOP" VARCHAR2(255 BYTE), 
	"PARTITION_ID" NUMBER(*,0), 
	"OTHER" LONG, 
	"DISTRIBUTION" VARCHAR2(30 BYTE), 
	"CPU_COST" NUMBER(*,0), 
	"IO_COST" NUMBER(*,0), 
	"TEMP_SPACE" NUMBER(*,0), 
	"ACCESS_PREDICATES" VARCHAR2(4000 BYTE), 
	"FILTER_PREDICATES" VARCHAR2(4000 BYTE), 
	"PROJECTION" VARCHAR2(4000 BYTE), 
	"TIME" NUMBER(*,0), 
	"QBLOCK_NAME" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table NEWSNOTICE
--------------------------------------------------------

  CREATE TABLE "ROOT"."NEWSNOTICE" 
   (	"NN_ID" NUMBER, 
	"NN_TITLE" VARCHAR2(50 BYTE), 
	"NN_DESC" VARCHAR2(1000 BYTE), 
	"CREATED_AT" NUMBER, 
	"UPDATED_AT" NUMBER, 
	"ACTIVE" NUMBER, 
	"TYPE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SERVICE
--------------------------------------------------------

  CREATE TABLE "ROOT"."SERVICE" 
   (	"SER_ID" NUMBER, 
	"SER_NAME" VARCHAR2(50 BYTE), 
	"SER_IMAGE" VARCHAR2(200 BYTE), 
	"SER_DESCRIPTION" VARCHAR2(1000 BYTE), 
	"SER_TYPE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table STUDENT
--------------------------------------------------------

  CREATE TABLE "ROOT"."STUDENT" 
   (	"STUDENT_ID" NUMBER, 
	"AVAILABLE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "ROOT"."USERS" 
   (	"USER_ID" NUMBER, 
	"FIRST_NAME" VARCHAR2(60 BYTE), 
	"LAST_NAME" VARCHAR2(60 BYTE), 
	"USERNAME" VARCHAR2(60 BYTE), 
	"PASSWORD" VARCHAR2(40 BYTE), 
	"EMAIL" VARCHAR2(60 BYTE), 
	"IMAGE_URL" VARCHAR2(200 BYTE), 
	"CREATED_AT" NUMBER, 
	"STUDENT_ID" VARCHAR2(30 BYTE), 
	"UPDATED_AT" NUMBER, 
	"ROLE" VARCHAR2(20 BYTE), 
	"STUDY_LEVEL" VARCHAR2(20 BYTE), 
	"COURSE" VARCHAR2(20 BYTE), 
	"CONTACT" VARCHAR2(20 BYTE), 
	"GENDER" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into ROOT.ACTIVITY
SET DEFINE OFF;
Insert into ROOT.ACTIVITY (ACT_ID,ACT_NAME,ACT_IMAGE,ACT_DESCRIPTION,ACT_TYPE) values (1,'Football','https://static01.nyt.com/images/2019/05/24/sports/24jamaicasoccer/merlin_155333919_a4569559-f106-42e8-9a76-5fef3163bf31-videoLarge.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','SPORTS');
Insert into ROOT.ACTIVITY (ACT_ID,ACT_NAME,ACT_IMAGE,ACT_DESCRIPTION,ACT_TYPE) values (2,'Labor Community','https://open.edx.org/wp-content/uploads/2018/12/Community@2x.png','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','COMMUNITY');
Insert into ROOT.ACTIVITY (ACT_ID,ACT_NAME,ACT_IMAGE,ACT_DESCRIPTION,ACT_TYPE) values (3,'Social Club','https://www.wikihow.com/images/thumb/a/a8/Start-a-School-Club-Step-1.jpg/aid617573-v4-678px-Start-a-School-Club-Step-1.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','CLUB');
Insert into ROOT.ACTIVITY (ACT_ID,ACT_NAME,ACT_IMAGE,ACT_DESCRIPTION,ACT_TYPE) values (215,'tree plantation','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiEGHFM2fPw4kW_rDjjByJvdM8yIkAIeQwshJy9GIYEV3qJqUrfw','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','SPORTS');
Insert into ROOT.ACTIVITY (ACT_ID,ACT_NAME,ACT_IMAGE,ACT_DESCRIPTION,ACT_TYPE) values (216,'Cultural Activity','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7a-_g7ovPZXaRhXTM5F2k4HMHeQyxR3WkIosanl16z3DQmOr-','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','COMMUNITY');
Insert into ROOT.ACTIVITY (ACT_ID,ACT_NAME,ACT_IMAGE,ACT_DESCRIPTION,ACT_TYPE) values (236,'Tour','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScBtRy4PVkBrkd46fLcOhLzQ1kkQne8kmupoj8aigTWh57yJ4I','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','SPORTS');
REM INSERTING into ROOT.BOOKING
SET DEFINE OFF;
Insert into ROOT.BOOKING (BOOKED_DATE,EVENT_ID,USER_ID,BOOKING_ID) values (123124123,224,115,1);
Insert into ROOT.BOOKING (BOOKED_DATE,EVENT_ID,USER_ID,BOOKING_ID) values (1558910436093,224,115,225);
Insert into ROOT.BOOKING (BOOKED_DATE,EVENT_ID,USER_ID,BOOKING_ID) values (1558910436093,224,117,300);
REM INSERTING into ROOT.EVENT
SET DEFINE OFF;
Insert into ROOT.EVENT (EVENT_ID,TITLE,IMAGE_URL,DESCRIPTION,SEAT_NUMBER,CREATED_AT,UPDATED_AT,EVENT_DATE,EVENT_TYPE,EVENT_STATUS,EVENT_END_DATE,SEAT_LEFT) values (221,'Photography contest','https://cdn.mos.cms.futurecdn.net/gvQ9NhQP8wbbM32jXy4V3j.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',8,8,0,1558899097089,'TEST','Active',1558899097089,22);
Insert into ROOT.EVENT (EVENT_ID,TITLE,IMAGE_URL,DESCRIPTION,SEAT_NUMBER,CREATED_AT,UPDATED_AT,EVENT_DATE,EVENT_TYPE,EVENT_STATUS,EVENT_END_DATE,SEAT_LEFT) values (222,'Art competition','https://animaster.com/wp-content/uploads/2018/02/after-10-12-art-design-college.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',8,8,0,1558899097089,'TEST','Active',1558899097089,23);
Insert into ROOT.EVENT (EVENT_ID,TITLE,IMAGE_URL,DESCRIPTION,SEAT_NUMBER,CREATED_AT,UPDATED_AT,EVENT_DATE,EVENT_TYPE,EVENT_STATUS,EVENT_END_DATE,SEAT_LEFT) values (223,'Walkathon','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaBxZkJ76vukiZut_NjuN3cNzKUtItl53IBYn1V7lVKxP7tqsLbA','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',23,1558897603343,1558897603344,1558899097089,'5','Active',1558899097089,23);
Insert into ROOT.EVENT (EVENT_ID,TITLE,IMAGE_URL,DESCRIPTION,SEAT_NUMBER,CREATED_AT,UPDATED_AT,EVENT_DATE,EVENT_TYPE,EVENT_STATUS,EVENT_END_DATE,SEAT_LEFT) values (224,'Volunteering opportunity','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjKSFwq2Lxq3JtoTRVLx0qAhKxM6Sm7xoC_zJfqh78qs_V4m_H','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',23,1558899097089,1558899097089,1558899097089,'5','Active',1558899097089,21);
REM INSERTING into ROOT.HTMLDB_PLAN_TABLE
SET DEFINE OFF;
REM INSERTING into ROOT.NEWSNOTICE
SET DEFINE OFF;
Insert into ROOT.NEWSNOTICE (NN_ID,NN_TITLE,NN_DESC,CREATED_AT,UPDATED_AT,ACTIVE,TYPE) values (229,'Examination Notice','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1558980577789,1558980577789,1,'NEWS');
Insert into ROOT.NEWSNOTICE (NN_ID,NN_TITLE,NN_DESC,CREATED_AT,UPDATED_AT,ACTIVE,TYPE) values (230,'New Session of classes','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1558981345191,1558981345191,1,'NOTICE');
Insert into ROOT.NEWSNOTICE (NN_ID,NN_TITLE,NN_DESC,CREATED_AT,UPDATED_AT,ACTIVE,TYPE) values (231,'Routine Change','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1558981739843,1558981739843,1,'NOTICE');
Insert into ROOT.NEWSNOTICE (NN_ID,NN_TITLE,NN_DESC,CREATED_AT,UPDATED_AT,ACTIVE,TYPE) values (232,'Guest Lecture for students','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1558981891566,1558981891566,1,'NOTICE');
Insert into ROOT.NEWSNOTICE (NN_ID,NN_TITLE,NN_DESC,CREATED_AT,UPDATED_AT,ACTIVE,TYPE) values (123,'Seminar for students','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1558980577789,1558980577789,1,'NEWS');
REM INSERTING into ROOT.SERVICE
SET DEFINE OFF;
Insert into ROOT.SERVICE (SER_ID,SER_NAME,SER_IMAGE,SER_DESCRIPTION,SER_TYPE) values (235,'GYM','https://www.telegraph.co.uk/content/dam/luxury/2017/03/21/Gym_2_trans_NvBQzQNjv4BqgsaO8O78rhmZrDxTlQBjdGcv5yZLmao6LolmWYJrXns.jpg?imwidth=1400','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','PARTNER');
Insert into ROOT.SERVICE (SER_ID,SER_NAME,SER_IMAGE,SER_DESCRIPTION,SER_TYPE) values (24,'LAXMI BANK','https://www.inheadline.com/inheadline/public/assets/uploads/news/67_550041551341157.jpeg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','BANK');
Insert into ROOT.SERVICE (SER_ID,SER_NAME,SER_IMAGE,SER_DESCRIPTION,SER_TYPE) values (324,'NABIL BANK','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ98ivBB8bjQZrInhgiAstoGKavh_9PgKSTKdKgU9IstmkGzMLj','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','BANK');
Insert into ROOT.SERVICE (SER_ID,SER_NAME,SER_IMAGE,SER_DESCRIPTION,SER_TYPE) values (456,'PRABHU BANK','http://admin.myrepublica.com/media/k2/items/cache/a97867d0c8d80f3ee6e2ac57bdc05687_L.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','BANK');
Insert into ROOT.SERVICE (SER_ID,SER_NAME,SER_IMAGE,SER_DESCRIPTION,SER_TYPE) values (67,'NORVIC Hospital','http://202.166.217.100/weblab1/logo-hospital.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','HOSPITAL');
Insert into ROOT.SERVICE (SER_ID,SER_NAME,SER_IMAGE,SER_DESCRIPTION,SER_TYPE) values (345,'Alka Hospital','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv15k0BzLAeJBNRHLDehmVcYDGskVw5gGk0O1qv_DawWiul3Kt','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','HOSPITAL');
Insert into ROOT.SERVICE (SER_ID,SER_NAME,SER_IMAGE,SER_DESCRIPTION,SER_TYPE) values (23,'Studio','https://headphonecommute.files.wordpress.com/2018/09/italtekstudio10.jpg?w=768&h=512','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','PARTNER');
Insert into ROOT.SERVICE (SER_ID,SER_NAME,SER_IMAGE,SER_DESCRIPTION,SER_TYPE) values (2546,'Bank Of Kathmandu','https://www.bok.com.np/assets/front/images/logo-header.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','BANK');
REM INSERTING into ROOT.STUDENT
SET DEFINE OFF;
Insert into ROOT.STUDENT (STUDENT_ID,AVAILABLE) values (3455235423,1);
Insert into ROOT.STUDENT (STUDENT_ID,AVAILABLE) values (123456,1);
Insert into ROOT.STUDENT (STUDENT_ID,AVAILABLE) values (1720873,1);
REM INSERTING into ROOT.USERS
SET DEFINE OFF;
Insert into ROOT.USERS (USER_ID,FIRST_NAME,LAST_NAME,USERNAME,PASSWORD,EMAIL,IMAGE_URL,CREATED_AT,STUDENT_ID,UPDATED_AT,ROLE,STUDY_LEVEL,COURSE,CONTACT,GENDER) values (238,'Roshan','Shrestha','Rosh','123456','Rosh@gmail.com','http://localhost:3000/images/oriental_fantasy_art-wallpaper-1366x768.jpg',1559115760970,'1720873',1559115760970,'Student','5','BBA','654651231','female');
Insert into ROOT.USERS (USER_ID,FIRST_NAME,LAST_NAME,USERNAME,PASSWORD,EMAIL,IMAGE_URL,CREATED_AT,STUDENT_ID,UPDATED_AT,ROLE,STUDY_LEVEL,COURSE,CONTACT,GENDER) values (117,'Kiran','Pradhan','Kirandroid','kiran123','Kiran@gmail.com','https://patancollege.edu.np/wp-content/uploads/2018/03/bscitcoursepic2-570x360.jpg',1558293851863,'123456789',1558293851863,'Admin','5','Bsc CS&SE','9860557488','male');
Insert into ROOT.USERS (USER_ID,FIRST_NAME,LAST_NAME,USERNAME,PASSWORD,EMAIL,IMAGE_URL,CREATED_AT,STUDENT_ID,UPDATED_AT,ROLE,STUDY_LEVEL,COURSE,CONTACT,GENDER) values (239,'sdfsdf','sdfsdf','sdfsdf','sdfsd','sdfsdf','http://localhost:3000/images/fedora_29_background-wallpaper-1366x768.jpg',1559116167823,'1720873',1559116167823,'Student','5','BBA','1243123123','female');
Insert into ROOT.USERS (USER_ID,FIRST_NAME,LAST_NAME,USERNAME,PASSWORD,EMAIL,IMAGE_URL,CREATED_AT,STUDENT_ID,UPDATED_AT,ROLE,STUDY_LEVEL,COURSE,CONTACT,GENDER) values (1,'Admin','Admin','admin','admin','admin','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0TDnTQ1rfhS4EyKIjz0BmqUNgU3vUKvggBFUT9bUvEFe3z47tHw',1558277157018,'11111',1558277157018,'Admin','5','BBA ','234234','male');
Insert into ROOT.USERS (USER_ID,FIRST_NAME,LAST_NAME,USERNAME,PASSWORD,EMAIL,IMAGE_URL,CREATED_AT,STUDENT_ID,UPDATED_AT,ROLE,STUDY_LEVEL,COURSE,CONTACT,GENDER) values (234,'asd','asd','asd','asd','asd','http://localhost:3000/images/oopp.jpg',1559103977223,'123456',1559103977223,'Student','5','BBA','123123123','female');
Insert into ROOT.USERS (USER_ID,FIRST_NAME,LAST_NAME,USERNAME,PASSWORD,EMAIL,IMAGE_URL,CREATED_AT,STUDENT_ID,UPDATED_AT,ROLE,STUDY_LEVEL,COURSE,CONTACT,GENDER) values (115,'Jonnys','ZOOOM','jonny','john123','john@gmail.com','https://patancollege.edu.np/wp-content/uploads/2018/03/27993829_1299924146818701_6740429578492329228_o.jpg',1558277157018,'1234343',1558853997205,'Student','5','BBA','234234','male');
--------------------------------------------------------
--  DDL for Index SERVICE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."SERVICE_PK" ON "ROOT"."SERVICE" ("SER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BOOKING_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."BOOKING_PK" ON "ROOT"."BOOKING" ("BOOKING_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SPORTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."SPORTS_PK" ON "ROOT"."ACTIVITY" ("ACT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index STUDENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."STUDENT_PK" ON "ROOT"."STUDENT" ("STUDENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index NEWSNOTICE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."NEWSNOTICE_PK" ON "ROOT"."NEWSNOTICE" ("NN_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index EVENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."EVENT_PK" ON "ROOT"."EVENT" ("EVENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."PK" ON "ROOT"."USERS" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger ACTIVITY_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ROOT"."ACTIVITY_TRG" 
BEFORE INSERT ON ACTIVITY 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ACT_ID IS NULL THEN
      SELECT AI.NEXTVAL INTO :NEW.ACT_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ROOT"."ACTIVITY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BOOKING_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ROOT"."BOOKING_TRG" 
BEFORE INSERT ON BOOKING 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.BOOKING_ID IS NULL THEN
      SELECT AI.NEXTVAL INTO :NEW.BOOKING_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ROOT"."BOOKING_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger EVENT_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ROOT"."EVENT_TRG" 
BEFORE INSERT ON EVENT 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ROOT"."EVENT_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger EVENT_TRG1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ROOT"."EVENT_TRG1" 
BEFORE INSERT ON EVENT 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.EVENT_ID IS NULL THEN
      SELECT AI.NEXTVAL INTO :NEW.EVENT_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ROOT"."EVENT_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NEWSNOTICE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ROOT"."NEWSNOTICE_TRG" 
BEFORE INSERT ON NEWSNOTICE 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.NN_ID IS NULL THEN
      SELECT AI.NEXTVAL INTO :NEW.NN_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ROOT"."NEWSNOTICE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SERVICE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ROOT"."SERVICE_TRG" 
BEFORE INSERT ON SERVICE 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.SER_ID IS NULL THEN
      SELECT AI.NEXTVAL INTO :NEW.SER_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ROOT"."SERVICE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SPORTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ROOT"."SPORTS_TRG" 
BEFORE INSERT ON ACTIVITY 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ROOT"."SPORTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ROOT"."USERS_TRG" 
BEFORE INSERT ON USERS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ROOT"."USERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USERS_TRG1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ROOT"."USERS_TRG1" 
BEFORE INSERT ON USERS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.USER_ID IS NULL THEN
      SELECT AI.NEXTVAL INTO :NEW.USER_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ROOT"."USERS_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Package Body USERS_TT_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "ROOT"."USERS_TT_TAPI" 
is
-- insert
procedure ins (
p_LASTNAME in USERS_TT.LASTNAME%type default null 
,p_USERNAME in USERS_TT.USERNAME%type default null 
,p_FIRSTNAME in USERS_TT.FIRSTNAME%type default null 
,p_PWD in USERS_TT.PWD%type default null 
,p_EMAIL in USERS_TT.EMAIL%type default null 
,p_ID_NUM in USERS_TT.ID_NUM%type
) is
begin
insert into USERS_TT(
LASTNAME
,USERNAME
,FIRSTNAME
,PWD
,EMAIL
,ID_NUM
) values (
p_LASTNAME
,p_USERNAME
,p_FIRSTNAME
,p_PWD
,p_EMAIL
,p_ID_NUM
);end;
-- update
procedure upd (
p_LASTNAME in USERS_TT.LASTNAME%type default null 
,p_USERNAME in USERS_TT.USERNAME%type default null 
,p_FIRSTNAME in USERS_TT.FIRSTNAME%type default null 
,p_PWD in USERS_TT.PWD%type default null 
,p_EMAIL in USERS_TT.EMAIL%type default null 
,p_ID_NUM in USERS_TT.ID_NUM%type
) is
begin
update USERS_TT set
LASTNAME = p_LASTNAME
,USERNAME = p_USERNAME
,FIRSTNAME = p_FIRSTNAME
,PWD = p_PWD
,EMAIL = p_EMAIL
where ID_NUM = p_ID_NUM;
end;
-- del
procedure del (
p_ID_NUM in USERS_TT.ID_NUM%type
) is
begin
delete from USERS_TT
where ID_NUM = p_ID_NUM;
end;
end USERS_TT_tapi;

/
--------------------------------------------------------
--  Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "ROOT"."STUDENT" ADD CONSTRAINT "STUDENT_PK" PRIMARY KEY ("STUDENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ROOT"."STUDENT" MODIFY ("AVAILABLE" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."STUDENT" MODIFY ("STUDENT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOOKING
--------------------------------------------------------

  ALTER TABLE "ROOT"."BOOKING" ADD CONSTRAINT "BOOKING_PK" PRIMARY KEY ("BOOKING_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ROOT"."BOOKING" MODIFY ("BOOKING_ID" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."BOOKING" MODIFY ("EVENT_ID" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."BOOKING" MODIFY ("BOOKED_DATE" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."BOOKING" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SERVICE
--------------------------------------------------------

  ALTER TABLE "ROOT"."SERVICE" ADD CONSTRAINT "SERVICE_PK" PRIMARY KEY ("SER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ROOT"."SERVICE" MODIFY ("SER_TYPE" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."SERVICE" MODIFY ("SER_DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."SERVICE" MODIFY ("SER_IMAGE" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."SERVICE" MODIFY ("SER_NAME" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."SERVICE" MODIFY ("SER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EVENT
--------------------------------------------------------

  ALTER TABLE "ROOT"."EVENT" ADD CONSTRAINT "EVENT_PK" PRIMARY KEY ("EVENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ROOT"."EVENT" MODIFY ("EVENT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "ROOT"."USERS" MODIFY ("IMAGE_URL" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."USERS" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."USERS" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."USERS" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."USERS" MODIFY ("LAST_NAME" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."USERS" MODIFY ("FIRST_NAME" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."USERS" ADD CONSTRAINT "PK" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ROOT"."USERS" MODIFY ("GENDER" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."USERS" MODIFY ("CONTACT" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."USERS" MODIFY ("COURSE" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."USERS" MODIFY ("STUDY_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."USERS" MODIFY ("ROLE" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."USERS" MODIFY ("UPDATED_AT" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."USERS" MODIFY ("STUDENT_ID" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."USERS" MODIFY ("CREATED_AT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NEWSNOTICE
--------------------------------------------------------

  ALTER TABLE "ROOT"."NEWSNOTICE" ADD CONSTRAINT "NEWSNOTICE_PK" PRIMARY KEY ("NN_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ROOT"."NEWSNOTICE" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."NEWSNOTICE" MODIFY ("ACTIVE" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."NEWSNOTICE" MODIFY ("UPDATED_AT" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."NEWSNOTICE" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."NEWSNOTICE" MODIFY ("NN_DESC" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."NEWSNOTICE" MODIFY ("NN_TITLE" NOT NULL ENABLE);
  ALTER TABLE "ROOT"."NEWSNOTICE" MODIFY ("NN_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACTIVITY
--------------------------------------------------------

  ALTER TABLE "ROOT"."ACTIVITY" ADD CONSTRAINT "SPORTS_PK" PRIMARY KEY ("ACT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ROOT"."ACTIVITY" MODIFY ("ACT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BOOKING
--------------------------------------------------------

  ALTER TABLE "ROOT"."BOOKING" ADD CONSTRAINT "EVENT_ID" FOREIGN KEY ("EVENT_ID")
	  REFERENCES "ROOT"."EVENT" ("EVENT_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ROOT"."BOOKING" ADD CONSTRAINT "USER_ID" FOREIGN KEY ("USER_ID")
	  REFERENCES "ROOT"."USERS" ("USER_ID") ON DELETE CASCADE ENABLE;
