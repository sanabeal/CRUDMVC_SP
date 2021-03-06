USE [master]
GO
/****** Object:  Database [Demo]    Script Date: 4/24/2021 9:41:20 PM ******/
CREATE DATABASE [Demo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Demo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Demo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Demo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Demo] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Demo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Demo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Demo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Demo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Demo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Demo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Demo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Demo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Demo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Demo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Demo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Demo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Demo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Demo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Demo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Demo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Demo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Demo] SET RECOVERY FULL 
GO
ALTER DATABASE [Demo] SET  MULTI_USER 
GO
ALTER DATABASE [Demo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Demo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Demo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Demo] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Demo', N'ON'
GO
ALTER DATABASE [Demo] SET QUERY_STORE = OFF
GO
USE [Demo]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Demo]
GO
/****** Object:  User [test]    Script Date: 4/24/2021 9:41:21 PM ******/
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/24/2021 9:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Address] [varchar](300) NULL,
	[Mobileno] [varchar](15) NULL,
	[Birthdate] [datetime] NULL,
	[EmailID] [varchar](300) NULL,
 CONSTRAINT [PK__Customer__A4AE64B8E05EE47B] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [Name], [Address], [Mobileno], [Birthdate], [EmailID]) VALUES (1, N'kabir 2', N'Panjeree Publications Ltd.', N'01723678442', CAST(N'2021-04-24T00:00:00.000' AS DateTime), N'sanabeal@gmail.')
INSERT [dbo].[Customer] ([CustomerID], [Name], [Address], [Mobileno], [Birthdate], [EmailID]) VALUES (2, N'test', N'Panjeree Publications Ltd.', N'01723678442', CAST(N'2021-04-25T00:00:00.000' AS DateTime), N'sanabeal@gmail.')
INSERT [dbo].[Customer] ([CustomerID], [Name], [Address], [Mobileno], [Birthdate], [EmailID]) VALUES (3, N'test', N'Panjeree Publications Ltd.', N'01723678442', CAST(N'2021-04-23T00:00:00.000' AS DateTime), N'sanabeal@gmail.')
INSERT [dbo].[Customer] ([CustomerID], [Name], [Address], [Mobileno], [Birthdate], [EmailID]) VALUES (4, N'test 2', N'Panjeree Publications Ltd.', N'01723678442', CAST(N'2021-04-24T00:00:00.000' AS DateTime), N'sanabeal.kabir@')
INSERT [dbo].[Customer] ([CustomerID], [Name], [Address], [Mobileno], [Birthdate], [EmailID]) VALUES (5, N'kabir', N'Dhaka, Bangladesh', N'01723678443', CAST(N'2021-04-30T00:00:00.000' AS DateTime), N'sanabeal.kabir@')
SET IDENTITY_INSERT [dbo].[Customer] OFF
/****** Object:  StoredProcedure [dbo].[SP_CRUD_Customer]    Script Date: 4/24/2021 9:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CRUD_Customer]

@CustomerID BIGINT = 0

,@Name NVARCHAR(100) = NULL

,@Mobileno NVARCHAR(15) = NULL

,@Address NVARCHAR(300) = 0

,@Birthdate DATETIME = NULL

,@EmailID NVARCHAR(15) = NULL

,@Query INT

AS

BEGIN

IF (@Query = 1)

BEGIN

INSERT INTO Customer(

NAME

,Address

,Mobileno

,Birthdate

,EmailID

)

VALUES (

@Name

,@Address

,@Mobileno

,@Birthdate

,@EmailID

)

 

IF (@@ROWCOUNT > 0)

BEGIN

SELECT 'Insert'

END

END

 

IF (@Query = 2)

BEGIN

UPDATE Customer

SET NAME = @Name

,Address = @Address

,Mobileno = @Mobileno

,Birthdate = @Birthdate

,EmailID = @EmailID

WHERE Customer.CustomerID = @CustomerID

 

SELECT 'Update'

END

 

IF (@Query = 3)

BEGIN

DELETE

FROM Customer

WHERE Customer.CustomerID = @CustomerID

 

SELECT 'Deleted'

END

 

IF (@Query = 4)

BEGIN

SELECT *

FROM Customer

END

END

 

IF (@Query = 5)

BEGIN

SELECT *

FROM Customer

WHERE Customer.CustomerID = @CustomerID

END
GO
USE [master]
GO
ALTER DATABASE [Demo] SET  READ_WRITE 
GO
