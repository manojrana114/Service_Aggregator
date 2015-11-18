
/* Drop Tables */

IF ObJECt_ID('[ACL_ENTRY]') IS NOT NULL DROP TABLE [ACL_ENTRY];
IF ObJECt_ID('[ACL_SID]') IS NOT NULL DROP TABLE [ACL_SID];
IF ObJECt_ID('[ORDER_ITEM]') IS NOT NULL DROP TABLE [ORDER_ITEM];
IF ObJECt_ID('[ORDER_STATUS]') IS NOT NULL DROP TABLE [ORDER_STATUS];
IF ObJECt_ID('[OREDR]') IS NOT NULL DROP TABLE [OREDR];
IF ObJECt_ID('[FIELD_PROFESSIONAL]') IS NOT NULL DROP TABLE [FIELD_PROFESSIONAL];
IF ObJECt_ID('[PROVIDER]') IS NOT NULL DROP TABLE [PROVIDER];
IF ObJECt_ID('[SEC_USER_ROLE]') IS NOT NULL DROP TABLE [SEC_USER_ROLE];
IF ObJECt_ID('[SERVICE_AGGREGATOR]') IS NOT NULL DROP TABLE [SERVICE_AGGREGATOR];
IF ObJECt_ID('[SEC_USER]') IS NOT NULL DROP TABLE [SEC_USER];
IF ObJECt_ID('[ADDRESS]') IS NOT NULL DROP TABLE [ADDRESS];
IF ObJECt_ID('[CUSTOMER]') IS NOT NULL DROP TABLE [CUSTOMER];
IF ObJECt_ID('[RECORD_METADATA]') IS NOT NULL DROP TABLE [RECORD_METADATA];
IF ObJECt_ID('[METADATA]') IS NOT NULL DROP TABLE [METADATA];
IF ObJECt_ID('[OBJECT_IDENTITY]') IS NOT NULL DROP TABLE [OBJECT_IDENTITY];
IF ObJECt_ID('[OBJECT_TYPE]') IS NOT NULL DROP TABLE [OBJECT_TYPE];
IF ObJECt_ID('[OFFER]') IS NOT NULL DROP TABLE [OFFER];
IF ObJECt_ID('[PRODUCT]') IS NOT NULL DROP TABLE [PRODUCT];
IF ObJECt_ID('[REGION]') IS NOT NULL DROP TABLE [REGION];
IF ObJECt_ID('[SEC_ROLE]') IS NOT NULL DROP TABLE [SEC_ROLE];
IF ObJECt_ID('[SERVICE_TYPE]') IS NOT NULL DROP TABLE [SERVICE_TYPE];




/* Create Tables */

CREATE TABLE [ACL_ENTRY]
(
	[ACL_ENTRY_ID] bigint NOT NULL,
	[ACL_SID_ID] bigint NOT NULL,
	[OBJECT_IDENTITY_ID] bigint NOT NULL,
	PRIMARY KEY ([ACL_ENTRY_ID])
);


CREATE TABLE [ACL_SID]
(
	[ACL_SID_ID] bigint NOT NULL,
	[USER_ID] bigint NOT NULL,
	PRIMARY KEY ([ACL_SID_ID])
);


CREATE TABLE [ADDRESS]
(
	[ADDRESS_ID] bigint NOT NULL,
	[LINE1] varchar(50),
	[LINE2] varchar(50),
	[CITY] nvarchar(50),
	[STATE] nvarchar(50),
	[COUNTRY] nvarchar(50),
	[ZIP_CODE] nvarchar(50),
	PRIMARY KEY ([ADDRESS_ID])
);


CREATE TABLE [CUSTOMER]
(
	[CUSTOMER_ID] bigint NOT NULL,
	[PHONE] nvarchar(50),
	[NAME] varchar(100),
	[EMAIL] nvarchar(100),
	PRIMARY KEY ([CUSTOMER_ID])
);


CREATE TABLE [FIELD_PROFESSIONAL]
(
	[FIELD_PROFESSIONAL_ID] bigint NOT NULL,
	[PROVIDER_ID] bigint NOT NULL,
	[AGGREGATOR_ID] bigint NOT NULL,
	[USER_ID] bigint NOT NULL,
	[ADDRESS_ID] bigint NOT NULL,
	PRIMARY KEY ([FIELD_PROFESSIONAL_ID])
);


CREATE TABLE [METADATA]
(
	[EXTENSION_ID] bigint NOT NULL,
	[COLUMN_LABEL] varchar(max) NOT NULL,
	[COLUMN_TYPE] nvarchar(max) NOT NULL,
	PRIMARY KEY ([EXTENSION_ID])
);


