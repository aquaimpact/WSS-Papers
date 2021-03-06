USE [master]
GO
/****** Object:  Database [Session1]    Script Date: 09-Jan-20 2:21:27 PM ******/
CREATE DATABASE [Session1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Session1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Session1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Session1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Session1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Session1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Session1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Session1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Session1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Session1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Session1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Session1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Session1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Session1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Session1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Session1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Session1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Session1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Session1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Session1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Session1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Session1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Session1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Session1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Session1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Session1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Session1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Session1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Session1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Session1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Session1] SET  MULTI_USER 
GO
ALTER DATABASE [Session1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Session1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Session1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Session1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Session1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Session1] SET QUERY_STORE = OFF
GO
USE [Session1]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 09-Jan-20 2:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[resId] [int] IDENTITY(1,1) NOT NULL,
	[resName] [varchar](100) NOT NULL,
	[resTypeIdFK] [int] NOT NULL,
	[remainingQuantity] [int] NOT NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[resId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resource_Allocation]    Script Date: 09-Jan-20 2:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource_Allocation](
	[allocId] [int] IDENTITY(1,1) NOT NULL,
	[resIdFK] [int] NOT NULL,
	[skillIdFK] [int] NOT NULL,
 CONSTRAINT [PK_Resource_Allocation] PRIMARY KEY CLUSTERED 
(
	[allocId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resource_Type]    Script Date: 09-Jan-20 2:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource_Type](
	[resTypeId] [int] IDENTITY(1,1) NOT NULL,
	[resTypeName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Resource_Type] PRIMARY KEY CLUSTERED 
(
	[resTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 09-Jan-20 2:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[skillId] [int] IDENTITY(1,1) NOT NULL,
	[skillName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[skillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09-Jan-20 2:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [varchar](50) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[userPw] [varchar](50) NOT NULL,
	[userTypeIdFK] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Type]    Script Date: 09-Jan-20 2:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Type](
	[userTypeId] [int] IDENTITY(1,1) NOT NULL,
	[userTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User_Type] PRIMARY KEY CLUSTERED 
(
	[userTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Resource] ON 

INSERT [dbo].[Resource] ([resId], [resName], [resTypeIdFK], [remainingQuantity]) VALUES (1, N'Chair', 1, 10)
INSERT [dbo].[Resource] ([resId], [resName], [resTypeIdFK], [remainingQuantity]) VALUES (2, N'Laptop', 2, 15)
INSERT [dbo].[Resource] ([resId], [resName], [resTypeIdFK], [remainingQuantity]) VALUES (3, N'Table', 1, 12)
INSERT [dbo].[Resource] ([resId], [resName], [resTypeIdFK], [remainingQuantity]) VALUES (4, N'Coffee', 3, 2)
INSERT [dbo].[Resource] ([resId], [resName], [resTypeIdFK], [remainingQuantity]) VALUES (5, N'Snickers Bar', 3, 0)
SET IDENTITY_INSERT [dbo].[Resource] OFF
SET IDENTITY_INSERT [dbo].[Resource_Allocation] ON 

INSERT [dbo].[Resource_Allocation] ([allocId], [resIdFK], [skillIdFK]) VALUES (1, 1, 1)
INSERT [dbo].[Resource_Allocation] ([allocId], [resIdFK], [skillIdFK]) VALUES (2, 1, 2)
INSERT [dbo].[Resource_Allocation] ([allocId], [resIdFK], [skillIdFK]) VALUES (3, 2, 3)
INSERT [dbo].[Resource_Allocation] ([allocId], [resIdFK], [skillIdFK]) VALUES (4, 3, 4)
SET IDENTITY_INSERT [dbo].[Resource_Allocation] OFF
SET IDENTITY_INSERT [dbo].[Resource_Type] ON 

INSERT [dbo].[Resource_Type] ([resTypeId], [resTypeName]) VALUES (1, N'Furniture')
INSERT [dbo].[Resource_Type] ([resTypeId], [resTypeName]) VALUES (2, N'Hardware')
INSERT [dbo].[Resource_Type] ([resTypeId], [resTypeName]) VALUES (3, N'Refreshment')
SET IDENTITY_INSERT [dbo].[Resource_Type] OFF
SET IDENTITY_INSERT [dbo].[Skill] ON 

INSERT [dbo].[Skill] ([skillId], [skillName]) VALUES (1, N'Cyber Security')
INSERT [dbo].[Skill] ([skillId], [skillName]) VALUES (2, N'Software Solutions')
INSERT [dbo].[Skill] ([skillId], [skillName]) VALUES (3, N'Web Tech')
INSERT [dbo].[Skill] ([skillId], [skillName]) VALUES (4, N'Networking')
SET IDENTITY_INSERT [dbo].[Skill] OFF
INSERT [dbo].[User] ([userId], [userName], [userPw], [userTypeIdFK]) VALUES (N'12345678', N'John', N'johnPW1', 1)
INSERT [dbo].[User] ([userId], [userName], [userPw], [userTypeIdFK]) VALUES (N'44554455', N'Mary', N'maryPW2', 1)
SET IDENTITY_INSERT [dbo].[User_Type] ON 

INSERT [dbo].[User_Type] ([userTypeId], [userTypeName]) VALUES (1, N'Manager')
INSERT [dbo].[User_Type] ([userTypeId], [userTypeName]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[User_Type] OFF
ALTER TABLE [dbo].[Resource]  WITH CHECK ADD  CONSTRAINT [FK_Resource_Resource_Type] FOREIGN KEY([resTypeIdFK])
REFERENCES [dbo].[Resource_Type] ([resTypeId])
GO
ALTER TABLE [dbo].[Resource] CHECK CONSTRAINT [FK_Resource_Resource_Type]
GO
ALTER TABLE [dbo].[Resource_Allocation]  WITH CHECK ADD  CONSTRAINT [FK_Resource_Allocation_Resource] FOREIGN KEY([resIdFK])
REFERENCES [dbo].[Resource] ([resId])
GO
ALTER TABLE [dbo].[Resource_Allocation] CHECK CONSTRAINT [FK_Resource_Allocation_Resource]
GO
ALTER TABLE [dbo].[Resource_Allocation]  WITH CHECK ADD  CONSTRAINT [FK_Resource_Allocation_Skill1] FOREIGN KEY([skillIdFK])
REFERENCES [dbo].[Skill] ([skillId])
GO
ALTER TABLE [dbo].[Resource_Allocation] CHECK CONSTRAINT [FK_Resource_Allocation_Skill1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User_Type] FOREIGN KEY([userTypeIdFK])
REFERENCES [dbo].[User_Type] ([userTypeId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User_Type]
GO
USE [master]
GO
ALTER DATABASE [Session1] SET  READ_WRITE 
GO
