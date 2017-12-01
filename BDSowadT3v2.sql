USE [BDSowadT3]
GO
/****** Object:  Database [BDSowadT3]    Script Date: 29/11/2017 11:09:14 p.m. ******/
CREATE DATABASE [BDSowadT3] ON  PRIMARY 
( NAME = N'BDSowadT3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\BDSowadT3.mdf' , SIZE = 20480KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDSowadT3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\BDSowadT3_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BDSowadT3] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDSowadT3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDSowadT3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDSowadT3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDSowadT3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDSowadT3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDSowadT3] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDSowadT3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDSowadT3] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BDSowadT3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDSowadT3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDSowadT3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDSowadT3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDSowadT3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDSowadT3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDSowadT3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDSowadT3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDSowadT3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDSowadT3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDSowadT3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDSowadT3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDSowadT3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDSowadT3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDSowadT3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDSowadT3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDSowadT3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDSowadT3] SET  MULTI_USER 
GO
ALTER DATABASE [BDSowadT3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDSowadT3] SET DB_CHAINING OFF 
GO
USE [BDSowadT3]
GO
/****** Object:  User [test]    Script Date: 29/11/2017 11:09:15 p.m. ******/
CREATE USER [test] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  StoredProcedure [dbo].[spBuscarObra]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spBuscarObra]
@strnombobra varchar(50)
as
set nocount on

select IDOBRA, NOMBREOBRA, UBICACIONOBRA
from OBRA
where NOMBREOBRA = @strnombobra AND ESTADOOBRA = 1

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spBuscarPersona]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spBuscarPersona]
@strapepatpersona varchar(20)
as
set nocount on

select IDPERSONA, NOMBREPERSONA, APEPATPERSONA, APEMATPERSONA
from PERSONA
where APEPATPERSONA = @strapepatpersona

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spEditarActividad]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spEditarActividad]
@intidactividad int,
@strnombactividad varchar(50),
@strfecinact varchar(30),
@strfecfinact varchar(30)
as
begin

update ACTIVIDAD
set NOMBREACTIVIDAD = @strnombactividad, FECINIACTIVIDAD = CONVERT(date, @strfecinact),
FECFINACTIVIDAD = CONVERT(date, @strfecfinact)
where IDACTIVIDAD = @intidactividad;

