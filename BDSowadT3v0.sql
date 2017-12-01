/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     18/11/2017 11:31:55 a.m.                     */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ACTIVIDAD') and o.name = 'FK_ACTIVIDA_RELATIONS_OBRA')
alter table ACTIVIDAD
   drop constraint FK_ACTIVIDA_RELATIONS_OBRA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ACTIVIDAD') and o.name = 'FK_ACTIVIDA_RELATIONS_USUARIO')
alter table ACTIVIDAD
   drop constraint FK_ACTIVIDA_RELATIONS_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AVANCE') and o.name = 'FK_AVANCE_RELATIONS_ACTIVIDA')
alter table AVANCE
   drop constraint FK_AVANCE_RELATIONS_ACTIVIDA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CONTRATO') and o.name = 'FK_CONTRATO_RELATIONS_PERSONA')
alter table CONTRATO
   drop constraint FK_CONTRATO_RELATIONS_PERSONA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLEACTIVIDAD') and o.name = 'FK_DETALLEA_RELATIONS_ACTIVIDA')
alter table DETALLEACTIVIDAD
   drop constraint FK_DETALLEA_RELATIONS_ACTIVIDA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLEACTIVIDAD') and o.name = 'FK_DETALLEA_RELATIONS_MATERIAL')
alter table DETALLEACTIVIDAD
   drop constraint FK_DETALLEA_RELATIONS_MATERIAL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATERIAL') and o.name = 'FK_MATERIAL_RELATIONS_PROVEEDO')
alter table MATERIAL
   drop constraint FK_MATERIAL_RELATIONS_PROVEEDO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OBRA') and o.name = 'FK_OBRA_RELATIONS_USUARIO')
alter table OBRA
   drop constraint FK_OBRA_RELATIONS_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PERSONA') and o.name = 'FK_PERSONA_RELATIONS_CARGO')
alter table PERSONA
   drop constraint FK_PERSONA_RELATIONS_CARGO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('USUARIO') and o.name = 'FK_USUARIO_RELATIONS_TIPOUSUA')
alter table USUARIO
   drop constraint FK_USUARIO_RELATIONS_TIPOUSUA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('USUARIO') and o.name = 'FK_USUARIO_RELATIONS_PERSONA')
alter table USUARIO
   drop constraint FK_USUARIO_RELATIONS_PERSONA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ACTIVIDAD')
            and   name  = 'RELATIONSHIP_8_FK'
            and   indid > 0
            and   indid < 255)
   drop index ACTIVIDAD.RELATIONSHIP_8_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ACTIVIDAD')
            and   name  = 'RELATIONSHIP_7_FK'
            and   indid > 0
            and   indid < 255)
   drop index ACTIVIDAD.RELATIONSHIP_7_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ACTIVIDAD')
            and   type = 'U')
   drop table ACTIVIDAD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AVANCE')
            and   name  = 'RELATIONSHIP_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index AVANCE.RELATIONSHIP_5_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AVANCE')
            and   type = 'U')
   drop table AVANCE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CARGO')
            and   type = 'U')
   drop table CARGO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CONTRATO')
            and   name  = 'RELATIONSHIP_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CONTRATO.RELATIONSHIP_2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CONTRATO')
            and   type = 'U')
   drop table CONTRATO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLEACTIVIDAD')
            and   name  = 'RELATIONSHIP_11_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLEACTIVIDAD.RELATIONSHIP_11_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLEACTIVIDAD')
            and   name  = 'RELATIONSHIP_10_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLEACTIVIDAD.RELATIONSHIP_10_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DETALLEACTIVIDAD')
            and   type = 'U')
   drop table DETALLEACTIVIDAD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATERIAL')
            and   name  = 'RELATIONSHIP_14_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATERIAL.RELATIONSHIP_14_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MATERIAL')
            and   type = 'U')
   drop table MATERIAL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('OBRA')
            and   name  = 'RELATIONSHIP_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index OBRA.RELATIONSHIP_3_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('OBRA')
            and   type = 'U')
   drop table OBRA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PERSONA')
            and   name  = 'RELATIONSHIP_13_FK'
            and   indid > 0
            and   indid < 255)
   drop index PERSONA.RELATIONSHIP_13_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PERSONA')
            and   type = 'U')
   drop table PERSONA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PROVEEDOR')
            and   type = 'U')
   drop table PROVEEDOR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TIPOUSUARIO')
            and   type = 'U')
   drop table TIPOUSUARIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('USUARIO')
            and   name  = 'RELATIONSHIP_12_FK'
            and   indid > 0
            and   indid < 255)
   drop index USUARIO.RELATIONSHIP_12_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('USUARIO')
            and   name  = 'RELATIONSHIP_9_FK'
            and   indid > 0
            and   indid < 255)
   drop index USUARIO.RELATIONSHIP_9_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('USUARIO')
            and   type = 'U')
   drop table USUARIO
