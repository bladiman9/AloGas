USE [master]
GO
/****** Object:  Database [Alogas]    Script Date: 23/11/2017 10:10:58 p.m. ******/
CREATE DATABASE [Alogas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Alogas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Alogas.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Alogas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Alogas_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Alogas] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Alogas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Alogas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Alogas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Alogas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Alogas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Alogas] SET ARITHABORT OFF 
GO
ALTER DATABASE [Alogas] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Alogas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Alogas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Alogas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Alogas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Alogas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Alogas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Alogas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Alogas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Alogas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Alogas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Alogas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Alogas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Alogas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Alogas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Alogas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Alogas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Alogas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Alogas] SET  MULTI_USER 
GO
ALTER DATABASE [Alogas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Alogas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Alogas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Alogas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Alogas] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Alogas]
GO
/****** Object:  User [usuario]    Script Date: 23/11/2017 10:10:58 p.m. ******/
CREATE USER [usuario] FOR LOGIN [usuario] WITH DEFAULT_SCHEMA=[alogas_squema]
GO
/****** Object:  User [Robertg]    Script Date: 23/11/2017 10:10:58 p.m. ******/
CREATE USER [Robertg] FOR LOGIN [Robertg] WITH DEFAULT_SCHEMA=[alog_squema]
GO
/****** Object:  Schema [alog_squema]    Script Date: 23/11/2017 10:10:58 p.m. ******/
CREATE SCHEMA [alog_squema]
GO
/****** Object:  Schema [alogas_squema]    Script Date: 23/11/2017 10:10:58 p.m. ******/
CREATE SCHEMA [alogas_squema]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 23/11/2017 10:10:58 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cliente](
	[dni_cliente] [int] NOT NULL,
	[nombre] [nvarchar](40) NULL,
	[apellido] [nvarchar](40) NULL,
	[direccion] [nvarchar](40) NULL,
	[telefono] [varchar](10) NULL,
 CONSTRAINT [pk_dnicliente] PRIMARY KEY CLUSTERED 
(
	[dni_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 23/11/2017 10:10:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[dni] [int] NOT NULL DEFAULT ((16549864)),
	[usuario] [nvarchar](10) NOT NULL DEFAULT ('Robertg'),
	[contraseña] [nvarchar](10) NOT NULL DEFAULT ('alogas'),
	[nombre] [nvarchar](40) NOT NULL DEFAULT ('Roberto'),
	[apellido] [nvarchar](40) NOT NULL DEFAULT ('Gutierrez'),
 CONSTRAINT [pk_usuarioempleado] PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[producto]    Script Date: 23/11/2017 10:10:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id_producto] [int] NOT NULL,
	[fecha] [date] NOT NULL DEFAULT (CONVERT([date],sysdatetime())),
	[descripcion] [nvarchar](20) NULL DEFAULT ('balon'),
	[unidad_media] [int] NULL,
	[precio] [float] NULL,
	[tipo_balon] [nvarchar](10) NULL,
	[dni] [int] NOT NULL DEFAULT ((16549864)),
	[usuario] [nvarchar](10) NOT NULL DEFAULT ('Robertg'),
 CONSTRAINT [pk_id_producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stock]    Script Date: 23/11/2017 10:10:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock](
	[id_producto] [int] NULL,
	[stock_] [int] NULL,
	[usuario] [nvarchar](10) NOT NULL DEFAULT ('Robertg')
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[venta]    Script Date: 23/11/2017 10:10:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[cod_venta] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL DEFAULT (CONVERT([date],sysdatetime())),
	[precio] [float] NULL,
	[dni_cliente] [int] NULL,
	[usuario] [nvarchar](10) NOT NULL DEFAULT ('Robertg'),
	[dni] [int] NOT NULL DEFAULT ((16549864)),
	[nombres] [nvarchar](40) NULL,
	[direccion] [nvarchar](40) NULL,
	[tipo_balon] [nvarchar](10) NULL,
	[producto] [nvarchar](10) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[cliente] ([dni_cliente], [nombre], [apellido], [direccion], [telefono]) VALUES (16549865, N'Rolando ', N'Rubio Flores', N'Jr. Cayoma 267', N'948909696')
INSERT [dbo].[cliente] ([dni_cliente], [nombre], [apellido], [direccion], [telefono]) VALUES (16798546, N'Luis Miguel', N'Rubio Ramos', N'El Sol de Mexico', N'971663708')
INSERT [dbo].[empleado] ([dni], [usuario], [contraseña], [nombre], [apellido]) VALUES (16549864, N'Robertg', N'alogas', N'Roberto', N'Gutierrez')
INSERT [dbo].[producto] ([id_producto], [fecha], [descripcion], [unidad_media], [precio], [tipo_balon], [dni], [usuario]) VALUES (1, CAST(N'2017-11-06' AS Date), N'balon', 1, 28.5, N'económico', 16549864, N'Robertg')
INSERT [dbo].[producto] ([id_producto], [fecha], [descripcion], [unidad_media], [precio], [tipo_balon], [dni], [usuario]) VALUES (2, CAST(N'2017-11-06' AS Date), N'balon', 1, 30, N'normal', 16549864, N'Robertg')
INSERT [dbo].[producto] ([id_producto], [fecha], [descripcion], [unidad_media], [precio], [tipo_balon], [dni], [usuario]) VALUES (3, CAST(N'2017-11-06' AS Date), N'balon', 1, 35, N'premium', 16549864, N'Robertg')
INSERT [dbo].[stock] ([id_producto], [stock_], [usuario]) VALUES (NULL, 30, N'Robertg')
SET IDENTITY_INSERT [dbo].[venta] ON 

INSERT [dbo].[venta] ([cod_venta], [fecha], [precio], [dni_cliente], [usuario], [dni], [nombres], [direccion], [tipo_balon], [producto]) VALUES (1, CAST(N'2017-11-08' AS Date), 35, 48666933, N'Robertg', 16549864, N'Johor Rubio', N'Jr. Ambar 267', N'Premium', NULL)
INSERT [dbo].[venta] ([cod_venta], [fecha], [precio], [dni_cliente], [usuario], [dni], [nombres], [direccion], [tipo_balon], [producto]) VALUES (3, CAST(N'2017-11-08' AS Date), 35, 98654598, N'Robertg', 16549864, N'José Gutierrez', N'Jr. Carcamo 845', N'Premium', NULL)
INSERT [dbo].[venta] ([cod_venta], [fecha], [precio], [dni_cliente], [usuario], [dni], [nombres], [direccion], [tipo_balon], [producto]) VALUES (4, CAST(N'2017-11-08' AS Date), 28, 48589823, N'Robertg', 16549864, N'Luis Ramirez', N'Jr. Cayoma', N'Premium', NULL)
SET IDENTITY_INSERT [dbo].[venta] OFF
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [fk_usuario] FOREIGN KEY([dni])
REFERENCES [dbo].[empleado] ([dni])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [fk_usuario]
GO
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [fk_id_productostock] FOREIGN KEY([id_producto])
REFERENCES [dbo].[producto] ([id_producto])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [fk_id_productostock]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [fk_id_dniem] FOREIGN KEY([dni])
REFERENCES [dbo].[empleado] ([dni])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [fk_id_dniem]
GO
/****** Object:  StoredProcedure [dbo].[Buscar_balon]    Script Date: 23/11/2017 10:10:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Buscar_balon](@id_producto int)
as begin
select id_producto, tipo_balon, unidad_media, precio from producto where id_producto=@id_producto
end

GO
/****** Object:  StoredProcedure [dbo].[Buscar_cliente]    Script Date: 23/11/2017 10:10:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Buscar_cliente](@dni_cliente int)
as begin
select * from cliente where dni_cliente=@dni_cliente
end

GO
/****** Object:  StoredProcedure [dbo].[Buscar_venta]    Script Date: 23/11/2017 10:10:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Buscar_venta](@cod_venta int)
as begin
select  cod_venta, dni_cliente, nombres ,direccion ,tipo_balon ,precio from venta where cod_venta=@cod_venta
end

GO
/****** Object:  StoredProcedure [dbo].[Eliminar_balon]    Script Date: 23/11/2017 10:10:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Eliminar_balon](@id_producto int)
as begin
delete from producto where id_producto=@id_producto
end

GO
/****** Object:  StoredProcedure [dbo].[Eliminar_cliente]    Script Date: 23/11/2017 10:10:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Eliminar_cliente](@dni_cliente int)
as begin
delete from cliente where dni_cliente=@dni_cliente
end

GO
/****** Object:  StoredProcedure [dbo].[Eliminar_venta]    Script Date: 23/11/2017 10:10:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Eliminar_venta](@cod_venta int)
as begin
delete from venta where cod_venta=@cod_venta
end

GO
/****** Object:  StoredProcedure [dbo].[Entrada_balon]    Script Date: 23/11/2017 10:10:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Entrada_balon](@id_producto int, @tipo_balon nvarchar(10), @unidad_media int,
@precio float )
as begin
insert into producto  (id_producto, tipo_balon,unidad_media,precio) values(@id_producto, @tipo_balon,@unidad_media, @precio)
end

GO
/****** Object:  StoredProcedure [dbo].[Entrada_cliente]    Script Date: 23/11/2017 10:10:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Entrada_cliente](@dni_cliente int, @nombre nvarchar(40), @apellido nvarchar(40), @direccion nvarchar(40), @telefono varchar(10))
as begin
insert into cliente values (@dni_cliente, @nombre, @apellido, @direccion, @telefono)
end

GO
/****** Object:  StoredProcedure [dbo].[Entrada_venta]    Script Date: 23/11/2017 10:10:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Entrada_venta] ( @dni_cliente int, @nombres nvarchar(40), @direccion nvarchar(40), @tipo_balon nvarchar(10), @precio float )
as begin
insert into venta(dni_cliente,nombres, direccion, tipo_balon, precio) values(@dni_cliente, @nombres, @direccion,@tipo_balon,@precio)
end

GO
USE [master]
GO
ALTER DATABASE [Alogas] SET  READ_WRITE 
GO
