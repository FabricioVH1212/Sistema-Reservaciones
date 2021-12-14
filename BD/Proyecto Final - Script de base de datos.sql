USE [master]
GO
/****** Object:  Database [PV_ProyectoFinal]    Script Date: 05/11/2021 ******/
CREATE DATABASE [PV_ProyectoFinal]
 CONTAINMENT = NONE
GO
ALTER DATABASE [PV_ProyectoFinal] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PV_ProyectoFinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PV_ProyectoFinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PV_ProyectoFinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PV_ProyectoFinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PV_ProyectoFinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PV_ProyectoFinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PV_ProyectoFinal] SET  MULTI_USER 
GO
ALTER DATABASE [PV_ProyectoFinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PV_ProyectoFinal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PV_ProyectoFinal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PV_ProyectoFinal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PV_ProyectoFinal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PV_ProyectoFinal] SET QUERY_STORE = OFF
GO
USE [PV_ProyectoFinal]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 05/11/2021 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[idBitacora] [int] IDENTITY(1,1) NOT NULL,
	[idReservacion] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[accionRealizada] [varchar](25) NOT NULL,
	[fechaDeLaAccion] [datetime] NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[idBitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 05/11/2021 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion](
	[idHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[idHotel] [int] NOT NULL,
	[numeroHabitacion] [varchar](10) NOT NULL,
	[capacidadMaxima] [int] NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED 
(
	[idHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 05/11/2021 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[idHotel] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NOT NULL,
	[direccion] [varchar](500) NULL,
	[costoPorCadaAdulto] [numeric](10, 2) NOT NULL,
	[costoPorCadaNinho] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[idHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 05/11/2021 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[nombreCompleto] [varchar](250) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[clave] [varchar](15) NOT NULL,
	[esEmpleado] [bit] NOT NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservacion]    Script Date: 05/11/2021 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservacion](
	[idReservacion] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[idHabitacion] [int] NOT NULL,
	[fechaEntrada] [datetime] NOT NULL,
	[fechaSalida] [datetime] NOT NULL,
	[numeroAdultos] [int] NOT NULL,
	[numeroNinhos] [int] NOT NULL,
	[totalDiasReservacion] [int] NOT NULL,
	[costoPorCadaAdulto] [numeric](10, 2) NOT NULL,
	[costoPorCadaNinho] [numeric](10, 2) NOT NULL,
	[costoTotal] [numeric](14, 2) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Reservacion] PRIMARY KEY CLUSTERED 
(
	[idReservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bitacora] ON 
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (1, 1, 5, N'CREADA', CAST(N'2021-02-15T14:35:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (2, 1, 5, N'CANCELADA', CAST(N'2021-02-15T14:38:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (3, 2, 3, N'CREADA', CAST(N'2021-04-21T11:18:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (4, 2, 4, N'CORREGIDA', CAST(N'2021-04-21T11:19:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (5, 2, 4, N'CORREGIDA', CAST(N'2021-04-21T11:20:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (6, 3, 3, N'CREADA', CAST(N'2021-04-25T13:40:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (7, 3, 1, N'CORREGIDA', CAST(N'2021-04-25T13:41:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (8, 3, 1, N'CORREGIDA', CAST(N'2021-04-25T13:42:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (9, 3, 1, N'CORREGIDA', CAST(N'2021-04-25T13:43:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (10, 3, 5, N'CORREGIDA', CAST(N'2021-04-25T13:44:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (11, 4, 8, N'CREADA', CAST(N'2021-05-01T18:04:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (12, 4, 8, N'CORREGIDA', CAST(N'2021-05-01T18:05:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (13, 4, 8, N'CORREGIDA', CAST(N'2021-05-01T18:06:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (14, 4, 8, N'CORREGIDA', CAST(N'2021-05-01T18:07:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (15, 4, 8, N'CORREGIDA', CAST(N'2021-05-01T18:08:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (16, 4, 8, N'CORREGIDA', CAST(N'2021-05-01T18:09:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (17, 5, 1, N'CREADA', CAST(N'2021-05-04T20:11:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (18, 5, 1, N'CORREGIDA', CAST(N'2021-05-04T20:12:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (19, 5, 1, N'CORREGIDA', CAST(N'2021-05-04T20:11:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (20, 5, 1, N'CORREGIDA', CAST(N'2021-05-04T20:13:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (21, 5, 1, N'CORREGIDA', CAST(N'2021-05-04T20:14:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (22, 5, 1, N'CANCELADA', CAST(N'2021-05-04T20:15:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (23, 6, 8, N'CREADA', CAST(N'2021-05-07T09:01:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (24, 6, 1, N'CANCELADA', CAST(N'2021-05-07T09:02:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (25, 6, 1, N'CORREGIDA', CAST(N'2021-05-07T09:03:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (26, 7, 1, N'CREADA', CAST(N'2021-05-15T15:27:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (27, 7, 1, N'CORREGIDA', CAST(N'2021-05-15T15:28:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (28, 7, 1, N'CORREGIDA', CAST(N'2021-05-15T15:29:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (29, 8, 8, N'CREADA', CAST(N'2021-05-15T15:34:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (30, 9, 8, N'CREADA', CAST(N'2021-05-15T16:03:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (31, 10, 7, N'CREADA', CAST(N'2021-05-15T16:03:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (32, 11, 5, N'CREADA', CAST(N'2021-05-15T16:09:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (33, 12, 8, N'CREADA', CAST(N'2021-05-15T18:07:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (34, 13, 7, N'CREADA', CAST(N'2021-05-15T18:17:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (35, 14, 5, N'CREADA', CAST(N'2021-05-15T18:27:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (36, 15, 8, N'CREADA', CAST(N'2021-05-15T19:44:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (37, 16, 7, N'CREADA', CAST(N'2021-05-15T19:48:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (38, 17, 5, N'CREADA', CAST(N'2021-05-15T19:54:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
GO
SET IDENTITY_INSERT [dbo].[Habitacion] ON 
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (1, 1, N'R201', 1, N'Habitación individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (2, 1, N'R202', 2, N'Habitación doble de uso individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (3, 1, N'R303', 3, N'Habitación triple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (4, 1, N'R304', 4, N'Habitación cuádruple', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (5, 1, N'R305', 4, N'Habitación cuádruple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (6, 2, N'T101', 2, N'Habitación doble de uso individual', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (7, 2, N'T102', 2, N'Habitación doble de uso individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (8, 2, N'T301', 3, N'Habitación triple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (9, 2, N'T302', 3, N'Habitación triple', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (10, 2, N'T401', 4, N'Habitación cuádruple', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (11, 2, N'T402', 4, N'Habitación cuádruple', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (12, 2, N'T403', 4, N'Habitación cuádruple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (13, 3, N'H201', 2, N'Habitación doble de uso individual', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (14, 3, N'H202', 2, N'Habitación doble de uso individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (15, 3, N'H301', 3, N'Habitación triple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (16, 3, N'H302', 3, N'Habitación triple', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (17, 3, N'H303', 3, N'Habitación triple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (18, 3, N'H401', 4, N'Habitación cuádruple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (19, 3, N'H402', 4, N'Habitación cuádruple', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (20, 3, N'H403', 4, N'Habitación cuádruple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (21, 3, N'H404', 4, N'Habitación cuádruple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (22, 4, N'P101', 1, N'Habitación individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (23, 4, N'P102', 1, N'Habitación individual', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (24, 4, N'P103', 1, N'Habitación individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (25, 4, N'P104', 1, N'Habitación individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (26, 4, N'P201', 2, N'Habitación doble de uso individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (27, 4, N'P202', 2, N'Habitación doble de uso individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (28, 4, N'P203', 2, N'Habitación doble de uso individual', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (29, 4, N'P301', 3, N'Habitación triple', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (30, 4, N'P302', 3, N'Habitación triple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (31, 4, N'P303', 3, N'Habitación triple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (32, 4, N'P401', 4, N'Habitación cuádruple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (33, 4, N'P402', 4, N'Habitación cuádruple', N'A')
GO
SET IDENTITY_INSERT [dbo].[Habitacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 
GO
INSERT [dbo].[Hotel] ([idHotel], [nombre], [direccion], [costoPorCadaAdulto], [costoPorCadaNinho]) VALUES (1, N'Dreams Las Mareas', N'Playa, Provincia de Guanacaste', CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)))
GO
INSERT [dbo].[Hotel] ([idHotel], [nombre], [direccion], [costoPorCadaAdulto], [costoPorCadaNinho]) VALUES (2, N'Barceló Tambor', N'Playa Tambor, Puntarenas Tambor 771 Costa Rica Puntarenas, 11500', CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)))
GO
INSERT [dbo].[Hotel] ([idHotel], [nombre], [direccion], [costoPorCadaAdulto], [costoPorCadaNinho]) VALUES (3, N'Punta Leona', N'Punta Leona, 61102 Jacó, Costa Rica', CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)))
GO
INSERT [dbo].[Hotel] ([idHotel], [nombre], [direccion], [costoPorCadaAdulto], [costoPorCadaNinho]) VALUES (4, N'Río Perdido', N'Camino al Hotel Rio Perdido Lodge, Provincia de Guanacaste, Bagaces', CAST(89.81 AS Numeric(10, 2)), CAST(74.72 AS Numeric(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (1, N'Nadia Fonseca Masis', N'nfonseca1498@hotmail.com', N'12345', 0, N'A')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (2, N'Alberto Rivera Gutiérrez', N'alberto9684@msn.com', N'12345', 0, N'A')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (3, N'Olga Ávila Flores', N'oaflores23@gmail.com', N'12345', 1, N'I')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (4, N'Roger Pineda González', N'rpinedag46@outlook.com', N'12345', 0, N'A')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (5, N'Keren Martínez Oreamuno', N'kmartinez32@hotmail.com', N'12345', 1, N'A')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (6, N'Mauricio Tellez Cerdas', N'tellezc55@gmail.com', N'12345', 0, N'I')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (7, N'Vivian Muñoz Campos', N'vivimcampos28@outlook.com', N'12345', 0, N'A')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (8, N'Jorge Trejos Leal', N'jtleal1979@msn.com', N'12345', 1, N'A')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (9, N'Gloria Matarrita Pérez', N'gmape381@hotmail.com', N'12345', 0, N'I')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (10, N'Aaron Camacho Elizondo', N'acael147@hotmail.com', N'12345', 1, N'I')
GO
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservacion] ON 
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (1, 5, 24, CAST(N'2021-06-08T00:00:00.000' AS DateTime), CAST(N'2021-06-08T00:00:00.000' AS DateTime), 1, 0, 1, CAST(89.81 AS Numeric(10, 2)), CAST(74.72 AS Numeric(10, 2)), CAST(89.81 AS Numeric(14, 2)), CAST(N'2021-02-15T14:35:00.000' AS DateTime), CAST(N'2021-02-15T15:03:00.000' AS DateTime), N'I')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (2, 4, 17, CAST(N'2021-10-18T00:00:00.000' AS DateTime), CAST(N'2021-11-08T00:00:00.000' AS DateTime), 3, 0, 22, CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)), CAST(7978.74 AS Numeric(14, 2)), CAST(N'2021-04-21T11:18:00.000' AS DateTime), CAST(N'2021-04-24T16:57:00.000' AS DateTime), N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (3, 1, 8, CAST(N'2022-06-29T00:00:00.000' AS DateTime), CAST(N'2022-06-30T00:00:00.000' AS DateTime), 1, 2, 2, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(743.82 AS Numeric(14, 2)), CAST(N'2021-04-25T13:40:00.000' AS DateTime), CAST(N'2021-04-26T12:36:00.000' AS DateTime), N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (4, 8, 3, CAST(N'2021-09-17T00:00:00.000' AS DateTime), CAST(N'2021-09-20T00:00:00.000' AS DateTime), 2, 1, 4, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(1005.20 AS Numeric(14, 2)), CAST(N'2021-05-01T18:04:00.000' AS DateTime), CAST(N'2021-05-01T18:49:00.000' AS DateTime), N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (5, 1, 5, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 1, 2, 2, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(462.20 AS Numeric(14, 2)), CAST(N'2021-05-04T20:11:00.000' AS DateTime), CAST(N'2021-05-04T21:18:00.000' AS DateTime), N'I')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (6, 1, 12, CAST(N'2021-09-22T00:00:00.000' AS DateTime), CAST(N'2021-09-23T00:00:00.000' AS DateTime), 2, 2, 2, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(1044.28 AS Numeric(14, 2)), CAST(N'2021-05-07T09:01:00.000' AS DateTime), CAST(N'2021-05-07T09:57:00.000' AS DateTime), N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (7, 1, 20, CAST(N'2021-10-29T00:00:00.000' AS DateTime), CAST(N'2021-11-24T00:00:00.000' AS DateTime), 3, 1, 27, CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)), CAST(12104.64 AS Numeric(14, 2)), CAST(N'2021-05-15T15:27:00.000' AS DateTime), CAST(N'2021-05-15T17:34:00.000' AS DateTime), N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (8, 8, 33, CAST(N'2021-12-13T00:00:00.000' AS DateTime), CAST(N'2021-12-13T00:00:00.000' AS DateTime), 2, 2, 1, CAST(89.81 AS Numeric(10, 2)), CAST(74.72 AS Numeric(10, 2)), CAST(329.06 AS Numeric(14, 2)), CAST(N'2021-05-15T15:34:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (9, 8, 2, CAST(N'2021-12-13T00:00:00.000' AS DateTime), CAST(N'2021-12-14T00:00:00.000' AS DateTime), 1, 1, 2, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(321.60 AS Numeric(14, 2)), CAST(N'2021-05-15T16:03:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (10, 7, 3, CAST(N'2021-12-15T00:00:00.000' AS DateTime), CAST(N'2021-12-16T00:00:00.000' AS DateTime), 2, 1, 2, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(502.60 AS Numeric(14, 2)), CAST(N'2021-05-15T16:03:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (11, 5, 5, CAST(N'2021-12-15T00:00:00.000' AS DateTime), CAST(N'2021-12-15T00:00:00.000' AS DateTime), 2, 2, 1, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(321.60 AS Numeric(14, 2)), CAST(N'2021-05-15T16:09:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (12, 8, 2, CAST(N'2021-12-19T00:00:00.000' AS DateTime), CAST(N'2021-12-20T00:00:00.000' AS DateTime), 1, 1, 2, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(321.60 AS Numeric(14, 2)), CAST(N'2021-05-15T18:17:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (13, 7, 12, CAST(N'2021-12-19T00:00:00.000' AS DateTime), CAST(N'2021-12-20T00:00:00.000' AS DateTime), 2, 2, 2, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(1044.28 AS Numeric(14, 2)), CAST(N'2021-05-15T18:17:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (14, 5, 7, CAST(N'2021-12-20T00:00:00.000' AS DateTime), CAST(N'2021-12-20T00:00:00.000' AS DateTime), 2, 0, 1, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(300.46 AS Numeric(14, 2)), CAST(N'2021-05-15T18:17:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (15, 8, 18, CAST(N'2021-12-20T00:00:00.000' AS DateTime), CAST(N'2021-12-21T00:00:00.000' AS DateTime), 3, 1, 2, CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)), CAST(896.64 AS Numeric(14, 2)), CAST(N'2021-05-15T19:44:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (16, 7, 15, CAST(N'2021-12-22T00:00:00.000' AS DateTime), CAST(N'2021-12-23T00:00:00.000' AS DateTime), 1, 2, 2, CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)), CAST(584.38 AS Numeric(14, 2)), CAST(N'2021-05-15T19:44:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (17, 5, 31, CAST(N'2021-12-22T00:00:00.000' AS DateTime), CAST(N'2021-12-22T00:00:00.000' AS DateTime), 2, 1, 1, CAST(89.81 AS Numeric(10, 2)), CAST(74.72 AS Numeric(10, 2)), CAST(254.34 AS Numeric(14, 2)), CAST(N'2021-05-15T19:44:00.000' AS DateTime), NULL, N'A')
GO
SET IDENTITY_INSERT [dbo].[Reservacion] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Habitacion_hotel_numeroHabitacion]    Script Date: 05/11/2021 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Habitacion_hotel_numeroHabitacion] ON [dbo].[Habitacion]
(
	[idHotel] ASC,
	[numeroHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Persona_email]    Script Date: 05/11/2021 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Persona_email] ON [dbo].[Persona]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [DF_Persona_clave]  DEFAULT ((12345)) FOR [clave]
GO
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [DF_Persona_esEmpleado]  DEFAULT ((0)) FOR [esEmpleado]
GO
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [DF_Persona_estado]  DEFAULT ('A') FOR [estado]
GO
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Persona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Persona]
GO
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Reservacion] FOREIGN KEY([idReservacion])
REFERENCES [dbo].[Reservacion] ([idReservacion])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Reservacion]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Habitacion_Hotel] FOREIGN KEY([idHotel])
REFERENCES [dbo].[Hotel] ([idHotel])
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [FK_Habitacion_Hotel]
GO
ALTER TABLE [dbo].[Reservacion]  WITH CHECK ADD  CONSTRAINT [FK_Reservacion_Habitacion] FOREIGN KEY([idHabitacion])
REFERENCES [dbo].[Habitacion] ([idHabitacion])
GO
ALTER TABLE [dbo].[Reservacion] CHECK CONSTRAINT [FK_Reservacion_Habitacion]
GO
ALTER TABLE [dbo].[Reservacion]  WITH CHECK ADD  CONSTRAINT [FK_Reservacion_Persona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Reservacion] CHECK CONSTRAINT [FK_Reservacion_Persona]
GO
USE [master]
GO
ALTER DATABASE [PV_ProyectoFinal] SET  READ_WRITE 
GO

--Procedimiento para agregar usuario
CREATE PROCEDURE proc_AgregarUsuario
@P_nombreCompleto varchar(50),
@P_email varchar(50),
@P_clave varchar(50),
@P_esEmpleado varchar(50),
@P_estado varchar(50)
AS 
BEGIN 
INSERT INTO Persona(nombreCompleto,email,clave,esEmpleado,estado)
VALUES(@P_nombreCompleto,@P_email,@P_clave,@P_esEmpleado,@P_estado)
END;

--Procedimiento para crear la habitación
CREATE PROCEDURE proc_CrearHabitacion
@P_idHotel int,
@P_numeroHabitacion varchar(10),
@P_capacidadMaxima int,
@P_descripcion varchar(500)
AS
BEGIN
	INSERT INTO Habitacion(idHotel,numeroHabitacion,capacidadMaxima,descripcion,estado)
	VALUES(@P_idHotel,@P_numeroHabitacion,@P_capacidadMaxima,@P_descripcion,'A')
END

--Procedimiento para crear la reservación
CREATE PROCEDURE proc_CrearReservacion
@P_idPersona int,
@P_idHabitacion int,
@P_fechaEntrada datetime,
@P_fechaSalida datetime,
@P_numeroAdultos int,
@P_numeroNinho int,
@P_totalDiasReservacion int,
@P_costoPorCadaAdulto numeric,
@P_costoPorCadaNinho numeric,
@P_costoTotal numeric
AS
BEGIN
	INSERT INTO Reservacion(idPersona,idHabitacion,fechaEntrada,fechaSalida,numeroAdultos,numeroNinhos,totalDiasReservacion,costoPorCadaAdulto,costoPorCadaNinho,costoTotal,fechaCreacion,estado)
	VALUES(@P_idPersona,@P_idHabitacion,@P_fechaEntrada,@P_fechaSalida,@P_numeroAdultos,@P_numeroNinho,@P_totalDiasReservacion,@P_costoPorCadaAdulto,@P_costoPorCadaNinho,@P_costoTotal,SYSDATETIME(),'A')
END;

--Procedimiento para validar el usuario existente de la base de datos
CREATE PROCEDURE proc_ValidarUsuario
AS 
BEGIN 
	SELECT idPersona,nombreCompleto,email,clave,esEmpleado,(CASE WHEN estado = 'A' THEN 'Activo'ELSE 'Inactivo'END) AS estado 
	FROM persona 
	WHERE estado = 'A';
END;

proc_AgregarUsuario 'Leo Mora Cespedes', 'leo366021@gmail.com' , 12345 , 1 , 'A' 

--Procedimiento consultar estado por medio del id
CREATE PROCEDURE proc_ConsultarEstadoReservacion
@P_idReservacion int
AS
BEGIN
	select estado from Reservacion where idReservacion = @P_idReservacion;
END;

--Procedimiento para consultar las reservaciones del cliente
CREATE PROCEDURE proc_ConsultarUsuarioReservaciones
@P_nombre varchar(150)
AS 
BEGIN
	SELECT	RE.idReservacion,RE.idPersona,HO.nombre,RE.fechaEntrada,RE.fechaSalida,CONCAT('$',RE.costoTotal) AS costoTotal,
	 (CASE WHEN RE.estado = 'I' THEN 'Inactivo' 
      WHEN RE.estado = 'A' AND RE.fechaSalida < getdate() THEN 'Finalizada'
	  WHEN RE.estado = 'A' AND RE.fechaEntrada <= getdate() THEN 'En proceso'
	  WHEN RE.estado = 'A' AND RE.fechaEntrada > getdate() AND RE.fechaSalida > getdate() THEN 'En espera' END) AS estado
	FROM Reservacion RE
	INNER JOIN Habitacion HA ON RE.idHabitacion = HA.idHabitacion
	INNER JOIN Hotel HO ON HA.idHotel = HO.idHotel
	INNER JOIN Persona PE ON RE.idPersona = PE.idPersona
	WHERE PE.nombreCompleto = @P_nombre;
END;
--Consultar todas las reservaciones del sistema
CREATE PROCEDURE proc_ConsultarReservaciones
AS 
BEGIN
	SELECT	RE.idReservacion,PE.nombreCompleto,HO.nombre,RE.fechaEntrada,RE.fechaSalida,CONCAT('$',RE.costoTotal) AS costoTotal,
	  (CASE WHEN RE.estado = 'I' THEN 'Inactivo' 
      WHEN RE.estado = 'A' AND RE.fechaSalida < getdate() THEN 'Finalizada'
	  WHEN RE.estado = 'A' AND RE.fechaEntrada <= getdate() THEN 'En proceso'
	  WHEN RE.estado = 'A' AND RE.fechaEntrada > getdate() AND RE.fechaSalida > getdate() THEN 'En espera' END) AS estado
	FROM Reservacion RE
	INNER JOIN Habitacion HA ON RE.idHabitacion = HA.idHabitacion
	INNER JOIN Hotel HO ON HA.idHotel = HO.idHotel
	INNER JOIN Persona PE ON RE.idPersona = PE.idPersona;
END;
--Consultar los datos de la reservación por su numero de identificacion
CREATE PROCEDURE proc_ConsultarReservacionPorID
@P_idReservacion int
AS
BEGIN
	SELECT RE.idReservacion,HO.idHotel,HO.nombre,HA.numeroHabitacion,PE.nombreCompleto,RE.fechaEntrada,RE.fechaSalida,RE.numeroNinhos,RE.numeroAdultos
	FROM Reservacion RE
	INNER JOIN Habitacion HA ON RE.idHabitacion = HA.idHabitacion
	INNER JOIN Hotel HO ON HA.idHotel = HO.idHotel
	INNER JOIN Persona PE ON RE.idPersona = PE.idPersona
	WHERE Re.idReservacion = @P_idReservacion;
END;
--Consultar el detalle de reservacion
CREATE PROCEDURE proc_ConsultarDetalleReservacion
@P_idReservacion int
AS
BEGIN 
	SELECT	RE.idReservacion,PE.idPersona,HO.nombre,HA.numeroHabitacion,PE.nombreCompleto,RE.fechaEntrada,RE.fechaSalida,RE.totalDiasReservacion,RE.numeroNinhos,RE.numeroAdultos,CONCAT('$',RE.costoTotal) AS costoTotal,
	  (CASE WHEN RE.estado = 'I' THEN 'Inactivo' 
      WHEN RE.estado = 'A' AND RE.fechaSalida < getdate() THEN 'Finalizada'
	  WHEN RE.estado = 'A' AND RE.fechaEntrada <= getdate() THEN 'En proceso'
	  WHEN RE.estado = 'A' AND RE.fechaEntrada > getdate() AND RE.fechaSalida > getdate() THEN 'En espera' END) AS estado
	FROM Reservacion RE
	INNER JOIN Habitacion HA ON RE.idHabitacion = HA.idHabitacion
	INNER JOIN Hotel HO ON HA.idHotel = HO.idHotel
	INNER JOIN Persona PE ON RE.idPersona = PE.idPersona
	WHERE RE.idReservacion = @P_idReservacion;
END;
--Consultar el último ID para asignarlo al id de reservacion de la Bitacora
CREATE PROCEDURE proc_ConseguirID
AS
BEGIN
	select TOP 1 idReservacion+1 from Reservacion ORDER BY idReservacion DESC; 
END;

CREATE PROCEDURE ConsultarCapacidad
@P_idReservacion int,
@P_idHotel int
AS
BEGIN
	SELECT capacidadMaxima FROM Habitacion HA
	INNER JOIN Reservacion RE ON HA.idHabitacion = RE.idHabitacion
	WHERE HA.idHotel = @P_idHotel AND RE.idReservacion = @P_idReservacion HA.estado = 'A';
END;

--Consulto la fecha de reservacion(Esta es usada en el área de habitaciones)
CREATE PROCEDURE proc_ConsultarFechaReservacion
@P_idHabitacion int
AS
BEGIN
	select fechaEntrada,fechaSalida from Reservacion where idHabitacion = @P_idHabitacion;
END;

--Consulta la fecha de la reservación(Esta es usada en el área de reservaciones)
CREATE PROCEDURE proc_ConsultarFecha
@P_idReservacion int 
AS
BEGIN 
	SELECT fechaEntrada,fechaSalida FROM Reservacion WHERE idReservacion = @P_idReservacion;
END;

--Consulta el detalle de la bitacora
CREATE PROCEDURE proc_ConsultarDetalleBitacora
@P_idReservacion int
AS
BEGIN
	SELECT BI.fechaDeLaAccion, BI.accionRealizada,PE.nombreCompleto FROM Bitacora BI
	INNER JOIN Reservacion RE ON BI.idReservacion = RE.idReservacion
	INNER JOIN Persona PE ON RE.idPersona = PE.idPersona 
	WHERE RE.idReservacion = @P_idReservacion
	ORDER BY BI.idBitacora DESC
END;
--Procedimiento que filtra las reservaciones 
CREATE PROCEDURE proc_FiltroReservaciones
@P_idPersona int,
@P_fechaEntrada datetime,
@P_fechaSalida datetime
AS 
BEGIN
	SELECT	RE.idReservacion,PE.nombreCompleto,HO.nombre,RE.fechaEntrada,RE.fechaSalida,CONCAT('$',RE.costoTotal),RE.estado 
	FROM Reservacion RE
	INNER JOIN Habitacion HA ON RE.idHabitacion = HA.idHabitacion
	INNER JOIN Hotel HO ON HA.idHotel = HO.idHotel
	INNER JOIN Persona PE ON RE.idPersona = PE.idPersona
	WHERE PE.idPersona = @P_idPersona AND 
	(@P_fechaEntrada <= SYSDATETIME()) AND
	(@P_fechaSalida >= @P_fechaEntrada)
END;
--Consulta las habitaciones
CREATE PROCEDURE proc_ConsultarHabitaciones
AS
BEGIN
	SELECT HA.idHabitacion,HO.idHotel,HO.nombre,HA.numeroHabitacion,HA.capacidadMaxima, 
	(CASE WHEN HA.estado = 'A' THEN 'Activo'ELSE 'Inactivo'END) AS estado 
	FROM Habitacion HA
	INNER JOIN HOTEL HO ON HA.idHotel = HO.idHotel 
	ORDER BY HO.nombre, estado, HA.numeroHabitacion ASC;
END;
--Conulta el hotel
CREATE PROCEDURE proc_ConsultarHotel
AS
BEGIN
	SELECT idHotel,nombre FROM Hotel ORDER BY nombre ASC;
END;
--Consulta el hotel con un id en especifico
CREATE PROCEDURE proc_ConsultarHotelPorId
@P_idHotel int
AS
BEGIN
	SELECT idHotel,costoPorCadaAdulto,costoPorCadaNinho FROM Hotel
	WHERE idHotel = @P_idHotel
END;
--Consulta el cliente
CREATE PROCEDURE proc_ConsultarCliente
AS
BEGIN
	SELECT idPersona,nombreCompleto FROM Persona WHERE estado = 'A' AND esEmpleado = 0 ORDER BY nombreCompleto ASC; 
END;
--Consulta la habitación por un ID en especifcio
CREATE PROCEDURE proc_ConsultarHabitacionPorId
@P_idHabitacion int
AS
BEGIN 
	SELECT HA.idHabitacion,HO.idHotel,HO.nombre,HA.numeroHabitacion,HA.capacidadMaxima,HA.descripcion,Ha.estado
	FROM Habitacion HA
	INNER JOIN HOTEL HO ON HA.idHotel = HO.idHotel 
	WHERE idHabitacion = @P_idHabitacion;
END;
--Se encarga de editar la habitacion
CREATE PROCEDURE proc_EditarHabitacion
@P_idHabitacion int,
@P_idHotel int,
@P_numeroHabitacion varchar(10),
@P_capacidadMaxima int,
@P_descripcion varchar(500)
AS 
BEGIN
	UPDATE Habitacion
	SET 
	idHabitacion = @P_idHabitacion,
	idHotel = @P_idHotel,
	numeroHabitacion = @P_numeroHabitacion,
	capacidadMaxima = @P_capacidadMaxima,
	descripcion = @P_descripcion
	WHERE idHabitacion = @P_idHabitacion;
END;
--Se encarga de editar la reservacion
CREATE PROCEDURE proc_EditarReservacion
@P_idReservacion int,
@P_fechaEntrada datetime,
@P_fechaSalida datetime,
@P_numeroAdultos int,
@P_numeroNinho int,
@P_totalDiasReservacion int,
@P_costoPorCadaAdulto numeric,
@P_costoPorCadaNinho numeric,
@P_costoTotal numeric
AS 
BEGIN
	UPDATE Reservacion
	SET 
	fechaEntrada = @P_fechaEntrada,
	fechaSalida = @P_fechaSalida,
	numeroAdultos = @P_numeroAdultos,
	numeroNinhos = @P_numeroNinho,
	totalDiasReservacion = @P_totalDiasReservacion,
	costoPorCadaAdulto = @P_costoPorCadaAdulto,
	costoPorCadaNinho = @P_costoPorCadaNinho,
	costoTotal = @P_costoTotal,
	fechaModificacion = SYSDATETIME()
	WHERE idReservacion = @P_idReservacion;
END;
--Cancela la reservación
CREATE PROCEDURE proc_CancelarReservacion
@P_idReservacion int
AS
BEGIN
	UPDATE Reservacion
	SET
	fechaModificacion = SYSDATETIME(),
	estado = 'I'
	WHERE idReservacion = @P_idReservacion;
END;
--Inactiva la habitación
CREATE PROCEDURE proc_Inactivar
@P_idHabitacion int
AS 
BEGIN
	UPDATE Habitacion
	SET 
	estado = 'I'
	WHERE idHabitacion = @P_idHabitacion;
END;
--Se encarga de crear la bitacora
CREATE PROCEDURE proc_CrearBitacora
@P_idReservacion int,
@P_idPersona int
AS
BEGIN
	INSERT INTO Bitacora(idReservacion,idPersona,accionRealizada,fechaDeLaAccion)
	VALUES(@P_idReservacion,@P_idPersona,'CREADA',SYSDATETIME() ) 
END;
--Se encarga de corregir la bitacora
CREATE PROCEDURE proc_CorregirBitacora
@P_idReservacion int,
@P_idPersona int
AS
BEGIN
	INSERT INTO Bitacora(idReservacion,idPersona,accionRealizada,fechaDeLaAccion)
	VALUES(@P_idReservacion,@P_idPersona,'CORREGIDA',SYSDATETIME() ) 
END;
--Se encarga de cancelar la bitacora
CREATE PROCEDURE proc_CancelarBitacora
@P_idReservacion int,
@P_idPersona int
AS
BEGIN
	INSERT INTO Bitacora(idReservacion,idPersona,accionRealizada,fechaDeLaAccion)
	VALUES(@P_idReservacion,@P_idPersona,'CANCELADA',SYSDATETIME() ) 
END;

 