CREATE TABLE [OBJECT_IDENTITY]
(
	[OBJECT_IDENTITY_ID] bigint NOT NULL,
	[OBJECT_IDENTITY] varchar(200) NOT NULL,
	[OBJECT_TYPE_ID] bigint NOT NULL,
	PRIMARY KEY ([OBJECT_IDENTITY_ID])
);


CREATE TABLE [OBJECT_TYPE]
(
	[OBJECT_TYPE_ID] bigint NOT NULL,
	[OBJECT_NAME] varchar(50),
	PRIMARY KEY ([OBJECT_TYPE_ID])
);


CREATE TABLE [OFFER]
(
	[PRODUCT_ID] bigint NOT NULL,
	[OFFER] varchar(100) NOT NULL,
	PRIMARY KEY ([PRODUCT_ID])
);


CREATE TABLE [ORDER_ITEM]
(
	[ORDER_ITEM_ID] bigint NOT NULL,
	[QUANTITY] numeric(20),
	[PRODUCT_ID] bigint NOT NULL,
	[ORDER_ID] bigint NOT NULL,
	PRIMARY KEY ([ORDER_ITEM_ID])
);


CREATE TABLE [ORDER_STATUS]
(
	[STATUS] varchar(200) NOT NULL,
	[ORDER_ID] bigint NOT NULL
);


CREATE TABLE [OREDR]
(
	[ORDER_ID] bigint NOT NULL,
	[CUSTOMER_ID] bigint NOT NULL,
	[PROVIDER_ID] bigint NOT NULL,
	[FIELD_PROFESSIONAL_ID] bigint NOT NULL,
	PRIMARY KEY ([ORDER_ID])
);


CREATE TABLE [PRODUCT]
(
	[PRODUCT_ID] bigint NOT NULL,
	[NAME] varchar(100) NOT NULL,
	[DESCRIPTION] varchar(500),
	PRIMARY KEY ([PRODUCT_ID])
);


CREATE TABLE [PROVIDER]
(
	[PROVIDER_ID] bigint NOT NULL,
	[NAME] varchar(max) NOT NULL,
	[PHONE] numeric(15),
	[EMAIL] nvarchar(max) NOT NULL,
	[REGION_ID] bigint NOT NULL,
	[AGGREGATOR_ID] bigint NOT NULL,
	[ADDRESS_ID] bigint NOT NULL,
	PRIMARY KEY ([PROVIDER_ID])
);


CREATE TABLE [RECORD_METADATA]
(
	[RECORD_ID] bigint NOT NULL,
	[VALUE] varchar(max) NOT NULL,
	[EXTENSION_ID] bigint NOT NULL,
	PRIMARY KEY ([RECORD_ID])
);


CREATE TABLE [REGION]
(
	[REGION_ID] bigint NOT NULL,
	[REGION_NAME] varchar(200) NOT NULL,
	[START_ZIPCODE] bigint NOT NULL,
	[END_ZIPCODE] bigint NOT NULL,
	PRIMARY KEY ([REGION_ID])
);


CREATE TABLE [SEC_ROLE]
(
	[ROLE_ID] bigint NOT NULL,
	[ROLE_NAME] nvarchar(50) NOT NULL,
	PRIMARY KEY ([ROLE_ID])
);


CREATE TABLE [SEC_USER]
(
	[USER_ID] bigint NOT NULL,
	[NAME] varchar(max) NOT NULL,
	[EMAIL] nvarchar(max) NOT NULL,
	[PHONE] bigint,
	[PASSWORD] nvarchar(50) NOT NULL,
	[ADDRESS_ID] bigint NOT NULL,
	PRIMARY KEY ([USER_ID])
);


CREATE TABLE [SEC_USER_ROLE]
(
	[USER_ROLE_ID] bigint NOT NULL,
	[ROLE_ID] bigint NOT NULL,
	[USER_ID] bigint NOT NULL,
	PRIMARY KEY ([USER_ROLE_ID])
);


CREATE TABLE [SERVICE_AGGREGATOR]
(
	[AGGREGATOR_ID] bigint NOT NULL,
	[NAME] nvarchar(max) NOT NULL,
	[PHONE] bigint,
	[EMAIL] nvarchar(100) NOT NULL,
	[ADDRESS_ID] bigint NOT NULL,
	[SERVICE_TYPE_ID] bigint NOT NULL,
	[USER_ID] bigint NOT NULL,
	[RECORD_ID] bigint NOT NULL,
	PRIMARY KEY ([AGGREGATOR_ID])
);


CREATE TABLE [SERVICE_TYPE]
(
	[SERVICE_TYPE_ID] bigint NOT NULL,
	[SERVICE_TYPE] varchar(50) NOT NULL,
	PRIMARY KEY ([SERVICE_TYPE_ID])
);



/* Create Foreign Keys */

ALTER TABLE [ACL_ENTRY]
	ADD FOREIGN KEY ([ACL_SID_ID])
	REFERENCES [ACL_SID] ([ACL_SID_ID])
