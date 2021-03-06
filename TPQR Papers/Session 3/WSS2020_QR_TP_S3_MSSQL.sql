USE [master]
GO
/****** Object:  Database [TpQR Session 3]    Script Date: 09-Jan-20 2:22:20 PM ******/
CREATE DATABASE [TpQR Session 3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TpQR Session 3', FILENAME = N'D:\WSS Training\Projects\dbstuff\TpQR Session 3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TpQR Session 3_log', FILENAME = N'D:\WSS Training\Projects\dbstuff\TpQR Session 3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TpQR Session 3] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TpQR Session 3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TpQR Session 3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TpQR Session 3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TpQR Session 3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TpQR Session 3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TpQR Session 3] SET ARITHABORT OFF 
GO
ALTER DATABASE [TpQR Session 3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TpQR Session 3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TpQR Session 3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TpQR Session 3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TpQR Session 3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TpQR Session 3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TpQR Session 3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TpQR Session 3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TpQR Session 3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TpQR Session 3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TpQR Session 3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TpQR Session 3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TpQR Session 3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TpQR Session 3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TpQR Session 3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TpQR Session 3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TpQR Session 3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TpQR Session 3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TpQR Session 3] SET  MULTI_USER 
GO
ALTER DATABASE [TpQR Session 3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TpQR Session 3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TpQR Session 3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TpQR Session 3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TpQR Session 3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TpQR Session 3] SET QUERY_STORE = OFF
GO
USE [TpQR Session 3]
GO
/****** Object:  Table [dbo].[Arrival]    Script Date: 09-Jan-20 2:22:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arrival](
	[arrivalId] [int] IDENTITY(1,1) NOT NULL,
	[userIdFK] [varchar](50) NOT NULL,
	[arrivalDate] [date] NOT NULL,
	[arrivalTime] [varchar](10) NOT NULL,
	[numberHead] [int] NOT NULL,
	[numberDelegate] [int] NOT NULL,
	[numberCompetitors] [int] NOT NULL,
	[numberCars] [int] NOT NULL,
	[number19seat] [int] NOT NULL,
	[number42seat] [int] NOT NULL,
 CONSTRAINT [PK_Arrival] PRIMARY KEY CLUSTERED 
(
	[arrivalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 09-Jan-20 2:22:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[hotelId] [int] IDENTITY(1,1) NOT NULL,
	[hotelName] [varchar](50) NOT NULL,
	[singleRate] [int] NOT NULL,
	[doubleRate] [int] NOT NULL,
	[numSingleRoomsTotal] [int] NOT NULL,
	[numDoubleRoomsTotal] [int] NOT NULL,
	[numSingleRoomsBooked] [int] NOT NULL,
	[numDoubleRoomsBooked] [int] NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[hotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel_Booking]    Script Date: 09-Jan-20 2:22:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel_Booking](
	[bookingId] [int] IDENTITY(1,1) NOT NULL,
	[hotelIdFK] [int] NOT NULL,
	[userIdFK] [varchar](50) NOT NULL,
	[numSingleRoomsRequired] [int] NOT NULL,
	[numDoubleRoomsRequired] [int] NOT NULL,
 CONSTRAINT [PK_Hotel_Booking] PRIMARY KEY CLUSTERED 
(
	[bookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09-Jan-20 2:22:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [varchar](50) NOT NULL,
	[countryName] [varchar](50) NOT NULL,
	[passwd] [varchar](50) NOT NULL,
	[userTypeIdFK] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Type]    Script Date: 09-Jan-20 2:22:20 PM ******/
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
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([hotelId], [hotelName], [singleRate], [doubleRate], [numSingleRoomsTotal], [numDoubleRoomsTotal], [numSingleRoomsBooked], [numDoubleRoomsBooked]) VALUES (1, N'Ritz-Carlton', 400, 600, 450, 350, 0, 0)
INSERT [dbo].[Hotel] ([hotelId], [hotelName], [singleRate], [doubleRate], [numSingleRoomsTotal], [numDoubleRoomsTotal], [numSingleRoomsBooked], [numDoubleRoomsBooked]) VALUES (2, N'Pan Pacific Hotel', 350, 550, 425, 325, 0, 0)
INSERT [dbo].[Hotel] ([hotelId], [hotelName], [singleRate], [doubleRate], [numSingleRoomsTotal], [numDoubleRoomsTotal], [numSingleRoomsBooked], [numDoubleRoomsBooked]) VALUES (3, N'Charlton Hotel', 300, 500, 300, 250, 0, 0)
INSERT [dbo].[Hotel] ([hotelId], [hotelName], [singleRate], [doubleRate], [numSingleRoomsTotal], [numDoubleRoomsTotal], [numSingleRoomsBooked], [numDoubleRoomsBooked]) VALUES (4, N'Intercontinental Singapore', 250, 400, 250, 200, 0, 0)
INSERT [dbo].[Hotel] ([hotelId], [hotelName], [singleRate], [doubleRate], [numSingleRoomsTotal], [numDoubleRoomsTotal], [numSingleRoomsBooked], [numDoubleRoomsBooked]) VALUES (5, N'Hotel Grand Pacific', 150, 200, 125, 130, 0, 0)
INSERT [dbo].[Hotel] ([hotelId], [hotelName], [singleRate], [doubleRate], [numSingleRoomsTotal], [numDoubleRoomsTotal], [numSingleRoomsBooked], [numDoubleRoomsBooked]) VALUES (6, N'Hotel Royal Queens', 100, 150, 95, 105, 0, 0)
SET IDENTITY_INSERT [dbo].[Hotel] OFF
INSERT [dbo].[User] ([userId], [countryName], [passwd], [userTypeIdFK]) VALUES (N'abcd1234', N'Singapore', N'sg12', 1)
INSERT [dbo].[User] ([userId], [countryName], [passwd], [userTypeIdFK]) VALUES (N'asdf1234', N'Malaysia', N'my34', 2)
INSERT [dbo].[User] ([userId], [countryName], [passwd], [userTypeIdFK]) VALUES (N'qwer1234', N'Indonesia', N'indo12', 2)
SET IDENTITY_INSERT [dbo].[User_Type] ON 

INSERT [dbo].[User_Type] ([userTypeId], [userTypeName]) VALUES (1, N'Admin')
INSERT [dbo].[User_Type] ([userTypeId], [userTypeName]) VALUES (2, N'Country Rep')
SET IDENTITY_INSERT [dbo].[User_Type] OFF
ALTER TABLE [dbo].[Arrival]  WITH CHECK ADD  CONSTRAINT [FK_Arrival_User] FOREIGN KEY([userIdFK])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Arrival] CHECK CONSTRAINT [FK_Arrival_User]
GO
ALTER TABLE [dbo].[Hotel_Booking]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Booking_Hotel] FOREIGN KEY([hotelIdFK])
REFERENCES [dbo].[Hotel] ([hotelId])
GO
ALTER TABLE [dbo].[Hotel_Booking] CHECK CONSTRAINT [FK_Hotel_Booking_Hotel]
GO
ALTER TABLE [dbo].[Hotel_Booking]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Booking_User] FOREIGN KEY([userIdFK])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Hotel_Booking] CHECK CONSTRAINT [FK_Hotel_Booking_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User_Type] FOREIGN KEY([userTypeIdFK])
REFERENCES [dbo].[User_Type] ([userTypeId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User_Type]
GO
USE [master]
GO
ALTER DATABASE [TpQR Session 3] SET  READ_WRITE 
GO
