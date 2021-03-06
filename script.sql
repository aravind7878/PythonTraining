USE [master]
GO
/****** Object:  Database [BIHybridFramework]    Script Date: 12/8/2017 7:46:57 PM ******/
CREATE DATABASE [BIHybridFramework]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BIFramWork_2016', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\BIFramWork_2016.mdf' , SIZE = 12288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BIFramWork_2016_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\BIFramWork_2016_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BIHybridFramework] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BIHybridFramework].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BIHybridFramework] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BIHybridFramework] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BIHybridFramework] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BIHybridFramework] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BIHybridFramework] SET ARITHABORT OFF 
GO
ALTER DATABASE [BIHybridFramework] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BIHybridFramework] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BIHybridFramework] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BIHybridFramework] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BIHybridFramework] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BIHybridFramework] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BIHybridFramework] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BIHybridFramework] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BIHybridFramework] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BIHybridFramework] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BIHybridFramework] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BIHybridFramework] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BIHybridFramework] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BIHybridFramework] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BIHybridFramework] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BIHybridFramework] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BIHybridFramework] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BIHybridFramework] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BIHybridFramework] SET  MULTI_USER 
GO
ALTER DATABASE [BIHybridFramework] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BIHybridFramework] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BIHybridFramework] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BIHybridFramework] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BIHybridFramework] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BIHybridFramework]
GO
/****** Object:  Schema [ADM]    Script Date: 12/8/2017 7:46:57 PM ******/
CREATE SCHEMA [ADM]
GO
/****** Object:  Schema [DW]    Script Date: 12/8/2017 7:46:57 PM ******/
CREATE SCHEMA [DW]
GO
/****** Object:  UserDefinedTableType [dbo].[UDT_FeatureList]    Script Date: 12/8/2017 7:46:57 PM ******/
CREATE TYPE [dbo].[UDT_FeatureList] AS TABLE(
	[SK] [int] NULL,
	[ReportURL] [nvarchar](100) NULL,
	[IsActive] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UDT_GroupPermissionList]    Script Date: 12/8/2017 7:46:57 PM ******/
CREATE TYPE [dbo].[UDT_GroupPermissionList] AS TABLE(
	[Group_SK] [int] NULL,
	[Feature_SK] [int] NULL,
	[AccessMode] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UDT_GroupPermissions]    Script Date: 12/8/2017 7:46:57 PM ******/
CREATE TYPE [dbo].[UDT_GroupPermissions] AS TABLE(
	[User_SK] [int] NULL,
	[Feature_SK] [int] NULL,
	[AccessMode] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UDT_UserGroups]    Script Date: 12/8/2017 7:46:57 PM ******/
CREATE TYPE [dbo].[UDT_UserGroups] AS TABLE(
	[Permissions_SK] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UDT_UserLocationList]    Script Date: 12/8/2017 7:46:57 PM ******/
CREATE TYPE [dbo].[UDT_UserLocationList] AS TABLE(
	[UserSK] [int] NULL,
	[LocationSK] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UDT_UserLocations]    Script Date: 12/8/2017 7:46:57 PM ******/
CREATE TYPE [dbo].[UDT_UserLocations] AS TABLE(
	[DId] [int] NULL,
	[UserSK] [int] NULL,
	[LocationSK] [int] NULL
)
GO
/****** Object:  Table [ADM].[Alerts]    Script Date: 12/8/2017 7:46:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ADM].[Alerts](
	[DId] [int] IDENTITY(1,1) NOT NULL,
	[Feature_SK] [int] NULL,
	[Time] [date] NULL,
	[Message] [nvarchar](600) NULL,
	[User_SK] [int] NULL,
 CONSTRAINT [PK__Alerts__C03656506188CA78] PRIMARY KEY CLUSTERED 
(
	[DId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ADM].[UserLocations]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ADM].[UserLocations](
	[Did] [int] IDENTITY(1,1) NOT NULL,
	[UserSK] [int] NOT NULL,
	[LocationSK] [int] NOT NULL,
 CONSTRAINT [PK_ADM.UserLocations] PRIMARY KEY CLUSTERED 
(
	[Did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ADServers]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADServers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ServerDesc] [nvarchar](50) NULL,
	[HostName] [nvarchar](50) NOT NULL,
	[IPAddress] [nchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CompanyId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppSettings]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppSettings](
	[DID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyMode] [int] NULL,
	[TrackLogin] [tinyint] NULL,
	[AdminMail] [nvarchar](200) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](80) NOT NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_Company_IsActive]  DEFAULT ((1)),
	[AliasName] [nvarchar](200) NULL,
	[CSSFile] [nvarchar](200) NULL,
	[DateCreated] [date] NULL,
	[IsLocked] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmailTemplates]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailTemplates](
	[EmailTemplateID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[EmailType] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](200) NULL,
	[EmailContent] [nvarchar](max) NOT NULL,
	[CompanyId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExcelFiles_History]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExcelFiles_History](
	[DId] [bigint] IDENTITY(1,1) NOT NULL,
	[FeatureID] [int] NULL,
	[FileName] [nvarchar](255) NULL,
	[UpLoadedDate] [datetime] NULL,
	[ExcelPath] [nvarchar](max) NULL,
	[HtmlPath] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Features]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Features](
	[SK] [int] IDENTITY(1,1) NOT NULL,
	[Parent_SK] [int] NULL,
	[DisplayText] [varchar](100) NOT NULL,
	[ReportURL] [varchar](max) NULL,
	[MenuType] [tinyint] NULL,
	[DisplayOrder] [int] NULL,
	[ImagePath] [varchar](200) NULL,
	[HoverImagePath] [varchar](200) NULL,
	[IsActive] [bit] NULL,
	[ServerType] [int] NULL,
	[ServerSK] [int] NULL,
	[CompanyId] [int] NULL,
	[ReportHeight] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeaturesBlog]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeaturesBlog](
	[SK] [int] IDENTITY(1,1) NOT NULL,
	[User_SK] [int] NULL,
	[Feature_SK] [int] NULL,
	[Message] [varchar](max) NULL,
	[CreatedDate] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GenServerOptions]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenServerOptions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DisableOTP] [bit] NULL,
	[CreateUser] [bit] NULL,
	[ReportingMail] [nvarchar](50) NULL,
	[ReportingName] [nvarchar](50) NULL,
	[LogoImg] [nvarchar](100) NULL,
	[Notifications] [tinyint] NULL,
	[ServerStartTime] [date] NULL,
	[ThemeColor] [nvarchar](50) NULL,
	[SessionTimeOut] [int] NULL,
	[DefaultLogType] [nvarchar](50) NULL,
	[CompanyId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupPermissions]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupPermissions](
	[SK] [int] IDENTITY(1,1) NOT NULL,
	[Group_SK] [int] NULL,
	[Feature_SK] [int] NULL,
	[AccessMode] [tinyint] NULL,
 CONSTRAINT [PK_GroupPermissions] PRIMARY KEY CLUSTERED 
(
	[SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportAccessLog]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportAccessLog](
	[SK] [int] IDENTITY(1,1) NOT NULL,
	[User_SK] [int] NULL,
	[Feature_SK] [int] NULL,
	[AccessDate] [datetime] NULL,
	[CompanyId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportServers]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportServers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ServerName] [nvarchar](50) NOT NULL,
	[Host] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[PassKey] [nvarchar](50) NULL,
	[Domain] [nvarchar](50) NULL,
	[PublicReportUrl] [nvarchar](100) NOT NULL,
	[Params] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[ServerTypeId] [int] NOT NULL,
	[CompanyId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServerTypes]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerTypes](
	[ServerTypeSk] [int] NOT NULL,
	[ServerTypeName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NULL,
	[ShowHide] [bit] NULL,
	[CompanyId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SMTPServers]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMTPServers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ServerDesc] [nvarchar](50) NULL,
	[EmailID] [nvarchar](50) NOT NULL,
	[PassKey] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](50) NULL,
	[port] [int] NOT NULL,
	[ServerAddr] [nvarchar](50) NOT NULL,
	[EnableSSL] [bit] NULL,
	[AnonymousAuth] [bit] NULL,
	[CompanyId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SSIS Configurations]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSIS Configurations](
	[ConfigurationFilter] [nvarchar](255) NOT NULL,
	[ConfiguredValue] [nvarchar](255) NULL,
	[PackagePath] [nvarchar](255) NOT NULL,
	[ConfiguredValueType] [nvarchar](20) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SSIS Configurationstest]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSIS Configurationstest](
	[ConfigurationFilter] [nvarchar](255) NOT NULL,
	[ConfiguredValue] [nvarchar](255) NULL,
	[PackagePath] [nvarchar](255) NOT NULL,
	[ConfiguredValueType] [nvarchar](20) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SystemLog]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemLog](
	[SystemLogID] [int] IDENTITY(1,1) NOT NULL,
	[ScreenName] [varchar](500) NULL,
	[FunctionName] [varchar](500) NULL,
	[ParameterValues] [varchar](500) NULL,
	[Exception] [varchar](2000) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_SEA_tblSystemLog] PRIMARY KEY CLUSTERED 
(
	[SystemLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TableauRefreshLog]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableauRefreshLog](
	[Did] [int] IDENTITY(1,1) NOT NULL,
	[UserSK] [int] NULL,
	[EventTime] [datetime] NULL,
	[EventStatus] [tinyint] NULL,
 CONSTRAINT [PK_TableauRefreshLog] PRIMARY KEY CLUSTERED 
(
	[Did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableauStatus]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableauStatus](
	[DId] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [datetime] NULL,
	[RefreshedBy] [int] NULL,
	[Is_Intiated] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Group_Permissions]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Group_Permissions](
	[SK] [int] IDENTITY(1,1) NOT NULL,
	[User_SK] [int] NULL,
	[Group_SK] [int] NULL,
 CONSTRAINT [PK_User_Group_Permissions] PRIMARY KEY CLUSTERED 
(
	[SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserGroups]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroups](
	[SK] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](100) NULL,
	[IsActive] [tinyint] NULL,
	[Description] [nvarchar](100) NULL,
	[CompanyId] [int] NULL,
 CONSTRAINT [PK_UserGroups] PRIMARY KEY CLUSTERED 
(
	[SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserPermissions]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPermissions](
	[SK] [int] IDENTITY(1,1) NOT NULL,
	[User_SK] [int] NULL,
	[Feature_SK] [int] NULL,
	[AccessMode] [tinyint] NULL,
 CONSTRAINT [PK_UserPermissions] PRIMARY KEY CLUSTERED 
(
	[SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[SK] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[IsADLogin] [tinyint] NULL,
	[IsActive] [tinyint] NULL,
	[UserGroup_SK] [int] NULL,
	[DefaultUrl] [varchar](200) NULL,
	[ProfilePic] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[CompanyLogo] [varchar](100) NULL CONSTRAINT [DF_Users_ComapanyLogo]  DEFAULT (NULL),
	[CompanyId] [int] NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserSessions]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserSessions](
	[UserSessionID] [int] IDENTITY(1,1) NOT NULL,
	[UserSK] [int] NULL,
	[LogInTimeStamp] [datetime] NULL,
	[LogOutTimeStamp] [datetime] NULL,
	[UserAgentData] [varchar](400) NULL,
	[IP] [varchar](30) NULL,
	[LogOutType] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [DW].[d_Locations]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DW].[d_Locations](
	[SK] [int] IDENTITY(1,1) NOT NULL,
	[BK] [nvarchar](5) NULL,
	[SubCode] [nvarchar](5) NULL,
	[LocationCode] [nvarchar](10) NULL,
	[Name] [nvarchar](50) NULL,
	[StateCode] [nvarchar](5) NULL,
	[State] [nvarchar](50) NULL,
	[Region] [nvarchar](50) NULL,
	[EZLaborPayrollCompanyCode] [nvarchar](50) NULL,
	[DepartmentMask] [nvarchar](50) NULL,
	[DutyMask] [nvarchar](50) NULL,
	[Status] [nvarchar](10) NULL,
	[InactiveFrom] [date] NULL,
	[City] [nvarchar](100) NULL,
	[Latitude] [numeric](16, 4) NULL,
	[Longitude] [numeric](16, 4) NULL,
	[TransitMinerLocationCode] [nvarchar](20) NULL
) ON [PRIMARY]

GO
ALTER TABLE [ADM].[UserLocations]  WITH CHECK ADD  CONSTRAINT [FK_UserLocations_Users] FOREIGN KEY([UserSK])
REFERENCES [dbo].[Users] ([SK])
GO
ALTER TABLE [ADM].[UserLocations] CHECK CONSTRAINT [FK_UserLocations_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users] FOREIGN KEY([SK])
REFERENCES [dbo].[Users] ([SK])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users]
GO
/****** Object:  StoredProcedure [ADM].[sprRetrieveAlerts]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [ADM].[sprRetrieveAlerts]
	@DId [int],
	@UserSK [int],
	@_Mode [int] = 0,
	@_Offset [int] = 0,
	@_Count [int] = 0,
	@_SortOrder [int] = NULL,
	@_SortBy [varchar](255) = NULL,
	@_TotalRecords [int] = 0 OUTPUT
AS

IF (@_Mode = 0)	-- GET ALL RECORDS (NOT USED)
BEGIN
	SELECT * FROM [ADM].[Alerts] (NOLOCK)
END
ELSE IF (@_Mode = 1)	-- GET RECORDS BY 'DId' (PRIMARY KEY) (NOT USED)
BEGIN
	SELECT * FROM [ADM].[Alerts] (NOLOCK) 
	WHERE DId = @DId 
	ORDER BY DId
END
ELSE IF (@_Mode = 2)	-- GET 10 NOTIFICATIONS BY USER
BEGIN
	/*USER NOTIFICATIONS*/
	SET @DId = CASE WHEN @DId = 0 THEN NULL ELSE @DId END
	
	SELECT TOP 10 A.DId, [Description], [Read] = CAST(CASE WHEN AURF.DId IS NULL THEN 1 ELSE 0 END AS BIT)
	FROM [ADM].[Alerts](NOLOCK) A
	LEFT JOIN ADM.AlertUserReadFlag(NOLOCK) AURF ON (A.DId = AURF.AlertId AND AURF.UserId = @UserSK)
	WHERE (@DId IS NULL OR A.DId < @DId)
	ORDER BY A.DId DESC
	
	/*UPDATING READ FLAG*/
	INSERT INTO ADM.AlertUserReadFlag(UserId, AlertId)
	SELECT A.UserSK, A.DId
	FROM
	(
		SELECT TOP 10 UserSK = @UserSK, A.DId
		FROM [ADM].[Alerts](NOLOCK) A
		WHERE (@DId IS NULL OR A.DId < @DId)
		ORDER BY A.DId DESC
	)A
	LEFT JOIN ADM.AlertUserReadFlag(NOLOCK) AURF ON (A.DId = AURF.AlertId AND AURF.UserId = @UserSK)
	WHERE AURF.DId IS NULL