;


ALTER TABLE [FIELD_PROFESSIONAL]
	ADD FOREIGN KEY ([ADDRESS_ID])
	REFERENCES [ADDRESS] ([ADDRESS_ID])
;


ALTER TABLE [PROVIDER]
	ADD FOREIGN KEY ([ADDRESS_ID])
	REFERENCES [ADDRESS] ([ADDRESS_ID])
;


ALTER TABLE [SEC_USER]
	ADD FOREIGN KEY ([ADDRESS_ID])
	REFERENCES [ADDRESS] ([ADDRESS_ID])
;


ALTER TABLE [SERVICE_AGGREGATOR]
	ADD FOREIGN KEY ([ADDRESS_ID])
	REFERENCES [ADDRESS] ([ADDRESS_ID])
;


ALTER TABLE [OREDR]
	ADD FOREIGN KEY ([CUSTOMER_ID])
	REFERENCES [CUSTOMER] ([CUSTOMER_ID])
;


ALTER TABLE [OREDR]
	ADD FOREIGN KEY ([FIELD_PROFESSIONAL_ID])
	REFERENCES [FIELD_PROFESSIONAL] ([FIELD_PROFESSIONAL_ID])
;


ALTER TABLE [RECORD_METADATA]
	ADD FOREIGN KEY ([EXTENSION_ID])
	REFERENCES [METADATA] ([EXTENSION_ID])
;


ALTER TABLE [ACL_ENTRY]
	ADD FOREIGN KEY ([OBJECT_IDENTITY_ID])
	REFERENCES [OBJECT_IDENTITY] ([OBJECT_IDENTITY_ID])
;


ALTER TABLE [OBJECT_IDENTITY]
	ADD FOREIGN KEY ([OBJECT_TYPE_ID])
	REFERENCES [OBJECT_TYPE] ([OBJECT_TYPE_ID])
;


ALTER TABLE [ORDER_ITEM]
	ADD FOREIGN KEY ([ORDER_ID])
	REFERENCES [OREDR] ([ORDER_ID])
;


ALTER TABLE [ORDER_STATUS]
	ADD FOREIGN KEY ([ORDER_ID])
	REFERENCES [OREDR] ([ORDER_ID])
;


ALTER TABLE [ORDER_ITEM]
	ADD FOREIGN KEY ([PRODUCT_ID])
	REFERENCES [PRODUCT] ([PRODUCT_ID])
;


ALTER TABLE [FIELD_PROFESSIONAL]
	ADD FOREIGN KEY ([PROVIDER_ID])
	REFERENCES [PROVIDER] ([PROVIDER_ID])
;


ALTER TABLE [OREDR]
	ADD FOREIGN KEY ([PROVIDER_ID])
	REFERENCES [PROVIDER] ([PROVIDER_ID])
;


ALTER TABLE [SERVICE_AGGREGATOR]
	ADD FOREIGN KEY ([RECORD_ID])
	REFERENCES [RECORD_METADATA] ([RECORD_ID])
;


ALTER TABLE [PROVIDER]
	ADD FOREIGN KEY ([REGION_ID])
	REFERENCES [REGION] ([REGION_ID])
;


ALTER TABLE [SEC_USER_ROLE]
	ADD FOREIGN KEY ([ROLE_ID])
	REFERENCES [SEC_ROLE] ([ROLE_ID])
;


ALTER TABLE [ACL_SID]
	ADD FOREIGN KEY ([USER_ID])
	REFERENCES [SEC_USER] ([USER_ID])
;


ALTER TABLE [FIELD_PROFESSIONAL]
	ADD FOREIGN KEY ([USER_ID])
	REFERENCES [SEC_USER] ([USER_ID])
;


ALTER TABLE [SEC_USER_ROLE]
	ADD FOREIGN KEY ([USER_ID])
	REFERENCES [SEC_USER] ([USER_ID])
;


ALTER TABLE [SERVICE_AGGREGATOR]
	ADD FOREIGN KEY ([USER_ID])
	REFERENCES [SEC_USER] ([USER_ID])
;


ALTER TABLE [FIELD_PROFESSIONAL]
	ADD FOREIGN KEY ([AGGREGATOR_ID])
	REFERENCES [SERVICE_AGGREGATOR] ([AGGREGATOR_ID])
;


ALTER TABLE [PROVIDER]
	ADD FOREIGN KEY ([AGGREGATOR_ID])
	REFERENCES [SERVICE_AGGREGATOR] ([AGGREGATOR_ID])
;


ALTER TABLE [SERVICE_AGGREGATOR]
	ADD FOREIGN KEY ([SERVICE_TYPE_ID])
	REFERENCES [SERVICE_TYPE] ([SERVICE_TYPE_ID])
;



