USE [master]
GO
/****** Object:  Database [StockTracking]    Script Date: 14.04.2020 10:14:02 ******/
CREATE DATABASE [StockTracking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockTracking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\StockTracking.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockTracking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\StockTracking_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockTracking] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockTracking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockTracking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockTracking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockTracking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockTracking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockTracking] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockTracking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockTracking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockTracking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockTracking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockTracking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockTracking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockTracking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockTracking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockTracking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockTracking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockTracking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockTracking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockTracking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockTracking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockTracking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockTracking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockTracking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockTracking] SET RECOVERY FULL 
GO
ALTER DATABASE [StockTracking] SET  MULTI_USER 
GO
ALTER DATABASE [StockTracking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockTracking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockTracking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockTracking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [StockTracking] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StockTracking', N'ON'
GO
USE [StockTracking]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 14.04.2020 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[DeletedDate] [date] NULL,
 CONSTRAINT [PK_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 14.04.2020 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[DeletedDate] [date] NULL,
 CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 14.04.2020 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[StockAmount] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[DeletedDate] [date] NULL,
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES]    Script Date: 14.04.2020 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ProductSalesAmount] [int] NOT NULL,
	[ProductSalesPrice] [int] NOT NULL,
	[SalesDate] [date] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[DeletedDate] [date] NULL,
 CONSTRAINT [PK_SALES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CATEGORY] ON 

INSERT [dbo].[CATEGORY] ([ID], [CategoryName], [isDeleted], [DeletedDate]) VALUES (1, N'Category1', 0, NULL)
INSERT [dbo].[CATEGORY] ([ID], [CategoryName], [isDeleted], [DeletedDate]) VALUES (2, N'Catego2', 0, NULL)
INSERT [dbo].[CATEGORY] ([ID], [CategoryName], [isDeleted], [DeletedDate]) VALUES (3, N'Catt3', 1, CAST(N'2020-01-07' AS Date))
INSERT [dbo].[CATEGORY] ([ID], [CategoryName], [isDeleted], [DeletedDate]) VALUES (4, N'Category44', 1, CAST(N'2019-12-20' AS Date))
SET IDENTITY_INSERT [dbo].[CATEGORY] OFF
SET IDENTITY_INSERT [dbo].[CUSTOMER] ON 

INSERT [dbo].[CUSTOMER] ([ID], [CustomerName], [isDeleted], [DeletedDate]) VALUES (1, N'Customer1', 0, NULL)
INSERT [dbo].[CUSTOMER] ([ID], [CustomerName], [isDeleted], [DeletedDate]) VALUES (2, N'Custom2', 0, NULL)
INSERT [dbo].[CUSTOMER] ([ID], [CustomerName], [isDeleted], [DeletedDate]) VALUES (3, N'Custommmer3', 1, NULL)
INSERT [dbo].[CUSTOMER] ([ID], [CustomerName], [isDeleted], [DeletedDate]) VALUES (4, N'Customer4', 0, NULL)
SET IDENTITY_INSERT [dbo].[CUSTOMER] OFF
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 

INSERT [dbo].[PRODUCT] ([ID], [ProductName], [CategoryID], [StockAmount], [Price], [isDeleted], [DeletedDate]) VALUES (1, N'Product1', 1, 4, 1000, 0, NULL)
INSERT [dbo].[PRODUCT] ([ID], [ProductName], [CategoryID], [StockAmount], [Price], [isDeleted], [DeletedDate]) VALUES (2, N'Produc2', 2, 200, 2300, 1, CAST(N'2019-12-20' AS Date))
INSERT [dbo].[PRODUCT] ([ID], [ProductName], [CategoryID], [StockAmount], [Price], [isDeleted], [DeletedDate]) VALUES (3, N'Procc3', 3, 100, 321, 1, CAST(N'2020-01-07' AS Date))
INSERT [dbo].[PRODUCT] ([ID], [ProductName], [CategoryID], [StockAmount], [Price], [isDeleted], [DeletedDate]) VALUES (4, N'Producctt4', 2, 200, 430023, 1, CAST(N'2019-12-20' AS Date))
INSERT [dbo].[PRODUCT] ([ID], [ProductName], [CategoryID], [StockAmount], [Price], [isDeleted], [DeletedDate]) VALUES (5, N'Productt5', 3, 300, 5670, 1, CAST(N'2020-01-07' AS Date))
INSERT [dbo].[PRODUCT] ([ID], [ProductName], [CategoryID], [StockAmount], [Price], [isDeleted], [DeletedDate]) VALUES (6, N'Product5', 3, 100, 200, 1, CAST(N'2020-01-07' AS Date))
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
SET IDENTITY_INSERT [dbo].[SALES] ON 

