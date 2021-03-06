USE [master]
GO
/****** Object:  Database [TPQR Session 2]    Script Date: 09-Jan-20 2:21:53 PM ******/
CREATE DATABASE [TPQR Session 2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TPQR Session 2', FILENAME = N'D:\WSS Training\Projects\dbstuff\TPQR Session 2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TPQR Session 2_log', FILENAME = N'D:\WSS Training\Projects\dbstuff\TPQR Session 2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TPQR Session 2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TPQR Session 2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TPQR Session 2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TPQR Session 2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TPQR Session 2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TPQR Session 2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TPQR Session 2] SET ARITHABORT OFF 
GO
ALTER DATABASE [TPQR Session 2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TPQR Session 2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TPQR Session 2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TPQR Session 2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TPQR Session 2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TPQR Session 2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TPQR Session 2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TPQR Session 2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TPQR Session 2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TPQR Session 2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TPQR Session 2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TPQR Session 2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TPQR Session 2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TPQR Session 2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TPQR Session 2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TPQR Session 2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TPQR Session 2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TPQR Session 2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TPQR Session 2] SET  MULTI_USER 
GO
ALTER DATABASE [TPQR Session 2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TPQR Session 2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TPQR Session 2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TPQR Session 2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TPQR Session 2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TPQR Session 2] SET QUERY_STORE = OFF
GO
USE [TPQR Session 2]
GO
/****** Object:  Table [dbo].[Benefit]    Script Date: 09-Jan-20 2:21:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Benefit](
	[benefitId] [int] IDENTITY(1,1) NOT NULL,
	[packageIdFK] [int] NOT NULL,
	[benefitName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Benefit] PRIMARY KEY CLUSTERED 
(
	[benefitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 09-Jan-20 2:21:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[bookingId] [int] IDENTITY(1,1) NOT NULL,
	[userIdFK] [varchar](50) NOT NULL,
	[packageIdFK] [int] NOT NULL,
	[quantityBooked] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[bookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package]    Script Date: 09-Jan-20 2:21:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[packageId] [int] IDENTITY(1,1) NOT NULL,
	[packageTier] [varchar](50) NOT NULL,
	[packageName] [varchar](100) NOT NULL,
	[packageValue] [bigint] NOT NULL,
	[packageQuantity] [int] NOT NULL,
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[packageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09-Jan-20 2:21:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[passwd] [varchar](50) NOT NULL,
	[userTypeIdFK] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Type]    Script Date: 09-Jan-20 2:21:53 PM ******/
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
SET IDENTITY_INSERT [dbo].[Benefit] ON 

INSERT [dbo].[Benefit] ([benefitId], [packageIdFK], [benefitName]) VALUES (1, 1, N'Online')
INSERT [dbo].[Benefit] ([benefitId], [packageIdFK], [benefitName]) VALUES (2, 1, N'Flyer')
INSERT [dbo].[Benefit] ([benefitId], [packageIdFK], [benefitName]) VALUES (3, 1, N'Banner')
INSERT [dbo].[Benefit] ([benefitId], [packageIdFK], [benefitName]) VALUES (4, 2, N'Online')
INSERT [dbo].[Benefit] ([benefitId], [packageIdFK], [benefitName]) VALUES (5, 2, N'Flyer')
INSERT [dbo].[Benefit] ([benefitId], [packageIdFK], [benefitName]) VALUES (6, 3, N'Flyer')
INSERT [dbo].[Benefit] ([benefitId], [packageIdFK], [benefitName]) VALUES (7, 3, N'Banner')
INSERT [dbo].[Benefit] ([benefitId], [packageIdFK], [benefitName]) VALUES (8, 4, N'Online')
SET IDENTITY_INSERT [dbo].[Benefit] OFF
SET IDENTITY_INSERT [dbo].[Package] ON 

INSERT [dbo].[Package] ([packageId], [packageTier], [packageName], [packageValue], [packageQuantity]) VALUES (1, N'Gold', N'Top Tier', 55000, 5)
INSERT [dbo].[Package] ([packageId], [packageTier], [packageName], [packageValue], [packageQuantity]) VALUES (2, N'Silver', N'Set A', 25000, 10)
INSERT [dbo].[Package] ([packageId], [packageTier], [packageName], [packageValue], [packageQuantity]) VALUES (3, N'Silver', N'Set B', 17000, 0)
INSERT [dbo].[Package] ([packageId], [packageTier], [packageName], [packageValue], [packageQuantity]) VALUES (4, N'Bronze', N'Entry Level', 4000, 15)
SET IDENTITY_INSERT [dbo].[Package] OFF
INSERT [dbo].[User] ([userId], [name], [passwd], [userTypeIdFK]) VALUES (N'abc12345', N'John', N'johnp1', 1)
INSERT [dbo].[User] ([userId], [name], [passwd], [userTypeIdFK]) VALUES (N'abcd4455', N'Mary', N'maryp2', 1)
INSERT [dbo].[User] ([userId], [name], [passwd], [userTypeIdFK]) VALUES (N'comp1234', N'Microsoft', N'micro1', 2)
INSERT [dbo].[User] ([userId], [name], [passwd], [userTypeIdFK]) VALUES (N'comp2233', N'IBM', N'ibm2', 2)
SET IDENTITY_INSERT [dbo].[User_Type] ON 

INSERT [dbo].[User_Type] ([userTypeId], [userTypeName]) VALUES (1, N'Manager')
INSERT [dbo].[User_Type] ([userTypeId], [userTypeName]) VALUES (2, N'Sponsor')
SET IDENTITY_INSERT [dbo].[User_Type] OFF
ALTER TABLE [dbo].[Benefit]  WITH CHECK ADD  CONSTRAINT [FK_Benefit_Package] FOREIGN KEY([packageIdFK])
REFERENCES [dbo].[Package] ([packageId])
GO
ALTER TABLE [dbo].[Benefit] CHECK CONSTRAINT [FK_Benefit_Package]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Package] FOREIGN KEY([packageIdFK])
REFERENCES [dbo].[Package] ([packageId])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Package]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_User] FOREIGN KEY([userIdFK])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User_Type] FOREIGN KEY([userTypeIdFK])
REFERENCES [dbo].[User_Type] ([userTypeId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User_Type]
GO
USE [master]
GO
ALTER DATABASE [TPQR Session 2] SET  READ_WRITE 
GO
