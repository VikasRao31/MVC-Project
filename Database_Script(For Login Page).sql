USE [master]
GO
/****** Object:  Database [vikas]    Script Date: 22-02-2020 17:43:50 ******/
CREATE DATABASE [vikas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vikas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\vikas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'vikas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\vikas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [vikas] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vikas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vikas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vikas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vikas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vikas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vikas] SET ARITHABORT OFF 
GO
ALTER DATABASE [vikas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [vikas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vikas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vikas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vikas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vikas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vikas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vikas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vikas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vikas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [vikas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vikas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vikas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vikas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vikas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vikas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vikas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vikas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [vikas] SET  MULTI_USER 
GO
ALTER DATABASE [vikas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vikas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vikas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vikas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [vikas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [vikas] SET QUERY_STORE = OFF
GO
USE [vikas]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [vikas]
GO
/****** Object:  User [web_user]    Script Date: 22-02-2020 17:43:51 ******/
CREATE USER [web_user] FOR LOGIN [pl_user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [db_execproc]    Script Date: 22-02-2020 17:43:51 ******/
CREATE ROLE [db_execproc]
GO
ALTER ROLE [db_execproc] ADD MEMBER [web_user]
GO
/****** Object:  Table [dbo].[CandidateSignUp]    Script Date: 22-02-2020 17:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateSignUp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[ConfirmPassword] [nvarchar](50) NOT NULL,
	[Profession] [nvarchar](50) NOT NULL,
	[Specialty] [nvarchar](50) NOT NULL,
	[DateAvailable] [datetime] NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Degree] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Zip] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[ImagePath] [varchar](500) NULL,
 CONSTRAINT [PK_CandidateSignUp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Database_Connection_StudentsDept]    Script Date: 22-02-2020 17:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Database_Connection_StudentsDept](
	[DeptCode] [int] NOT NULL,
	[DeptName] [nvarchar](80) NULL,
 CONSTRAINT [PK_StudentsDept] PRIMARY KEY CLUSTERED 
(
	[DeptCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataBase_Connection_StudentsInfo]    Script Date: 22-02-2020 17:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataBase_Connection_StudentsInfo](
	[StdRegNumber] [nvarchar](50) NOT NULL,
	[StdName] [nvarchar](50) NULL,
	[StdDoBirth] [date] NULL,
	[StdRegDate] [date] NULL,
	[StdContact] [nvarchar](14) NULL,
	[StdEmail] [nvarchar](50) NULL,
	[StdDeptCode] [int] NULL,
 CONSTRAINT [PK_StudentsInfo] PRIMARY KEY CLUSTERED 
(
	[StdRegNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Demo2_tblDepartment]    Script Date: 22-02-2020 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Demo2_tblDepartment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Demo2_tblEmployee]    Script Date: 22-02-2020 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Demo2_tblEmployee](
	[Employeeid] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [nvarchar](20) NULL,
	[City] [nvarchar](50) NULL,
	[DepartmentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Employeeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insert_trigger_table]    Script Date: 22-02-2020 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insert_trigger_table](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[table2_id] [int] NOT NULL,
	[table1_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginPage_tblEmployee]    Script Date: 22-02-2020 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginPage_tblEmployee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NULL,
	[LastName] [varchar](20) NULL,
 CONSTRAINT [Pk_Emp_Id] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginPage_tblLogin]    Script Date: 22-02-2020 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginPage_tblLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [varchar](50) NULL,
	[RememberMe] [bit] NULL,
	[ConfirmPassword] [varchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Department] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Part11_tblEmployee]    Script Date: 22-02-2020 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Part11_tblEmployee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [nvarchar](30) NULL,
	[City] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalDetail]    Script Date: 22-02-2020 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalDetail](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_PersonalDetail] PRIMARY KEY CLUSTERED 
(
	[AutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentReg]    Script Date: 22-02-2020 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentReg](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[ImagePath] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[table1]    Script Date: 22-02-2020 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table1](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[table2]    Script Date: 22-02-2020 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 22-02-2020 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](50) NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblAdmin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblApllicationForm]    Script Date: 22-02-2020 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblApllicationForm](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[EmpNo] [float] NOT NULL,
	[chkNo_AnotherName] [nvarchar](50) NOT NULL,
	[chkYes_AnotherName] [nvarchar](50) NOT NULL,
	[AnotherName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[PostCode1] [int] NOT NULL,
	[PostalAddress] [nvarchar](100) NOT NULL,
	[PostCode2] [int] NOT NULL,
	[HomeTelephone] [float] NOT NULL,
	[Mobile] [float] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[chkNo_Indian] [nvarchar](50) NOT NULL,
	[chkYes_Indian] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[chkNo_Health] [nvarchar](50) NOT NULL,
	[chkYes_Health] [nvarchar](50) NOT NULL,
	[HealthInformation] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_tblApllicationForm] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBookDinner]    Script Date: 22-02-2020 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBookDinner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[PhoneNo] [int] NULL,
	[Location] [nvarchar](50) NULL,
	[HotelName] [nvarchar](50) NULL,
	[DinnerTimming] [datetime] NULL,
 CONSTRAINT [PK_tblBookDinner] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCity]    Script Date: 22-02-2020 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
	[StateId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblCity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCountry]    Script Date: 22-02-2020 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCountry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblCountry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 22-02-2020 17:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tblEmployeeAdd_id] [int] NOT NULL,
	[Department] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDesignation]    Script Date: 22-02-2020 17:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDesignation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [nvarchar](50) NULL,
	[DepartmentId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblDesignation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDocuments]    Script Date: 22-02-2020 17:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocuments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentName] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblDocuments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmp]    Script Date: 22-02-2020 17:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](50) NULL,
	[MName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NULL,
	[EmailId] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblEmp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 22-02-2020 17:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[FatherName] [varchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Married_Status] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Caste] [nvarchar](50) NULL,
	[Religion] [nvarchar](50) NULL,
	[BloodGroup] [nvarchar](50) NULL,
	[Remarks] [nvarchar](50) NULL,
	[ImagePath] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee123]    Script Date: 22-02-2020 17:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee123](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[FatherName] [varchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Married_Status] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Caste] [nvarchar](50) NULL,
	[Religion] [nvarchar](50) NULL,
	[BloodGroup] [nvarchar](50) NULL,
	[Remarks] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[PinCode] [nvarchar](50) NULL,
	[HomeState] [nvarchar](50) NULL,
	[HomeDistrict] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
	[ImagePath] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee3_City]    Script Date: 22-02-2020 17:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee3_City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
	[StateId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployee3_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee3_Country]    Script Date: 22-02-2020 17:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee3_Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployee3_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee3_Department]    Script Date: 22-02-2020 17:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee3_Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployee3_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee3_Designation]    Script Date: 22-02-2020 17:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee3_Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [nvarchar](50) NULL,
	[DepartmentId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployee3_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee3_Documents]    Script Date: 22-02-2020 17:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee3_Documents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentName] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployee3_Documents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee3_EmployeeDocuments]    Script Date: 22-02-2020 17:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee3_EmployeeDocuments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpRegId] [int] NULL,
	[DocumentId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployee3_EmployeeDocuments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee3_EmployeeOfficeDetails]    Script Date: 22-02-2020 17:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee3_EmployeeOfficeDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpRegId] [int] NULL,
	[DepartmentId] [int] NULL,
	[CurrentOffice] [nvarchar](max) NULL,
	[CurrentCadre] [nvarchar](max) NULL,
	[DesignationId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployee3_EmployeeOfficeDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee3_EmployeeParamanentAddress]    Script Date: 22-02-2020 17:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee3_EmployeeParamanentAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpRegId] [int] NULL,
	[StateId] [int] NULL,
	[CityId] [int] NULL,
	[Block] [nvarchar](500) NULL,
	[Panchayat] [nvarchar](500) NULL,
	[Pincode] [nvarchar](12) NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[ParamanentAddress] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployee3_EmployeeParamanentAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee3_EmployeePersonalDetails]    Script Date: 22-02-2020 17:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee3_EmployeePersonalDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DOB] [datetime] NULL,
	[ConcernedPersonName] [nvarchar](50) NULL,
	[RelationId] [int] NULL,
	[Gender] [int] NULL,
	[MartalStatus] [int] NULL,
	[IdentityMark] [nvarchar](150) NULL,
	[DocumentName] [nvarchar](50) NULL,
	[Height] [nvarchar](10) NULL,
	[CategoryId] [int] NULL,
	[ReligionId] [int] NULL,
	[stateId] [int] NULL,
	[CountryId] [int] NULL,
	[CityId] [int] NULL,
	[OfficeType] [nvarchar](50) NULL,
	[OfficeName] [nvarchar](50) NULL,
	[LTCHomeTown] [nvarchar](50) NULL,
	[NearestRailStation] [nvarchar](150) NULL,
	[Remarks] [nvarchar](500) NULL,
	[EmpRegId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[EmployeeImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblEmployee3_EmployeePersonalDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee3_EmployeePresentAddress]    Script Date: 22-02-2020 17:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee3_EmployeePresentAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpRegId] [int] NULL,
	[StatetId] [int] NULL,
	[CityId] [int] NULL,
	[PrBlock] [nvarchar](500) NULL,
	[PrPanchayat] [nvarchar](500) NULL,
	[PrPincode] [nvarchar](12) NULL,
	[PrPhoneNumber] [nvarchar](15) NULL,
	[PrMobileNumber] [nvarchar](15) NULL,
	[EmailId] [nvarchar](80) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpDatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployee3_EmployeePresentAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee3_EmployeeRegistration]    Script Date: 22-02-2020 17:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee3_EmployeeRegistration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EName] [nvarchar](50) NULL,
	[FatherName] [nvarchar](50) NULL,
	[Edob] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployee3_EmployeeRegistration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee3_States]    Script Date: 22-02-2020 17:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee3_States](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployee3_States] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee3_UserLogin]    Script Date: 22-02-2020 17:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee3_UserLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_tblEmployee3_UserLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee3PersonalDetails]    Script Date: 22-02-2020 17:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee3PersonalDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DOB] [datetime] NULL,
	[ConcernedPersonName] [nvarchar](50) NULL,
	[RelationId] [int] NULL,
	[Gender] [int] NULL,
	[MartalStatus] [int] NULL,
	[IdentityMark] [nvarchar](150) NULL,
	[DocumentName] [nvarchar](50) NULL,
	[Height] [nvarchar](10) NULL,
	[CategoryId] [int] NULL,
	[ReligionId] [int] NULL,
	[stateId] [int] NULL,
	[CountryId] [int] NULL,
	[CityId] [int] NULL,
	[OfficeType] [nvarchar](50) NULL,
	[OfficeName] [nvarchar](50) NULL,
	[LTCHomeTown] [nvarchar](50) NULL,
	[NearestRailStation] [nvarchar](150) NULL,
	[Remarks] [nvarchar](500) NULL,
	[EmpRegId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[EmployeeImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblEmployee3PersonalDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployeeAdd]    Script Date: 22-02-2020 17:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeAdd](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tblEmployee_id] [int] NOT NULL,
	[Address] [nvarchar](500) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[PinCode] [nvarchar](50) NULL,
	[HomeState] [nvarchar](50) NULL,
	[HomeDistrict] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployeeDocuments]    Script Date: 22-02-2020 17:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeDocuments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpRegId] [int] NULL,
	[DocumentId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployeeDocuments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployeeOfficeDetails]    Script Date: 22-02-2020 17:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeOfficeDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpRegId] [int] NULL,
	[DepartmentId] [int] NULL,
	[CurrentOffice] [nvarchar](max) NULL,
	[CurrentCadre] [nvarchar](max) NULL,
	[DesignationId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployeeOfficeDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployeeParamanentAddress]    Script Date: 22-02-2020 17:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeParamanentAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpRegId] [int] NULL,
	[StateId] [int] NULL,
	[CityId] [int] NULL,
	[Block] [nvarchar](500) NULL,
	[Panchayat] [nvarchar](500) NULL,
	[Pincode] [nvarchar](12) NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[ParamanentAddress] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployeeParamanentAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployeePresentAddress]    Script Date: 22-02-2020 17:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeePresentAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpRegId] [int] NULL,
	[StatetId] [int] NULL,
	[CityId] [int] NULL,
	[PrBlock] [nvarchar](500) NULL,
	[PrPanchayat] [nvarchar](500) NULL,
	[PrPincode] [nvarchar](12) NULL,
	[PrPhoneNumber] [nvarchar](15) NULL,
	[PrMobileNumber] [nvarchar](15) NULL,
	[EmailId] [nvarchar](80) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpDatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployeePresentAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployeeRegistration]    Script Date: 22-02-2020 17:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeRegistration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EName] [nvarchar](50) NULL,
	[FatherName] [nvarchar](50) NULL,
	[Edob] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblEmployeeRegistration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbljQuery_Ajex_InsertData]    Script Date: 22-02-2020 17:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbljQuery_Ajex_InsertData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Age] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProfession]    Script Date: 22-02-2020 17:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProfession](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Profession] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblProfession] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReligion]    Script Date: 22-02-2020 17:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReligion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReligionName] [nvarchar](50) NULL,
	[Discription] [nvarchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblReligion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSpecialty]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSpecialty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Specialty] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblSpecialty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStates]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblStates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserLogin]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[RememberMe] [bit] NULL,
	[EmailAddress] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAdmin] ADD  CONSTRAINT [DF_tblAdmin_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblAdmin] ADD  CONSTRAINT [DF_tblAdmin_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblAdmin] ADD  CONSTRAINT [DF_tblAdmin_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblCity] ADD  CONSTRAINT [DF_tblCity_CountryId]  DEFAULT ((0)) FOR [CountryId]
GO
ALTER TABLE [dbo].[tblCity] ADD  CONSTRAINT [DF_tblCity_StateId]  DEFAULT ((0)) FOR [StateId]
GO
ALTER TABLE [dbo].[tblCity] ADD  CONSTRAINT [DF_tblCity_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblCity] ADD  CONSTRAINT [DF_tblCity_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblCity] ADD  CONSTRAINT [DF_tblCity_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblCity] ADD  CONSTRAINT [DF_tblCity_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblCountry] ADD  CONSTRAINT [DF_tblCountry_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblCountry] ADD  CONSTRAINT [DF_tblCountry_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblCountry] ADD  CONSTRAINT [DF_tblCountry_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblCountry] ADD  CONSTRAINT [DF_tblCountry_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblDesignation] ADD  CONSTRAINT [DF_tblDesignation_DepartmentId]  DEFAULT ((0)) FOR [DepartmentId]
GO
ALTER TABLE [dbo].[tblDesignation] ADD  CONSTRAINT [DF_tblDesignation_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblDesignation] ADD  CONSTRAINT [DF_tblDesignation_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblDesignation] ADD  CONSTRAINT [DF_tblDesignation_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblDesignation] ADD  CONSTRAINT [DF_tblDesignation_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblDocuments] ADD  CONSTRAINT [DF_tblDocuments_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblDocuments] ADD  CONSTRAINT [DF_tblDocuments_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_City] ADD  CONSTRAINT [DF_tblEmployee3_City_CountryId]  DEFAULT ((0)) FOR [CountryId]
GO
ALTER TABLE [dbo].[tblEmployee3_City] ADD  CONSTRAINT [DF_tblEmployee3_City_StateId]  DEFAULT ((0)) FOR [StateId]
GO
ALTER TABLE [dbo].[tblEmployee3_City] ADD  CONSTRAINT [DF_tblEmployee3_City_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_City] ADD  CONSTRAINT [DF_tblEmployee3_City_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_City] ADD  CONSTRAINT [DF_tblEmployee3_City_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_City] ADD  CONSTRAINT [DF_tblEmployee3_City_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_Country] ADD  CONSTRAINT [DF_tblEmployee3_Country_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_Country] ADD  CONSTRAINT [DF_tblEmployee3_Country_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_Country] ADD  CONSTRAINT [DF_tblEmployee3_Country_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_Country] ADD  CONSTRAINT [DF_tblEmployee3_Country_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_Department] ADD  CONSTRAINT [DF_tblEmployee3_Department_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_Department] ADD  CONSTRAINT [DF_tblEmployee3_Department_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_Department] ADD  CONSTRAINT [DF_tblEmployee3_Department_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_Department] ADD  CONSTRAINT [DF_tblEmployee3_Department_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_Designation] ADD  CONSTRAINT [DF_tblEmployee3_Designation_DepartmentId]  DEFAULT ((0)) FOR [DepartmentId]
GO
ALTER TABLE [dbo].[tblEmployee3_Designation] ADD  CONSTRAINT [DF_tblEmployee3_Designation_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_Designation] ADD  CONSTRAINT [DF_tblEmployee3_Designation_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_Designation] ADD  CONSTRAINT [DF_tblEmployee3_Designation_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_Designation] ADD  CONSTRAINT [DF_tblEmployee3_Designation_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_Documents] ADD  CONSTRAINT [DF_tblEmployee3_Documents_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_Documents] ADD  CONSTRAINT [DF_tblEmployee3_Documents_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeDocuments] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeDocuments_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeDocuments] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeDocuments_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeOfficeDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeOfficeDetails_EmpRegId]  DEFAULT ((0)) FOR [EmpRegId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeOfficeDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeOfficeDetails_DepartmentId]  DEFAULT ((0)) FOR [DepartmentId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeOfficeDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeOfficeDetails_DesignationId]  DEFAULT ((0)) FOR [DesignationId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeOfficeDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeOfficeDetails_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeOfficeDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeOfficeDetails_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeOfficeDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeOfficeDetails_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeOfficeDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeOfficeDetails_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeParamanentAddress] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeParamanentAddress_EmpRegId]  DEFAULT ((0)) FOR [EmpRegId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeParamanentAddress] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeParamanentAddress_StateId]  DEFAULT ((0)) FOR [StateId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeParamanentAddress] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeParamanentAddress_CityId]  DEFAULT ((0)) FOR [CityId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeParamanentAddress] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeParamanentAddress_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeParamanentAddress] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeParamanentAddress_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeParamanentAddress] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeParamanentAddress_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeParamanentAddress] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeParamanentAddress_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePersonalDetails_DOB]  DEFAULT (getdate()) FOR [DOB]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePersonalDetails_RelationId]  DEFAULT ((0)) FOR [RelationId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePersonalDetails_Gender]  DEFAULT ((0)) FOR [Gender]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePersonalDetails_MartalStatus]  DEFAULT ((0)) FOR [MartalStatus]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePersonalDetails_DocumentId]  DEFAULT ((0)) FOR [DocumentName]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePersonalDetails_CategoryId]  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePersonalDetails_ReligionId]  DEFAULT ((0)) FOR [ReligionId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePersonalDetails_stateId]  DEFAULT ((0)) FOR [stateId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePersonalDetails_CountryId]  DEFAULT ((0)) FOR [CountryId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePersonalDetails_CityId]  DEFAULT ((0)) FOR [CityId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePersonalDetails_EmpRegId]  DEFAULT ((0)) FOR [EmpRegId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePersonalDetails_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePersonalDetails_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePersonalDetails_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePersonalDetails_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePresentAddress] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePresentAddress_EmpRegId]  DEFAULT ((0)) FOR [EmpRegId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePresentAddress] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePresentAddress_StatetId]  DEFAULT ((0)) FOR [StatetId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePresentAddress] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePresentAddress_CityId]  DEFAULT ((0)) FOR [CityId]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePresentAddress] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePresentAddress_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePresentAddress] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePresentAddress_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePresentAddress] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePresentAddress_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePresentAddress] ADD  CONSTRAINT [DF_tblEmployee3_EmployeePresentAddress_UpDatedBy]  DEFAULT ((0)) FOR [UpDatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeRegistration] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeRegistration_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeRegistration] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeRegistration_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeRegistration] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeRegistration_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeRegistration] ADD  CONSTRAINT [DF_tblEmployee3_EmployeeRegistration_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_States] ADD  CONSTRAINT [DF_tblEmployee3_States_CountryId]  DEFAULT ((0)) FOR [CountryId]
GO
ALTER TABLE [dbo].[tblEmployee3_States] ADD  CONSTRAINT [DF_tblEmployee3_States_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_States] ADD  CONSTRAINT [DF_tblEmployee3_States_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblEmployee3_States] ADD  CONSTRAINT [DF_tblEmployee3_States_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployee3_States] ADD  CONSTRAINT [DF_tblEmployee3_States_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblEmployeeDocuments] ADD  CONSTRAINT [DF_tblEmployeeDocuments_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployeeDocuments] ADD  CONSTRAINT [DF_tblEmployeeDocuments_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployeeOfficeDetails] ADD  CONSTRAINT [DF_tblEmployeeOfficeDetails_EmpRegId]  DEFAULT ((0)) FOR [EmpRegId]
GO
ALTER TABLE [dbo].[tblEmployeeOfficeDetails] ADD  CONSTRAINT [DF_tblEmployeeOfficeDetails_DepartmentId]  DEFAULT ((0)) FOR [DepartmentId]
GO
ALTER TABLE [dbo].[tblEmployeeOfficeDetails] ADD  CONSTRAINT [DF_tblEmployeeOfficeDetails_DesignationId]  DEFAULT ((0)) FOR [DesignationId]
GO
ALTER TABLE [dbo].[tblEmployeeOfficeDetails] ADD  CONSTRAINT [DF_tblEmployeeOfficeDetails_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployeeOfficeDetails] ADD  CONSTRAINT [DF_tblEmployeeOfficeDetails_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblEmployeeOfficeDetails] ADD  CONSTRAINT [DF_tblEmployeeOfficeDetails_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployeeOfficeDetails] ADD  CONSTRAINT [DF_tblEmployeeOfficeDetails_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblEmployeeParamanentAddress] ADD  CONSTRAINT [DF_tblEmployeeParamanentAddress_EmpRegId]  DEFAULT ((0)) FOR [EmpRegId]
GO
ALTER TABLE [dbo].[tblEmployeeParamanentAddress] ADD  CONSTRAINT [DF_tblEmployeeParamanentAddress_StateId]  DEFAULT ((0)) FOR [StateId]
GO
ALTER TABLE [dbo].[tblEmployeeParamanentAddress] ADD  CONSTRAINT [DF_tblEmployeeParamanentAddress_CityId]  DEFAULT ((0)) FOR [CityId]
GO
ALTER TABLE [dbo].[tblEmployeeParamanentAddress] ADD  CONSTRAINT [DF_tblEmployeeParamanentAddress_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployeeParamanentAddress] ADD  CONSTRAINT [DF_tblEmployeeParamanentAddress_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblEmployeeParamanentAddress] ADD  CONSTRAINT [DF_tblEmployeeParamanentAddress_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployeeParamanentAddress] ADD  CONSTRAINT [DF_tblEmployeeParamanentAddress_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblEmployeePresentAddress] ADD  CONSTRAINT [DF_tblEmployeePresentAddress_EmpRegId]  DEFAULT ((0)) FOR [EmpRegId]
GO
ALTER TABLE [dbo].[tblEmployeePresentAddress] ADD  CONSTRAINT [DF_tblEmployeePresentAddress_StatetId]  DEFAULT ((0)) FOR [StatetId]
GO
ALTER TABLE [dbo].[tblEmployeePresentAddress] ADD  CONSTRAINT [DF_tblEmployeePresentAddress_CityId]  DEFAULT ((0)) FOR [CityId]
GO
ALTER TABLE [dbo].[tblEmployeePresentAddress] ADD  CONSTRAINT [DF_tblEmployeePresentAddress_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployeePresentAddress] ADD  CONSTRAINT [DF_tblEmployeePresentAddress_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblEmployeePresentAddress] ADD  CONSTRAINT [DF_tblEmployeePresentAddress_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployeePresentAddress] ADD  CONSTRAINT [DF_tblEmployeePresentAddress_UpDatedBy]  DEFAULT ((0)) FOR [UpDatedBy]
GO
ALTER TABLE [dbo].[tblEmployeeRegistration] ADD  CONSTRAINT [DF_tblEmployeeRegistration_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEmployeeRegistration] ADD  CONSTRAINT [DF_tblEmployeeRegistration_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblEmployeeRegistration] ADD  CONSTRAINT [DF_tblEmployeeRegistration_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblEmployeeRegistration] ADD  CONSTRAINT [DF_tblEmployeeRegistration_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblReligion] ADD  CONSTRAINT [DF_tblReligion_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblReligion] ADD  CONSTRAINT [DF_tblReligion_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblReligion] ADD  CONSTRAINT [DF_tblReligion_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblReligion] ADD  CONSTRAINT [DF_tblReligion_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblStates] ADD  CONSTRAINT [DF_tblStates_CountryId]  DEFAULT ((0)) FOR [CountryId]
GO
ALTER TABLE [dbo].[tblStates] ADD  CONSTRAINT [DF_tblStates_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblStates] ADD  CONSTRAINT [DF_tblStates_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblStates] ADD  CONSTRAINT [DF_tblStates_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tblStates] ADD  CONSTRAINT [DF_tblStates_UpdatedBy]  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[tblCity]  WITH CHECK ADD  CONSTRAINT [FK_tblCity_tblCountry] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tblCountry] ([Id])
GO
ALTER TABLE [dbo].[tblCity] CHECK CONSTRAINT [FK_tblCity_tblCountry]
GO
ALTER TABLE [dbo].[tblCity]  WITH CHECK ADD  CONSTRAINT [FK_tblCity_tblStates] FOREIGN KEY([StateId])
REFERENCES [dbo].[tblStates] ([Id])
GO
ALTER TABLE [dbo].[tblCity] CHECK CONSTRAINT [FK_tblCity_tblStates]
GO
ALTER TABLE [dbo].[tblDesignation]  WITH CHECK ADD  CONSTRAINT [FK_tblDesignation_tblDepartment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[tblDepartment] ([id])
GO
ALTER TABLE [dbo].[tblDesignation] CHECK CONSTRAINT [FK_tblDesignation_tblDepartment]
GO
ALTER TABLE [dbo].[tblEmployee3_City]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_City_tblCountry] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tblCountry] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_City] CHECK CONSTRAINT [FK_tblEmployee3_City_tblCountry]
GO
ALTER TABLE [dbo].[tblEmployee3_City]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_City_tblStates] FOREIGN KEY([StateId])
REFERENCES [dbo].[tblStates] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_City] CHECK CONSTRAINT [FK_tblEmployee3_City_tblStates]
GO
ALTER TABLE [dbo].[tblEmployee3_Designation]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_Designation_tblDepartment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[tblDepartment] ([id])
GO
ALTER TABLE [dbo].[tblEmployee3_Designation] CHECK CONSTRAINT [FK_tblEmployee3_Designation_tblDepartment]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeDocuments]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_EmployeeDocuments_tblEmployeeRegistration] FOREIGN KEY([EmpRegId])
REFERENCES [dbo].[tblEmployeeRegistration] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeDocuments] CHECK CONSTRAINT [FK_tblEmployee3_EmployeeDocuments_tblEmployeeRegistration]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeOfficeDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_EmployeeOfficeDetails_tblDepartment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[tblDepartment] ([id])
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeOfficeDetails] CHECK CONSTRAINT [FK_tblEmployee3_EmployeeOfficeDetails_tblDepartment]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeOfficeDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_EmployeeOfficeDetails_tblDesignation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[tblDesignation] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeOfficeDetails] CHECK CONSTRAINT [FK_tblEmployee3_EmployeeOfficeDetails_tblDesignation]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeParamanentAddress]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_EmployeeParamanentAddress_tblCity] FOREIGN KEY([CityId])
REFERENCES [dbo].[tblCity] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeParamanentAddress] CHECK CONSTRAINT [FK_tblEmployee3_EmployeeParamanentAddress_tblCity]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeParamanentAddress]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_EmployeeParamanentAddress_tblEmployeeRegistration] FOREIGN KEY([EmpRegId])
REFERENCES [dbo].[tblEmployeeRegistration] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeParamanentAddress] CHECK CONSTRAINT [FK_tblEmployee3_EmployeeParamanentAddress_tblEmployeeRegistration]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeParamanentAddress]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_EmployeeParamanentAddress_tblStates] FOREIGN KEY([StateId])
REFERENCES [dbo].[tblStates] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeeParamanentAddress] CHECK CONSTRAINT [FK_tblEmployee3_EmployeeParamanentAddress_tblStates]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_EmployeePersonalDetails_tblCity] FOREIGN KEY([CityId])
REFERENCES [dbo].[tblCity] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] CHECK CONSTRAINT [FK_tblEmployee3_EmployeePersonalDetails_tblCity]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_EmployeePersonalDetails_tblCountry] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tblCountry] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] CHECK CONSTRAINT [FK_tblEmployee3_EmployeePersonalDetails_tblCountry]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_EmployeePersonalDetails_tblEmployee3_EmployeePersonalDetails] FOREIGN KEY([Id])
REFERENCES [dbo].[tblEmployee3_EmployeePersonalDetails] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] CHECK CONSTRAINT [FK_tblEmployee3_EmployeePersonalDetails_tblEmployee3_EmployeePersonalDetails]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_EmployeePersonalDetails_tblEmployeeRegistration] FOREIGN KEY([EmpRegId])
REFERENCES [dbo].[tblEmployeeRegistration] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] CHECK CONSTRAINT [FK_tblEmployee3_EmployeePersonalDetails_tblEmployeeRegistration]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_EmployeePersonalDetails_tblReligion] FOREIGN KEY([ReligionId])
REFERENCES [dbo].[tblReligion] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] CHECK CONSTRAINT [FK_tblEmployee3_EmployeePersonalDetails_tblReligion]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_EmployeePersonalDetails_tblStates] FOREIGN KEY([stateId])
REFERENCES [dbo].[tblStates] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePersonalDetails] CHECK CONSTRAINT [FK_tblEmployee3_EmployeePersonalDetails_tblStates]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePresentAddress]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_EmployeePresentAddress_tblCity] FOREIGN KEY([CityId])
REFERENCES [dbo].[tblCity] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePresentAddress] CHECK CONSTRAINT [FK_tblEmployee3_EmployeePresentAddress_tblCity]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePresentAddress]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_EmployeePresentAddress_tblEmployeeRegistration] FOREIGN KEY([EmpRegId])
REFERENCES [dbo].[tblEmployeeRegistration] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePresentAddress] CHECK CONSTRAINT [FK_tblEmployee3_EmployeePresentAddress_tblEmployeeRegistration]
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePresentAddress]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_EmployeePresentAddress_tblStates] FOREIGN KEY([StatetId])
REFERENCES [dbo].[tblStates] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_EmployeePresentAddress] CHECK CONSTRAINT [FK_tblEmployee3_EmployeePresentAddress_tblStates]
GO
ALTER TABLE [dbo].[tblEmployee3_States]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee3_States_tblCountry] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tblCountry] ([Id])
GO
ALTER TABLE [dbo].[tblEmployee3_States] CHECK CONSTRAINT [FK_tblEmployee3_States_tblCountry]
GO
ALTER TABLE [dbo].[tblEmployeeDocuments]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeDocuments_tblEmployeeRegistration] FOREIGN KEY([EmpRegId])
REFERENCES [dbo].[tblEmployeeRegistration] ([Id])
GO
ALTER TABLE [dbo].[tblEmployeeDocuments] CHECK CONSTRAINT [FK_tblEmployeeDocuments_tblEmployeeRegistration]
GO
ALTER TABLE [dbo].[tblEmployeeOfficeDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeOfficeDetails_tblDepartment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[tblDepartment] ([id])
GO
ALTER TABLE [dbo].[tblEmployeeOfficeDetails] CHECK CONSTRAINT [FK_tblEmployeeOfficeDetails_tblDepartment]
GO
ALTER TABLE [dbo].[tblEmployeeOfficeDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeOfficeDetails_tblDesignation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[tblDesignation] ([Id])
GO
ALTER TABLE [dbo].[tblEmployeeOfficeDetails] CHECK CONSTRAINT [FK_tblEmployeeOfficeDetails_tblDesignation]
GO
ALTER TABLE [dbo].[tblEmployeeParamanentAddress]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeParamanentAddress_tblCity] FOREIGN KEY([CityId])
REFERENCES [dbo].[tblCity] ([Id])
GO
ALTER TABLE [dbo].[tblEmployeeParamanentAddress] CHECK CONSTRAINT [FK_tblEmployeeParamanentAddress_tblCity]
GO
ALTER TABLE [dbo].[tblEmployeeParamanentAddress]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeParamanentAddress_tblEmployeeRegistration] FOREIGN KEY([EmpRegId])
REFERENCES [dbo].[tblEmployeeRegistration] ([Id])
GO
ALTER TABLE [dbo].[tblEmployeeParamanentAddress] CHECK CONSTRAINT [FK_tblEmployeeParamanentAddress_tblEmployeeRegistration]
GO
ALTER TABLE [dbo].[tblEmployeeParamanentAddress]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeParamanentAddress_tblStates] FOREIGN KEY([StateId])
REFERENCES [dbo].[tblStates] ([Id])
GO
ALTER TABLE [dbo].[tblEmployeeParamanentAddress] CHECK CONSTRAINT [FK_tblEmployeeParamanentAddress_tblStates]
GO
ALTER TABLE [dbo].[tblEmployeePresentAddress]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeePresentAddress_tblCity] FOREIGN KEY([CityId])
REFERENCES [dbo].[tblCity] ([Id])
GO
ALTER TABLE [dbo].[tblEmployeePresentAddress] CHECK CONSTRAINT [FK_tblEmployeePresentAddress_tblCity]
GO
ALTER TABLE [dbo].[tblEmployeePresentAddress]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeePresentAddress_tblEmployeeRegistration] FOREIGN KEY([EmpRegId])
REFERENCES [dbo].[tblEmployeeRegistration] ([Id])
GO
ALTER TABLE [dbo].[tblEmployeePresentAddress] CHECK CONSTRAINT [FK_tblEmployeePresentAddress_tblEmployeeRegistration]
GO
ALTER TABLE [dbo].[tblEmployeePresentAddress]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeePresentAddress_tblStates] FOREIGN KEY([StatetId])
REFERENCES [dbo].[tblStates] ([Id])
GO
ALTER TABLE [dbo].[tblEmployeePresentAddress] CHECK CONSTRAINT [FK_tblEmployeePresentAddress_tblStates]
GO
ALTER TABLE [dbo].[tblStates]  WITH CHECK ADD  CONSTRAINT [FK_tblStates_tblCountry] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tblCountry] ([Id])
GO
ALTER TABLE [dbo].[tblStates] CHECK CONSTRAINT [FK_tblStates_tblCountry]
GO
/****** Object:  StoredProcedure [dbo].[AddNewStudent]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AddNewStudent]  
(  
   @Name nvarchar (50),  
   @City nvarchar (50),  
   @Address nvarchar (100),
   @ImagePath varchar(400)  
)  
as  
begin  
   Insert into StudentReg values(@Name,@City,@Address,@ImagePath)  
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[DeleteStudent]  
(  
   @StdId int  
)  
as   
begin  
   Delete from StudentReg where Id=@StdId  
End
GO
/****** Object:  StoredProcedure [dbo].[GetDataFromtblemp]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetDataFromtblemp]  
as  
begin  
   select * from tblEmp
End
GO
/****** Object:  StoredProcedure [dbo].[GetStudentDetails]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetStudentDetails]  
as  
begin  
   select * from StudentReg
End
GO
/****** Object:  StoredProcedure [dbo].[Part11_spGetAllEmployees]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Part11_spGetAllEmployees]
as begin
set nocount on;
select Distinct * from Part11_tblEmployee
end
GO
/****** Object:  StoredProcedure [dbo].[sp_BookDinner]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_BookDinner](
             @Name nvarchar(50),
			 @PhoneNo int ,
			 @Location nvarchar(50),
			 @HotelName nvarchar(50),
			 @DinnerTimming datetime)
			 as
			 begin
			 set nocount on;
			 insert into tblBookDinner values(@Name,@PhoneNo,@Location,@HotelName,@DinnerTimming)
			 end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteEmployee]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  --sp_DeleteEmployee'1024'    
CREATE    proc [dbo].[sp_DeleteEmployee](@Id int)      
as      
begin      
--delete  from tblDepartment where id = (select id from tblEmployeeAdd where tblEmployee_id=@Id)    
--delete from tblEmployeeAdd where tblEmployee_id=@Id    
delete from tblEmployee where id=@Id     
end 

--The DELETE statement conflicted with the REFERENCE constraint \"FK__tblEmploy__tblEm__2DE6D218\". The conflict occurred in database \"vikas\", table \"dbo.tblEmployeeAdd\", column 'tblEmployee_id'.\r\nThe statement has been terminated.
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteStudent]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_DeleteStudent](@StdId int)
as
begin
delete from CandidateSignUp where id=@StdId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_tbljQuery_Ajex_InsertData]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_tbljQuery_Ajex_InsertData]  
as  
begin  
select ID,Name,Email from tbljQuery_Ajex_InsertData  order by id desc
end 

GO
/****** Object:  StoredProcedure [dbo].[sp_GetBookDetails]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[sp_GetBookDetails]
as
begin
set nocount on;
select Distinct * from tblBookDinner
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDataFromCandidateSignUp]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
CREATE proc [dbo].[sp_GetDataFromCandidateSignUp]  
as  
begin  
set nocount on;  
  
  
select Distinct top 10  id, Email, Profession ,  
                             Specialty,DateAvailable,FirstName,LastName,  
                             Degree,Address,City,Country,State,Zip,Phone,ImagePath from CandidateSignUp order by id desc  
  
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDataFromtblEmployee]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
      
        
CREATE proc [dbo].[sp_GetDataFromtblEmployee]       
as        
begin        
set nocount on;        
        
        
select Distinct top 10 tblEmployee.id,FirstName,MiddleName,LastName,FatherName,Caste,Religion,BloodGroup,Remarks,ImagePath from tblEmployee   order by id desc        
        
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDataFromtblEmployee123]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
    
CREATE proc [dbo].[sp_GetDataFromtblEmployee123]    
as    
begin    
set nocount on;    
    
    
select Distinct top 10 id,FirstName,LastName,FatherName,Department,PhoneNo,Email,ImagePath from tblEmployee123 order by id desc    
    
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDepartmentFromtblEmployee123]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetDepartmentFromtblEmployee123]        
as        
begin        
set nocount on;        
        
        
select Distinct top 10 tblEmployee.id,Department,FirstName,Position,PhoneNo,Email from tblEmployee inner join tblEmployeeAdd
               on tblEmployee.id=tblEmployeeAdd.tblEmployee_id inner join tblDepartment on tblDepartment.tblEmployeeAdd_id=tblEmployeeAdd.id order by id desc        
        
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_tbljQuery_Ajex_InsertData]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create   procedure [dbo].[sp_Insert_tbljQuery_Ajex_InsertData]    
(    
 
   @Name varchar (50),    
   @Email varchar (50)    
)    
as    
begin    
   Insert into tbljQuery_Ajex_InsertData(Name,Email) values(@Name,@Email)    
End 
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDataInto_CandidateSignUp]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
CREATE proc [dbo].[sp_InsertDataInto_CandidateSignUp]       
(        
@Email nvarchar(50),        
@Password nvarchar(50),        
@ConfirmPassword nvarchar(50),        
@Profession nvarchar(50),        
@Specialty nvarchar(50),    
@DateAvailable datetime,        
@FirstName nvarchar(50) ,       
@LastName nvarchar(50) ,       
@Degree nvarchar(50)  ,      
@Address nvarchar(50) ,       
@City nvarchar(50) ,       
@Country nvarchar(50) ,       
@State nvarchar(50),      
@Zip nvarchar(50),      
@Phone nvarchar(50),  
@ImagePath varchar(500)=''      
        
)        
as begin        
set nocount on;        
Insert Into CandidateSignUp(Email,Password,ConfirmPassword,Profession,Specialty,FirstName,LastName,      
                            Degree,Address,City,Country,State,Zip,Phone,DateAvailable,ImagePath)    
           
    values(@Email,@Password,@ConfirmPassword,@Profession,@Specialty,@FirstName,@LastName,      
                            @Degree,@Address,@City,@Country,@State,@Zip,@Phone,@DateAvailable,@ImagePath)     
           
End        
      
 select * from CandidateSignUp
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDataInto_tblEmp]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsertDataInto_tblEmp]
(
@FName nvarchar(50),
@MName nvarchar(50),
@LName nvarchar(50),
@EMailId nvarchar(50)
)
as begin
set nocount on;
Insert Into tblEmp(FName,MName,LName,EmailId)values(@FName,@MName,@LName,@EMailId)
End
        
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDataInto_tblEmployee]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE   proc [dbo].[sp_InsertDataInto_tblEmployee](    
   @FirstName nvarchar(50),    
   @MiddleName nvarchar(50),    
   @LastName nvarchar(50),    
   @FatherName nvarchar(50)='',    
   @Gender nvarchar(50),    
   @MartialStatus nvarchar(50)='',    
   @Caste nvarchar(50)='',    
   @Religion nvarchar(50)='',    
   @BloodGroup nvarchar(50)='',    
   @Address nvarchar(50),    
   @Email nvarchar(50),    
   @HomeState nvarchar(50)='',    
   @HomeDistrict nvarchar(50)='',    
   @PinCode nvarchar(50)='',    
   @Remarks nvarchar(500)='',    
   @ImagePath varchar(500)='',    
   @PhoneNo nvarchar(50)='',    
   @Department nvarchar(50)='',    
   @Position nvarchar(50)=''      
)    
as begin    
set nocount on;    
  
    insert into tblEmployee(FirstName,MiddleName,LastName,FatherName,Gender,Married_Status,Caste,Religion,BloodGroup,Remarks,ImagePath)    
                   values(@FirstName,@MiddleName,@LastName,@FatherName,@Gender,@MartialStatus,@Caste,@Religion,@BloodGroup,@Remarks,@ImagePath)    
    
    
 Declare @tblEmployee_id int =@@identity        
    insert into tblEmployeeAdd (tblEmployee_id,Address,Email,PhoneNo,PinCode,HomeState,HomeDistrict)  
                    values(@tblEmployee_id,@Address,@Email,@PhoneNo,@PinCode,@HomeState,@HomeDistrict)    
     
 Declare @tblEmployeeAdd_id int=@@identity      
    insert into tblDepartment (tblEmployeeAdd_id,Department,Position)  
                     values(@tblEmployeeAdd_id,@Department,@Position)     
       
    
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDataInto_tblEmployee123]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsertDataInto_tblEmployee123](  
   @FirstName nvarchar(50),  
   @MiddleName nvarchar(50),  
   @LastName nvarchar(50),  
   @FatherName nvarchar(50),  
   @Gender nvarchar(50),  
   @MartialStatus nvarchar(50),  
   @Caste nvarchar(50),  
   @Religion nvarchar(50),  
   @BloodGroup nvarchar(50),  
   @Address nvarchar(50),  
   @Email nvarchar(50),  
   @HomeState nvarchar(50),  
   @HomeDistrict nvarchar(50),  
   @PinCode nvarchar(50),  
   @Remarks nvarchar(500),  
   @ImagePath varchar(500),  
   @PhoneNo nvarchar(50),  
   @Department nvarchar(50),  
   @Position nvarchar(50)    
)  
as begin  
set nocount on;  

    insert into tblEmployee123(FirstName,MiddleName,LastName,FatherName,Gender,Married_Status,Caste,Religion,BloodGroup,Remarks,Address,Email,PhoneNo,PinCode,HomeState,HomeDistrict,Department,Position,ImagePath)  
                   values(@FirstName,@MiddleName,@LastName,@FatherName,@Gender,@MartialStatus,@Caste,@Religion,@BloodGroup,@Remarks,@Address,@Email,@PhoneNo,@PinCode,@HomeState,@HomeDistrict,@Department,@Position,@ImagePath)  
  
  
 --Declare @tblEmployee_id int =@@identity      
 --   insert into tblEmployeeAdd (tblEmployee_id,Address,Email,PhoneNo,PinCode,HomeState,HomeDistrict)
	--                   values(@tblEmployee_id,@Address,@Email,@PhoneNo,@PinCode,@HomeState,@HomeDistrict)  
   
 --Declare @tblEmployeeAdd_id int=@@identity    
 --   insert into tblDepartment (tblEmployeeAdd_id,Department,Position)
	--                    values(@tblEmployeeAdd_id,@Department,@Position)   
     
  
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDataInto_tblUserLogin]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---select * from tblUserLogin

create   proc	[dbo].[sp_InsertDataInto_tblUserLogin]
(
@Email nvarchar(50),
@Password nvarchar(50)
)	
as begin      
set nocount on; 
insert into tblUserLogin(EmailAddress,Password)
values(@Email,@Password)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEmployee]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_InsertEmployee 'Suraj','AAA','1','0','2222222','ZZZ','2 Years','05-03-2019','2019-03-07 09:34:00.000','SSSSSSSSSSSSasadsds','Stock-Exchange','Head'

CREATE proc [dbo].[sp_InsertEmployee]
          (
		  @Name           nvarchar(50),
		  @FatherName     varchar(50),
		  @Gender         Bit,
		  @Married_Status Bit,
		  @PhoneNo        int,
		  @HigherEdu      nvarchar(50),
		  @Experience     nvarchar(50),
		  @JoiningDate    Date,
		  @StartDate      DateTime,
		  @Address        nvarchar(500),
		  @Department     nvarchar(50),
		  @Position       nvarchar(50)
		  )
		  as begin set nocount on;
		  
		  BEGIN TRAN
              BEGIN TRY

		  insert into tblEmployee values(@Name,@FatherName,@Gender,@Married_Status,@PhoneNo,@HigherEdu,@Experience,@JoiningDate,@StartDate)
		  
		  Declare @tblEmployee_id int =@@identity  
		  insert into tblEmployeeAdd values(@tblEmployee_id,@Address)

		  Declare @tblEmployeeAdd_id int=@@identity
		  insert into tblDepartment values(@tblEmployeeAdd_id,@Department,@Position)

		      COMMIT TRANSACTION
          END TRY
              BEGIN CATCH
			  ROLLBACK TRANSACTION
              END CATCH
		  end
GO
/****** Object:  StoredProcedure [dbo].[UpdateCandidateSignUpDetail]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
CREATE procedure [dbo].[UpdateCandidateSignUpDetail]      
(      
@StdId int,  
@Email nvarchar(50),      
@Password nvarchar(50),      
@ConfirmPassword nvarchar(50),      
@Profession nvarchar(50),      
@Specialty nvarchar(50),  
@DateAvailable datetime,      
@FirstName nvarchar(50) ,     
@LastName nvarchar(50) ,     
@Degree nvarchar(50)  ,    
@Address nvarchar(50) ,     
@City nvarchar(50) ,     
@Country nvarchar(50) ,     
@State nvarchar(50),    
@Zip nvarchar(50),    
@Phone nvarchar(50)
--@ImagePath varchar(500)='' 
   
)      
as      
begin      
   Update CandidateSignUp       
   set Email=@Email,Password=@Password,ConfirmPassword=@ConfirmPassword,Profession=@Profession,Specialty=@Specialty,      
             DateAvailable=@DateAvailable,FirstName=@FirstName,LastName=@LastName,Degree=@Degree,Address=@Address,          
             City=@City,Country=@Country,State=@State,Zip=@Zip,Phone=@Phone--,ImagePath=@ImagePath   
   where Id=@StdId      
End
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudentDetails]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[UpdateStudentDetails]  
(  
   @StdId int,  
   @Name nvarchar (50),  
   @City nvarchar (50),  
   @Address nvarchar (100)  
)  
as  
begin  
   Update StudentReg   
   set Name=@Name,  
   City=@City,  
   Address=@Address  
   where Id=@StdId  
End
GO
/****** Object:  StoredProcedure [dbo].[UpdatetblEmployee]    Script Date: 22-02-2020 17:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
          
CREATE   procedure [dbo].[UpdatetblEmployee]            
(      
   @id int,          
   @FirstName nvarchar(50),  
   @MiddleName nvarchar(50)='',      
   @LastName nvarchar(50)='',      
   @FatherName nvarchar(50)='',  
   @Caste nvarchar(50)='',  
   @Religion nvarchar(50)='',  
   @BloodGroup nvarchar(50)='',  
   @Remarks nvarchar(50)=''
         
)            
as            
begin            
   Update tblEmployee             
   set FirstName=@FirstName,MiddleName=@MiddleName,LastName=@LastName,FatherName=@FatherName,Caste=@Caste,Religion=@Religion,           
             BloodGroup=@BloodGroup,Remarks=@Remarks    
   where Id=@Id            
End  
  
--select * from tblEmployee  
  
--select * from tblEmployeeAdd  
  
--select * from tblDepartment
GO
USE [master]
GO
ALTER DATABASE [vikas] SET  READ_WRITE 
GO
