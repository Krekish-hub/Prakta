USE [master]
GO
/****** Object:  Database [LoginApp]    Script Date: 29.04.2023 11:42:34 ******/
CREATE DATABASE [LoginApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LoginApp', FILENAME = N'C:\StudentDatabase\LoginApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LoginApp_log', FILENAME = N'C:\StudentDatabase\LoginApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LoginApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LoginApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LoginApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LoginApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LoginApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LoginApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LoginApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [LoginApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LoginApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LoginApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LoginApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LoginApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LoginApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LoginApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LoginApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LoginApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LoginApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LoginApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LoginApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LoginApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LoginApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LoginApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LoginApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LoginApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LoginApp] SET RECOVERY FULL 
GO
ALTER DATABASE [LoginApp] SET  MULTI_USER 
GO
ALTER DATABASE [LoginApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LoginApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LoginApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LoginApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LoginApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LoginApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LoginApp', N'ON'
GO
ALTER DATABASE [LoginApp] SET QUERY_STORE = OFF
GO
USE [LoginApp]
GO
/****** Object:  User [Student]    Script Date: 29.04.2023 11:42:35 ******/
CREATE USER [Student] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [osas]    Script Date: 29.04.2023 11:42:35 ******/
CREATE USER [osas] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[osas]
GO
ALTER ROLE [db_owner] ADD MEMBER [osas]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [osas]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [osas]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [osas]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [osas]
GO
ALTER ROLE [db_datareader] ADD MEMBER [osas]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [osas]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [osas]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [osas]
GO
/****** Object:  Schema [osas]    Script Date: 29.04.2023 11:42:35 ******/
CREATE SCHEMA [osas]
GO
/****** Object:  Table [dbo].[Discipline]    Script Date: 29.04.2023 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discipline](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Discipline] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormTime]    Script Date: 29.04.2023 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Time] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FormTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journal]    Script Date: 29.04.2023 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdStudent] [int] NOT NULL,
	[IdDiscipline] [int] NOT NULL,
	[Evaulation] [int] NOT NULL,
	[IdNameGroup] [int] NOT NULL,
 CONSTRAINT [PK_Journal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NameGroup]    Script Date: 29.04.2023 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NameGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NameGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 29.04.2023 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Special]    Script Date: 29.04.2023 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Special](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Special] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 29.04.2023 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IdSpecial] [int] NOT NULL,
	[IdYearAdd] [int] NOT NULL,
	[IdFormTime] [int] NOT NULL,
	[IdNameGroup] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 29.04.2023 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IdDiscipline] [int] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 29.04.2023 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nchar](10) NOT NULL,
	[Password] [nchar](10) NOT NULL,
	[IdRole] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YearAdd]    Script Date: 29.04.2023 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YearAdd](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_YearAdd] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Journal]  WITH CHECK ADD  CONSTRAINT [FK_Journal_Discipline] FOREIGN KEY([IdDiscipline])
REFERENCES [dbo].[Discipline] ([Id])
GO
ALTER TABLE [dbo].[Journal] CHECK CONSTRAINT [FK_Journal_Discipline]
GO
ALTER TABLE [dbo].[Journal]  WITH CHECK ADD  CONSTRAINT [FK_Journal_NameGroup] FOREIGN KEY([IdNameGroup])
REFERENCES [dbo].[NameGroup] ([Id])
GO
ALTER TABLE [dbo].[Journal] CHECK CONSTRAINT [FK_Journal_NameGroup]
GO
ALTER TABLE [dbo].[Journal]  WITH CHECK ADD  CONSTRAINT [FK_Journal_Student] FOREIGN KEY([IdStudent])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[Journal] CHECK CONSTRAINT [FK_Journal_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_FormTime] FOREIGN KEY([IdFormTime])
REFERENCES [dbo].[FormTime] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_FormTime]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_NameGroup] FOREIGN KEY([IdNameGroup])
REFERENCES [dbo].[NameGroup] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_NameGroup]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Special] FOREIGN KEY([IdSpecial])
REFERENCES [dbo].[Special] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Special]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_YearAdd] FOREIGN KEY([IdYearAdd])
REFERENCES [dbo].[YearAdd] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_YearAdd]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Discipline] FOREIGN KEY([IdDiscipline])
REFERENCES [dbo].[Discipline] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Discipline]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [LoginApp] SET  READ_WRITE 
GO
