/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2019/6/12 19:15:51                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Consumption') and o.name = 'FK_CONSUMPT_RELATIONS_USER')
alter table Consumption
   drop constraint FK_CONSUMPT_RELATIONS_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Login') and o.name = 'FK_LOGIN_RELATIONS_TYPE')
alter table Login
   drop constraint FK_LOGIN_RELATIONS_TYPE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Login') and o.name = 'FK_LOGIN_RELATIONS_USER')
alter table Login
   drop constraint FK_LOGIN_RELATIONS_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Site') and o.name = 'FK_SITE_RELATIONS_USER')
alter table Site
   drop constraint FK_SITE_RELATIONS_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Site') and o.name = 'FK_SITE_RELATIONS_LINE')
alter table Site
   drop constraint FK_SITE_RELATIONS_LINE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Consumption')
            and   type = 'U')
   drop table Consumption
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Line')
            and   type = 'U')
   drop table Line
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Login')
            and   name  = 'Relationship_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index Login.Relationship_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Login')
            and   type = 'U')
   drop table Login
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Page')
            and   type = 'U')
   drop table Page
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Site')
            and   name  = 'Relationship_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index Site.Relationship_5_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Site')
            and   type = 'U')
   drop table Site
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Type')
            and   type = 'U')
   drop table Type
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"User"')
            and   type = 'U')
   drop table "User"
go

/*==============================================================*/
/* Table: Consumption                                           */
/*==============================================================*/
create table Consumption (
   ID                   varchar(20)          not null,
   ConTime              datetime             not null,
   ConMoney             money                not null,
   ConType              tinyint              not null,
   Con                  varchar(200)         null,
   constraint PK_CONSUMPTION primary key nonclustered (ID)
)
go

/*==============================================================*/
/* Table: Line                                                  */
/*==============================================================*/
create table Line (
   LineID               int                  not null,
   LineName             varchar(20)          not null,
   constraint PK_LINE primary key nonclustered (LineID)
)
go

/*==============================================================*/
/* Table: Login                                                 */
/*==============================================================*/
create table Login (
   ID                   varchar(20)          not null,
   Password             varchar(20)          not null,
   TypeID               int                  not null,
   constraint PK_LOGIN primary key nonclustered (ID)
)
go

/*==============================================================*/
/* Index: Relationship_1_FK                                     */
/*==============================================================*/
create index Relationship_1_FK on Login (
TypeID ASC
)
go

/*==============================================================*/
/* Table: Page                                                  */
/*==============================================================*/
create table Page (
   PageID               int                  not null,
   PageName             varchar(20)          not null,
   PageColor            varchar(20)          not null,
   constraint PK_PAGE primary key nonclustered (PageID)
)
go

/*==============================================================*/
/* Table: Site                                                  */
/*==============================================================*/
create table Site (
   ID                   varchar(20)          not null,
   SiteName             varchar(20)          not null,
   LineID               int                  null,
   Price                money                not null,
   constraint PK_SITE primary key nonclustered (ID)
)
go

/*==============================================================*/
/* Index: Relationship_5_FK                                     */
/*==============================================================*/
create index Relationship_5_FK on Site (
LineID ASC
)
go

/*==============================================================*/
/* Table: Type                                                  */
/*==============================================================*/
create table Type (
   TypeID               int                  not null,
   Type                 varchar(20)          not null,
   constraint PK_TYPE primary key nonclustered (TypeID)
)
go

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" (
   Name                 varchar(20)          not null,
   Birthday             datetime             not null,
   Sex                  char(2)              not null,
   Phone                varchar(20)          not null,
   UserID               varchar(20)          not null,
   Blance               money                null,
   ID                   varchar(20)          not null,
   constraint PK_USER primary key nonclustered (ID)
)
go

alter table Consumption
   add constraint FK_CONSUMPT_RELATIONS_USER foreign key (ID)
      references "User" (ID)
go

alter table Login
   add constraint FK_LOGIN_RELATIONS_TYPE foreign key (TypeID)
      references Type (TypeID)
go

alter table Login
   add constraint FK_LOGIN_RELATIONS_USER foreign key (ID)
      references "User" (ID)
go

alter table Site
   add constraint FK_SITE_RELATIONS_USER foreign key (ID)
      references "User" (ID)
go

alter table Site
   add constraint FK_SITE_RELATIONS_LINE foreign key (LineID)
      references Line (LineID)
go