INSERT [dbo].[SALES] ([ID], [ProductID], [CustomerID], [CategoryID], [ProductSalesAmount], [ProductSalesPrice], [SalesDate], [isDeleted], [DeletedDate]) VALUES (1002, 3, 1, 3, 100, 321, CAST(N'2019-12-16' AS Date), 1, CAST(N'2020-01-07' AS Date))
INSERT [dbo].[SALES] ([ID], [ProductID], [CustomerID], [CategoryID], [ProductSalesAmount], [ProductSalesPrice], [SalesDate], [isDeleted], [DeletedDate]) VALUES (1003, 2, 1, 2, 200, 2300, CAST(N'2019-12-16' AS Date), 1, CAST(N'2019-12-20' AS Date))
INSERT [dbo].[SALES] ([ID], [ProductID], [CustomerID], [CategoryID], [ProductSalesAmount], [ProductSalesPrice], [SalesDate], [isDeleted], [DeletedDate]) VALUES (1004, 1, 4, 1, 45, 1000, CAST(N'2019-12-16' AS Date), 0, CAST(N'2019-12-20' AS Date))
INSERT [dbo].[SALES] ([ID], [ProductID], [CustomerID], [CategoryID], [ProductSalesAmount], [ProductSalesPrice], [SalesDate], [isDeleted], [DeletedDate]) VALUES (1005, 2, 3, 2, 200, 2300, CAST(N'2019-12-16' AS Date), 1, CAST(N'2019-12-20' AS Date))
INSERT [dbo].[SALES] ([ID], [ProductID], [CustomerID], [CategoryID], [ProductSalesAmount], [ProductSalesPrice], [SalesDate], [isDeleted], [DeletedDate]) VALUES (1006, 4, 2, 2, 200, 430023, CAST(N'2019-12-20' AS Date), 0, NULL)
INSERT [dbo].[SALES] ([ID], [ProductID], [CustomerID], [CategoryID], [ProductSalesAmount], [ProductSalesPrice], [SalesDate], [isDeleted], [DeletedDate]) VALUES (1007, 5, 2, 3, 170, 5670, CAST(N'2019-12-20' AS Date), 1, CAST(N'2020-01-07' AS Date))
INSERT [dbo].[SALES] ([ID], [ProductID], [CustomerID], [CategoryID], [ProductSalesAmount], [ProductSalesPrice], [SalesDate], [isDeleted], [DeletedDate]) VALUES (1008, 1, 1, 1, 200, 1000, CAST(N'2019-12-20' AS Date), 1, CAST(N'2019-12-20' AS Date))
INSERT [dbo].[SALES] ([ID], [ProductID], [CustomerID], [CategoryID], [ProductSalesAmount], [ProductSalesPrice], [SalesDate], [isDeleted], [DeletedDate]) VALUES (1009, 6, 2, 3, 100, 200, CAST(N'2019-12-20' AS Date), 1, CAST(N'2020-01-07' AS Date))
INSERT [dbo].[SALES] ([ID], [ProductID], [CustomerID], [CategoryID], [ProductSalesAmount], [ProductSalesPrice], [SalesDate], [isDeleted], [DeletedDate]) VALUES (1010, 6, 2, 3, 40, 200, CAST(N'2019-12-20' AS Date), 1, CAST(N'2020-01-07' AS Date))
SET IDENTITY_INSERT [dbo].[SALES] OFF
USE [master]
GO
ALTER DATABASE [StockTracking] SET  READ_WRITE 
GO