end
GO
/****** Object:  StoredProcedure [dbo].[spEditarAvance]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spEditarAvance]
@intidavance int,
@intporcentajeavance int,
@strnombavance varchar(50),
@strdescavance varchar(50)
as
begin

update AVANCE
set PORCENTAJEAVANCE = @intporcentajeavance, NOMBREAVANCE = @strnombavance,
DESCRIPCIONAVANCE = @strdescavance
where IDAVANCE = @intidavance;

end
GO
/****** Object:  StoredProcedure [dbo].[spEditarContrato]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spEditarContrato]
@intidcontrato int,
@floatpagohora numeric(6,2),
@strfecincont varchar(30),
@strfecfincont varchar(30),
@inthoradiatrabajo int
as
begin

update CONTRATO
set PAGOHORA = @floatpagohora, FECHAINCONT = @strfecincont, @strfecfincont = @strfecfincont,
HORADIATRABAJO = @inthoradiatrabajo
where IDCONTRATO = @intidcontrato;

end
GO
/****** Object:  StoredProcedure [dbo].[spEditarMaterial]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spEditarMaterial]
@intidmaterial int,
@intidproveedor int,
@strnombmaterial varchar(50),
@strmarcmaterial varchar(50),
@strunimedmaterial varchar(20),
@floatcostomaterial numeric(6,2)
as
begin

update MATERIAL
set IDPROVEEDOR = @intidproveedor, NOMBREMATERIAL = @strnombmaterial, MARCAMATERIAL = @strmarcmaterial,
UNIMEDMATERIAL = @strunimedmaterial, COSTOMATERIAL = @floatcostomaterial
where IDMATERIAL = @intidmaterial;

end
GO
/****** Object:  StoredProcedure [dbo].[spEditarObra]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spEditarObra]
@intidobra int,
@strnombobra varchar(50),
@strubiobra varchar(50),
@strfecinobra varchar(30),
@strfecfinobra varchar(30)
as
begin

update OBRA
set NOMBREOBRA = @strnombobra, UBICACIONOBRA = @strubiobra, FECINOBRA = @strfecinobra,
FECFINOBRA = @strfecfinobra
where IDOBRA = @intidobra;

end
GO
/****** Object:  StoredProcedure [dbo].[spEditarPersona]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spEditarPersona]
@intidpersona int,
@intidcargo int,
@strnombpersona varchar(20),
@strapepatpersona varchar(20),
@strapematpersona varchar(20),
@strcorreopersona varchar(20),
@strcelularpersona varchar(9)
as
begin

update PERSONA
set IDCARGO = @intidcargo, NOMBREPERSONA = @strnombpersona, APEPATPERSONA = @strapepatpersona, APEMATPERSONA = @strapematpersona,
CORREOPERSONA = @strcorreopersona, CELULARPERSONA = @strcelularpersona
where IDPERSONA = @intidpersona;

end
GO
/****** Object:  StoredProcedure [dbo].[spEditarUsuario]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spEditarUsuario]
@intidusuario int,
@inttipousuario int,
@strnombusu varchar(10),
@strclaveusu varchar(10)
as
begin

update USUARIO
set IDTIPOUSUARIO = @inttipousuario, NOMBREUSUARIO = @strnombusu, CLAVEUSUARIO = @strclaveusu
where IDUSUARIO = @intidusuario;

end
GO
/****** Object:  StoredProcedure [dbo].[spEliminarPersona]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spEliminarPersona]
@intidpersona int
as
begin

delete from USUARIO where IDUSUARIO in (select u.IDUSUARIO from USUARIO u inner join PERSONA p on u.IDPERSONA = p.IDPERSONA where u.IDPERSONA = @intidpersona)
delete from PERSONA where IDPERSONA = @intidpersona

end
GO
/****** Object:  StoredProcedure [dbo].[spEstadoActividad]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spEstadoActividad]
@intidactividad int,
@bitestadoactividad bit
as
begin

update ACTIVIDAD
set ESTADOACTIVIDAD = @bitestadoactividad
where IDACTIVIDAD = @intidactividad;

end
GO
/****** Object:  StoredProcedure [dbo].[spEstadoContrato]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spEstadoContrato]
@intidcontrato int,
@bitestadocontrato bit
as
begin

update CONTRATO
set ESTADOCONTRATO = @bitestadocontrato
where IDCONTRATO = @intidcontrato;

end
GO
/****** Object:  StoredProcedure [dbo].[spEstadoMaterial]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spEstadoMaterial]
@intidmaterial int,
@bitestadomaterial bit
as
begin

update MATERIAL
set ESTADOMATERIAL = @bitestadomaterial
where IDMATERIAL = @intidmaterial;

end
GO
/****** Object:  StoredProcedure [dbo].[spEstadoObra]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spEstadoObra]
@intidobra int,
@bitestadobora bit
as
begin

update OBRA
set ESTADOOBRA = @bitestadobora
where IDOBRA = @intidobra;

end
GO
/****** Object:  StoredProcedure [dbo].[spEstadoUsuario]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spEstadoUsuario]
@intidusuario int,
@bitestadousuario bit
as
begin

update USUARIO
set ESTADOUSUARIO = @bitestadousuario
where IDUSUARIO = @intidusuario;

end
GO
/****** Object:  StoredProcedure [dbo].[spInsertarActividad]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertarActividad]
@intidobra int,
@intidusuario int,
@strnombactividad varchar(50),
@strfecinact varchar(30),
@strfecfinact varchar(30)
as
begin

insert into ACTIVIDAD (IDOBRA, IDUSUARIO, NOMBREACTIVIDAD, FECINIACTIVIDAD, FECFINACTIVIDAD, ESTADOACTIVIDAD)
values (@intidobra, @intidusuario, @strnombactividad, CONVERT(date, @strfecinact), CONVERT(date, @strfecfinact), 1)

end
GO
/****** Object:  StoredProcedure [dbo].[spInsertarAvance]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertarAvance]
@intidactividad int,
@intporcentajeavance int,
@strnombavance varchar(50),
@strdescavance varchar(50)
as
begin

insert into AVANCE (IDACTIVIDAD, PORCENTAJEAVANCE, NOMBREAVANCE, DESCRIPCIONAVANCE, ESTADOAVANCE)
values (@intidactividad, @intporcentajeavance, @strnombavance, @strdescavance, 1)

end
GO
/****** Object:  StoredProcedure [dbo].[spInsertarContrato]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertarContrato]
@intidpersona int,
@floatpagohora numeric(6,2),
@strfecincont varchar(30),
@strfecfincont varchar(30),
@inthoradiatrabajo int
as
begin

insert into CONTRATO (IDPERSONA, PAGOHORA, FECHAINCONT, FECHAFINCONT, HORADIATRABAJO, ESTADOCONTRATO)
values (@intidpersona, @floatpagohora, CONVERT(date, @strfecincont), CONVERT(date, @strfecfincont), @inthoradiatrabajo, 1)

end
GO
/****** Object:  StoredProcedure [dbo].[spInsertarDetalleActividad]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertarDetalleActividad]
@intidactividad int,
@intidmaterial int,
@intcantidadmaterial int
as
begin

insert into DETALLEACTIVIDAD (IDACTIVIDAD, IDMATERIAL, CANTIDADMATERIAL)
values (@intidactividad, @intidmaterial, @intcantidadmaterial)

end
GO
/****** Object:  StoredProcedure [dbo].[spInsertarMaterial]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertarMaterial]
@intidproveedor int,
@strnombmaterial varchar(50),
@strmarcamaterial varchar(50),
@strunimedmaterial varchar(20),
@floatcostomaterial numeric(6,2)
as
begin

insert into MATERIAL (IDPROVEEDOR, NOMBREMATERIAL, MARCAMATERIAL, UNIMEDMATERIAL, COSTOMATERIAL, ESTADOMATERIAL)
values (@intidproveedor, @strnombmaterial, @strmarcamaterial, @strunimedmaterial, @floatcostomaterial, 1)

end
GO
/****** Object:  StoredProcedure [dbo].[spInsertarObra]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertarObra]
@intidusuario int,
@strnombreobra varchar(50),
@strubicacionobra varchar(50),
@datefecinobra varchar(30),
@datefecfinobra varchar(30)
as
begin

insert into OBRA (IDUSUARIO, NOMBREOBRA, UBICACIONOBRA, FECINOBRA, FECFINOBRA, AVANCEOBRA, ESTADOOBRA)
values (@intidusuario, @strnombreobra, @strubicacionobra, CONVERT(date, @datefecinobra), CONVERT(date, @datefecfinobra), 0, 1)

end
GO
/****** Object:  StoredProcedure [dbo].[spInsertarPersona]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertarPersona]
@intidcargo int,
@strnombpersona varchar(20),
@strapepatpersona varchar(20),
@strapematpersona varchar(20),
@strcorreopersona varchar(20),
@strcelularpersona varchar(9)
as
begin

insert into PERSONA (IDCARGO, NOMBREPERSONA, APEPATPERSONA, APEMATPERSONA, CORREOPERSONA, CELULARPERSONA)
values (@intidcargo, @strnombpersona, @strapepatpersona, @strapematpersona, @strcorreopersona, @strcelularpersona)

end
GO
/****** Object:  StoredProcedure [dbo].[spInsertarUsuario]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertarUsuario]
@intidpersona int,
@inttipousuario int,
@strnomusu varchar(10),
@strclaveusu varchar(10)
as
begin

insert into USUARIO (IDPERSONA, IDTIPOUSUARIO, NOMBREUSUARIO, CLAVEUSUARIO, ESTADOUSUARIO)
values (@intidpersona, @inttipousuario, @strnomusu, @strclaveusu, 1)

end
GO
/****** Object:  StoredProcedure [dbo].[spListarActividad]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spListarActividad]
as
set nocount on

select a.IDACTIVIDAD, a.NOMBREACTIVIDAD, o.NOMBREOBRA, p.APEPATPERSONA, p.APEMATPERSONA, a.FECINIACTIVIDAD, a.FECFINACTIVIDAD, a.ESTADOACTIVIDAD
from ACTIVIDAD a inner join OBRA o on a.IDOBRA = o.IDOBRA
inner join USUARIO u on a.IDUSUARIO = u.IDUSUARIO
inner join PERSONA p on u.IDPERSONA = p.IDPERSONA

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spListarActividadB]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spListarActividadB]
@intidobra int
as
set nocount on

select IDACTIVIDAD, NOMBREACTIVIDAD, FECINIACTIVIDAD, FECFINACTIVIDAD
from ACTIVIDAD
where IDOBRA = @intidobra

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spListarAvance]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spListarAvance]
@intidactividad int
as
set nocount on

select IDAVANCE, NOMBREAVANCE, DESCRIPCIONAVANCE, PORCENTAJEAVANCE, ESTADOAVANCE
from AVANCE
where IDACTIVIDAD = @intidactividad

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spListarAvanceB]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spListarAvanceB]
@intidactividad int
as
set nocount on

select IDAVANCE, NOMBREAVANCE, PORCENTAJEAVANCE
from AVANCE
where IDACTIVIDAD = @intidactividad

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spListarCargoCombo]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spListarCargoCombo]
as
set nocount on

select IDCARGO, NOMBRECARGO
from CARGO
where ESTADOCARGO = 1

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spListarContrato]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spListarContrato]
as
set nocount on

select c.IDCONTRATO, p.APEPATPERSONA, c.PAGOHORA, c.FECHAINCONT, c.FECHAFINCONT, c.HORADIATRABAJO, c.ESTADOCONTRATO
from CONTRATO c inner join PERSONA p on c.IDPERSONA = p.IDPERSONA

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spListarMaterial]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spListarMaterial]
as
set nocount on

select m.IDMATERIAL, p.NOMBREPROVEEDOR, m.NOMBREMATERIAL, m.MARCAMATERIAL, m.COSTOMATERIAL, m.ESTADOMATERIAL
from MATERIAL m inner join PROVEEDOR p on m.IDPROVEEDOR = p.IDPROVEEDOR

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spListarMaterialCombo]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spListarMaterialCombo]
as
set nocount on

select IDMATERIAL, NOMBREMATERIAL
from MATERIAL
where ESTADOMATERIAL = 1

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spListarObra]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spListarObra]
@intidusuario int
as
set nocount on

select o.IDOBRA, p.APEPATPERSONA, o.NOMBREOBRA, o.UBICACIONOBRA, o.FECINOBRA, o.FECFINOBRA, o.AVANCEOBRA, o.ESTADOOBRA
from OBRA o inner join USUARIO u on o.IDUSUARIO = u.IDUSUARIO
inner join PERSONA p on u.IDPERSONA = p.IDPERSONA
where o.IDUSUARIO = @intidusuario

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spListarObraB]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spListarObraB]
as
set nocount on

select IDOBRA, NOMBREOBRA, UBICACIONOBRA
from OBRA
where ESTADOOBRA = 1

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spListarPersona]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spListarPersona]
as
set nocount on

select p.IDPERSONA, c.NOMBRECARGO, p.NOMBREPERSONA, p.APEPATPERSONA, p.APEMATPERSONA, p.CORREOPERSONA, p.CELULARPERSONA
from PERSONA p inner join CARGO c on p.IDCARGO = c.IDCARGO

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spListarProveedorCombo]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spListarProveedorCombo]
as
set nocount on

select IDPROVEEDOR, NOMBREPROVEEDOR
from PROVEEDOR

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spListarTipoUsuarioCombo]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spListarTipoUsuarioCombo]
as
set nocount on

select IDTIPOUSUARIO, NOMBRETIPOUSUARIO
from TIPOUSUARIO

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spListarUsuario]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spListarUsuario]
as
set nocount on

select u.IDUSUARIO, u.NOMBREUSUARIO, u.CLAVEUSUARIO, tu.NOMBRETIPOUSUARIO, p.APEPATPERSONA, p.NOMBREPERSONA, p.CORREOPERSONA, u.ESTADOUSUARIO
from USUARIO u inner join TIPOUSUARIO tu on u.IDTIPOUSUARIO = tu.IDTIPOUSUARIO
inner join PERSONA p on u.IDPERSONA = p.IDPERSONA

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spObtenerActividad]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spObtenerActividad]
@intidactividad int
as
set nocount on

select IDOBRA, NOMBREACTIVIDAD, FECINIACTIVIDAD, FECFINACTIVIDAD
from ACTIVIDAD
where IDACTIVIDAD = @intidactividad

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spObtenerActividadUltima]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spObtenerActividadUltima]
as
set nocount on

select TOP 1 IDACTIVIDAD
from ACTIVIDAD
order by IDACTIVIDAD desc

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spObtenerAvance]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spObtenerAvance]
@intidavance int
as
set nocount on

select PORCENTAJEAVANCE, NOMBREAVANCE, DESCRIPCIONAVANCE
from AVANCE
where IDAVANCE = @intidavance

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spObtenerContrato]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spObtenerContrato]
@intidcontrato int
as
set nocount on

select IDCONTRATO, PAGOHORA, FECHAINCONT, FECHAFINCONT, HORADIATRABAJO
from CONTRATO
where IDCONTRATO = @intidcontrato

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spObtenerMaterial]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spObtenerMaterial]
@intidmaterial int
as
set nocount on

select IDMATERIAL, IDPROVEEDOR, NOMBREMATERIAL, MARCAMATERIAL, UNIMEDMATERIAL, COSTOMATERIAL
from MATERIAL
where IDMATERIAL = @intidmaterial

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spObtenerObra]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spObtenerObra]
@intidobra int
as
set nocount on

select NOMBREOBRA, UBICACIONOBRA, FECINOBRA, FECFINOBRA
from OBRA
where IDOBRA = @intidobra

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPersona]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spObtenerPersona]
@intidpersona int
as
set nocount on

select IDPERSONA, IDCARGO, NOMBREPERSONA, APEPATPERSONA, APEMATPERSONA, CORREOPERSONA, CELULARPERSONA
from PERSONA
where IDPERSONA = @intidpersona

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spObtenerUsuario]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spObtenerUsuario]
@intidusuario int
as
set nocount on

select IDUSUARIO, IDTIPOUSUARIO, NOMBREUSUARIO, CLAVEUSUARIO
from USUARIO
where IDUSUARIO = @intidusuario

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spVerificarAcceso]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spVerificarAcceso]
@strnomusu varchar(10),
@strclaveusu varchar(10)
as
set nocount on

select IDUSUARIO, IDTIPOUSUARIO, ESTADOUSUARIO 
from USUARIO
where NOMBREUSUARIO = @strnomusu AND CLAVEUSUARIO = @strclaveusu

set nocount off
GO
/****** Object:  Table [dbo].[ACTIVIDAD]    Script Date: 29/11/2017 11:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACTIVIDAD](
	[IDACTIVIDAD] [int] IDENTITY(1,1) NOT NULL,
	[IDOBRA] [int] NOT NULL,
	[IDUSUARIO] [int] NOT NULL,
	[NOMBREACTIVIDAD] [varchar](50) NULL,
	[FECINIACTIVIDAD] [date] NULL,
	[FECFINACTIVIDAD] [date] NULL,
	[ESTADOACTIVIDAD] [bit] NULL,
 CONSTRAINT [PK_ACTIVIDAD] PRIMARY KEY CLUSTERED 
(
	[IDACTIVIDAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AVANCE]    Script Date: 29/11/2017 11:09:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AVANCE](
	[IDAVANCE] [int] IDENTITY(1,1) NOT NULL,
	[IDACTIVIDAD] [int] NOT NULL,
	[PORCENTAJEAVANCE] [int] NULL,
	[NOMBREAVANCE] [varchar](50) NULL,
	[DESCRIPCIONAVANCE] [varchar](50) NULL,
	[ESTADOAVANCE] [bit] NULL,
 CONSTRAINT [PK_AVANCE] PRIMARY KEY CLUSTERED 
(
	[IDAVANCE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CARGO]    Script Date: 29/11/2017 11:09:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CARGO](
	[IDCARGO] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRECARGO] [varchar](20) NULL,
	[ESPECIALIDADCARGO] [varchar](50) NULL,
	[ESTADOCARGO] [bit] NULL,
 CONSTRAINT [PK_CARGO] PRIMARY KEY CLUSTERED 
(
	[IDCARGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONTRATO]    Script Date: 29/11/2017 11:09:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTRATO](
	[IDCONTRATO] [int] IDENTITY(1,1) NOT NULL,
	[IDPERSONA] [int] NOT NULL,
	[PAGOHORA] [numeric](6, 2) NULL,
	[FECHAINCONT] [date] NULL,
	[FECHAFINCONT] [date] NULL,
	[HORADIATRABAJO] [int] NULL,
	[ESTADOCONTRATO] [bit] NULL,
 CONSTRAINT [PK_CONTRATO] PRIMARY KEY CLUSTERED 
(
	[IDCONTRATO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DETALLEACTIVIDAD]    Script Date: 29/11/2017 11:09:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLEACTIVIDAD](
	[IDDETALLEACTIVIDAD] [int] IDENTITY(1,1) NOT NULL,
	[IDACTIVIDAD] [int] NOT NULL,
	[IDMATERIAL] [int] NOT NULL,
	[CANTIDADMATERIAL] [int] NULL,
 CONSTRAINT [PK_DETALLEACTIVIDAD] PRIMARY KEY CLUSTERED 
(
	[IDDETALLEACTIVIDAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MATERIAL]    Script Date: 29/11/2017 11:09:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MATERIAL](
	[IDMATERIAL] [int] IDENTITY(1,1) NOT NULL,
	[IDPROVEEDOR] [int] NOT NULL,
	[NOMBREMATERIAL] [varchar](50) NULL,
	[MARCAMATERIAL] [varchar](50) NULL,
	[UNIMEDMATERIAL] [varchar](20) NULL,
	[COSTOMATERIAL] [numeric](6, 2) NULL,
	[ESTADOMATERIAL] [bit] NULL,
 CONSTRAINT [PK_MATERIAL] PRIMARY KEY CLUSTERED 
(
	[IDMATERIAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OBRA]    Script Date: 29/11/2017 11:09:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OBRA](
	[IDOBRA] [int] IDENTITY(1,1) NOT NULL,
	[IDUSUARIO] [int] NOT NULL,
	[NOMBREOBRA] [varchar](50) NULL,
	[UBICACIONOBRA] [varchar](50) NULL,
	[FECINOBRA] [date] NULL,
	[FECFINOBRA] [date] NULL,
	[AVANCEOBRA] [int] NULL,
	[ESTADOOBRA] [bit] NULL,
 CONSTRAINT [PK_OBRA] PRIMARY KEY CLUSTERED 
(
	[IDOBRA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERSONA]    Script Date: 29/11/2017 11:09:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERSONA](
	[IDPERSONA] [int] IDENTITY(1,1) NOT NULL,
	[IDCARGO] [int] NOT NULL,
	[NOMBREPERSONA] [varchar](20) NULL,
	[APEPATPERSONA] [varchar](20) NULL,
	[APEMATPERSONA] [varchar](20) NULL,
	[CORREOPERSONA] [varchar](20) NULL,
	[CELULARPERSONA] [varchar](9) NULL,
 CONSTRAINT [PK_PERSONA] PRIMARY KEY CLUSTERED 
(
	[IDPERSONA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROVEEDOR]    Script Date: 29/11/2017 11:09:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROVEEDOR](
	[IDPROVEEDOR] [int] IDENTITY(1,1) NOT NULL,
	[NOMBREPROVEEDOR] [varchar](20) NULL,
	[RUCPROVEEDOR] [char](11) NULL,
	[EMAILPROVEEDOR] [varchar](20) NULL,
	[TELEFONOPROVEEDOR] [varchar](9) NULL,
	[DIRECCIONPROVEEDOR] [varchar](20) NULL,
	[CODCUENTAINTERBANCARIO] [varchar](20) NULL,
	[NUMDETRACCION] [varchar](10) NULL,
 CONSTRAINT [PK_PROVEEDOR] PRIMARY KEY CLUSTERED 
(
	[IDPROVEEDOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TIPOUSUARIO]    Script Date: 29/11/2017 11:09:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TIPOUSUARIO](
	[IDTIPOUSUARIO] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRETIPOUSUARIO] [varchar](20) NULL,
 CONSTRAINT [PK_TIPOUSUARIO] PRIMARY KEY CLUSTERED 
(
	[IDTIPOUSUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 29/11/2017 11:09:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IDUSUARIO] [int] IDENTITY(1,1) NOT NULL,
	[IDPERSONA] [int] NOT NULL,
	[IDTIPOUSUARIO] [int] NOT NULL,
	[NOMBREUSUARIO] [varchar](10) NULL,
	[CLAVEUSUARIO] [varchar](10) NULL,
	[ESTADOUSUARIO] [bit] NULL,
 CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED 
(
	[IDUSUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ACTIVIDAD] ON 

INSERT [dbo].[ACTIVIDAD] ([IDACTIVIDAD], [IDOBRA], [IDUSUARIO], [NOMBREACTIVIDAD], [FECINIACTIVIDAD], [FECFINACTIVIDAD], [ESTADOACTIVIDAD]) VALUES (2, 5, 1, N'Actividad1', CAST(0xCB2B0B00 AS Date), CAST(0x652C0B00 AS Date), 1)
INSERT [dbo].[ACTIVIDAD] ([IDACTIVIDAD], [IDOBRA], [IDUSUARIO], [NOMBREACTIVIDAD], [FECINIACTIVIDAD], [FECFINACTIVIDAD], [ESTADOACTIVIDAD]) VALUES (3, 5, 1, N'Actividad3', CAST(0xAE2B0B00 AS Date), CAST(0xCD2B0B00 AS Date), 1)
INSERT [dbo].[ACTIVIDAD] ([IDACTIVIDAD], [IDOBRA], [IDUSUARIO], [NOMBREACTIVIDAD], [FECINIACTIVIDAD], [FECFINACTIVIDAD], [ESTADOACTIVIDAD]) VALUES (4, 6, 1, N'Actividad5', CAST(0x6D3D0B00 AS Date), CAST(0x8C3D0B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[ACTIVIDAD] OFF
SET IDENTITY_INSERT [dbo].[AVANCE] ON 

INSERT [dbo].[AVANCE] ([IDAVANCE], [IDACTIVIDAD], [PORCENTAJEAVANCE], [NOMBREAVANCE], [DESCRIPCIONAVANCE], [ESTADOAVANCE]) VALUES (1, 2, 20, N'Avance1', N'Descripcionavance', 1)
INSERT [dbo].[AVANCE] ([IDAVANCE], [IDACTIVIDAD], [PORCENTAJEAVANCE], [NOMBREAVANCE], [DESCRIPCIONAVANCE], [ESTADOAVANCE]) VALUES (2, 2, 50, N'Avance2', N'Descripcionavance', 1)
INSERT [dbo].[AVANCE] ([IDAVANCE], [IDACTIVIDAD], [PORCENTAJEAVANCE], [NOMBREAVANCE], [DESCRIPCIONAVANCE], [ESTADOAVANCE]) VALUES (3, 2, 40, N'Avance3', N'Descripcionavance', 1)
INSERT [dbo].[AVANCE] ([IDAVANCE], [IDACTIVIDAD], [PORCENTAJEAVANCE], [NOMBREAVANCE], [DESCRIPCIONAVANCE], [ESTADOAVANCE]) VALUES (4, 3, 45, N'Avance1', N'Descripcionavance', 1)
SET IDENTITY_INSERT [dbo].[AVANCE] OFF
SET IDENTITY_INSERT [dbo].[CARGO] ON 

INSERT [dbo].[CARGO] ([IDCARGO], [NOMBRECARGO], [ESPECIALIDADCARGO], [ESTADOCARGO]) VALUES (1, N'Jefe', N'Administrador', 1)
INSERT [dbo].[CARGO] ([IDCARGO], [NOMBRECARGO], [ESPECIALIDADCARGO], [ESTADOCARGO]) VALUES (2, N'Trabajador', N'Obrero', 1)
INSERT [dbo].[CARGO] ([IDCARGO], [NOMBRECARGO], [ESPECIALIDADCARGO], [ESTADOCARGO]) VALUES (3, N'Supervisor', N'Ingeniero', 1)
SET IDENTITY_INSERT [dbo].[CARGO] OFF
SET IDENTITY_INSERT [dbo].[CONTRATO] ON 

INSERT [dbo].[CONTRATO] ([IDCONTRATO], [IDPERSONA], [PAGOHORA], [FECHAINCONT], [FECHAFINCONT], [HORADIATRABAJO], [ESTADOCONTRATO]) VALUES (1, 1, CAST(11.00 AS Numeric(6, 2)), CAST(0xDF280B00 AS Date), CAST(0x4D2A0B00 AS Date), 8, 1)
INSERT [dbo].[CONTRATO] ([IDCONTRATO], [IDPERSONA], [PAGOHORA], [FECHAINCONT], [FECHAFINCONT], [HORADIATRABAJO], [ESTADOCONTRATO]) VALUES (2, 2, CAST(5.20 AS Numeric(6, 2)), CAST(0xE23C0B00 AS Date), CAST(0xB83D0B00 AS Date), 5, 1)
SET IDENTITY_INSERT [dbo].[CONTRATO] OFF
SET IDENTITY_INSERT [dbo].[DETALLEACTIVIDAD] ON 

INSERT [dbo].[DETALLEACTIVIDAD] ([IDDETALLEACTIVIDAD], [IDACTIVIDAD], [IDMATERIAL], [CANTIDADMATERIAL]) VALUES (2, 2, 1, 50)
INSERT [dbo].[DETALLEACTIVIDAD] ([IDDETALLEACTIVIDAD], [IDACTIVIDAD], [IDMATERIAL], [CANTIDADMATERIAL]) VALUES (3, 3, 1, 100)
INSERT [dbo].[DETALLEACTIVIDAD] ([IDDETALLEACTIVIDAD], [IDACTIVIDAD], [IDMATERIAL], [CANTIDADMATERIAL]) VALUES (4, 3, 2, 20)
SET IDENTITY_INSERT [dbo].[DETALLEACTIVIDAD] OFF
SET IDENTITY_INSERT [dbo].[MATERIAL] ON 

INSERT [dbo].[MATERIAL] ([IDMATERIAL], [IDPROVEEDOR], [NOMBREMATERIAL], [MARCAMATERIAL], [UNIMEDMATERIAL], [COSTOMATERIAL], [ESTADOMATERIAL]) VALUES (1, 1, N'material1', N'marca1', N'kg', CAST(25.20 AS Numeric(6, 2)), 1)
INSERT [dbo].[MATERIAL] ([IDMATERIAL], [IDPROVEEDOR], [NOMBREMATERIAL], [MARCAMATERIAL], [UNIMEDMATERIAL], [COSTOMATERIAL], [ESTADOMATERIAL]) VALUES (2, 1, N'material2', N'marca1', N'g', CAST(50.50 AS Numeric(6, 2)), 1)
INSERT [dbo].[MATERIAL] ([IDMATERIAL], [IDPROVEEDOR], [NOMBREMATERIAL], [MARCAMATERIAL], [UNIMEDMATERIAL], [COSTOMATERIAL], [ESTADOMATERIAL]) VALUES (3, 1, N'material3', N'marca2', N'kg', CAST(15.30 AS Numeric(6, 2)), 1)
SET IDENTITY_INSERT [dbo].[MATERIAL] OFF
SET IDENTITY_INSERT [dbo].[OBRA] ON 

INSERT [dbo].[OBRA] ([IDOBRA], [IDUSUARIO], [NOMBREOBRA], [UBICACIONOBRA], [FECINOBRA], [FECFINOBRA], [AVANCEOBRA], [ESTADOOBRA]) VALUES (5, 1, N'Obra1', N'UbicacionObra', CAST(0xAB2B0B00 AS Date), CAST(0x1A2D0B00 AS Date), 50, 1)
INSERT [dbo].[OBRA] ([IDOBRA], [IDUSUARIO], [NOMBREOBRA], [UBICACIONOBRA], [FECINOBRA], [FECFINOBRA], [AVANCEOBRA], [ESTADOOBRA]) VALUES (6, 1, N'Obra2', N'UbicacionObra2', CAST(0x403D0B00 AS Date), CAST(0xFD3D0B00 AS Date), 0, 1)
INSERT [dbo].[OBRA] ([IDOBRA], [IDUSUARIO], [NOMBREOBRA], [UBICACIONOBRA], [FECINOBRA], [FECFINOBRA], [AVANCEOBRA], [ESTADOOBRA]) VALUES (7, 1, N'Obra3', N'UbicacionObra3', CAST(0x8C3E0B00 AS Date), CAST(0xA93F0B00 AS Date), 0, 1)
INSERT [dbo].[OBRA] ([IDOBRA], [IDUSUARIO], [NOMBREOBRA], [UBICACIONOBRA], [FECINOBRA], [FECFINOBRA], [AVANCEOBRA], [ESTADOOBRA]) VALUES (12, 1, N'Obra4', N'UbicacionObra4', CAST(0x6A3C0B00 AS Date), CAST(0xD63D0B00 AS Date), 0, 1)
SET IDENTITY_INSERT [dbo].[OBRA] OFF
SET IDENTITY_INSERT [dbo].[PERSONA] ON 

INSERT [dbo].[PERSONA] ([IDPERSONA], [IDCARGO], [NOMBREPERSONA], [APEPATPERSONA], [APEMATPERSONA], [CORREOPERSONA], [CELULARPERSONA]) VALUES (1, 1, N'persona1', N'apemat', N'apepat', N'correo@example.com', N'123456')
INSERT [dbo].[PERSONA] ([IDPERSONA], [IDCARGO], [NOMBREPERSONA], [APEPATPERSONA], [APEMATPERSONA], [CORREOPERSONA], [CELULARPERSONA]) VALUES (2, 3, N'persona2', N'apemat2', N'apepat2', N'correo2@example.com', N'123457')
INSERT [dbo].[PERSONA] ([IDPERSONA], [IDCARGO], [NOMBREPERSONA], [APEPATPERSONA], [APEMATPERSONA], [CORREOPERSONA], [CELULARPERSONA]) VALUES (3, 2, N'persona3', N'apemat3', N'apepat3', N'correo3@example.com', N'123458')
SET IDENTITY_INSERT [dbo].[PERSONA] OFF
SET IDENTITY_INSERT [dbo].[PROVEEDOR] ON 

INSERT [dbo].[PROVEEDOR] ([IDPROVEEDOR], [NOMBREPROVEEDOR], [RUCPROVEEDOR], [EMAILPROVEEDOR], [TELEFONOPROVEEDOR], [DIRECCIONPROVEEDOR], [CODCUENTAINTERBANCARIO], [NUMDETRACCION]) VALUES (1, N'Proveedor1', N'12345678911', N'provedor@correo.com', N'123456789', N'direccionp', N'f5c3d69', N'50000')
SET IDENTITY_INSERT [dbo].[PROVEEDOR] OFF
SET IDENTITY_INSERT [dbo].[TIPOUSUARIO] ON 

INSERT [dbo].[TIPOUSUARIO] ([IDTIPOUSUARIO], [NOMBRETIPOUSUARIO]) VALUES (1, N'Web')
INSERT [dbo].[TIPOUSUARIO] ([IDTIPOUSUARIO], [NOMBRETIPOUSUARIO]) VALUES (2, N'Movil')
INSERT [dbo].[TIPOUSUARIO] ([IDTIPOUSUARIO], [NOMBRETIPOUSUARIO]) VALUES (3, N'Escritorio')
SET IDENTITY_INSERT [dbo].[TIPOUSUARIO] OFF
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([IDUSUARIO], [IDPERSONA], [IDTIPOUSUARIO], [NOMBREUSUARIO], [CLAVEUSUARIO], [ESTADOUSUARIO]) VALUES (1, 1, 1, N'uwebb', N'124', 1)
INSERT [dbo].[USUARIO] ([IDUSUARIO], [IDPERSONA], [IDTIPOUSUARIO], [NOMBREUSUARIO], [CLAVEUSUARIO], [ESTADOUSUARIO]) VALUES (3, 2, 3, N'udesktop', N'125', 1)
INSERT [dbo].[USUARIO] ([IDUSUARIO], [IDPERSONA], [IDTIPOUSUARIO], [NOMBREUSUARIO], [CLAVEUSUARIO], [ESTADOUSUARIO]) VALUES (4, 1, 3, N'n1usu', N'555', 1)
INSERT [dbo].[USUARIO] ([IDUSUARIO], [IDPERSONA], [IDTIPOUSUARIO], [NOMBREUSUARIO], [CLAVEUSUARIO], [ESTADOUSUARIO]) VALUES (5, 1, 3, N'n2usu', N'333', 1)
INSERT [dbo].[USUARIO] ([IDUSUARIO], [IDPERSONA], [IDTIPOUSUARIO], [NOMBREUSUARIO], [CLAVEUSUARIO], [ESTADOUSUARIO]) VALUES (6, 1, 1, N'n1web', N'776', 1)
INSERT [dbo].[USUARIO] ([IDUSUARIO], [IDPERSONA], [IDTIPOUSUARIO], [NOMBREUSUARIO], [CLAVEUSUARIO], [ESTADOUSUARIO]) VALUES (7, 1, 1, N'n2web', N'999', 1)
INSERT [dbo].[USUARIO] ([IDUSUARIO], [IDPERSONA], [IDTIPOUSUARIO], [NOMBREUSUARIO], [CLAVEUSUARIO], [ESTADOUSUARIO]) VALUES (8, 2, 3, N'n2desktop', N'563', 1)
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
/****** Object:  Index [RELATIONSHIP_7_FK]    Script Date: 29/11/2017 11:09:16 p.m. ******/
CREATE NONCLUSTERED INDEX [RELATIONSHIP_7_FK] ON [dbo].[ACTIVIDAD]
(
	[IDOBRA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RELATIONSHIP_8_FK]    Script Date: 29/11/2017 11:09:16 p.m. ******/
CREATE NONCLUSTERED INDEX [RELATIONSHIP_8_FK] ON [dbo].[ACTIVIDAD]
(
	[IDUSUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RELATIONSHIP_5_FK]    Script Date: 29/11/2017 11:09:16 p.m. ******/
CREATE NONCLUSTERED INDEX [RELATIONSHIP_5_FK] ON [dbo].[AVANCE]
(
	[IDACTIVIDAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RELATIONSHIP_2_FK]    Script Date: 29/11/2017 11:09:16 p.m. ******/
CREATE NONCLUSTERED INDEX [RELATIONSHIP_2_FK] ON [dbo].[CONTRATO]
(
	[IDPERSONA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RELATIONSHIP_10_FK]    Script Date: 29/11/2017 11:09:16 p.m. ******/
CREATE NONCLUSTERED INDEX [RELATIONSHIP_10_FK] ON [dbo].[DETALLEACTIVIDAD]
(
	[IDACTIVIDAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RELATIONSHIP_11_FK]    Script Date: 29/11/2017 11:09:16 p.m. ******/
CREATE NONCLUSTERED INDEX [RELATIONSHIP_11_FK] ON [dbo].[DETALLEACTIVIDAD]
(
	[IDMATERIAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RELATIONSHIP_14_FK]    Script Date: 29/11/2017 11:09:16 p.m. ******/
CREATE NONCLUSTERED INDEX [RELATIONSHIP_14_FK] ON [dbo].[MATERIAL]
(
	[IDPROVEEDOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RELATIONSHIP_3_FK]    Script Date: 29/11/2017 11:09:16 p.m. ******/
CREATE NONCLUSTERED INDEX [RELATIONSHIP_3_FK] ON [dbo].[OBRA]
(
	[IDUSUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RELATIONSHIP_13_FK]    Script Date: 29/11/2017 11:09:16 p.m. ******/
CREATE NONCLUSTERED INDEX [RELATIONSHIP_13_FK] ON [dbo].[PERSONA]
(
	[IDCARGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RELATIONSHIP_12_FK]    Script Date: 29/11/2017 11:09:16 p.m. ******/
CREATE NONCLUSTERED INDEX [RELATIONSHIP_12_FK] ON [dbo].[USUARIO]
(
	[IDTIPOUSUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RELATIONSHIP_9_FK]    Script Date: 29/11/2017 11:09:16 p.m. ******/
CREATE NONCLUSTERED INDEX [RELATIONSHIP_9_FK] ON [dbo].[USUARIO]
(
	[IDPERSONA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK_ACTIVIDA_RELATIONS_OBRA] FOREIGN KEY([IDOBRA])
REFERENCES [dbo].[OBRA] ([IDOBRA])
GO
ALTER TABLE [dbo].[ACTIVIDAD] CHECK CONSTRAINT [FK_ACTIVIDA_RELATIONS_OBRA]
GO
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK_ACTIVIDA_RELATIONS_USUARIO] FOREIGN KEY([IDUSUARIO])
REFERENCES [dbo].[USUARIO] ([IDUSUARIO])
GO
ALTER TABLE [dbo].[ACTIVIDAD] CHECK CONSTRAINT [FK_ACTIVIDA_RELATIONS_USUARIO]
GO
ALTER TABLE [dbo].[AVANCE]  WITH CHECK ADD  CONSTRAINT [FK_AVANCE_RELATIONS_ACTIVIDA] FOREIGN KEY([IDACTIVIDAD])
REFERENCES [dbo].[ACTIVIDAD] ([IDACTIVIDAD])
GO
ALTER TABLE [dbo].[AVANCE] CHECK CONSTRAINT [FK_AVANCE_RELATIONS_ACTIVIDA]
GO
ALTER TABLE [dbo].[CONTRATO]  WITH CHECK ADD  CONSTRAINT [FK_CONTRATO_RELATIONS_PERSONA] FOREIGN KEY([IDPERSONA])
REFERENCES [dbo].[PERSONA] ([IDPERSONA])
GO
ALTER TABLE [dbo].[CONTRATO] CHECK CONSTRAINT [FK_CONTRATO_RELATIONS_PERSONA]
GO
ALTER TABLE [dbo].[DETALLEACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK_DETALLEA_RELATIONS_ACTIVIDA] FOREIGN KEY([IDACTIVIDAD])
REFERENCES [dbo].[ACTIVIDAD] ([IDACTIVIDAD])
GO
ALTER TABLE [dbo].[DETALLEACTIVIDAD] CHECK CONSTRAINT [FK_DETALLEA_RELATIONS_ACTIVIDA]
GO
ALTER TABLE [dbo].[DETALLEACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK_DETALLEA_RELATIONS_MATERIAL] FOREIGN KEY([IDMATERIAL])
REFERENCES [dbo].[MATERIAL] ([IDMATERIAL])
GO
ALTER TABLE [dbo].[DETALLEACTIVIDAD] CHECK CONSTRAINT [FK_DETALLEA_RELATIONS_MATERIAL]
GO
ALTER TABLE [dbo].[MATERIAL]  WITH CHECK ADD  CONSTRAINT [FK_MATERIAL_RELATIONS_PROVEEDO] FOREIGN KEY([IDPROVEEDOR])
REFERENCES [dbo].[PROVEEDOR] ([IDPROVEEDOR])
GO
ALTER TABLE [dbo].[MATERIAL] CHECK CONSTRAINT [FK_MATERIAL_RELATIONS_PROVEEDO]
GO
ALTER TABLE [dbo].[OBRA]  WITH CHECK ADD  CONSTRAINT [FK_OBRA_RELATIONS_USUARIO] FOREIGN KEY([IDUSUARIO])
REFERENCES [dbo].[USUARIO] ([IDUSUARIO])
GO
ALTER TABLE [dbo].[OBRA] CHECK CONSTRAINT [FK_OBRA_RELATIONS_USUARIO]
GO
ALTER TABLE [dbo].[PERSONA]  WITH CHECK ADD  CONSTRAINT [FK_PERSONA_RELATIONS_CARGO] FOREIGN KEY([IDCARGO])
REFERENCES [dbo].[CARGO] ([IDCARGO])
GO
ALTER TABLE [dbo].[PERSONA] CHECK CONSTRAINT [FK_PERSONA_RELATIONS_CARGO]
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_RELATIONS_PERSONA] FOREIGN KEY([IDPERSONA])
REFERENCES [dbo].[PERSONA] ([IDPERSONA])
GO
ALTER TABLE [dbo].[USUARIO] CHECK CONSTRAINT [FK_USUARIO_RELATIONS_PERSONA]
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_RELATIONS_TIPOUSUA] FOREIGN KEY([IDTIPOUSUARIO])
REFERENCES [dbo].[TIPOUSUARIO] ([IDTIPOUSUARIO])
GO
ALTER TABLE [dbo].[USUARIO] CHECK CONSTRAINT [FK_USUARIO_RELATIONS_TIPOUSUA]
GO
USE [master]
GO
ALTER DATABASE [BDSowadT3] SET  READ_WRITE 
GO