END
ELSE IF (@_Mode = 3)	-- GET USER NOTIFICATIONS COUNT (UNREAD & TOTAL)
BEGIN
	DECLARE @TotalNotificationsCount INT


--DELETE FROM
--ADM.AlertUserReadFlag 
--WHERE 
--AlertId IN (SELECT distinct  DId FROM [ADM].[Alerts] WHERE DATEDIFF(DAY, CompletedOn, GETDATE()) > 31)



--DELETE FROM [ADM].[Alerts]
--WHERE CompletedOn < DATEADD(DAY,-31,GETDATE())
--AND NOT EXISTS (SELECT DISTINCT AlertId FROM [ADM].AlertUserReadFlag)

	
--SELECT @TotalNotificationsCount = COUNT(1)
--FROM [ADM].[Alerts](NOLOCK) A

--SELECT UnreadNotificationsCount = COUNT(1), TotalNotificationsCount = @TotalNotificationsCount
--FROM [ADM].[Alerts](NOLOCK) A
--LEFT JOIN ADM.AlertUserReadFlag(NOLOCK) AURF ON (A.DId = AURF.AlertId AND AURF.UserId = @UserSK)
--WHERE AURF.DId IS NULL


END





GO
/****** Object:  StoredProcedure [ADM].[sprRetrieveUserLocations]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ADM].[sprRetrieveUserLocations]	
	@_Mode [int] = 0,
	@Did [int] = 0,
	@_UserSK [int] = 0
AS

IF (@_Mode = 1)	-- GET ALL RECORDS
BEGIN
	SELECT
		[Did], [UserSK], [LocationSK] 
	FROM
		[ADM].[UserLocations] (NOLOCK)
	WHERE
		[UserSK] = @_UserSK
	ORDER BY
		[LocationSK]

		
END




GO
/****** Object:  StoredProcedure [dbo].[AccessADServers]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AccessADServers]	
	@_Mode [int] = 0,
	@id [int] = 0,
	@ServerDesc varchar(100) = null,
	@HostName	varchar(100) = null,
	@IPAddress	varchar(100) = null,
	@IsActive varchar(100) = null,
	@CompanyId [int] = 0
AS

IF (@_Mode = 1)	-- RETRIEVE
BEGIN
	Select * from dbo.ADServers where CompanyId = @CompanyId
END
ELSE IF (@_Mode = 2)	-- RETRIEVE by ID
BEGIN
	Select * from dbo.ADServers where id = @id
END
ELSE IF (@_Mode = 3)	-- UPDATE
BEGIN
	UPDATE dbo.ADServers 
	SET 
		ServerDesc = @ServerDesc,
		HostName   = @HostName,
		IPAddress  = @IPAddress,	
		IsActive   = @IsActive
	where id = @id
END


ELSE IF (@_Mode = 4)	-- UPDATE
BEGIN
	INSERT INTO dbo.ADServers (ServerDesc, HostName, IPAddress, IsActive, CompanyId)
						VALUES('Primary AD Server', 'SEANERGYIND', 'server1.seanergyind.in', 1, @CompanyId)
	
	INSERT INTO dbo.ADServers (ServerDesc, HostName, IPAddress, IsActive, CompanyId)
						VALUES('Primary AD Server','SEANERGYTEST', '192.168.10.3', 1, @CompanyId)
END


GO
/****** Object:  StoredProcedure [dbo].[AccessAppSettings]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AccessAppSettings]	
	@_Mode [int] = 0,	
	@CompanyId [int] = 0,
	@DefaultCompanyName nvarchar(100)=null
AS

IF (@_Mode = 0)	-- RETRIEVE
BEGIN
	SET @DefaultCompanyName = (select top 1 name from Company)
	SELECT *,@DefaultCompanyName as DefaultCompanyName from dbo.AppSettings
END
--exec dbo.AccessAppSettings @_Mode=0


GO
/****** Object:  StoredProcedure [dbo].[AccessCompany]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--exec dbo.AccessCompany @id=0,@Name=N'werds',@IsActive=1,@_Mode=4
--exec dbo.AccessCompany @_Mode=1


CREATE PROCEDURE [dbo].[AccessCompany]
	@_Mode [int],
	@Id [int]=0 OUTPUT,
    @Name nvarchar(60) = null,
    @LogoImg nvarchar(100) = null,
	@IsActive BIT= 0,
	@AliasName nvarchar(60) = null,
	@CSSFile nvarchar(60) = null,
	@CipherText nvarchar(256) = null,
	@IsLocked bit  = null
AS

IF (@_Mode = 0)	-- GET ALL RECORDS (NOT USED)
BEGIN
	SELECT CMP.*,
		   GS.LogoImg AS Logo,
		   (SELECT COUNT(1) FROM Users US WHERE US.CompanyId = CMP.ID AND US.IsActive= 1 ) AS  ActiveUsers
	FROM [dbo].[Company] CMP (NOLOCK)	
	inner join 	dbo.GenServerOptions GS ON GS.CompanyId = CMP.ID
END
ELSE IF (@_Mode = 1)	-- GET ACTIVE RECORDS
BEGIN
	SELECT CMP.*,
		   GS.LogoImg AS Logo,
		   (SELECT COUNT(1) FROM Users US WHERE US.CompanyId = CMP.ID AND US.IsActive= 1 ) AS  ActiveUsers
	FROM [dbo].[Company] CMP (NOLOCK)	
	inner join 	dbo.GenServerOptions GS ON GS.CompanyId = CMP.ID
	where CMP.IsActive = 1
END
ELSE IF (@_Mode = 2)	-- GET RECORDS BY 'DId' (PRIMARY KEY) (NOT USED)
BEGIN
	SELECT CMP.*,
		   GS.LogoImg AS Logo
	FROM [dbo].[Company] CMP (NOLOCK)	
	inner join 	dbo.GenServerOptions GS ON GS.CompanyId = CMP.ID
	where CMP.ID= @Id
END
ELSE IF (@_Mode = 3)	
BEGIN
	SELECT CMP.*,
		   GS.LogoImg AS Logo
	FROM [dbo].[Company] CMP (NOLOCK)	
	inner join 	dbo.GenServerOptions GS ON GS.CompanyId = CMP.ID
	where CMP.Name = @Name
END
ELSE IF (@_Mode = 4)	
BEGIN
	IF(@Id = 0)
	BEGIN
		INSERT INTO [dbo].[Company](Name, IsActive, AliasName, CSSFile, DateCreated, IsLocked) VALUES(@Name, 1, @AliasName, @CSSFile, GETDATE(), @IsLocked)
		SET @Id = CAST(SCOPE_IDENTITY() AS int)	
		EXEC [dbo].[sprRetrieveUsers]	@_Mode=8, @UserName = 'Admin', @Password=@CipherText, @CompanyId=@Id		
		EXEC [dbo].[AccessGenServerOptions] @_Mode=2, @CompanyId=@Id
		EXEC [dbo].[AccessADServers]	@_Mode=4, @CompanyId=@Id				
		EXEC [dbo].[AccessSMTPServers]	@_Mode=4, @CompanyId=@Id
		EXEC [dbo].[RetrieveEmailTemplate]	@_Mode=3, @CompanyId=@Id
		SELECT @Id
	END 
	ELSE
	BEGIN
		UPDATE [dbo].[Company]
		SET 
			Name= @Name,
			IsActive= @IsActive,
			CSSFile = @CSSFile,
			AliasName = @AliasName,
			IsLocked = @IsLocked
		WHERE ID= @id
		SELECT @Id
	END
END
ELSE IF (@_Mode = 5)	
BEGIN

	-- All PERMISSIONS 	
	DELETE FROM  [dbo].[UserPermissions] WHERE [User_SK] IN  (SELECT SK FROM [dbo].[Users] WHERE CompanyId= @Id)
	DELETE FROM  [dbo].[User_Group_Permissions] WHERE [User_SK] IN  (SELECT SK FROM [dbo].[Users] WHERE CompanyId= @Id)
	DELETE FROM  [dbo].[GroupPermissions] WHERE Group_SK IN ( SELECT SK FROM [dbo].[UserGroups] WHERE CompanyId= @Id)
	DELETE FROM  [dbo].[UserGroups] WHERE CompanyId= @Id
	-- USERS & Notifications
	DELETE FROM  [ADM].[Alerts] WHERE [User_SK] IN  (SELECT SK FROM [dbo].[Users] WHERE CompanyId= @Id)
	DELETE FROM  [dbo].[UserSessions] WHERE [UserSK] IN  (SELECT SK FROM [dbo].[Users] WHERE CompanyId= @Id)	
	DELETE FROM  [dbo].[Users] WHERE CompanyId= @Id
	-- SERVERs Mail
	DELETE FROM  [dbo].[ADServers] WHERE CompanyId= @Id
	DELETE FROM  [dbo].[EmailTemplates] WHERE CompanyId= @Id
	DELETE FROM  [dbo].[ReportServers] WHERE CompanyId= @Id
	DELETE FROM  [dbo].[SMTPServers] WHERE CompanyId= @Id
	-- Features Related
	DELETE FROM  [dbo].[FeaturesBlog] WHERE Feature_SK IN (SELECT SK FROM [dbo].[Features] WHERE CompanyId= @Id)
	DELETE FROM  [dbo].[ReportAccessLog]  WHERE Feature_SK IN (SELECT SK FROM [dbo].[Features] WHERE CompanyId= @Id)
	DELETE FROM  [dbo].[Features] WHERE CompanyId= @Id
	-- Company Related
	DELETE FROM  [dbo].[Company] WHERE ID= @Id
	DELETE FROM  [dbo].[GenServerOptions] WHERE CompanyId= @Id

	SELECT @Id
	-----------
END
ELSE IF (@_Mode = 6)	
BEGIN
	SELECT CMP.*,
		   GS.LogoImg AS Logo
	FROM [dbo].[Company] CMP (NOLOCK)	
	inner join 	dbo.GenServerOptions GS ON GS.CompanyId = CMP.ID
	where CMP.AliasName = @Name
END
ELSE IF (@_Mode = 7)	
BEGIN
	SELECT CMP.*,
		   GS.LogoImg AS Logo
	FROM [dbo].[Company] CMP (NOLOCK)	
	inner join 	dbo.GenServerOptions GS ON GS.CompanyId = CMP.ID
	where CMP.Name = @Name OR AliasName=@AliasName
END







--exec dbo.AccessCompany @id=0,@Name=N'Test1',@IsActive=0,@AliasName=N'Test1',@CSSFile=N'BIFramework.css',@LogoImg=N'.png',@_Mode=4




GO
/****** Object:  StoredProcedure [dbo].[AccessFeaturesBlog]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [dbo].[AccessFeaturesBlog]	@_Mode=1, @Feature_SK=2, @User_SK=1318, @Message='Hello'
CREATE PROCEDURE [dbo].[AccessFeaturesBlog]	
	@_Mode int = 0,
	@SK int = 0,
	@Feature_SK int= 0,
	@User_SK	int= 0,
	@Message	varchar(Max) = null
AS

IF (@_Mode = 1)	-- RETRIEVE
BEGIN
	INSERT INTO  dbo.FeaturesBlog(Feature_SK, User_SK, [Message], CreatedDate) VALUES(@Feature_SK, @User_SK, @Message, GETDATE())
	
END

ELSE IF (@_Mode = 2)	-- RETRIEVE by ID
BEGIN
	Select 
		--F.DisplayText,
		U.UserName,
		U.ProfilePic,
		FBL.Message,
		FBL.CreatedDate
	 from dbo.FeaturesBlog FBL
	Inner Join dbo.Users U ON U.SK = FBL.User_SK
	--Inner Join dbo.Features F ON F.SK = FBL.Feature_SK
	 WHERE Feature_SK = @Feature_SK
	 ORDER BY FBL.CreatedDate DESC
END





GO
/****** Object:  StoredProcedure [dbo].[AccessGenServerOptions]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AccessGenServerOptions]	
	@_Mode [int] = 0,
	@id [int] = 0,
	@DisableOTP [int] = 0,
	@CreateUser [int] = 0,	
	@ReportingMail nvarchar(60)=null,
	@ReportingName nvarchar(60)=null,
	@LogoImg nvarchar(60)=null,
	@Notifications [int] = 0,
	@ThemeColor nvarchar(60)=null,
	@SessionTimeOut int = 300,
	@DefaultLogType nvarchar(50)=null,
	@CompanyId [int] = 0
AS

IF (@_Mode = 1)	-- RETRIEVE
BEGIN
	Select * from dbo.GenServerOptions where CompanyId = @CompanyId
END

ELSE IF (@_MODE = 2)	-- INSERT DEFAULT VALUES WHEN NEW COMPANY CREATED
BEGIN	
	 INSERT INTO DBO.GENSERVEROPTIONS( DISABLEOTP, CREATEUSER, REPORTINGMAIL, REPORTINGNAME, LOGOIMG, NOTIFICATIONS, THEMECOLOR, SESSIONTIMEOUT, DEFAULTLOGTYPE,CompanyId)	
	 VALUES (1,0, 'support@seanergysoftech.com', 'Admin', ('./Content/img/Logo_O.png'), null,null,1000,0,@CompanyId)	
END
ELSE IF (@_Mode = 3)	-- UPDATE
BEGIN
	update 	dbo.GenServerOptions
	set 
		DisableOTP    = @DisableOTP   ,
		CreateUser 	  = @CreateUser 	, 
		ReportingMail = @ReportingMail,
		ReportingName = @ReportingName,
		LogoImg		  = @LogoImg		, 
		Notifications = @Notifications,
		ThemeColor 	  = @ThemeColor,
		SessionTimeOut = @SessionTimeOut,
		DefaultLogType = @DefaultLogType
	where 
		id= @id 
END	
ELSE IF (@_Mode = 4)	-- UPDATE
BEGIN
	update 	dbo.GenServerOptions
	set 
		LogoImg		  = @LogoImg
	where 
		CompanyId= @id 
END


GO
/****** Object:  StoredProcedure [dbo].[AccessGroupPermissions]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AccessGroupPermissions]
	@SK [int] =0,
	@Group_SK [int] =0,
	@Feature_SK [int] =0,
	@AccessMode [tinyint] =0,	
	@_Mode [int] = 0,
	@ComapanyId [int] = 0
AS

IF (@_Mode = 1)	-- DELETE By 'Group_SK' (PRIMARY KEY)
	BEGIN
	INSERT INTO 
		[dbo].[GroupPermissions]
		( [Group_SK], [Feature_SK], [AccessMode])
	VALUES 
		(@Group_SK, @Feature_SK, @AccessMode)
END
IF (@_Mode = 2)	-- DELETE By 'Group_SK' (PRIMARY KEY)
	BEGIN
	DELETE FROM [dbo].[GroupPermissions] WHERE Group_SK = @Group_SK
END


GO
/****** Object:  StoredProcedure [dbo].[AccessReportLog]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC [dbo].[AccessReportLog] @_Mode=2, @CompanyId=1

CREATE PROCEDURE [dbo].[AccessReportLog]
	@User_SK	int= 0,
	@Feature_SK	int= 0,
	@StartDate datetime =null,
	@EndDate datetime  =null,
	@UserString nvarchar(20) = NULL,
	@_Mode int= 0,
	@DynamicParam nvarchar(100)=NULL,
	@DynamicQuery nvarchar(1000)=NULL,
	@CompanyId [int] = 0
AS
IF (@_Mode = 1)
BEGIN
	Insert into [dbo].[ReportAccessLog]( [User_SK], [Feature_SK], [AccessDate], [CompanyId])
	values(@User_SK, @Feature_SK, GETDATE(), @CompanyId)
END

IF (@_Mode = 2)
BEGIN
	Set @DynamicParam  = CASE WHEN (@UserString is NULL OR @UserString = '') THEN ' AND 1=1 ' ELSE 'AND U.SK =' + @UserString END
	-- IIF((@UserString is NULL) OR (@UserString = '') , ' AND 1=1 ', 'AND U.SK =' + @UserString )
	Set @DynamicQuery  = 'SELECT U.UserName,
						  		 F.DisplayText AS FeatureName,
								 RAL.AccessDate
							FROM [dbo].[ReportAccessLog] RAL										
							INNER JOIN dbo.Users U on U.SK = RAL.User_SK
							INNER JOIN dbo.Features F ON F.SK = RAL.Feature_SK
							WHERE (RAL.AccessDate between'''+ Convert(varchar(50), @StartDate) + ''' AND ''' + Convert(varchar(50),@EndDate) +''') AND  U.CompanyId =' + Convert(varchar(50),@CompanyId)  + '' + @DynamicParam
	PRINT @DynamicQuery
	exec  (@DynamicQuery)
END

IF (@_Mode = 3)
BEGIN	
	--Set @DynamicParam = IIF((@UserString is NULL) OR (@UserString = '') , ' AND 1=1 ', 'AND RAL.User_SK =' + @UserString )
	Set @DynamicParam = CASE WHEN (@UserString is NULL) OR (@UserString = '') THEN ' AND 1=1 ' ELSE 'AND RAL.User_SK =' + @UserString END
	Set @DynamicQuery = 'WITH cteFeatureCount(User_SK,Feature_SK, AccessCount)
											AS(
											SELECT	
												User_SK,
												Feature_SK,
												count(1) as AccessCount
											FROM [dbo].[ReportAccessLog] RAL 
											WHERE (RAL.AccessDate between'''+ Convert(varchar(50), @StartDate) + ''' AND ''' + Convert(varchar(50),@EndDate) +''') '+ @DynamicParam + '
											group by Feature_SK, User_SK)' + '
						SELECT
							U.UserName,
							FC.AccessCount,
							F.DisplayText AS FeatureName
						FROM cteFeatureCount FC
						INNER JOIN dbo.Features F ON F.SK = FC.Feature_SK
						INNER JOIN dbo.Users U on U.SK = FC.User_SK
						WHERE  U.CompanyId =' + Convert(varchar(50),@CompanyId)+''
	PRINT @DynamicQuery
	exec  (@DynamicQuery)
END

IF (@_Mode = 4)
BEGIN

	--Set @DynamicParam = IIF((@StartDate is NULL) OR (@EndDate is NULL) , ' ', 'WHERE (RAL.AccessDate between ''' + cast(@StartDate as nvarchar)+ ''' AND ''' + cast(@EndDate as nvarchar) + ''')')
	Set @DynamicParam = CASE WHEN (@StartDate is NULL) OR (@EndDate is NULL) THEN ' ' ELSE 'WHERE (RAL.AccessDate between ''' + cast(@StartDate as nvarchar)+ ''' AND ''' + cast(@EndDate as nvarchar) + ''')' END
	Set @DynamicQuery = 
		'WITH CTEFeature(Feature_SK, AccessCount) as(
		SELECT			
			Feature_SK,
			count(1) as AccessCount
		FROM [dbo].[ReportAccessLog] RAL
		' + @DynamicParam + '
		GROUP BY Feature_SK)

		select F.DisplayText AS FeatureName, CF.AccessCount from CTEFeature CF
		INNER JOIN Features F on F.SK = CF.Feature_SK
		WHERE F.CompanyId =' + Convert(varchar(50),@CompanyId) 

	PRINT @DynamicQuery
	exec  (@DynamicQuery)


END


---


GO
/****** Object:  StoredProcedure [dbo].[AccessReportServers]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AccessReportServers]	
	@_Mode [int] = 0,
	@id [int] = 0	,
	@ServerName nvarchar(100)= null,
	@Host nvarchar(100)= null,
	@UserName nvarchar(100)= null,
	@PassKey nvarchar(100)= null,
	@Params nvarchar(100)= null,
	@Domain nvarchar(100)= null,
	@PublicReportUrl nvarchar(100)= null,
	@IsActive int = 0,
	@ServerTypeId int = null,
	@CompanyId [int] = 0
AS

IF (@_Mode = 1)	-- RETRIEVE
BEGIN
	SELECT	RS.* ,
			ST.ServerTypeName
    FROM dbo.ReportServers RS
	INNER JOIN [dbo].[ServerTypes] ST ON(RS.ServerTypeId = ST.ServerTypeSk)
	where RS.CompanyId =@CompanyId AND ST.ServerTypeName != 'Local'  
END

ELSE IF (@_Mode = 2)	-- RETRIEVE by id
BEGIN
	Select  * from dbo.ReportServers  where id = @id
END

ELSE IF (@_Mode = 3)	-- UPDATE
BEGIN
    IF (@id=0)
	BEGIN
		
		Insert into dbo.ReportServers (ServerName, Host, UserName, PassKey, Params, Domain, PublicReportUrl, IsActive,ServerTypeId,CompanyId)
		values(@ServerName, @Host, @UserName, @PassKey, @Params, @Domain, @PublicReportUrl, @IsActive,@ServerTypeId, @CompanyId)

	END

	ELSE
	BEGIN
		update dbo.ReportServers
		set
			ServerName		= @ServerName,
			Host			= @Host		 ,
			UserName		= @UserName	 ,
			PassKey			= @PassKey	 ,
			Params			= @Params	 ,
			Domain			= @Domain	 ,
			PublicReportUrl = @PublicReportUrl,
			IsActive		= @IsActive,
			ServerTypeId =  @ServerTypeId
		where 
		id= @id	
	END
END

IF (@_Mode = 4)	-- RETRIEVE
BEGIN
	SELECT RS.*, ST.ServerTypeName
    FROM dbo.ReportServers RS
	INNER JOIN [dbo].[ServerTypes] ST ON(RS.ServerTypeId = ST.ServerTypeSk)
	WHERE RS.ServerTypeId = @ServerTypeId AND RS.CompanyId = @CompanyId
END

IF (@_Mode = 5)	-- RETRIEVE
BEGIN
	DELETE FROM dbo.ReportServers WHERE id = @id
END


GO
/****** Object:  StoredProcedure [dbo].[AccessSMTPServers]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AccessSMTPServers]	
	@_Mode [int] = 0,
	@id [int] = 0,
	@EmailID nvarchar(100)=null, 
	@PassKey nvarchar(100)=null,
	@DisplayName nvarchar(100)=null,
	@ServerDesc nvarchar(100)=null,
	@ServerAddr nvarchar(100)=null,
	@port nvarchar(100)=null,
	@EnableSSL int =0,
	@AnonymousAuth int =0,
	@IsActive int =0,
	@CompanyId [int] = 0
AS

IF (@_Mode = 1)	-- RETRIEVE
BEGIN
	Select * from dbo.SMTPServers where CompanyId = @CompanyId
END
ELSE IF (@_Mode = 2)	-- UPDATE
BEGIN
	Select * from dbo.SMTPServers where id = @id
END
ELSE IF (@_Mode = 3)	-- UPDATE
BEGIN
	UPDATE dbo.SMTPServers 
	SET 		
		 EmailID      =    @EmailID       
		,PassKey	 =	  @PassKey	
		,DisplayName =    @DisplayName
		,ServerDesc  =    @ServerDesc 
		,ServerAddr  =    @ServerAddr 
		,port		 =    @port		
		,EnableSSL	 =    @EnableSSL	
		,AnonymousAuth =  @AnonymousAuth
		--,IsActive	 =    @IsActive	
	where
		id = @id
END

ELSE IF (@_Mode = 4)	-- UPDATE
BEGIN
	INSERT INTO dbo.SMTPServers(EmailID, PassKey,  DisplayName,  ServerDesc, ServerAddr, port, EnableSSL, AnonymousAuth, CompanyId)
						VALUES('support@seanergysoftech.com', 'Softech!9', 'Seanergy Support Mail', 'Primary Mail Server', 'smtp.gmail.com', 587, 1, 0, @CompanyId)
	
	INSERT INTO dbo.SMTPServers(EmailID, PassKey,  DisplayName,  ServerDesc, ServerAddr, port, EnableSSL, AnonymousAuth, CompanyId)
						VALUES('support@seanergysoftech.com', 'Softech!9', 'Seanergy Support Mail', 'Secondary Mail Server', 'smtp.gmail.com', 587, 1, 0, @CompanyId)
END

--EXEC [dbo].[AccessSMTPServers] @_Mode=4, @CompanyId=


GO
/****** Object:  StoredProcedure [dbo].[RetrieveEmailTemplate]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RetrieveEmailTemplate]
	@EmailType [varchar](200)=NULL,
	@Subject [varchar](200)=NULL,
	@EmailContent [varchar](MAX)=NULL,
	@EmailTemplateID [varchar](200)=NULL,
	@_Mode [int] = 0,
	@CompanyId [int] = 0
AS

IF @_Mode = 0
BEGIN
	SELECT * FROM [dbo].[EmailTemplates]  where CompanyId= @CompanyId
END

ELSE IF @_Mode = 1
BEGIN
SELECT [EmailTemplateID]
		  ,[Category]
		  ,[EmailType]
		  ,[Subject]
		  ,[EmailContent]
	FROM [dbo].[EmailTemplates]  
	WHERE [EmailType] =  @EmailType AND  CompanyId= @CompanyId
--	PRINT @EmailType
END

ELSE IF @_Mode = 2

BEGIN
UPDATE [dbo].[EmailTemplates]  
SET		
	  --[Subject] = @Subject,
	  [EmailContent] = @EmailContent

WHERE EmailTemplateID =  @EmailTemplateID
--	PRINT @EmailType
END

ELSE IF @_Mode = 3

BEGIN
	INSERT INTO [dbo].[EmailTemplates]( Category, EmailType, Subject, CompanyId, EmailContent)
				values('WEB', 'Test','Test Template', @CompanyId, (select EmailContent from [dbo].[EmailTemplates] where EmailType = 'Test' AND CompanyId = 0))
	INSERT INTO [dbo].[EmailTemplates]( Category, EmailType, Subject, CompanyId, EmailContent)
				values('WEB', 'USER_ACTIVATION','Welcome to BIFramework', @CompanyId, (select EmailContent from [dbo].[EmailTemplates] where EmailType = 'USER_ACTIVATION' AND CompanyId = 0))
	INSERT INTO [dbo].[EmailTemplates]( Category, EmailType, Subject, CompanyId, EmailContent)
				values('WEB', 'FORGOT_PASSWORD','Forgot Password', @CompanyId, (select EmailContent from [dbo].[EmailTemplates] where EmailType = 'FORGOT_PASSWORD' AND CompanyId = 0))
	INSERT INTO [dbo].[EmailTemplates]( Category, EmailType, Subject, CompanyId, EmailContent)
				values('WEB', 'OTP','Verification Code', @CompanyId, (select EmailContent from [dbo].[EmailTemplates] where EmailType = 'OTP' AND CompanyId = 0))
	INSERT INTO [dbo].[EmailTemplates]( Category, EmailType, Subject, CompanyId, EmailContent)
				values('WEB', 'NEWUSER','AD User Request',  @CompanyId, (select EmailContent from [dbo].[EmailTemplates] where EmailType = 'NEWUSER' AND CompanyId = 0))
				
	--select EmailContent from [dbo].[EmailTemplates] where EmailType = 'USER_ACTIVATION' AND CompanyId = 1
END


GO
/****** Object:  StoredProcedure [dbo].[sprExecuteExcelFiles_History]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprExecuteExcelFiles_History]
	@DId [int] = NULL,
	@FeatureID [int] =NULL,
	@FileName [nvarchar](255) = NULL,
	@UpLoadedDate datetime = NULL,
	@ExcelPath [nvarchar](max) = NULL,
	@HtmlPath [nvarchar] (max) = NULL,
	@_Mode [int] = 0
AS

IF (@_Mode = 1)	-- INSERT/UPDATE By 'SK' (PRIMARY KEY)
BEGIN
	
		INSERT INTO [dbo].[ExcelFiles_History]([FeatureID], [FileName], [UpLoadedDate], [ExcelPath],[HtmlPath])
		VALUES (@FeatureID, @FileName, @UpLoadedDate, @ExcelPath,@HtmlPath)
	
END
IF (@_Mode = 2)	-- DELETE By 'SK' (PRIMARY KEY)
BEGIN
	DELETE FROM [dbo].[ExcelFiles_History]
	WHERE [DId] = @DId
END





GO
/****** Object:  StoredProcedure [dbo].[sprExecuteFeatures]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprExecuteFeatures]
	@SK [int] =NULL,
	@Parent_SK [int]= 0,
	@DisplayText [varchar](100) =NULL,
	@ReportURL [varchar](max) =NULL,
	@DisplayOrder [int] =0,
	@ImagePath [varchar](200)=NULL,
	@IsActive [tinyint]=0,
	@_Mode [int] = 0,
	@ServerType  [int] = 0,
	@ServerSK [int] = 0,
	@HoverImagePath [varchar](200)=NULL,
	@User_SK [int] = 0,
	@CompanyId [int] = 0,
	@FeatureSK [int] = 0,
	@ReportHeight [int] = null
AS

IF (@_Mode = 1)	-- INSERT/UPDATE By 'SK' (PRIMARY KEY)
BEGIN
	IF (SELECT COUNT(*) FROM [dbo].[Features] (NOLOCK) WHERE [SK] = @SK) = 0
	BEGIN
		INSERT INTO [dbo].[Features]([SK], [Parent_SK], [DisplayText], [ReportURL], [ReportHeight], [DisplayOrder], [ImagePath], [IsActive], [CompanyId])
		VALUES (@SK, @Parent_SK, @DisplayText, @ReportURL, @ReportHeight, @DisplayOrder, @ImagePath, @IsActive, @CompanyId)
		exec sprRetrieveNotifications @_Mode=2,@UserId = @User_SK, @Message = 'Added Feature Successfully'
	END
	ELSE
	BEGIN
		UPDATE [dbo].[Features]
		SET [Parent_SK] = @Parent_SK, [DisplayText] = @DisplayText, [ReportURL] = @ReportURL, [ReportHeight] = @ReportHeight, [DisplayOrder] = @DisplayOrder, [ImagePath] = @ImagePath, [IsActive] = @IsActive
		WHERE [SK] = @SK

		exec sprRetrieveNotifications @_Mode=2,@UserId = @User_SK, @Message = 'Feature Updated Successfully'
	END
END

IF (@_Mode = 2)	-- DELETE By 'SK' (PRIMARY KEY)
BEGIN

	DELETE FROM [dbo].[Features] 
	WHERE [SK] = @SK

    DELETE FROM [dbo].[GroupPermissions] 
	WHERE Feature_SK = @SK

		DELETE FROM [dbo].[UserPermissions]
	WHERE Feature_SK = @SK

	exec sprRetrieveNotifications @_Mode=2,@UserId = @User_SK, @Message = 'Feature Deleted Successfully'
END

IF (@_Mode = 3)
BEGIN
	UPDATE [dbo].[Features]
		SET [ReportURL] = @ReportURL, [IsActive] = @IsActive
		WHERE [SK] = @SK

	exec sprRetrieveNotifications @_Mode=2,@UserId = @User_SK, @Message = 'Feature Updated Successfully'
END

IF (@_Mode = 4)	
BEGIN
    IF ((SELECT COUNT(1) FROM  [dbo].[Features] WHERE SK = @SK) >= 1)
	BEGIN
		UPDATE [dbo].[Features]
		SET 
			[Parent_SK] = @Parent_SK,
			[DisplayText] = @DisplayText, 
			[ReportURL] = @ReportURL, 
			[DisplayOrder] = @DisplayOrder, 
			[ImagePath] = @ImagePath,  
			[IsActive] = @IsActive, 
			[ServerType] = @ServerType, 
			[ServerSK] = @ServerSK,
			[ReportHeight] = @ReportHeight   
		WHERE
			SK = @SK

		exec sprRetrieveNotifications @_Mode=2,@UserId = @User_SK, @Message = 'Feature Updated Successfully'
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[Features]([Parent_SK], [DisplayText], [ReportURL], [ReportHeight], [DisplayOrder], [ImagePath], [IsActive], [ServerType], [ServerSK], [CompanyId])
	    VALUES (@Parent_SK, @DisplayText, @ReportURL, @ReportHeight, @DisplayOrder, @ImagePath, @IsActive, @ServerType, @ServerSK, @CompanyId)

		exec sprRetrieveNotifications @_Mode=2,@UserId = @User_SK, @Message = 'Feature Added Successfully'
	END
END
ELSE IF (@_Mode = 5)
	BEGIN
		-- Add Features for New Company

		INSERT INTO [dbo].[Features]([Parent_SK], [DisplayText], [ReportURL], [DisplayOrder], [ImagePath], [IsActive], [CompanyId],[ServerType],[ReportHeight])
							 VALUES (0, 'Administration', '',200,'./Content/img/Admin_hover.png',1, @CompanyId,3,900)
		SET @Parent_SK = CAST(SCOPE_IDENTITY() AS int)	
		INSERT INTO [dbo].[Features]([Parent_SK], [DisplayText], [ReportURL], [DisplayOrder], [ImagePath], [IsActive], [CompanyId],[ServerType],[ReportHeight])
							 VALUES (@Parent_SK, 'Users', '../Users',1,'',1, @CompanyId,3,900)
		INSERT INTO [dbo].[Features]([Parent_SK], [DisplayText], [ReportURL], [DisplayOrder], [ImagePath], [IsActive], [CompanyId],[ServerType],[ReportHeight])
							 VALUES (@Parent_SK, 'Groups', '../Groups',1,'',1, @CompanyId,3,900)
		INSERT INTO [dbo].[Features]([Parent_SK], [DisplayText], [ReportURL], [DisplayOrder], [ImagePath], [IsActive], [CompanyId],[ServerType],[ReportHeight])
							 VALUES (@Parent_SK, 'Features', '../Features',1,'',1, @CompanyId,3,900)
		INSERT INTO [dbo].[Features]([Parent_SK], [DisplayText], [ReportURL], [DisplayOrder], [ImagePath], [IsActive], [CompanyId],[ServerType],[ReportHeight])
							 VALUES (@Parent_SK, 'Settings', '../ServerInfo',1,'',1, @CompanyId,3,900)
		INSERT INTO [dbo].[Features]([Parent_SK], [DisplayText], [ReportURL], [DisplayOrder], [ImagePath], [IsActive], [CompanyId],[ServerType],[ReportHeight])
							 VALUES (@Parent_SK, 'Admin Reports', '../ServerInfo/ReportsList',1,'',1, @CompanyId,3,900)		

		--// Add Permissions to the New Features for Admin User [@User_SK]

		SELECT @FeatureSK= [SK] FROM [dbo].[Features] where DisplayText like 'Administration' AND CompanyId = @CompanyId
		INSERT INTO dbo.[UserPermissions](User_SK, Feature_SK, AccessMode) SELECT @User_SK, SK, 1 FROM [dbo].[Features] WHERE SK= @FeatureSK  OR Parent_SK = @FeatureSK

		--SELECT @User_SK, @FeatureSK, * FROM [dbo].[Features] WHERE SK= @FeatureSK  OR Parent_SK = @FeatureSK
	END



GO
/****** Object:  StoredProcedure [dbo].[sprExecuteGroupPermissions]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprExecuteGroupPermissions]
	@SK [int] =0,
	@Group_SK [int] =0,
	@Feature_SK [int] =0,
	@AccessMode [tinyint] =0,
	@User_SK  [int] =0, 	
	@DataTable [UDT_UserGroups] READONLY,
	@_Mode [int] = 0,
	@ComapanyId [int] = 0
AS

IF (@_Mode = 1)	-- INSERT/UPDATE By 'SK' (PRIMARY KEY)
BEGIN
	
	INSERT 
	INTO [dbo].[GroupPermissions]
									( [Group_SK], [Feature_SK], [AccessMode])
									SELECT  @User_SK, DT.[Permissions_SK], 1 FROM @DataTable DT			

END
IF (@_Mode = 2)	-- DELETE By 'SK' (PRIMARY KEY)
BEGIN
	DELETE FROM [dbo].[GroupPermissions] 
	WHERE [SK] = @SK
END

IF (@_Mode = 3)	-- DELETE By 'Group_SK' (PRIMARY KEY)
BEGIN
	DELETE FROM [dbo].[GroupPermissions] 
	WHERE [Group_SK] = @Group_SK
END
IF (@_Mode = 3)	-- DELETE By 'Group_SK' (PRIMARY KEY)
	BEGIN
	INSERT INTO 
		[dbo].[GroupPermissions]
		( [Group_SK], [Feature_SK], [AccessMode])
	VALUES 
		(@Group_SK, @Feature_SK, @AccessMode)
END


GO
/****** Object:  StoredProcedure [dbo].[sprExecuteNotifications]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprExecuteNotifications]
	@DId [int] = 0,
	@_Mode [int] = 0,
	@UserId [int] = 0,
	@Feature_SK INT = 0,
	@Message nvarchar(MAX)=null,
	@ComapanyId [int] = 0
AS

IF (@_Mode = 0)	-- GET ALL RECORDS
BEGIN
	INSERT INTO [ADM].[Alerts]
				(Feature_SK, [Time],[Message], User_SK )
		Values(@Feature_SK, GETDATE(), @Message,@UserId)
END




GO
/****** Object:  StoredProcedure [dbo].[sprExecuteSystemLog]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sprExecuteSystemLog]
	@SystemLogID [int],
	@ScreenName [varchar](500),
	@FunctionName [varchar](500),
	@ParameterValues [varchar](500),
	@Exception [varchar](2000),
	@CreatedBy [int],
	@CreatedOn [datetime],
	@_Mode [int] = 0,
	@ComapanyId [int] = 0
AS

IF (@_Mode = 1)	-- INSERT/UPDATE By 'SystemLogID' (PRIMARY KEY)
BEGIN
	IF (SELECT COUNT(*) FROM [dbo].[SystemLog] (NOLOCK) WHERE [SystemLogID] = @SystemLogID) = 0
	BEGIN
		INSERT INTO [dbo].[SystemLog]([ScreenName], [FunctionName], [ParameterValues], [Exception], [CreatedBy], [CreatedOn])
		VALUES (@ScreenName, @FunctionName, @ParameterValues, @Exception, @CreatedBy, @CreatedOn)
	END
	ELSE
	BEGIN
		UPDATE [dbo].[SystemLog]
		SET [ScreenName] = @ScreenName, [FunctionName] = @FunctionName, [ParameterValues] = @ParameterValues, [Exception] = @Exception, [CreatedBy] = @CreatedBy, [CreatedOn] = @CreatedOn
		WHERE [SystemLogID] = @SystemLogID
	END
END
IF (@_Mode = 2)	-- DELETE By 'SystemLogID' (PRIMARY KEY)
BEGIN
	DELETE FROM [dbo].[SystemLog] 
	WHERE [SystemLogID] = @SystemLogID
END







GO
/****** Object:  StoredProcedure [dbo].[sprExecuteTableaurefresh]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sprExecuteTableaurefresh]
	@DId [int]=0,
	@UserSK [int] =0,   
    @EventStatus [tinyint] = 0,
	@EventTime datetime = null,
	@_Mode [int] = 0
AS

IF (@_Mode = 1)	-- INSERT/UPDATE By 'SK' (PRIMARY KEY)
BEGIN
	IF (SELECT COUNT(*) FROM [dbo].[TableauRefreshLog] (NOLOCK) WHERE [DId] = @DId) = 0
	BEGIN
		INSERT INTO [dbo].[TableauRefreshLog]
		(
				UserSK,
				EventTime,
				EventStatus
		)
		VALUES
		(
				@UserSK,
				GETDATE(),
				@EventStatus
		)

		SET @DId = SCOPE_IDENTITY()
		SELECT @DId as DId

--==============================================
		UPDATE  [dbo].[TableauStatus]
		SET
			Is_Intiated = 1 
		WHERE Did = 1

	END
	ELSE
	BEGIN
		UPDATE  [dbo].[TableauRefreshLog] 
		SET
			UserSK = UserSK,
			EventTime = GETDATE(),
			EventStatus = EventStatus
		WHERE
			[DId] = @DId
	END
END

ELSE IF (@_Mode = 2)	-- Reset previous Requset after the Tableau refresh Executed and update the tableau refresh Time 
	BEGIN
		UPDATE  [dbo].[TableauRefreshLog] 
		SET
			EventStatus = 1
		WHERE
			EventStatus = 0 --AND EventTime <= @EventTime

		UPDATE  [dbo].[TableauStatus]
		SET
			StartTime = @EventTime
			,Is_Intiated = 0 
		WHERE  Did = 1
END






GO
/****** Object:  StoredProcedure [dbo].[sprExecuteUserGroup_Permissions]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprExecuteUserGroup_Permissions]
	@DataTable [DBO].[UDT_UserGroups] READONLY,
	@User_SK [int] = 0,
	@Group_SK [int] = 0,
	@_Mode [int] = 0,
	@ComapanyId [int] = 0
AS

BEGIN 
IF(@_Mode = 0)    -- INSERT DATA TABLE DATA INTO THE USER_GROUP_PERMISSIONS TABLE
BEGIN
	 INSERT INTO [dbo].[User_Group_Permissions] (User_SK,Group_SK)
	 SELECT @User_SK,Permissions_SK FROM @DataTable
END
IF(@_Mode = 1)    -- INSERT DATA TABLE DATA INTO THE USERPERMISSIONS TABLE
BEGIN
	 DELETE FROM [dbo].[UserPermissions] WHERE USER_SK = @User_SK

	 INSERT INTO [dbo].[UserPermissions] (User_SK,Feature_SK,AccessMode)
	 SELECT @User_SK,Permissions_SK,1 FROM @DataTable
END
IF(@_Mode = 2)    -- INSERT DATA TABLE DATA INTO THE GROUPPERMISSIONS TABLE
BEGIN
	 --DELETE FROM [dbo].[GroupPermissions] WHERE Group_SK = @User_SK

	 INSERT INTO [dbo].[GroupPermissions] (Group_SK,Feature_SK,AccessMode)
	 SELECT @User_SK,Permissions_SK,1 FROM @DataTable
END
IF(@_Mode = 3)    -- INSERT DATA TABLE DATA INTO THE GROUPPERMISSIONS TABLE
BEGIN
	 INSERT INTO [dbo].[User_Group_Permissions] (User_SK,Group_SK)
	 values ( @User_SK,@Group_SK )
END

IF(@_Mode = 4)    -- INSERT DATA TABLE DATA INTO THE GROUPPERMISSIONS TABLE
BEGIN
	    UPDATE UGS
		SET
			Group_SK = @User_SK
		FROM
			[dbo].[User_Group_Permissions] UGS 
		INNER JOIN  @DataTable  dt ON(UGS.SK = dt.Permissions_SK)
        
END

IF(@_Mode = 5)    -- DELETE THE GROUPPERMISSIONS TABLE
BEGIN
DELETE FROM [dbo].[User_Group_Permissions] WHERE USER_SK = @User_SK
END

IF(@_Mode = 6)    -- DELETE THE GROUPPERMISSIONS TABLE
BEGIN
	DELETE FROM [dbo].[GroupPermissions] WHERE Group_SK = @User_SK
END

END






GO
/****** Object:  StoredProcedure [dbo].[sprExecuteUserGroups]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprExecuteUserGroups]
	@SK [int]=0 OUTPUT,
	@_Mode [int] = 0,
	@GroupName [varchar](100)= NULL,
	@IsActive [tinyint]= 0,	
	@Description nvarchar(100) = NULL,
	@CompanyId [int] = 0
AS

IF (@_Mode = 1)	-- INSERT/UPDATE By 'SK' (PRIMARY KEY)
BEGIN
	IF (SELECT COUNT(*) FROM [dbo].[UserGroups] (NOLOCK) WHERE [SK] = @SK) = 0
	BEGIN
		INSERT INTO [dbo].[UserGroups]( [GroupName], [IsActive], [Description],[CompanyId])
		VALUES ( @GroupName, @IsActive, @Description,@CompanyId)
		SET @SK = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE [dbo].[UserGroups]
		SET
			[GroupName] = @GroupName,
			[IsActive] = @IsActive,
			[Description] = @Description
		WHERE [SK] = @SK
	END
END
IF (@_Mode = 2)	-- DELETE By 'SK' (PRIMARY KEY)
BEGIN
	DELETE FROM [dbo].[UserGroups] 
	WHERE [SK] = @SK

	DELETE FROM [dbo].[User_Group_Permissions]
	WHERE Group_SK = @SK

	DELETE FROM dbo.[GroupPermissions]
	WHERE Group_SK = @SK
END




GO
/****** Object:  StoredProcedure [dbo].[sprExecuteUserLogReport]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sprExecuteUserLogReport]

AS BEGIN
	SET NOCOUNT ON ; 

	if ( (select cast (TrackLogin as int) from dbo.AppSettings)= 1) ------ Check for Flag --------- 
	BEGIN
	----------------------------------------------------------------------------------------------------
		DECLARE @TableTag varchar(MAX) = '<html><head> <style> td, th{  border: solid 1px #000; } </style></head>
											<body><table cellspacing="0" style="BORDER: solid 1px #000;" width="100%"> <thead><tr style="background-color: cornflowerblue;"> <th> Name </th> <th> Email </th> <th> CompanyName </th> <th> LogInTimeStamp </th> <th> TotalTime (Min) </th>  <th> IP Address </th></tr></thead><tbody>', --<th> LogOutTimeStamp </th> 
				@Content varchar(MAX)= '',
				@AdminMail varchar(200)= '',
				@Name varchar(50),
				@Email varchar(50),
				@CompanyName varchar(50),
				@LogInTimeStamp varchar(50),
				@LogOutTimeStamp varchar(50),
				@TotalTime varchar(50),
				@minid int = 1 ,
				@maxid int

		IF OBJECT_ID ('tempdb..#UserSessions') IS NOT NULL
			DROP TABLE #UserSessions

		------------------------ Create Temp Table --------------------
		---------------------------------------------------------------
		SELECT
			  USR.UserName as Name
			, LOWER(USR.Email) as Email
			, CMP.Name as CompanyName
			, CAST (USS.LogInTimeStamp AS VARCHAR(100)) AS LogInTimeStamp
			--, CAST (ISNULL(USS.LogOutTimeStamp, DATEADD(SECOND, GnSrOp.SessionTimeOut, USS.LogInTimeStamp) )AS VARCHAR(100)) AS LogOutTimeStamp
			, CAST(ISNULL(DATEDIFF(MI,USS.LogInTimeStamp , USS.LogOutTimeStamp), GnSrOp.SessionTimeOut / 60)  AS VARCHAR(100)) AS TotalTime 
			, USS.IP
			,ROW_NUMBER () OVER (ORDER BY USR.UserName) AS row_id  -- Need for Loop		
		INTO #UserSessions
		FROM [dbo].[UserSessions] USS
		INNER JOIN DBO.Users USR ON USR.SK = USS.UserSK
		INNER JOIN DBO.Company CMP ON CMP.ID = USR.CompanyId
		INNER JOIN DBO.GenServerOptions GnSrOp ON GnSrOp.CompanyId = CMP.ID
		WHERE  CAST(USS.LogInTimeStamp AS DATE) = CAST(GETDATE() AS DATE) AND ( USR.Email NOT LIKE '%Seanergysoftech%' OR USR.Email IS NULL)
		SELECT @maxid = MAX(row_id) FROM #UserSessions
		
		--------------- While Loop Traversing ---------------
		------------------------------------------------------

		WHILE ( @minid <= @maxid )
		BEGIN 
			SET @Content = @Content +
				(
				SELECT  
				 '<tr><td>'+ ISNULL(Name ,'')
				+ '</td><td>'+ ISNULL(Email ,'')
				+ '</td><td>' + ISNULL(CompanyName ,'')			
				+ '</td><td>' + ISNULL(LogInTimeStamp,'') 
				-- + '</td><td>' + ISNULL(LogOutTimeStamp,'') 
				+ '</td><td>' + ISNULL(TotalTime,'') 
				+ '</td><td>' + ISNULL(IP,'') 
				+ '</td></tr>'
				FROM  
					#UserSessions 
				WHERE row_id = @minid
				)
			SET @minid = @minid + 1
		END

		----------------------------------Adding Html --------------------------
		------------------------------------------------------------------------
		
		if(@Content = '')
			SET @Content = '<tr> <td>-</td> <td>-</td> <td>-</td> <td>-</td> <td>-</td> <td>-</td> </tr>'
		SET @Content =  @TableTag + @Content  + '</tbody></table> </body></html>'	
		SELECT @Content AS MailContent

		--------------------------------------- Mail the Content -----------------
		--------------------------------------------------------------------------
		
		SELECT @AdminMail = AdminMail from dbo.AppSettings
		exec  msdb.dbo.sp_send_dbmail
		--@profile_name = 'BiFrameWork',
		@profile_name = 'BI Support',
		@recipients = @AdminMail,
		@subject = 'User Session Report',
		@body =    @Content ,
		@body_format ='HTML'
		
		------ End Functionality by sending the mail ---------
		------------------------------------------------------
		END
END

--exec [dbo].[sprExecuteUserLogReport]

-----------------------------------------------------------------------------
 --SELECT USR.UserName as Name, LOWER(USR.Email) as Email, CMP.Name as CompanyName, USS.LogInTimeStamp, USS.LogOutTimeStamp,  ISNULL(DATEDIFF(MI,USS.LogInTimeStamp , USS.LogOutTimeStamp), 0) AS TotalTime from [dbo].[UserSessions] USS
--INNER JOIN DBO.Users USR ON USR.SK = USS.UserSK
--INNER JOIN DBO.Company CMP ON CMP.ID = USR.CompanyId
--where  CAST(USS.LogInTimeStamp as date) = CAST(GETDATE() as date) AND ( USR.Email NOT LIKE '%Seanergysoftech%' OR USR.Email IS NULL)
---------------------------------------------------------------------------------








GO
/****** Object:  StoredProcedure [dbo].[sprExecuteUserPermissions]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprExecuteUserPermissions]
	@SK [int] = 0,
	@User_SK [int] = 0,
	@Feature_SK [int] = 0,
	@AccessMode [tinyint] = 0,
	@DataTable [UDT_UserGroups] READONLY,
	@_Mode [int] = 0,
	@ComapanyId [int] = 0
AS

IF (@_Mode = 1)	-- INSERT/UPDATE By 'SK' (PRIMARY KEY)
BEGIN
	
	    INSERT
		INTO [dbo].[UserPermissions]
			( [User_SK], [Feature_SK], [AccessMode])
		SELECT  @User_SK, DT.[Permissions_SK], 1 FROM @DataTable DT		
	
END
IF (@_Mode = 2)	-- DELETE By 'SK' (PRIMARY KEY)
BEGIN
	DELETE FROM [dbo].[UserPermissions] 
	WHERE [SK] = @SK
END


IF (@_Mode = 3)	-- INSERT/UPDATE By 'SK' (PRIMARY KEY)
BEGIN
		INSERT INTO [dbo].[UserPermissions]([SK], [User_SK], [Feature_SK], [AccessMode])
		VALUES ((SELECT COUNT(*) FROM [dbo].[UserPermissions] ), @User_SK, @Feature_SK, @AccessMode)
END

IF (@_Mode = 4)	-- INSERT/UPDATE By 'SK' (PRIMARY KEY)
BEGIN		
	DELETE FROM [dbo].[UserPermissions] 
	WHERE [User_SK] = @User_SK
END




GO
/****** Object:  StoredProcedure [dbo].[sprExecuteUsers]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprExecuteUsers]
	@SK [int] = 0 Output,
	@UserName [varchar](100) = NULL,
	@Email [varchar](100) =NULL,
	@Password [varchar](100) = NULL,
	@FirstName [varchar](50) =NULL,
	@LastName [varchar](50) = NULL,
	@UserGroup_SK [int] = 0,
	@NewPassword [Varchar] (200) = NULL,
	@IsADLogin [tinyint] = 0,
	@IsActive [tinyint] = 0,
	@ErrorMessage [Varchar] (200) =NULL OUTPUT,
	@DefaultUrl [varchar](200) = NULL,
	@ProfilePic [varchar](200) = NULL,
	@ComapanyLogo [varchar](200) = NULL,
	@Group_SK [int] = 0,
	@_Mode [int] = 0,
	@CompanyId [int] = 0
AS

IF (@_Mode = 1)	-- INSERT/UPDATE By 'SK' (PRIMARY KEY)
BEGIN
	IF (SELECT COUNT(*) FROM [dbo].[Users] (NOLOCK) WHERE [SK] = @SK) = 0
	BEGIN
		INSERT INTO [dbo].[Users]([UserName], [Email], [FirstName], [LastName], [IsADLogin], [IsActive], [UserGroup_SK], [DefaultUrl], [CompanyId])
		VALUES (@UserName, @Email, @FirstName, @LastName, @IsADLogin, @IsActive, @UserGroup_SK, @DefaultUrl, @CompanyId)
		SET @SK = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE [dbo].[Users]
		SET [UserName] = @UserName, [Email] = @Email, [FirstName] = @FirstName, [LastName] = @LastName,[DefaultUrl] = @DefaultUrl,
		    [IsADLogin] = @IsADLogin, [IsActive] = @IsActive
		WHERE [SK] = @SK
	END
END

ELSE IF (@_Mode = 2)	-- DELETE By 'SK' (PRIMARY KEY)
BEGIN     
	DELETE FROM [dbo].[Users] 
	WHERE [SK] = @SK
	
	DELETE FROM [dbo].[User_Group_Permissions]
	WHERE [User_SK] = @SK

	DELETE FROM [dbo].[UserPermissions]
	WHERE [User_SK] = @SK
END

ELSE IF (@_Mode = 3)	-- GET RECORDS BY 'USERNAME'
BEGIN
	IF (SELECT COUNT(*) FROM [dbo].[Users] WHERE [SK] = @SK AND [Password] = @Password)= 0
	BEGIN
	SET @ErrorMessage = 'Your old password is incorrect'
	END
	ELSE
	BEGIN
    UPDATE [dbo].[Users]
	SET  [Password] = @NewPassword
	WHERE [SK] = @SK
	
	SET @ErrorMessage = 'Your password changed successfully'
	END
END

ELSE IF (@_Mode = 4)	-- DELETE By 'SK' (PRIMARY KEY)
BEGIN
		UPDATE [dbo].[Users]
		SET  [FirstName] = @FirstName, [LastName] = @LastName, 
		    [DefaultUrl] = @DefaultUrl, [ProfilePic] = @ProfilePic, [Email] = @Email
		WHERE [SK] = @SK
END


ELSE IF (@_Mode = 5)	-- UPDATE  'USERNAME'
BEGIN
	BEGIN
    UPDATE [dbo].[Users]
	SET  [Password] = @NewPassword
	WHERE [SK] = @SK
	END
END

ELSE IF (@_Mode = 6)	-- UPDATE  'USERNAME'
BEGIN

INSERT INTO [dbo].[Users]([UserName], [Email], [FirstName], [LastName], [IsADLogin], [IsActive], [UserGroup_SK], [DefaultUrl], [ProfilePic], [CompanyId])
		VALUES (@UserName, @Email, @FirstName, @LastName, @IsADLogin, @IsActive, @UserGroup_SK, @DefaultUrl, @ProfilePic, @CompanyId)
		select * from [dbo].[Users] where SK = SCOPE_IDENTITY()
END

ELSE IF (@_Mode = 7)	-- DELETE
BEGIN
	DELETE from [dbo].[UserPermissions] where User_SK = @SK
END

ELSE IF (@_Mode = 8)
BEGIN
	DELETE from [dbo].[User_Group_Permissions] where User_SK = @SK AND Group_SK =@Group_SK
END

ELSE IF (@_Mode = 9)	-- UPDATE Profile
BEGIN
	UPDATE [dbo].[Users]
			SET [Email] = @Email,
				[FirstName] = @FirstName,
				[LastName] = @LastName,
				[ProfilePic] = @ProfilePic
				--[DefaultUrl] = @DefaultUrl, [IsADLogin] = @IsADLogin, [IsActive] = @IsActive,				
			WHERE [SK] = @SK
END

ELSE IF (@_Mode = 10)	-- UPDATE Profile
BEGIN
	UPDATE [dbo].[Users]
	SET 
		[ProfilePic] = @ProfilePic
	WHERE 
		[SK] = @SK
END

ELSE IF (@_Mode = 11)	-- UPDATE Profile
BEGIN
	UPDATE [dbo].[Users]
	SET 
		[Password] = @Password
	WHERE 
		[SK] = @SK
END


GO
/****** Object:  StoredProcedure [dbo].[sprExecuteUserSessions]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprExecuteUserSessions]
	@_Mode [int] = 0,
	@UserSK [int] =0,  
	@LogStatus [varchar](200) = null,
	@ip [varchar](30) = null,
	@UserAgentData [varchar](200) = null,
	@UserSessionID [varchar](200) = null,
	@LogOutType [varchar](200) = null,
	@SessionTimeOut [int] =0
AS

IF (@_Mode = 1)	-- Insert User Session Status LoggedIn/ LoggedOut 
BEGIN
		SELECT @SessionTimeOut = [SessionTimeOut] FROM [dbo].[GenServerOptions]

		INSERT INTO [dbo].[UserSessions](UserSK, LogInTimeStamp, UserAgentData, IP, LogOutTimeStamp,LogOutType)
								VALUES (@UserSK, GETDATE(), @UserAgentData, @ip, DATEADD(ss,@SessionTimeOut,getDate()),'Default')
		SELECT * FROM [dbo].[UserSessions] WHERE UserSessionID = SCOPE_IDENTITY()
		
END 

ELSE IF (@_Mode = 2)	-- Insert User Session Status LoggedIn/ LoggedOut 
	BEGIN
			Update [dbo].[UserSessions]
			SET 
				LogOutTimeStamp = GETDATE(),
				UserAgentData = @UserAgentData,
				IP = @ip,
				LogOutType = @LogOutType 
			WHERE
				UserSessionID = @UserSessionID AND 
				UserSK = @UserSK
		
	END 

	--select getDate(), DATEADD(ss,200,getDate())

	



GO
/****** Object:  StoredProcedure [dbo].[sprRetrieveExcelFiles_History]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sprRetrieveExcelFiles_History]
	@DId [int] = 0 ,
	@_Mode [int] =0,
	@FeatureID [int] = 0,
	@FileName NVARCHAR(255) = NULL,
	@UpLoadedDate datetime = null,
	@ExcelPath nvarchar(max) = null,
	@HtmlPath nvarchar(max) = null,
	@_TotalRecords int output
AS

IF (@_Mode = 0)	-- GET ALL RECORDS
BEGIN
	SELECT * FROM
		[dbo].[ExcelFiles_History] (NOLOCK)
	ORDER BY DId
END
ELSE IF (@_Mode = 1)	-- GET RECORDS BASED ON FEATURE ID
BEGIN
	SELECT
		[DId], [FeatureID], [FileName], [UpLoadedDate], [ExcelPath],[HtmlPath]
	FROM
		[dbo].[ExcelFiles_History] (NOLOCK)
	WHERE
		[FeatureID] = @FeatureID
	ORDER BY
		UpLoadedDate desc
END





GO
/****** Object:  StoredProcedure [dbo].[sprRetrieveFeatures]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprRetrieveFeatures]
	@SK [int]=0,
	--@DisplayText [varchar](200),
	@_Mode [int] = 0,
	@CompanyId [int] = 0
	
AS

IF (@_Mode = 0)	-- GET ALL RECORDS
BEGIN	
	SELECT F.SK,
			   F.Parent_SK,
			   F.DisplayText ,
			   F.ReportURL,
			   F.ReportHeight,
			   F.IsActive,
			   F.CompanyId,
			   F.ServerType,
			   RS.ServerName AS ServerTypeName
		FROM 
			[dbo].[Features] F
			LEFT JOIN ReportServers RS ON F.ServerSK = RS.id
		WHERE   F.CompanyId = @CompanyId
		ORDER BY [DisplayOrder]

	-- [SK], [Parent_SK], [DisplayText], [ReportURL], [DisplayOrder], [ImagePath], [IsActive] 
END
ELSE IF (@_Mode = 1)	-- GET RECORDS BY 'SK' (PRIMARY KEY)
BEGIN
	SELECT	[SK],
			[Parent_SK],
			[DisplayText],
			[ReportURL],
			[ReportHeight],
			[DisplayOrder],
			[ImagePath],
			[IsActive],
			[ServerSK],
			[ServerType],
			[CompanyId]
	FROM [dbo].[Features] (NOLOCK) 
	WHERE SK = @SK
	ORDER BY DisplayOrder
END

ELSE IF (@_Mode = 2)	-- GET BY USER
BEGIN	
		SELECT  F.SK,
				Parent_SK,
				DisplayText ,
				IsActive =	(CASE  WHEN UP.SK IS NULL THEN 0
			                       WHEN UP.SK IS NOT NULL THEN 1  END)
		FROM
			[dbo].[Features] F
			INNER JOIN ServerTypes ST ON F.ServerType = ST.ServerTypeSk
			LEFT JOIN  dbo.UserPermissions UP ON(F.SK = UP.Feature_SK and UP.User_SK = @SK)
		WHERE F.[CompanyId] = @CompanyId
		ORDER BY [DisplayOrder]
END
ELSE IF (@_Mode = 3)
BEGIN
	SELECT 
		F.SK, F.Parent_SK, F.DisplayText, F.ReportURL, F.DisplayOrder,
		RS.id, RS.ServerName, RS.Host, RS.UserName, RS.PassKey, RS.Domain, RS.PublicReportUrl, RS.Params, RS.ServerTypeId
	FROM [dbo].[Features] F
	INNER JOIN ReportServers RS ON F.ServerSK = RS.id
	WHERE F.IsActive = 1 AND RS.IsActive = 1 AND F.SK=@SK
	ORDER BY F.DisplayOrder
END

ELSE IF(@_Mode = 4)
BEGIN
	select F.SK,
		F.Parent_SK,
		F.DisplayText,
		F.ReportURL,
		F.DisplayOrder,
		F.ImagePath
From Features (NOLOCK) F
	INNER JOIN [dbo].[UserPermissions] (NOLOCK) UP ON F.SK = UP.Feature_SK
Where UP.User_SK=@SK  AND F.IsActive= 1 AND F.CompanyId = @CompanyId
ORDER BY F.DisplayOrder
END

ELSE IF(@_Mode = 5)
BEGIN
	select * From dbo.ServerTypes WHERE ShowHide= 1
END

ELSE IF(@_Mode = 6)
BEGIN
	SELECT *
	FROM [dbo].[Features]
	WHERE Parent_SK = 0 AND CompanyId = @CompanyId
	ORDER BY DisplayOrder
END

ELSE IF(@_Mode = 7)-- GET BY GROUP
BEGIN

		SELECT	F.SK,
				Parent_SK,
				DisplayText ,
				CompanyId,
				IsActive =	(CASE  WHEN UP.SK IS NULL THEN 0
					               WHEN UP.SK IS NOT NULL THEN 1  END)
		FROM 
			[dbo].[Features] F
			LEFT JOIN  dbo.[GroupPermissions] UP ON(F.SK = UP.Feature_SK and UP.Group_SK = @SK)
		WHERE  F.CompanyId = @CompanyId
		ORDER BY [DisplayOrder]

END
ELSE IF(@_Mode = 8)
BEGIN
	SELECT	*
	FROM [dbo].[Features] F
	WHERE F.SK IN (	SELECT DISTINCT GP.Feature_SK
					FROM [dbo].[GroupPermissions] GP
					WHERE GP.Group_SK IN(SELECT Group_SK
										FROM [dbo].[User_Group_Permissions]
										WHERE User_SK= @SK)
					UNION
					
					SELECT DISTINCT [Feature_SK]
					FROM [dbo].[UserPermissions]
					WHERE User_SK= @SK
				)
				AND
				F.IsActive = 1
				AND
				F.CompanyId = @CompanyId
				ORDER BY F.DisplayOrder
END



GO
/****** Object:  StoredProcedure [dbo].[sprRetrieveGroupPermissions]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprRetrieveGroupPermissions]
	@SK [int],
	@_Mode [int] = 0,
	@_Offset [int] = 0,
	@_Count [int] = 0,
	@_SortOrder [int] = NULL,
	@_SortBy [varchar](255) = NULL,
	@_TotalRecords [int] = 0 OUTPUT,
	@ComapanyId [int] = 0
AS

IF (@_Mode = 0)	-- GET ALL RECORDS
BEGIN
	SELECT [SK], [Group_SK], [Feature_SK], [AccessMode] 
	FROM [dbo].[GroupPermissions] (NOLOCK)
END
ELSE IF (@_Mode = 1)	-- GET RECORDS BY 'SK' (PRIMARY KEY)
BEGIN
	SELECT [SK], [Group_SK], [Feature_SK], [AccessMode] 
	FROM [dbo].[GroupPermissions] (NOLOCK) 
	WHERE SK = @SK 
	ORDER BY SK
END

ELSE IF (@_Mode = 2)	-- GET RECORDS BY 'GROUP_SK' (PRIMARY KEY)
BEGIN
	SELECT [SK], [Group_SK], [Feature_SK], [AccessMode] 
	FROM [dbo].[GroupPermissions] (NOLOCK) 
	WHERE Group_SK = @SK
	ORDER BY Feature_SK
END



GO
/****** Object:  StoredProcedure [dbo].[sprRetrieveLocations]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sprRetrieveLocations]
	@SK [int] = 0 ,
	@_Mode [int] =0
AS

IF (@_Mode = 1)	-- GET ALL RECORDS
BEGIN
	SELECT
		[SK], [BK], [SubCode], [LocationCode], [Name], [StateCode], [State], [Region], [Status], [City]
	FROM
		[DW].[d_Locations] (NOLOCK)
	ORDER BY SK
END
ELSE IF (@_Mode = 2)	-- GET ALL RECORDS
BEGIN
	SELECT
		[SK], [BK], [SubCode], [LocationCode], [Name], [StateCode], [State], [Region], [Status], [City]
	FROM
		[DW].[d_Locations] (NOLOCK)
	WHERE
		[SK] = @SK
	ORDER BY
		SK
END





GO
/****** Object:  StoredProcedure [dbo].[sprRetrieveNotifications]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprRetrieveNotifications]
	@DId [int] = 0,
	@_Mode [int] = 0,
	@UserId INT = 0,
	@Feature_SK INT = 0,
	@Message nvarchar(600)=null
AS

IF (@_Mode = 0)	-- GET ALL RECORDS
BEGIN
	SELECT COUNT(*)
	FROM [ADM].[Alerts]
	WHERE 	[User_SK] =   @UserId

END

IF (@_Mode = 1)	-- GET ALL RECORDS
BEGIN  
	SELECT *
	from  ADM.Alerts 
	WHERE 	[User_SK] =   @UserId
	ORDER BY Did desc
END

IF (@_Mode = 2)	-- GET ALL RECORDS
BEGIN
	Insert into 
		ADM.Alerts(Feature_SK, [Time], [Message], User_SK)
		values(@Feature_SK, GETDATE(), @Message, @UserId);
END
IF (@_Mode = 3)	-- GET ALL RECORDS
BEGIN
	SELECT 1
END



GO
/****** Object:  StoredProcedure [dbo].[sprRetrieveSystemLog]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sprRetrieveSystemLog]
	@SystemLogID [int],
	@_Mode [int] = 0,
	@_Offset [int] = 0,
	@_Count [int] = 0,
	@_SortOrder [int] = NULL,
	@_SortBy [varchar](255) = NULL,
	@_TotalRecords [int] = 0 OUTPUT,
	@ComapanyId [int] = 0
AS

IF (@_Mode = 0)	-- GET ALL RECORDS
BEGIN
	SELECT [SystemLogID], [ScreenName], [FunctionName], [ParameterValues], [Exception], [CreatedBy], [CreatedOn] 
	FROM [dbo].[SystemLog] (NOLOCK)
END
ELSE IF (@_Mode = 1)	-- GET RECORDS BY 'SystemLogID' (PRIMARY KEY)
BEGIN
	SELECT [SystemLogID], [ScreenName], [FunctionName], [ParameterValues], [Exception], [CreatedBy], [CreatedOn] 
	FROM [dbo].[SystemLog] (NOLOCK) 
	WHERE SystemLogID = @SystemLogID 
	ORDER BY SystemLogID
END




GO
/****** Object:  StoredProcedure [dbo].[sprRetrieveTableaurefresh]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sprRetrieveTableaurefresh]
	@DId [int]=0 ,
	@UserSK [int] =0,   
    @EventStatus [tinyint] = 0,
	@_Mode [int] = 0
AS

IF (@_Mode = 1)	-- Retrieve by EventStatus and the requests occured within 30 min
BEGIN

--UPDATE  [dbo].[TableauRefreshLog] 
--		SET		
--			EventStatus = 1
--		WHERE
--			EventStatus = 0 AND datediff(MI,EventTime,GETDATE()) >= 30

SELECT	Did,
		UserSK,
		EventTime,
		EventStatus 
FROM 
		[dbo].[TableauRefreshLog]
WHERE  
		EventStatus = 0 AND -datediff(MI,EventTime,GETDATE()) <= 30
ORDER BY
		EventTime
END

ELSE IF (@_Mode = 2)	-- Retrive by Request Refresh DId (PRIMARY KEY)
BEGIN

SELECT	Did,
		UserSK,
		EventTime,
		EventStatus 
FROM 
		[dbo].[TableauRefreshLog]
WHERE  
		Did= @Did

END

ELSE IF (@_Mode = 3)	-- Get Tableau Refresh state as 1 / 0 based on the Last StartTime and CurrenTime
	BEGIN
		IF (SELECT datediff(MI,StartTime, GETDATE()) FROM [dbo].[TableauStatus] WHERE DId = 1 and is_intiated = 0) >= 10
			BEGIN
				SELECT 1 as MinutesDiff 
			END
		ELSE
			BEGIN
				SELECT 0 as MinutesDiff 
			END
END







GO
/****** Object:  StoredProcedure [dbo].[sprRetrieveUserGroups]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprRetrieveUserGroups]
	@SK [int],
	@_Mode [int] = 0,
	@_Offset [int] = 0,
	@_Count [int] = 0,
	@_SortOrder [int] = NULL,
	@_SortBy [varchar](255) = NULL,
	@_TotalRecords [int] = 0 OUTPUT,
	@CompanyId [int] = 0
AS

IF (@_Mode = 0)	-- GET ALL RECORDS
BEGIN
	SELECT * 
	FROM [dbo].[UserGroups] (NOLOCK)
	WHERE CompanyId = @CompanyId
END
ELSE IF (@_Mode = 1)	-- GET RECORDS BY 'SK' (PRIMARY KEY)
BEGIN
	SELECT * FROM [dbo].[UserGroups] (NOLOCK) 
	WHERE SK = @SK 
	ORDER BY SK
END
ELSE IF (@_Mode = 2)	-- GET RECORDS BY 'SK' (PRIMARY KEY)
BEGIN
	SELECT * FROM [dbo].[UserGroups] (NOLOCK)
	WHERE IsActive = 1 AND CompanyId = @CompanyId
END

ELSE IF(@_Mode = 3)  -- GET ACTIVE GROUPS FOR ASSIGTN TO THE USER
BEGIN
	SELECT 
		GroupName,
		SK as GroupId
		,CASE WHEN UGP.Group_SK IS NULL THEN 0 ELSE 1 END AS ISACTIVE
	From 
		[dbo].[UserGroups] UG
	OUTER APPLY   
		(SELECT Group_SK FROM [dbo].[User_Group_Permissions] UGP
		WHERE UG.SK = UGP.Group_SK
		and UGP.User_SK = @SK ) AS UGP
Where  UG.IsActive=1 and CompanyId = @CompanyId

END
ELSE IF(@_Mode = 4)  -- GET ACTIVE GROUPS FOR ASSIGTN TO THE USER
BEGIN
   
	SELECT --ugp.[SK]
		   [User_SK] as SK 
		  ,[Group_SK] AS GroupID
		  ,ugp.SK as UserGroup_SK
		  ,u.UserName
		  ,u.FirstName 
		  ,u.LastName
		  ,u.Email
	FROM [dbo].[User_Group_Permissions] ugp
		  INNER JOIN dbo.Users u ON(ugp.User_SK = u.SK)
	WHERE Group_SK = @SK AND u.CompanyId = @CompanyId

END


GO
/****** Object:  StoredProcedure [dbo].[sprRetrieveUserPermissions]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprRetrieveUserPermissions]
	@SK [int],
	@User_SK [int],
	@_Mode [int] = 0,
	@_Offset [int] = 0,
	@_Count [int] = 0,
	@_SortOrder [int] = NULL,
	@_SortBy [varchar](255) = NULL,
	@_TotalRecords [int] = 0 OUTPUT,
	@ComapanyId [int] = 0
AS

IF (@_Mode = 0)	-- GET ALL RECORDS
BEGIN
	SELECT [SK], [User_SK],  [AccessMode] 
	FROM [dbo].[UserPermissions] (NOLOCK)
END
ELSE IF (@_Mode = 1)	-- GET RECORDS BY 'SK' (PRIMARY KEY)
BEGIN
	SELECT [SK], [User_SK], [AccessMode] 
	FROM [dbo].[UserPermissions] (NOLOCK) 
	WHERE SK = @SK 
	ORDER BY SK
END
ELSE IF (@_Mode = 2)	-- GET RECORDS BY 'User_SK'
BEGIN
	SELECT [SK], [User_SK], [Feature_SK], [AccessMode]
	FROM [dbo].[UserPermissions] (NOLOCK) 
	WHERE User_SK = @User_SK
	ORDER BY Feature_SK
END




GO
/****** Object:  StoredProcedure [dbo].[sprRetrieveUsers]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sprRetrieveUsers]
	@SK [int] =0,
	@_Mode [int] = 0,
	@UserName [varchar](200)=null,
	@Password [varchar](200)=null,
	@Email [varchar](200) =null,
	@EmailType [varchar](200) =null,
	@CompanyId int=0
AS

IF (@_Mode = 8) ----- Below Code is to Create A Default Admin User with ddefault password.
BEGIN
		DECLARE @NewUserID INT =0
			--SET @UserName = 'Admin'
			--SET @Password=N'K66dKFWp+xeRxzguzhYO6A=='

		INSERT INTO dbo.Users(UserName, [Password],IsActive, CompanyId, IsAdmin) VALUES(@UserName,@Password, 1,@CompanyId, 1)
		SELECT @NewUserID = CAST(scope_identity() AS int)										--//	Get New User ID
		Exec [dbo].[sprExecuteFeatures] @_Mode=5, @CompanyId = @CompanyId, @User_SK=@NewUserID	--//	Add Features of Administration		
		
		----- Above Code is to Create A Default Admin User with default password.
END


IF (@_Mode = 0)	-- GET ALL RECORDS
BEGIN
	
  SELECT US.[SK], 
		 US.[UserName],
	     US.[FirstName], 
		 US.[LastName], 
		 US.[IsADLogin],
		 US.[IsActive], 
		 US.DefaultUrl, 
		 US.ProfilePic, 
		 US.[Email],
		 US.IsAdmin, 
		 --UserLocationCount= 0, 
		 US.[UserGroup_SK], 
		 UG.[GroupName],
		 US.[CompanyId],
		 CU.Name AS CompanyName,
		 CU.AliasName
	FROM [dbo].[Users] US
	LEFT JOIN [dbo].[UserGroups] UG ON US.[UserGroup_SK] = UG.[SK]
	INNER JOIN [dbo].[Company] CU ON US.[CompanyId] = CU.[ID]
	where US.[CompanyId] = @CompanyId
	ORDER BY US.[SK] desc
END
ELSE IF (@_Mode = 1)	-- GET RECORDS BY 'SK' (PRIMARY KEY)
BEGIN

	SELECT US.[SK], 
			US.[UserName], 
			US.[Password], 
			US.[FirstName], 
			US.[LastName], 
			US.[IsADLogin], 
			US.[IsActive], 
			US.DefaultUrl,
		    US.ProfilePic,
			US.[Email],
			US.[UserGroup_SK], 
			UG.[GroupName],
			US.[CompanyId],
			US.IsAdmin, 
		    CU.Name AS CompanyName,
		    GS.LogoImg AS CompanyLogo,
			CU.CSSFile AS CSSFile,
			CU.AliasName
    FROM [dbo].[Users] US
    LEFT JOIN [dbo].[UserGroups] UG  ON US.[UserGroup_SK] = UG.[SK]
	INNER JOIN [dbo].[Company] CU ON US.[CompanyId] = CU.[ID]
	INNER JOIN [dbo].[GenServerOptions] GS ON GS.[CompanyId] = CU.[ID]
     WHERE US.[SK] = @SK
END

ELSE IF (@_Mode = 2)	-- GET RECORDS BY 'USERNAME'
BEGIN
	SELECT	US.[SK],
			US.[UserName],
			US.[FirstName],
			US.[LastName],
			US.[IsADLogin],
			US.[IsActive],
			US.[UserGroup_SK],
			US.[DefaultUrl],
			US.[ProfilePic],
			US.[CompanyLogo],
			US.[Email],
			US.[CompanyId],
			US.IsAdmin, 
		    CU.Name AS CompanyName,
		    GS.LogoImg AS CompanyLogo,
			CU.CSSFile AS CSSFile,
			CU.AliasName
	FROM [dbo].[Users] US (NOLOCK) 
	INNER JOIN [dbo].[Company] CU ON US.[CompanyId] = CU.[ID]
	INNER JOIN [dbo].[GenServerOptions] GS ON GS.[CompanyId] = CU.[ID]
	WHERE US.[UserName] = @UserName  AND US.[Password] = @Password AND US.[CompanyId] = @CompanyId
	ORDER BY SK
END

ELSE IF (@_Mode = 3)	
BEGIN
	SELECT [SK] ,
		  [Email],
		  [UserName],
		  [Subject] = (CASE WHEN SK IS NOT NULL THEN  (SELECT TOP 1 [Subject] FROM [dbo].[EmailTemplates] WHERE EmailType = 'FORGOT_PASSWORD' AND CompanyId = @CompanyId )
					   ELSE ''  END),
		  [EmailContent] = (CASE WHEN SK IS NOT NULL THEN  (SELECT TOP 1 [EmailContent] FROM [dbo].[EmailTemplates] WHERE EmailType = 'FORGOT_PASSWORD' AND CompanyId = @CompanyId )
					   ELSE ''  END),
          IsADLogin
	FROM [dbo].[Users] (NOLOCK) 
	WHERE [UserName] = @UserName AND CompanyId = @CompanyId
END

ELSE IF (@_Mode = 4)
BEGIN
	SELECT [EmailTemplateID]
      ,[Category]
      ,[EmailType]
      ,[Subject]
      ,[EmailContent]
    FROM [dbo].[EmailTemplates]
	WHERE [EmailType] = @EmailType
	AND CompanyId = @CompanyId 
END

ELSE IF (@_Mode = 5)	
BEGIN
	SELECT [SK] ,[UserName] 
	FROM [dbo].[Users] (NOLOCK) 
	WHERE [Email] = @Email
END

ELSE IF (@_Mode = 6)	-- GET RECORDS BY 'USERNAME'
BEGIN
	SELECT  US.[SK],
			US.[UserName],
			US.[Password],
			US.[FirstName],
			US.[LastName],
			US.[IsADLogin],
			US.[IsActive],
			US.[UserGroup_SK],
			US.[DefaultUrl], 
	        US.[ProfilePic],
			US.[Email],
			US.IsAdmin
	FROM [dbo].[Users] US (NOLOCK) 
	INNER JOIN [dbo].[Company] CMPN ON CMPN.ID = US.CompanyId
	WHERE [UserName] = @UserName
	ORDER BY SK
END

ELSE IF (@_Mode = 7)	-- GET RECORDS BY 'USERNAME'
BEGIN
		SELECT distinct SK, UserName
		FROM dbo.Users
		--INNER JOIN [dbo].[User_Group_Permissions]  ugp on(u.SK != ugp.User_SK )
		--WHERE U.SK not in (select User_SK from [dbo].[User_Group_Permissions] where Group_SK =  @SK)  AND U.CompanyId = @CompanyId
		WHERE CompanyId = @CompanyId
END

ELSE IF (@_Mode = 12)	-- GET RECORDS BY 'COMPANY NOT IN ANY GROUP.'
BEGIN
SELECT distinct U.SK, U.UserName
		FROM dbo.Users U
		WHERE U.SK not in (SELECT User_SK FROM [dbo].[User_Group_Permissions] WHERE Group_SK =  @SK)  AND U.CompanyId = @CompanyId
END
ELSE IF (@_Mode = 9)	-- GET RECORDS BY 'USERNAME'
BEGIN
	SELECT *
	FROM [dbo].[Users] (NOLOCK)
	WHERE [UserName] = @UserName AND CompanyId = @CompanyId
END

ELSE IF (@_Mode = 10)	-- GET RECORDS BY 'USERNAME'
BEGIN
	SELECT *
	FROM [dbo].[Users] (NOLOCK)
	WHERE [SK] = @SK AND [Password] = @Password
END
ELSE IF (@_Mode = 11)	-- GET RECORDS BY 'USERNAME'
BEGIN
	SELECT *
	FROM [dbo].[Users] (NOLOCK)
	WHERE [UserName] = @UserName AND [Password] = @Password AND CompanyId = 0
END



GO
/****** Object:  StoredProcedure [dbo].[sprRetrieveUserSessions]    Script Date: 12/8/2017 7:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprRetrieveUserSessions]
	@_Mode [int] = 0,
	@UserSK [int] =0,
	@UserString nvarchar(20) = NULL,
	@StartDate datetime =null,
	@EndDate datetime  =null,
	@CompanyId [int]=0
AS
IF (@_Mode = 0)	-- Insert User Session Status LoggedIn/ LoggedOut 
BEGIN
		
  SELECT TOP 10 [UserSessionID]
      ,[UserSK]
      ,[LogInTimeStamp]
      ,[LogOutTimeStamp]
      ,[UserAgentData]
      ,[IP]
	  ,Name = UR.UserName --UR.FirstName + ' ' +UR.LastName 
  FROM [dbo].[UserSessions] US INNER JOIN dbo.Users UR ON(US.UserSK = UR.SK)
  WHERE UR.CompanyId = @CompanyId
  order by [UserSessionID] desc 		
END 


IF (@_Mode = 1)	-- Insert User Session Status LoggedIn/ LoggedOut 
BEGIN
 	--Declare @DynamicParam nvarchar(1000) = IIF((@UserString is NULL) OR (@UserString = '') , ' AND 1=1 ', 'AND US.UserSK =' + @UserString )
	Declare @DynamicParam nvarchar(1000) = CASE WHEN (@UserString IS NULL OR @UserString = '') THEN ' AND 1=1 ' ELSE 'AND US.UserSK =' + @UserString END
	Declare @DynamicQuery nvarchar(MAX) = 'SELECT   [UserSessionID]
													,[UserSK]
													,[LogInTimeStamp]
													,[LogOutTimeStamp]
													,[UserAgentData]
													,[IP]
													,[LogOutType]
													,CASE WHEN ([LogOutTimeStamp] is NULL) THEN ''-'' ELSE cast( DATEDIFF(mi, [LogInTimeStamp], [LogOutTimeStamp]) as nvarchar(100)) END as Duration
													,UR.UserName as  Name -- concat( UR.FirstName,UR.LastName) as  Name 
											FROM  [dbo].[UserSessions] US
											INNER JOIN dbo.Users  UR ON(US.UserSK = UR.SK)
											WHERE ([LogInTimeStamp] between'''+ Convert(varchar(50), @StartDate) + ''' AND ''' + Convert(varchar(50),@EndDate) +''') AND  UR.CompanyId =' + Convert(varchar(50),@CompanyId)  + '' + @DynamicParam +'							 
											ORDER BY [UserSessionID] DESC'
											--,IIF(([LogOutTimeStamp] is NULL) , ''-'', cast( DATEDIFF(mi, [LogInTimeStamp], [LogOutTimeStamp]) as nvarchar(100)) ) as Duration
	PRINT @DynamicQuery
	exec  (@DynamicQuery)
END 

--exec [dbo].[sprRetrieveUserSessions] @StartDate='10-16-2016', @EndDate='10-18-2016', @_Mode=1,@UserSK=1318 




GO
USE [master]
GO
ALTER DATABASE [BIHybridFramework] SET  READ_WRITE 
GO
