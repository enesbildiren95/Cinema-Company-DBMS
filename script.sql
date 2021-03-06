USE [master]
GO
/****** Object:  Database [Movie Corporation]    Script Date: 12/26/2018 4:55:52 AM ******/
CREATE DATABASE [Movie Corporation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Movie Corporation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Movie Corporation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Movie Corporation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Movie Corporation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Movie Corporation] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Movie Corporation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Movie Corporation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Movie Corporation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Movie Corporation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Movie Corporation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Movie Corporation] SET ARITHABORT OFF 
GO
ALTER DATABASE [Movie Corporation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Movie Corporation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Movie Corporation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Movie Corporation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Movie Corporation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Movie Corporation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Movie Corporation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Movie Corporation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Movie Corporation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Movie Corporation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Movie Corporation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Movie Corporation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Movie Corporation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Movie Corporation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Movie Corporation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Movie Corporation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Movie Corporation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Movie Corporation] SET RECOVERY FULL 
GO
ALTER DATABASE [Movie Corporation] SET  MULTI_USER 
GO
ALTER DATABASE [Movie Corporation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Movie Corporation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Movie Corporation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Movie Corporation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Movie Corporation] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Movie Corporation', N'ON'
GO
ALTER DATABASE [Movie Corporation] SET QUERY_STORE = OFF
GO
USE [Movie Corporation]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[Movie_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Release_Date] [nvarchar](50) NULL,
	[Views] [numeric](12, 0) NULL,
	[Trailer] [nvarchar](100) NULL,
	[Budget] [int] NULL,
	[Revenue] [int] NULL,
 CONSTRAINT [PK_Film] PRIMARY KEY CLUSTERED 