go

/*==============================================================*/
/* Table: ACTIVIDAD                                             */
/*==============================================================*/
create table ACTIVIDAD (
   IDACTIVIDAD          int                  not null identity(1,1),
   IDOBRA               int                  not null,
   IDUSUARIO            int                  not null,
   NOMBREACTIVIDAD      varchar(50)          null,
   FECINIACTIVIDAD      date                 null,
   FECFINACTIVIDAD      date                 null,
   ESTADOACTIVIDAD      bit                  null,
   constraint PK_ACTIVIDAD primary key (IDACTIVIDAD)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_7_FK on ACTIVIDAD (IDOBRA ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_8_FK on ACTIVIDAD (IDUSUARIO ASC)
go

/*==============================================================*/
/* Table: AVANCE                                                */
/*==============================================================*/
create table AVANCE (
   IDAVANCE             int                  not null identity(1,1),
   IDACTIVIDAD          int                  not null,
   PORCENTAJEAVANCE     int                  null,
   NOMBREAVANCE         varchar(50)          null,
   DESCRIPCIONAVANCE    varchar(50)          null,
   ESTADOAVANCE         bit                  null,
   constraint PK_AVANCE primary key (IDAVANCE)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_5_FK on AVANCE (IDACTIVIDAD ASC)
go

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO (
   IDCARGO              int                  not null identity(1,1),
   NOMBRECARGO          varchar(20)          null,
   ESPECIALIDADCARGO    varchar(50)          null,
   ESTADOCARGO          bit                  null,
   constraint PK_CARGO primary key (IDCARGO)
)
go

/*==============================================================*/
/* Table: CONTRATO                                              */
/*==============================================================*/
create table CONTRATO (
   IDCONTRATO           int                  not null identity(1,1),
   IDPERSONA            int                  not null,
   PAGOHORA             numeric(6,2)         null,
   FECHAINCONT          date                 null,
   FECHAFINCONT         date                 null,
   HORADIATRABAJO       int                  null,
   ESTADOCONTRATO       bit                  null,
   constraint PK_CONTRATO primary key (IDCONTRATO)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_2_FK on CONTRATO (IDPERSONA ASC)
go

/*==============================================================*/
/* Table: DETALLEACTIVIDAD                                      */
/*==============================================================*/
create table DETALLEACTIVIDAD (
   IDDETALLEACTIVIDAD   int                  not null identity(1,1),
   IDACTIVIDAD          int                  not null,
   IDMATERIAL           int                  not null,
   CANTIDADMATERIAL     int                  null,
   constraint PK_DETALLEACTIVIDAD primary key (IDDETALLEACTIVIDAD)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_10_FK on DETALLEACTIVIDAD (IDACTIVIDAD ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_11_FK on DETALLEACTIVIDAD (IDMATERIAL ASC)
go

/*==============================================================*/
/* Table: MATERIAL                                              */
/*==============================================================*/
create table MATERIAL (
   IDMATERIAL           int                  not null identity(1,1),
   IDPROVEEDOR          int                  not null,
   NOMBREMATERIAL       varchar(50)          null,
   MARCAMATERIAL        varchar(50)          null,
   UNIMEDMATERIAL       varchar(20)          null,
   COSTOMATERIAL        numeric(6,2)         null,
   ESTADOMATERIAL       bit                  null,
   constraint PK_MATERIAL primary key (IDMATERIAL)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_14_FK on MATERIAL (IDPROVEEDOR ASC)
go

/*==============================================================*/
/* Table: OBRA                                                  */
/*==============================================================*/
create table OBRA (
   IDOBRA               int                  not null identity(1,1),
   IDUSUARIO            int                  not null,
   NOMBREOBRA           varchar(50)          null,
   UBICACIONOBRA        varchar(50)          null,
   FECINOBRA            date                 null,
   FECFINOBRA           date                 null,
   AVANCEOBRA           int                  null,
   ESTADOOBRA           bit                  null,
   constraint PK_OBRA primary key (IDOBRA)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_3_FK on OBRA (IDUSUARIO ASC)
go

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA (
   IDPERSONA            int                  not null identity(1,1),
   IDCARGO              int                  not null,
   NOMBREPERSONA        varchar(20)          null,
   APEPATPERSONA        varchar(20)          null,
   APEMATPERSONA        varchar(20)          null,
   CORREOPERSONA        varchar(20)          null,
   CELULARPERSONA       varchar(9)           null,
   constraint PK_PERSONA primary key (IDPERSONA)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_13_FK on PERSONA (IDCARGO ASC)
go

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR (
   IDPROVEEDOR          int                  not null identity(1,1),
   NOMBREPROVEEDOR      varchar(20)          null,
   RUCPROVEEDOR         char(11)             null,
   EMAILPROVEEDOR       varchar(20)          null,
   TELEFONOPROVEEDOR    varchar(9)           null,
   DIRECCIONPROVEEDOR   varchar(20)          null,
   CODCUENTAINTERBANCARIO varchar(20)          null,
   NUMDETRACCION        varchar(10)          null,
   constraint PK_PROVEEDOR primary key (IDPROVEEDOR)
)
go

/*==============================================================*/
/* Table: TIPOUSUARIO                                           */
/*==============================================================*/
create table TIPOUSUARIO (
   IDTIPOUSUARIO        int                  not null identity(1,1),
   NOMBRETIPOUSUARIO    varchar(20)          null,
   constraint PK_TIPOUSUARIO primary key (IDTIPOUSUARIO)
)
go

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   IDUSUARIO            int                  not null identity(1,1),
   IDPERSONA            int                  not null,
   IDTIPOUSUARIO        int                  not null,
   NOMBREUSUARIO        varchar(10)          null,
   CLAVEUSUARIO         varchar(10)          null,
   ESTADOUSUARIO        bit                  null,
   constraint PK_USUARIO primary key (IDUSUARIO)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_9_FK on USUARIO (IDPERSONA ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_12_FK on USUARIO (IDTIPOUSUARIO ASC)
go

alter table ACTIVIDAD
   add constraint FK_ACTIVIDA_RELATIONS_OBRA foreign key (IDOBRA)
      references OBRA (IDOBRA)
go

alter table ACTIVIDAD
   add constraint FK_ACTIVIDA_RELATIONS_USUARIO foreign key (IDUSUARIO)
      references USUARIO (IDUSUARIO)
go

alter table AVANCE
   add constraint FK_AVANCE_RELATIONS_ACTIVIDA foreign key (IDACTIVIDAD)
      references ACTIVIDAD (IDACTIVIDAD)
go

alter table CONTRATO
   add constraint FK_CONTRATO_RELATIONS_PERSONA foreign key (IDPERSONA)
      references PERSONA (IDPERSONA)
go

alter table DETALLEACTIVIDAD
   add constraint FK_DETALLEA_RELATIONS_ACTIVIDA foreign key (IDACTIVIDAD)
      references ACTIVIDAD (IDACTIVIDAD)
go

alter table DETALLEACTIVIDAD
   add constraint FK_DETALLEA_RELATIONS_MATERIAL foreign key (IDMATERIAL)
      references MATERIAL (IDMATERIAL)
go

alter table MATERIAL
   add constraint FK_MATERIAL_RELATIONS_PROVEEDO foreign key (IDPROVEEDOR)
      references PROVEEDOR (IDPROVEEDOR)
go

alter table OBRA
   add constraint FK_OBRA_RELATIONS_USUARIO foreign key (IDUSUARIO)
      references USUARIO (IDUSUARIO)
go

alter table PERSONA
   add constraint FK_PERSONA_RELATIONS_CARGO foreign key (IDCARGO)
      references CARGO (IDCARGO)
go

alter table USUARIO
   add constraint FK_USUARIO_RELATIONS_TIPOUSUA foreign key (IDTIPOUSUARIO)
      references TIPOUSUARIO (IDTIPOUSUARIO)
go

alter table USUARIO
   add constraint FK_USUARIO_RELATIONS_PERSONA foreign key (IDPERSONA)
      references PERSONA (IDPERSONA)
go

