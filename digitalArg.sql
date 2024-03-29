USE [master]
GO
/****** Object:  Database [DigitalArg]    Script Date: 11/9/2023 21:10:55 ******/
CREATE DATABASE [DigitalArg]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DigitalArg', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DigitalArg.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DigitalArg_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DigitalArg_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DigitalArg] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DigitalArg].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DigitalArg] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DigitalArg] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DigitalArg] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DigitalArg] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DigitalArg] SET ARITHABORT OFF 
GO
ALTER DATABASE [DigitalArg] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DigitalArg] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DigitalArg] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DigitalArg] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DigitalArg] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DigitalArg] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DigitalArg] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DigitalArg] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DigitalArg] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DigitalArg] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DigitalArg] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DigitalArg] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DigitalArg] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DigitalArg] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DigitalArg] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DigitalArg] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DigitalArg] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DigitalArg] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DigitalArg] SET  MULTI_USER 
GO
ALTER DATABASE [DigitalArg] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DigitalArg] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DigitalArg] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DigitalArg] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DigitalArg] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DigitalArg] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DigitalArg] SET QUERY_STORE = ON
GO
ALTER DATABASE [DigitalArg] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DigitalArg]
GO
/****** Object:  Table [dbo].[CuentaPesos]    Script Date: 11/9/2023 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaPesos](
	[idCuentaPesos] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NULL,
	[numeroCuenta] [nchar](20) NULL,
	[CVU] [nchar](22) NULL,
 CONSTRAINT [PK_CuentaPesos] PRIMARY KEY CLUSTERED 
(
	[idCuentaPesos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Monedas]    Script Date: 11/9/2023 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monedas](
	[idMoneda] [int] IDENTITY(1,1) NOT NULL,
	[nombreMoneda] [varchar](20) NOT NULL,
	[cotizacionVenta] [money] NULL,
	[cotizacionCompra] [money] NULL,
	[esCriptomoneda] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoMoneda]    Script Date: 11/9/2023 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoMoneda](
	[idMovimientoMoneda] [int] IDENTITY(1,1) NOT NULL,
	[idMovimientoPesos] [int] NOT NULL,
	[fecha] [date] NULL,
	[idMoneda] [int] NOT NULL,
	[idOperacionMoneda] [int] NOT NULL,
	[importeMoneda] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoPesos]    Script Date: 11/9/2023 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoPesos](
	[idMovimientoPesos] [int] IDENTITY(1,1) NOT NULL,
	[idCuentaPesos] [int] NULL,
	[fecha] [date] NULL,
	[idOperacionPesos] [int] NULL,
	[importe] [money] NULL,
 CONSTRAINT [PK_MovimientoPesos] PRIMARY KEY CLUSTERED 
(
	[idMovimientoPesos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperacionMoneda]    Script Date: 11/9/2023 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperacionMoneda](
	[idOperacionMoneda] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[porcentajeComision] [real] NULL,
	[esDebito] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperacionPesos]    Script Date: 11/9/2023 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperacionPesos](
	[idOperacionPesos] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[esDebito] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagoServicios]    Script Date: 11/9/2023 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoServicios](
	[idPagoServicio] [int] IDENTITY(1,1) NOT NULL,
	[idMovimientoPesos] [int] NOT NULL,
	[idServicio] [int] NOT NULL,
	[codigoDePago] [int] NOT NULL,
	[numeroFactura] [int] NOT NULL,
	[fechaVencimiento] [date] NOT NULL,
	[fechaPago] [date] NOT NULL,
	[importe] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlazosFijos]    Script Date: 11/9/2023 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlazosFijos](
	[idInversion] [int] NOT NULL,
	[idMovimientoPesos] [int] NOT NULL,
	[fechaAlta] [date] NOT NULL,
	[fechaFin] [date] NULL,
	[tasaInteres] [float] NOT NULL,
	[importeInicial] [money] NOT NULL,
	[importeFinal] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 11/9/2023 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[idServicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[idTipoServicio] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoServicio]    Script Date: 11/9/2023 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoServicio](
	[idTipoServicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 11/9/2023 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[dni] [int] NULL,
	[apellido] [nvarchar](30) NULL,
	[nombre] [nvarchar](50) NULL,
	[domicilio] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[imgDniFrente] [nvarchar](50) NULL,
	[imgDniAtras] [nvarchar](50) NULL,
	[passwordHash] [nchar](50) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CuentaPesos]  WITH CHECK ADD  CONSTRAINT [FK_CuentaPesos_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[CuentaPesos] CHECK CONSTRAINT [FK_CuentaPesos_Usuarios]
GO
ALTER TABLE [dbo].[MovimientoPesos]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoPesos_CuentaPesos] FOREIGN KEY([idMovimientoPesos])
REFERENCES [dbo].[CuentaPesos] ([idCuentaPesos])
GO
ALTER TABLE [dbo].[MovimientoPesos] CHECK CONSTRAINT [FK_MovimientoPesos_CuentaPesos]
GO
USE [master]
GO
ALTER DATABASE [DigitalArg] SET  READ_WRITE 
GO