(
	[Movie_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sponsor]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsor](
	[Sponsor_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [nvarchar](50) NOT NULL,
	[CEO] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Phone_Number] [nvarchar](20) NOT NULL,
	[Information] [nvarchar](max) NOT NULL,
	[Movie] [int] NULL,
 CONSTRAINT [PK_Sponsor] PRIMARY KEY CLUSTERED 
(
	[Sponsor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[findsponsor]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[findsponsor]
as
Select Sponsor.Sponsor_ID, Sponsor.Company_Name, Sponsor.CEO, Sponsor.Phone_Number From Sponsor
INNER JOIN Movie on Sponsor.Movie = Movie.Movie_ID;
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [nvarchar](50) NOT NULL,
	[CEO] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Phone_Number] [nvarchar](20) NOT NULL,
	[Information] [nvarchar](max) NOT NULL,
	[Responsible_Area] [nvarchar](50) NOT NULL,
	[Movie] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[findcustomer]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[findcustomer]
as
Select Customer.Customer_ID, Customer.Company_Name, Customer.CEO,Customer.Responsible_Area From Customer
Inner Join Movie on Customer.Movie = Movie.Movie_ID;
GO
/****** Object:  Table [dbo].[Cast]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cast](
	[Personal_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Phone_Number] [nvarchar](50) NOT NULL,
	[Birth_Date] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Nationality] [nvarchar](50) NOT NULL,
	[Biography] [nvarchar](max) NOT NULL,
	[Department] [int] NOT NULL,
	[Studio] [int] NOT NULL,
	[Current_Movie] [int] NULL,
	[Current_Stuff] [int] NULL,
	[Salary] [int] NOT NULL,
 CONSTRAINT [PK_Cast] PRIMARY KEY CLUSTERED 
(
	[Personal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Department_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Department_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[Equipment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Model] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[Buying_Date] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[Equipment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Membership]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Membership](
	[Membership_ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Department] [int] NOT NULL,
 CONSTRAINT [PK_Membership] PRIMARY KEY CLUSTERED 
(
	[Membership_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Membership] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Production]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Production](
	[Personal_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Birth_Date] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Nationality] [nvarchar](50) NOT NULL,
	[Biography] [nvarchar](max) NOT NULL,
	[Department] [int] NOT NULL,
	[Current_Movie] [int] NULL,
	[Current_Equipment] [int] NULL,
	[Salary] [int] NOT NULL,
	[Phone_Number] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employee_1] PRIMARY KEY CLUSTERED 
(
	[Personal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Studio]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studio](
	[Studio_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Phone_Number] [nvarchar](20) NOT NULL,
	[Current_Film] [int] NULL,
 CONSTRAINT [PK_Studio] PRIMARY KEY CLUSTERED 
(
	[Studio_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Studio_Stuff]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studio_Stuff](
	[Studio_ID] [int] NOT NULL,
	[Stuff_ID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stuff]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stuff](
	[Stuff_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Stock_No] [int] NOT NULL,
 CONSTRAINT [PK_Stuff] PRIMARY KEY CLUSTERED 
(
	[Stuff_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cast]  WITH CHECK ADD  CONSTRAINT [acts] FOREIGN KEY([Current_Movie])
REFERENCES [dbo].[Movie] ([Movie_ID])
GO
ALTER TABLE [dbo].[Cast] CHECK CONSTRAINT [acts]
GO
ALTER TABLE [dbo].[Cast]  WITH CHECK ADD  CONSTRAINT [be_responsible] FOREIGN KEY([Department])
REFERENCES [dbo].[Department] ([Department_ID])
GO
ALTER TABLE [dbo].[Cast] CHECK CONSTRAINT [be_responsible]
GO
ALTER TABLE [dbo].[Cast]  WITH CHECK ADD  CONSTRAINT [used_by] FOREIGN KEY([Current_Stuff])
REFERENCES [dbo].[Stuff] ([Stuff_ID])
GO
ALTER TABLE [dbo].[Cast] CHECK CONSTRAINT [used_by]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Movie] FOREIGN KEY([Movie])
REFERENCES [dbo].[Movie] ([Movie_ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Movie]
GO
ALTER TABLE [dbo].[Membership]  WITH CHECK ADD  CONSTRAINT [manages] FOREIGN KEY([Department])
REFERENCES [dbo].[Department] ([Department_ID])
GO
ALTER TABLE [dbo].[Membership] CHECK CONSTRAINT [manages]
GO
ALTER TABLE [dbo].[Production]  WITH CHECK ADD  CONSTRAINT [be responsible] FOREIGN KEY([Department])
REFERENCES [dbo].[Department] ([Department_ID])
GO
ALTER TABLE [dbo].[Production] CHECK CONSTRAINT [be responsible]
GO
ALTER TABLE [dbo].[Production]  WITH CHECK ADD  CONSTRAINT [shoots] FOREIGN KEY([Current_Movie])
REFERENCES [dbo].[Movie] ([Movie_ID])
GO
ALTER TABLE [dbo].[Production] CHECK CONSTRAINT [shoots]
GO
ALTER TABLE [dbo].[Production]  WITH CHECK ADD  CONSTRAINT [used by] FOREIGN KEY([Current_Equipment])
REFERENCES [dbo].[Equipment] ([Equipment_ID])
GO
ALTER TABLE [dbo].[Production] CHECK CONSTRAINT [used by]
GO
ALTER TABLE [dbo].[Sponsor]  WITH CHECK ADD  CONSTRAINT [FK_Sponsor_Movie] FOREIGN KEY([Movie])
REFERENCES [dbo].[Movie] ([Movie_ID])
GO
ALTER TABLE [dbo].[Sponsor] CHECK CONSTRAINT [FK_Sponsor_Movie]
GO
ALTER TABLE [dbo].[Studio]  WITH CHECK ADD  CONSTRAINT [shoots at] FOREIGN KEY([Current_Film])
REFERENCES [dbo].[Movie] ([Movie_ID])
GO
ALTER TABLE [dbo].[Studio] CHECK CONSTRAINT [shoots at]
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteMovie]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteMovie] @ID int
AS
delete Movie 
where (Movie_ID = @ID);
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertMovie]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_InsertMovie]  @Name nvarchar(max), @Release_Date nvarchar(50), @Views numeric(12,0), @Trailer nvarchar(100), @Budget int, @Revenue int
AS
insert into Movie(name,release_Date,views,trailer,budget,revenue) values (@name, @Release_Date,@Views,@Trailer,@Budget, @Revenue)
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateMovie]    Script Date: 12/26/2018 4:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateMovie] @Movie_ID int, @Name nvarchar(max), @Release_Date nvarchar(50), @Views numeric(12,0), @Trailer nvarchar(100), @Budget int, @Revenue int
AS
update Movie
set Movie.Name = @name,Movie.Release_Date = @release_date, Movie.Views = @Views, Movie.Trailer = @trailer, Movie.Budget = @budget, Movie.Revenue = @revenue
where (Movie_ID = @Movie_ID);
GO
USE [master]
GO
ALTER DATABASE [Movie Corporation] SET  READ_WRITE 
GO
