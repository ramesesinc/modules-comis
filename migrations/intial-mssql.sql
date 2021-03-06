CREATE DATABASE [comis]
GO
ALTER DATABASE [comis] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [comis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [comis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [comis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [comis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [comis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [comis] SET ARITHABORT OFF 
GO
ALTER DATABASE [comis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [comis] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [comis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [comis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [comis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [comis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [comis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [comis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [comis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [comis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [comis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [comis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [comis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [comis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [comis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [comis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [comis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [comis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [comis] SET RECOVERY FULL 
GO
ALTER DATABASE [comis] SET  MULTI_USER 
GO
ALTER DATABASE [comis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [comis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [comis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [comis] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'comis', N'ON'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[application](
	[objid] [nvarchar](50) NOT NULL,
	[state] [nvarchar](25) NOT NULL,
	[resourceinfo_objid] [nvarchar](50) NULL,
	[online] [int] NULL,
	[apptype] [nvarchar](25) NULL,
	[appno] [nvarchar](25) NULL,
	[appyear] [int] NULL,
	[dtapplied] [date] NULL,
	[dtapproved] [date] NULL,
	[applicant_objid] [nvarchar](50) NULL,
	[applicant_name] [nvarchar](255) NULL,
	[applicant_address] [nvarchar](255) NULL,
	[deceased_objid] [nvarchar](50) NULL,
	[relation_objid] [nvarchar](50) NULL,
	[createdby] [nvarchar](255) NULL,
	[dtcreated] [datetime2](7) NULL,
	[dtexpiry] [date] NULL,
	[reportid] [nvarchar](50) NULL,
	[permitid] [nvarchar](50) NULL,
	[renewable] [int] NULL,
	[leaseduration] [int] NULL,
	[amount] [decimal](16, 2) NULL,
	[amtpaid] [decimal](16, 2) NULL,
	[lessor] [nvarchar](max) NULL,
	[lessee] [nvarchar](max) NULL,
	[witness1] [nvarchar](255) NULL,
	[witness2] [nvarchar](255) NULL,
	[prevappid] [nvarchar](50) NULL,
	[taskid] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[application_fee](
	[objid] [nvarchar](50) NOT NULL,
	[parentid] [nvarchar](50) NOT NULL,
	[item_objid] [nvarchar](50) NOT NULL,
	[amount] [decimal](16, 2) NOT NULL,
	[amtpaid] [decimal](16, 2) NOT NULL,
	[surcharge] [decimal](16, 2) NOT NULL,
	[penalty] [decimal](16, 2) NOT NULL,
	[remarks] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[application_task](
	[taskid] [nvarchar](50) NOT NULL,
	[refid] [nvarchar](50) NULL,
	[parentprocessid] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[startdate] [datetime2](7) NULL,
	[enddate] [datetime2](7) NULL,
	[assignee_objid] [nvarchar](50) NULL,
	[assignee_name] [nvarchar](100) NULL,
	[assignee_title] [nvarchar](80) NULL,
	[actor_objid] [nvarchar](50) NULL,
	[actor_name] [nvarchar](100) NULL,
	[actor_title] [nvarchar](80) NULL,
	[message] [nvarchar](255) NULL,
	[signature] [nvarchar](max) NULL,
	[returnedby] [nvarchar](100) NULL,
	[dtcreated] [datetime2](7) NULL,
	[prevtaskid] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[taskid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attachment](
	[objid] [nvarchar](50) NOT NULL,
	[refid] [nvarchar](50) NOT NULL,
	[refno] [nvarchar](50) NOT NULL,
	[fileid] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[causeofdeath](
	[objid] [nvarchar](50) NOT NULL,
	[state] [nvarchar](25) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cemetery](
	[objid] [nvarchar](50) NOT NULL,
	[state] [nvarchar](25) NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[location] [nvarchar](150) NOT NULL,
	[isnew] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cemetery_section](
	[objid] [nvarchar](50) NOT NULL,
	[parentid] [nvarchar](50) NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[ui] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cemetery_section_block](
	[objid] [nvarchar](50) NOT NULL,
	[parentid] [nvarchar](50) NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[ui] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cemetery_section_block_resource](
	[objid] [nvarchar](50) NOT NULL,
	[parentid] [nvarchar](50) NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[currentinfoid] [nvarchar](50) NULL,
	[currentappid] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cemetery_section_block_resource_info](
	[objid] [nvarchar](50) NOT NULL,
	[parentid] [nvarchar](50) NOT NULL,
	[state] [nvarchar](25) NOT NULL,
	[resource_objid] [nvarchar](50) NOT NULL,
	[code] [nvarchar](15) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[areasqm] [decimal](16, 2) NOT NULL,
	[ui] [nvarchar](max) NULL,
	[length] [decimal](16, 2) NULL,
	[width] [decimal](16, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deceased](
	[objid] [nvarchar](50) NOT NULL,
	[state] [nvarchar](25) NOT NULL,
	[name] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[lgu] [nvarchar](50) NULL,
	[nationality] [nvarchar](50) NULL,
	[age] [int] NULL,
	[agetype] [nvarchar](5) NULL,
	[ageinmon] [int] NULL,
	[sex] [nvarchar](10) NULL,
	[dtdied] [date] NULL,
	[placeofdeath] [nvarchar](50) NULL,
	[placeofburial] [nvarchar](50) NULL,
	[causeofdeath_objid] [nvarchar](50) NULL,
	[permissiontype] [nvarchar](25) NULL,
	[infectious] [nvarchar](255) NULL,
	[embalmed] [nvarchar](255) NULL,
	[disposition] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itemaccount](
	[objid] [nvarchar](50) NOT NULL,
	[title] [nvarchar](50) NULL,
	[item_objid] [nvarchar](50) NULL,
	[item_code] [nvarchar](50) NULL,
	[item_title] [nvarchar](255) NULL,
	[item_fund_objid] [nvarchar](50) NULL,
	[item_fund_title] [nvarchar](50) NULL,
	[sortorder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lgu](
	[objid] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nationality](
	[objid] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[note](
	[objid] [nvarchar](255) NOT NULL,
	[refid] [nvarchar](255) NOT NULL,
	[idx] [int] NOT NULL,
	[type] [nvarchar](50) NULL,
	[note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[objid] [nvarchar](50) NOT NULL,
	[appid] [nvarchar](50) NULL,
	[refid] [nvarchar](50) NULL,
	[refno] [nvarchar](50) NULL,
	[reftype] [nvarchar](50) NULL,
	[refdate] [date] NULL,
	[discount] [decimal](16, 2) NULL,
	[amount] [decimal](10, 2) NULL,
	[voided] [int] NULL,
	[txnmode] [nvarchar](50) NULL,
	[remarks] [nvarchar](255) NULL,
	[txndate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_item](
	[objid] [nvarchar](50) NOT NULL,
	[parentid] [nvarchar](50) NOT NULL,
	[refid] [nvarchar](50) NOT NULL,
	[reftype] [nvarchar](50) NOT NULL,
	[acct_objid] [nvarchar](50) NOT NULL,
	[acct_type] [nvarchar](25) NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[discount] [decimal](10, 2) NOT NULL,
	[remarks] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permit](
	[objid] [nvarchar](50) NOT NULL,
	[appid] [nvarchar](50) NOT NULL,
	[paymentid] [nvarchar](50) NULL,
	[permitno] [nvarchar](25) NULL,
	[permitdate] [date] NULL,
	[permittype] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[relation](
	[objid] [nvarchar](50) NOT NULL,
	[state] [nvarchar](25) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resource](
	[objid] [nvarchar](50) NOT NULL,
	[state] [nvarchar](25) NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_email_queue](
	[objid] [nvarchar](50) NOT NULL,
	[refid] [nvarchar](50) NULL,
	[state] [int] NULL,
	[reportid] [nvarchar](50) NULL,
	[dtsent] [datetime2](7) NULL,
	[to] [nvarchar](255) NULL,
	[subject] [nvarchar](255) NULL,
	[message] [nvarchar](max) NULL,
	[errmsg] [nvarchar](255) NULL,
	[connection] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_email_template](
	[objid] [nvarchar](50) NOT NULL,
	[subject] [nvarchar](255) NULL,
	[message] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_file](
	[objid] [nvarchar](50) NOT NULL,
	[title] [nvarchar](50) NULL,
	[filetype] [nvarchar](50) NULL,
	[dtcreated] [datetime2](7) NULL,
	[createdby_objid] [nvarchar](50) NULL,
	[createdby_name] [nvarchar](255) NULL,
	[keywords] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_fileitem](
	[objid] [nvarchar](50) NOT NULL,
	[state] [nvarchar](50) NULL,
	[parentid] [nvarchar](50) NULL,
	[dtcreated] [datetime2](7) NULL,
	[createdby_objid] [nvarchar](50) NULL,
	[createdby_name] [nvarchar](255) NULL,
	[caption] [nvarchar](155) NULL,
	[remarks] [nvarchar](255) NULL,
	[filelocid] [nvarchar](50) NULL,
	[filesize] [int] NULL,
	[thumbnail] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_fileloc](
	[objid] [nvarchar](50) NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[rootdir] [nvarchar](255) NULL,
	[defaultloc] [int] NOT NULL,
	[loctype] [nvarchar](20) NULL,
	[user_name] [nvarchar](50) NULL,
	[user_pwd] [nvarchar](50) NULL,
	[info] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_report_header](
	[objid] [nvarchar](50) NOT NULL,
	[value] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_report_tag](
	[objid] [nvarchar](150) NOT NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role](
	[name] [nvarchar](50) NOT NULL,
	[title] [nvarchar](255) NULL,
	[system] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role_permission](
	[objid] [nvarchar](100) NOT NULL,
	[role] [nvarchar](50) NULL,
	[object] [nvarchar](25) NULL,
	[permission] [nvarchar](25) NULL,
	[title] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rule](
	[objid] [nvarchar](50) NOT NULL,
	[state] [nvarchar](25) NULL,
	[name] [nvarchar](50) NOT NULL,
	[ruleset] [nvarchar](50) NOT NULL,
	[rulegroup] [nvarchar](50) NULL,
	[title] [nvarchar](250) NULL,
	[description] [nvarchar](max) NULL,
	[salience] [int] NULL,
	[effectivefrom] [date] NULL,
	[effectiveto] [date] NULL,
	[dtfiled] [datetime2](7) NULL,
	[user_objid] [nvarchar](50) NULL,
	[user_name] [nvarchar](100) NULL,
	[noloop] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rule_action](
	[objid] [nvarchar](50) NOT NULL,
	[parentid] [nvarchar](50) NULL,
	[actiondef_objid] [nvarchar](50) NULL,
	[actiondef_name] [nvarchar](50) NULL,
	[pos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rule_action_param](
	[objid] [nvarchar](50) NOT NULL,
	[parentid] [nvarchar](50) NULL,
	[actiondefparam_objid] [nvarchar](100) NULL,
	[stringvalue] [nvarchar](255) NULL,
	[booleanvalue] [int] NULL,
	[var_objid] [nvarchar](50) NULL,
	[var_name] [nvarchar](50) NULL,
	[expr] [nvarchar](max) NULL,
	[exprtype] [nvarchar](25) NULL,
	[pos] [int] NULL,
	[obj_key] [nvarchar](50) NULL,
	[obj_value] [nvarchar](255) NULL,
	[listvalue] [nvarchar](max) NULL,
	[lov] [nvarchar](50) NULL,
	[rangeoption] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rule_actiondef](
	[objid] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[title] [nvarchar](250) NULL,
	[sortorder] [int] NULL,
	[actionname] [nvarchar](50) NULL,
	[domain] [nvarchar](50) NULL,
	[actionclass] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rule_actiondef_param](
	[objid] [nvarchar](100) NOT NULL,
	[parentid] [nvarchar](50) NULL,
	[name] [nvarchar](50) NOT NULL,
	[sortorder] [int] NULL,
	[title] [nvarchar](50) NULL,
	[datatype] [nvarchar](50) NULL,
	[handler] [nvarchar](50) NULL,
	[lookuphandler] [nvarchar](50) NULL,
	[lookupkey] [nvarchar](50) NULL,
	[lookupvalue] [nvarchar](50) NULL,
	[vardatatype] [nvarchar](50) NULL,
	[lovname] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rule_condition](
	[objid] [nvarchar](50) NOT NULL,
	[parentid] [nvarchar](50) NULL,
	[fact_name] [nvarchar](50) NULL,
	[fact_objid] [nvarchar](50) NULL,
	[varname] [nvarchar](50) NULL,
	[pos] [int] NULL,
	[ruletext] [nvarchar](max) NULL,
	[displaytext] [nvarchar](max) NULL,
	[dynamic_datatype] [nvarchar](50) NULL,
	[dynamic_key] [nvarchar](50) NULL,
	[dynamic_value] [nvarchar](50) NULL,
	[notexist] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rule_condition_constraint](
	[objid] [nvarchar](50) NOT NULL,
	[parentid] [nvarchar](50) NULL,
	[field_objid] [nvarchar](100) NULL,
	[fieldname] [nvarchar](50) NULL,
	[varname] [nvarchar](50) NULL,
	[operator_caption] [nvarchar](50) NULL,
	[operator_symbol] [nvarchar](50) NULL,
	[usevar] [int] NULL,
	[var_objid] [nvarchar](50) NULL,
	[var_name] [nvarchar](50) NULL,
	[decimalvalue] [decimal](16, 2) NULL,
	[intvalue] [int] NULL,
	[stringvalue] [nvarchar](255) NULL,
	[listvalue] [nvarchar](max) NULL,
	[datevalue] [date] NULL,
	[pos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rule_condition_var](
	[objid] [nvarchar](50) NOT NULL,
	[parentid] [nvarchar](50) NULL,
	[ruleid] [nvarchar](50) NULL,
	[varname] [nvarchar](50) NULL,
	[datatype] [nvarchar](50) NULL,
	[pos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rule_deployed](
	[objid] [nvarchar](50) NOT NULL,
	[ruletext] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rule_fact](
	[objid] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[title] [nvarchar](160) NULL,
	[factclass] [nvarchar](50) NULL,
	[sortorder] [int] NULL,
	[handler] [nvarchar](50) NULL,
	[defaultvarname] [nvarchar](25) NULL,
	[dynamic] [int] NULL,
	[lookuphandler] [nvarchar](50) NULL,
	[lookupkey] [nvarchar](50) NULL,
	[lookupvalue] [nvarchar](50) NULL,
	[lookupdatatype] [nvarchar](50) NULL,
	[dynamicfieldname] [nvarchar](50) NULL,
	[builtinconstraints] [nvarchar](50) NULL,
	[domain] [nvarchar](50) NULL,
	[factsuperclass] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rule_fact_field](
	[objid] [nvarchar](100) NOT NULL,
	[parentid] [nvarchar](50) NULL,
	[name] [nvarchar](50) NOT NULL,
	[title] [nvarchar](160) NULL,
	[datatype] [nvarchar](50) NULL,
	[sortorder] [int] NULL,
	[handler] [nvarchar](50) NULL,
	[lookuphandler] [nvarchar](50) NULL,
	[lookupkey] [nvarchar](50) NULL,
	[lookupvalue] [nvarchar](50) NULL,
	[lookupdatatype] [nvarchar](50) NULL,
	[multivalued] [int] NULL,
	[required] [int] NULL,
	[vardatatype] [nvarchar](50) NULL,
	[lovname] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_rulegroup](
	[name] [nvarchar](50) NOT NULL,
	[ruleset] [nvarchar](50) NOT NULL,
	[title] [nvarchar](160) NULL,
	[sortorder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC,
	[ruleset] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_ruleset](
	[name] [nvarchar](50) NOT NULL,
	[title] [nvarchar](160) NULL,
	[packagename] [nvarchar](50) NULL,
	[domain] [nvarchar](50) NULL,
	[role] [nvarchar](50) NULL,
	[permission] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_ruleset_actiondef](
	[ruleset] [nvarchar](50) NOT NULL,
	[actiondef] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ruleset] ASC,
	[actiondef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_ruleset_fact](
	[ruleset] [nvarchar](50) NOT NULL,
	[rulefact] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ruleset] ASC,
	[rulefact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_sequence](
	[objid] [nvarchar](100) NOT NULL,
	[nextSeries] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_signature](
	[objid] [nvarchar](50) NOT NULL,
	[userid] [nvarchar](50) NULL,
	[user_name] [nvarchar](255) NULL,
	[displayname] [nvarchar](255) NULL,
	[position] [nvarchar](255) NULL,
	[signature] [varbinary](max) NULL,
	[tag] [nvarchar](50) NULL,
	[system] [int] NULL,
	[state] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_user](
	[objid] [nvarchar](50) NOT NULL,
	[username] [nvarchar](50) NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[middlename] [nvarchar](50) NULL,
	[name] [nvarchar](150) NULL,
	[jobtitle] [nvarchar](50) NULL,
	[txncode] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_user_role](
	[objid] [nvarchar](50) NOT NULL,
	[role] [nvarchar](50) NULL,
	[userid] [nvarchar](50) NOT NULL,
	[username] [nvarchar](50) NULL,
	[org_objid] [nvarchar](50) NULL,
	[org_name] [nvarchar](50) NULL,
	[securitygroup_objid] [nvarchar](50) NULL,
	[exclude] [nvarchar](255) NULL,
	[uid] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_usergroup](
	[objid] [nvarchar](50) NOT NULL,
	[title] [nvarchar](255) NULL,
	[domain] [nvarchar](25) NULL,
	[userclass] [nvarchar](25) NULL,
	[orgclass] [nvarchar](50) NULL,
	[role] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_var](
	[name] [nvarchar](50) NOT NULL,
	[value] [nvarchar](max) NULL,
	[description] [nvarchar](255) NULL,
	[datatype] [nvarchar](15) NULL,
	[category] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_wf](
	[name] [nvarchar](50) NOT NULL,
	[title] [nvarchar](100) NULL,
	[domain] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_wf_node](
	[name] [nvarchar](50) NOT NULL,
	[processname] [nvarchar](50) NOT NULL,
	[title] [nvarchar](100) NULL,
	[nodetype] [nvarchar](10) NULL,
	[idx] [int] NULL,
	[salience] [int] NULL,
	[domain] [nvarchar](50) NULL,
	[role] [nvarchar](50) NULL,
	[ui] [nvarchar](max) NULL,
	[properties] [nvarchar](max) NULL,
	[tracktime] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC,
	[processname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_wf_transition](
	[parentid] [nvarchar](50) NOT NULL,
	[processname] [nvarchar](50) NOT NULL,
	[action] [nvarchar](50) NOT NULL,
	[to] [nvarchar](50) NOT NULL,
	[idx] [int] NULL,
	[eval] [nvarchar](max) NULL,
	[properties] [nvarchar](255) NULL,
	[permission] [nvarchar](255) NULL,
	[caption] [nvarchar](255) NULL,
	[ui] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[parentid] ASC,
	[processname] ASC,
	[to] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_application] AS 
select 
    a.objid AS objid,
    a.state AS state,
    a.online AS online,
    a.apptype AS apptype,
    a.appno AS appno,
    a.dtapplied AS dtapplied,
    a.dtapproved AS dtapproved,
    a.appyear AS appyear,
    a.applicant_name AS applicant_name,
    a.applicant_address AS applicant_address,
    a.dtexpiry AS dtexpiry,
    a.amount AS amount,
    a.amtpaid AS amtpaid,
    a.renewable AS renewable,
    d.name AS deceased_name,
    d.nationality AS deceased_nationality,
    d.age AS deceased_age,
    d.sex AS deceased_sex,
    d.dtdied AS deceased_dtdied,
    d.permissiontype AS deceased_permissiontype,
    cd.title AS deceased_causeofdeath,
    sbri.objid AS resourceinfo_objid,
    sbri.code AS resourceinfo_code,
    sbri.name AS resourceinfo_name,
    sbri.areasqm AS resource_areasqm,
    sbri.length AS resource_length,
    sbri.width AS resource_width,
    sb.objid AS block_objid,
    sb.code AS block_code,
    sb.name AS block_name,
    r.objid AS resource_objid,
    r.name AS resource_type,
    s.objid AS section_objid,
    s.code AS section_code,
    s.name AS section_name,
    c.objid AS cemetery_objid,
    c.code AS cemetery_code,
    c.name AS cemetery_name,
    t.taskid AS task_objid,
    t.state AS task_state,
    t.enddate AS task_enddate,
    t.assignee_objid AS task_assignee_objid,
    t.actor_objid AS task_actor_objid,
    t.prevtaskid AS task_prevtaskid 
    from (((((((((application a 
    left join cemetery_section_block_resource_info sbri on((a.resourceinfo_objid = sbri.objid))) 
    left join cemetery_section_block_resource sbr on((sbri.parentid = sbr.objid))) 
    left join cemetery_section_block sb on((sbr.parentid = sb.objid))) 
    left join cemetery_section s on((sb.parentid = s.objid))) 
    left join cemetery c on((s.parentid = c.objid))) 
    left join resource r on((sbri.resource_objid = r.objid))) 
    left join deceased d on((a.deceased_objid = d.objid))) 
    left join causeofdeath cd on((d.causeofdeath_objid = cd.objid))) 
    left join application_task t on((a.taskid = t.taskid)))

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_cemetery_resource] AS 
select sri.objid AS objid,sri.parentid AS parentid,sr.parentid AS blockid,sr.code AS code,sr.name AS name,sr.currentinfoid AS currentinfoid,sr.currentappid AS currentappid,sri.state AS state,sri.areasqm AS areasqm,sri.resource_objid AS resource_objid,sri.ui AS ui,r.name AS resource_name,b.objid AS block_objid,b.code AS block_code,b.name AS block_name,s.objid AS section_objid,s.code AS section_code,s.name AS section_name,a.appno AS appno,a.apptype AS apptype,a.applicant_name AS applicant_name,a.applicant_address AS applicant_address,d.name AS deceased_name,d.nationality AS deceased_nationality,d.sex AS deceased_sex,d.age AS deceased_age,cd.title AS deceased_causeofdeath,c.objid AS cemetery_objid,c.code AS cemetery_code,c.name AS cemetery_name,c.location AS cemetery_location,c.isnew AS cemetery_isnew from ((((((((cemetery_section_block_resource sr join cemetery_section_block_resource_info sri on((sr.currentinfoid = sri.objid))) join resource r on((sri.resource_objid = r.objid))) join cemetery_section_block b on((sr.parentid = b.objid))) join cemetery_section s on((b.parentid = s.objid))) join cemetery c on((s.parentid = c.objid))) left join application a on((sr.currentappid = a.objid))) left join deceased d on((a.deceased_objid = d.objid))) left join causeofdeath cd on((d.causeofdeath_objid = cd.objid)))

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_transferred_list] AS select a.objid AS objid,a.state AS state,a.appno AS appno,a.dtapproved AS dtapproved,a.dtexpiry AS dtexpiry,s.code AS section_code,s.name AS section_name,sb.code AS block_code,sb.name AS block_name,sbri.code AS resourceinfo_code,sbri.name AS resourceinfo_name,a.applicant_name AS applicant_name,a.applicant_address AS applicant_address,d.name AS deceased_name,ps.code AS prevsection_code,ps.name AS prevsection_name,psb.code AS prevblock_code,psb.name AS prevblock_name,psbri.code AS prevresource_code,psbri.name AS prevresource_name from (((((((((((application a join cemetery_section_block_resource_info sbri on((a.resourceinfo_objid = sbri.objid))) join cemetery_section_block_resource sbr on((sbri.parentid = sbr.objid))) join cemetery_section_block sb on((sbr.parentid = sb.objid))) join cemetery_section s on((sb.parentid = s.objid))) join resource r on((sbri.resource_objid = r.objid))) join deceased d on((a.deceased_objid = d.objid))) join application pa on((a.prevappid = pa.objid))) join cemetery_section_block_resource_info psbri on((pa.resourceinfo_objid = psbri.objid))) join cemetery_section_block_resource psbr on((psbri.parentid = psbr.objid))) join cemetery_section_block psb on((sbr.parentid = psb.objid))) join cemetery_section ps on((psb.parentid = ps.objid)))

GO
INSERT [dbo].[causeofdeath] ([objid], [state], [title]) VALUES (N'ACCIDENT', N'ACTIVE', N'ACCIDENT')
INSERT [dbo].[causeofdeath] ([objid], [state], [title]) VALUES (N'COVID19', N'ACTIVE', N'COVID 19')
INSERT [dbo].[causeofdeath] ([objid], [state], [title]) VALUES (N'HYPERTENSION', N'ACTIVE', N'HYPER-TENSION')
INSERT [dbo].[causeofdeath] ([objid], [state], [title]) VALUES (N'NATURAL', N'ACTIVE', N'NATURAL')
INSERT [dbo].[itemaccount] ([objid], [title], [item_objid], [item_code], [item_title], [item_fund_objid], [item_fund_title], [sortorder]) VALUES (N'BPA', N'BURIAL PERMIT APPLICATION', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[itemaccount] ([objid], [title], [item_objid], [item_code], [item_title], [item_fund_objid], [item_fund_title], [sortorder]) VALUES (N'BPAPEN', N'BURIAL PERMIT APPLICATION - PENALTY', NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[itemaccount] ([objid], [title], [item_objid], [item_code], [item_title], [item_fund_objid], [item_fund_title], [sortorder]) VALUES (N'BPASUR', N'BURIAL PERMIT APPLICATION - SURCHARGE', NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[lgu] ([objid]) VALUES (N'BAAO')
INSERT [dbo].[lgu] ([objid]) VALUES (N'IRIGA CITY')
INSERT [dbo].[lgu] ([objid]) VALUES (N'LIGAO CITY')
INSERT [dbo].[lgu] ([objid]) VALUES (N'NAGA CITY')
INSERT [dbo].[nationality] ([objid]) VALUES (N'CHINESE')
INSERT [dbo].[nationality] ([objid]) VALUES (N'FILIPINO')
INSERT [dbo].[nationality] ([objid]) VALUES (N'JAPANESE')
INSERT [dbo].[relation] ([objid], [state], [title]) VALUES (N'BROTHER', N'ACTIVE', N'BROTHER')
INSERT [dbo].[relation] ([objid], [state], [title]) VALUES (N'FATER', N'ACTIVE', N'FATHER')
INSERT [dbo].[relation] ([objid], [state], [title]) VALUES (N'MOTHER', N'ACTIVE', N'MOTHER')
INSERT [dbo].[relation] ([objid], [state], [title]) VALUES (N'SISTER', N'ACTIVE', N'SISTER')
INSERT [dbo].[resource] ([objid], [state], [code], [name]) VALUES (N'MAUSOLEUM', N'ACTIVE', N'MAU', N'MAUSOLEUM')
INSERT [dbo].[resource] ([objid], [state], [code], [name]) VALUES (N'NICHE', N'ACTIVE', N'NIC', N'NICHE')
INSERT [dbo].[resource] ([objid], [state], [code], [name]) VALUES (N'OSSUARY', N'ACTIVE', N'OSS', N'OSSUARY')
INSERT [dbo].[resource] ([objid], [state], [code], [name]) VALUES (N'TOMB', N'ACTIVE', N'TOM', N'TOMB')
INSERT [dbo].[sys_role] ([name], [title], [system]) VALUES (N'ADMIN', N'ADMIN', 1)
INSERT [dbo].[sys_role] ([name], [title], [system]) VALUES (N'APPROVER', N'APPROVER', 1)
INSERT [dbo].[sys_role] ([name], [title], [system]) VALUES (N'ENCODER', N'ENCODER', 1)
INSERT [dbo].[sys_role] ([name], [title], [system]) VALUES (N'ENCODER_APPROVER', N'ENCODER_APPROVER', 1)
INSERT [dbo].[sys_role] ([name], [title], [system]) VALUES (N'LICENSING', N'LICENSING', 1)
INSERT [dbo].[sys_role] ([name], [title], [system]) VALUES (N'MASTER', N'MASTER', 1)
INSERT [dbo].[sys_role] ([name], [title], [system]) VALUES (N'RECEIVER', N'RECEIVER', 1)
INSERT [dbo].[sys_role] ([name], [title], [system]) VALUES (N'RELEASER', N'RELEASER', 1)
INSERT [dbo].[sys_role] ([name], [title], [system]) VALUES (N'REPORTS', N'REPORTS', 1)
INSERT [dbo].[sys_role] ([name], [title], [system]) VALUES (N'RULE_AUTHOR', N'RULE AUTHOR', 1)
INSERT [dbo].[sys_role] ([name], [title], [system]) VALUES (N'SHARED', N'SHARED', 1)
INSERT [dbo].[sys_role] ([name], [title], [system]) VALUES (N'SYSTEM', N'SYSTEM', 1)
INSERT [dbo].[sys_rule] ([objid], [state], [name], [ruleset], [rulegroup], [title], [description], [salience], [effectivefrom], [effectiveto], [dtfiled], [user_objid], [user_name], [noloop]) VALUES (N'RUL-18956a1e:17a75a2ce82:-7598', N'DEPLOYED', N'PENALTY', N'burialpermitapplicationbilling', N'penalty', N'PENALTY', NULL, 50000, NULL, NULL, CAST(0x070085669187B7420B AS DateTime2), N'USR5b13925b:17066eb8fad:-7eac', N'ADMIN', 1)
INSERT [dbo].[sys_rule] ([objid], [state], [name], [ruleset], [rulegroup], [title], [description], [salience], [effectivefrom], [effectiveto], [dtfiled], [user_objid], [user_name], [noloop]) VALUES (N'RUL-18956a1e:17a75a2ce82:-76ed', N'DEPLOYED', N'SURCHARGE', N'burialpermitapplicationbilling', N'surcharge', N'SURCHARGE', NULL, 50000, NULL, NULL, CAST(0x0700EC10A585B7420B AS DateTime2), N'USR5b13925b:17066eb8fad:-7eac', N'ADMIN', 1)
INSERT [dbo].[sys_rule] ([objid], [state], [name], [ruleset], [rulegroup], [title], [description], [salience], [effectivefrom], [effectiveto], [dtfiled], [user_objid], [user_name], [noloop]) VALUES (N'RUL47c70270:178a108c963:-7d4d', N'DEPLOYED', N'FEE_TOMB', N'burialpermitapplication', N'feecomputation', N'Tomb Fee', NULL, 50000, NULL, NULL, CAST(0x07806AC947865C420B AS DateTime2), N'USR5b13925b:17066eb8fad:-7eac', N'ADMIN', 1)
INSERT [dbo].[sys_rule] ([objid], [state], [name], [ruleset], [rulegroup], [title], [description], [salience], [effectivefrom], [effectiveto], [dtfiled], [user_objid], [user_name], [noloop]) VALUES (N'RUL6020185:178a06ffea4:-79ff', N'DEPLOYED', N'DEFAULT_RENEWABLE_OPTION', N'burialpermitapplication', N'init', N'DEFAULT RENEWABLE OPTION', NULL, 50000, NULL, NULL, CAST(0x078000DF70705C420B AS DateTime2), N'USR5b13925b:17066eb8fad:-7eac', N'ADMIN', 1)
INSERT [dbo].[sys_rule] ([objid], [state], [name], [ruleset], [rulegroup], [title], [description], [salience], [effectivefrom], [effectiveto], [dtfiled], [user_objid], [user_name], [noloop]) VALUES (N'RUL6020185:178a06ffea4:-7b65', N'DEPLOYED', N'DEFAULT_LEASED_DURATION', N'burialpermitapplication', N'init', N'DEFAULT LEASED DURATION', NULL, 50000, NULL, NULL, CAST(0x0700A36720705C420B AS DateTime2), N'USR5b13925b:17066eb8fad:-7eac', N'ADMIN', 1)
INSERT [dbo].[sys_rule] ([objid], [state], [name], [ruleset], [rulegroup], [title], [description], [salience], [effectivefrom], [effectiveto], [dtfiled], [user_objid], [user_name], [noloop]) VALUES (N'RUL72cbefee:17a3bef8ccd:-6fca', N'DEPLOYED', N'FEE_NICHE', N'burialpermitapplication', N'feecomputation', N'Niche Fee', NULL, 50000, NULL, NULL, CAST(0x078001FC7A66AC420B AS DateTime2), N'USR5b13925b:17066eb8fad:-7eac', N'ADMIN', 1)
INSERT [dbo].[sys_rule_action] ([objid], [parentid], [actiondef_objid], [actiondef_name], [pos]) VALUES (N'RA3d0a727c:17a3beb49e1:-7fef', N'RUL72cbefee:17a3bef8ccd:-6fca', N'comis.actions.AddFee', N'add-fee', 0)
INSERT [dbo].[sys_rule_action] ([objid], [parentid], [actiondef_objid], [actiondef_name], [pos]) VALUES (N'RACT-18956a1e:17a75a2ce82:-74d7', N'RUL-18956a1e:17a75a2ce82:-7598', N'comis.actions.CalcPenalty', N'calc-penalty', 0)
INSERT [dbo].[sys_rule_action] ([objid], [parentid], [actiondef_objid], [actiondef_name], [pos]) VALUES (N'RACT-18956a1e:17a75a2ce82:-7632', N'RUL-18956a1e:17a75a2ce82:-76ed', N'comis.actions.CalcSurcharge', N'calc-surcharge', 0)
INSERT [dbo].[sys_rule_action] ([objid], [parentid], [actiondef_objid], [actiondef_name], [pos]) VALUES (N'RACT47c70270:178a108c963:-7bf8', N'RUL47c70270:178a108c963:-7d4d', N'comis.actions.AddFee', N'add-fee', 0)
INSERT [dbo].[sys_rule_action] ([objid], [parentid], [actiondef_objid], [actiondef_name], [pos]) VALUES (N'RACT6020185:178a06ffea4:-79b2', N'RUL6020185:178a06ffea4:-79ff', N'comis.actions.SetRenewable', N'setrenewable', 0)
INSERT [dbo].[sys_rule_action] ([objid], [parentid], [actiondef_objid], [actiondef_name], [pos]) VALUES (N'RACT6020185:178a06ffea4:-7a6b', N'RUL6020185:178a06ffea4:-7b65', N'comis.actions.ComputeLeaseDuration', N'compute-lease-duration', 0)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RAP3d0a727c:17a3beb49e1:-7fec', N'RA3d0a727c:17a3beb49e1:-7fef', N'comis.actions.AddFee.application', NULL, NULL, N'RC3d0a727c:17a3beb49e1:-7ff2', N'APP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RAP3d0a727c:17a3beb49e1:-7fed', N'RA3d0a727c:17a3beb49e1:-7fef', N'comis.actions.AddFee.itemaccount', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'BPA', N'BURIAL PERMIT APPLICATION', NULL, NULL, NULL)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RAP3d0a727c:17a3beb49e1:-7fee', N'RA3d0a727c:17a3beb49e1:-7fef', N'comis.actions.AddFee.expr', NULL, NULL, NULL, NULL, N'2500', N'expression', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RULACT-18956a1e:17a75a2ce82:-7487', N'RACT-18956a1e:17a75a2ce82:-74d7', N'comis.actions.CalcPenalty.expr', NULL, NULL, NULL, NULL, N'AMOUNT * 0.02 *   (@MONTHDIFF( DTEXPIRY, CDATE, 1) + 2)', N'expression', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RULACT-18956a1e:17a75a2ce82:-74a8', N'RACT-18956a1e:17a75a2ce82:-74d7', N'comis.actions.CalcPenalty.itemaccount', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'BPAPEN', N'BURIAL PERMIT APPLICATION - PENALTY', NULL, NULL, NULL)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RULACT-18956a1e:17a75a2ce82:-74c3', N'RACT-18956a1e:17a75a2ce82:-74d7', N'comis.actions.CalcPenalty.fee', NULL, NULL, N'RCOND-18956a1e:17a75a2ce82:-7551', N'FEE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RULACT-18956a1e:17a75a2ce82:-75e2', N'RACT-18956a1e:17a75a2ce82:-7632', N'comis.actions.CalcSurcharge.expr', NULL, NULL, NULL, NULL, N'AMOUNT * 0.20', N'expression', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RULACT-18956a1e:17a75a2ce82:-7603', N'RACT-18956a1e:17a75a2ce82:-7632', N'comis.actions.CalcSurcharge.itemaccount', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'BPASUR', N'BURIAL PERMIT APPLICATION - SURCHARGE', NULL, NULL, NULL)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RULACT-18956a1e:17a75a2ce82:-761e', N'RACT-18956a1e:17a75a2ce82:-7632', N'comis.actions.CalcSurcharge.fee', NULL, NULL, N'RCOND-18956a1e:17a75a2ce82:-76a6', N'FEE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RULACT47c70270:178a108c963:-7ba8', N'RACT47c70270:178a108c963:-7bf8', N'comis.actions.AddFee.expr', NULL, NULL, NULL, NULL, N'3000', N'expression', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RULACT47c70270:178a108c963:-7bc9', N'RACT47c70270:178a108c963:-7bf8', N'comis.actions.AddFee.itemaccount', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'BPA', N'BURIAL PERMIT APPLICATION', NULL, NULL, NULL)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RULACT47c70270:178a108c963:-7be4', N'RACT47c70270:178a108c963:-7bf8', N'comis.actions.AddFee.application', NULL, NULL, N'RCOND47c70270:178a108c963:-7c3a', N'APP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RULACT6020185:178a06ffea4:-798c', N'RACT6020185:178a06ffea4:-79b2', N'comis.actions.SetRenewable.renewable', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RULACT6020185:178a06ffea4:-79a2', N'RACT6020185:178a06ffea4:-79b2', N'comis.actions.SetRenewable.application', NULL, NULL, N'RC-2066edb5:178a07da6d9:-7ffe', N'APP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RULACT6020185:178a06ffea4:-7a45', N'RACT6020185:178a06ffea4:-7a6b', N'comis.actions.ComputeLeaseDuration.expr', NULL, NULL, NULL, NULL, N'7', N'expression', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_action_param] ([objid], [parentid], [actiondefparam_objid], [stringvalue], [booleanvalue], [var_objid], [var_name], [expr], [exprtype], [pos], [obj_key], [obj_value], [listvalue], [lov], [rangeoption]) VALUES (N'RULACT6020185:178a06ffea4:-7a5b', N'RACT6020185:178a06ffea4:-7a6b', N'comis.actions.ComputeLeaseDuration.application', NULL, NULL, N'RCOND6020185:178a06ffea4:-7b30', N'APP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_actiondef] ([objid], [name], [title], [sortorder], [actionname], [domain], [actionclass]) VALUES (N'comis.actions.AddFee', N'add-fee', N'Add Fee', 3, N'add-fee', N'COMIS', N'comis.actions.AddFee')
INSERT [dbo].[sys_rule_actiondef] ([objid], [name], [title], [sortorder], [actionname], [domain], [actionclass]) VALUES (N'comis.actions.CalcPenalty', N'calc-penalty', N'Calculate Penalty', 5, N'calc-penalty', N'COMIS', N'comis.actions.CalcPenalty')
INSERT [dbo].[sys_rule_actiondef] ([objid], [name], [title], [sortorder], [actionname], [domain], [actionclass]) VALUES (N'comis.actions.CalcSurcharge', N'calc-surcharge', N'Calculate Surcharge', 4, N'calc-surcharge', N'COMIS', N'comis.actions.CalcSurcharge')
INSERT [dbo].[sys_rule_actiondef] ([objid], [name], [title], [sortorder], [actionname], [domain], [actionclass]) VALUES (N'comis.actions.ComputeLeaseDuration', N'compute-lease-duration', N'Compute Lease Duration', 1, N'compute-lease-duration', N'COMIS', N'comis.actions.ComputeLeaseDuration')
INSERT [dbo].[sys_rule_actiondef] ([objid], [name], [title], [sortorder], [actionname], [domain], [actionclass]) VALUES (N'comis.actions.SetRenewable', N'setrenewable', N'Set Renewable Flag', 2, N'setrenewable', N'COMIS', N'comis.actions.SetRenewable')
INSERT [dbo].[sys_rule_actiondef_param] ([objid], [parentid], [name], [sortorder], [title], [datatype], [handler], [lookuphandler], [lookupkey], [lookupvalue], [vardatatype], [lovname]) VALUES (N'comis.actions.AddFee.application', N'comis.actions.AddFee', N'application', 1, N'Burial Permit Application', NULL, N'var', NULL, NULL, NULL, N'comis.facts.BurialPermitApplication', NULL)
INSERT [dbo].[sys_rule_actiondef_param] ([objid], [parentid], [name], [sortorder], [title], [datatype], [handler], [lookuphandler], [lookupkey], [lookupvalue], [vardatatype], [lovname]) VALUES (N'comis.actions.AddFee.expr', N'comis.actions.AddFee', N'expr', 3, N'Computation', NULL, N'expression', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_actiondef_param] ([objid], [parentid], [name], [sortorder], [title], [datatype], [handler], [lookuphandler], [lookupkey], [lookupvalue], [vardatatype], [lovname]) VALUES (N'comis.actions.AddFee.itemaccount', N'comis.actions.AddFee', N'itemaccount', 2, N'Account', NULL, N'lookup', N'comis_itemaccount:lookup', N'objid', N'title', NULL, NULL)
INSERT [dbo].[sys_rule_actiondef_param] ([objid], [parentid], [name], [sortorder], [title], [datatype], [handler], [lookuphandler], [lookupkey], [lookupvalue], [vardatatype], [lovname]) VALUES (N'comis.actions.CalcPenalty.expr', N'comis.actions.CalcPenalty', N'expr', 3, N'Computation', NULL, N'expression', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_actiondef_param] ([objid], [parentid], [name], [sortorder], [title], [datatype], [handler], [lookuphandler], [lookupkey], [lookupvalue], [vardatatype], [lovname]) VALUES (N'comis.actions.CalcPenalty.fee', N'comis.actions.CalcPenalty', N'fee', 1, N'Fee', NULL, N'var', NULL, NULL, NULL, N'comis.facts.Fee', NULL)
INSERT [dbo].[sys_rule_actiondef_param] ([objid], [parentid], [name], [sortorder], [title], [datatype], [handler], [lookuphandler], [lookupkey], [lookupvalue], [vardatatype], [lovname]) VALUES (N'comis.actions.CalcPenalty.itemaccount', N'comis.actions.CalcPenalty', N'itemaccount', 2, N'Penalty Acct', NULL, N'lookup', N'comis_itemaccount:lookup', N'objid', N'title', NULL, NULL)
INSERT [dbo].[sys_rule_actiondef_param] ([objid], [parentid], [name], [sortorder], [title], [datatype], [handler], [lookuphandler], [lookupkey], [lookupvalue], [vardatatype], [lovname]) VALUES (N'comis.actions.CalcSurcharge.expr', N'comis.actions.CalcSurcharge', N'expr', 3, N'Computation', NULL, N'expression', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_actiondef_param] ([objid], [parentid], [name], [sortorder], [title], [datatype], [handler], [lookuphandler], [lookupkey], [lookupvalue], [vardatatype], [lovname]) VALUES (N'comis.actions.CalcSurcharge.fee', N'comis.actions.CalcSurcharge', N'fee', 1, N'Fee', NULL, N'var', NULL, NULL, NULL, N'comis.facts.Fee', NULL)
INSERT [dbo].[sys_rule_actiondef_param] ([objid], [parentid], [name], [sortorder], [title], [datatype], [handler], [lookuphandler], [lookupkey], [lookupvalue], [vardatatype], [lovname]) VALUES (N'comis.actions.CalcSurcharge.itemaccount', N'comis.actions.CalcSurcharge', N'itemaccount', 2, N'Surcharge Acct', NULL, N'lookup', N'comis_itemaccount:lookup', N'objid', N'title', NULL, NULL)
INSERT [dbo].[sys_rule_actiondef_param] ([objid], [parentid], [name], [sortorder], [title], [datatype], [handler], [lookuphandler], [lookupkey], [lookupvalue], [vardatatype], [lovname]) VALUES (N'comis.actions.ComputeLeaseDuration.application', N'comis.actions.ComputeLeaseDuration', N'application', 1, N'Burial Permit Application', NULL, N'var', NULL, NULL, NULL, N'comis.facts.BurialPermitApplication', NULL)
INSERT [dbo].[sys_rule_actiondef_param] ([objid], [parentid], [name], [sortorder], [title], [datatype], [handler], [lookuphandler], [lookupkey], [lookupvalue], [vardatatype], [lovname]) VALUES (N'comis.actions.ComputeLeaseDuration.expr', N'comis.actions.ComputeLeaseDuration', N'expr', 2, N'Computation', NULL, N'expression', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sys_rule_actiondef_param] ([objid], [parentid], [name], [sortorder], [title], [datatype], [handler], [lookuphandler], [lookupkey], [lookupvalue], [vardatatype], [lovname]) VALUES (N'comis.actions.SetRenewable.application', N'comis.actions.SetRenewable', N'application', 1, N'Burial Permit Application', NULL, N'var', NULL, NULL, NULL, N'comis.facts.BurialPermitApplication', NULL)
INSERT [dbo].[sys_rule_actiondef_param] ([objid], [parentid], [name], [sortorder], [title], [datatype], [handler], [lookuphandler], [lookupkey], [lookupvalue], [vardatatype], [lovname]) VALUES (N'comis.actions.SetRenewable.renewable', N'comis.actions.SetRenewable', N'renewable', 2, N'Is Renewable?', N'boolean', N'boolean', NULL, NULL, NULL, N'boolean', NULL)
INSERT [dbo].[sys_rule_condition] ([objid], [parentid], [fact_name], [fact_objid], [varname], [pos], [ruletext], [displaytext], [dynamic_datatype], [dynamic_key], [dynamic_value], [notexist]) VALUES (N'RC-2066edb5:178a07da6d9:-7ffe', N'RUL6020185:178a06ffea4:-79ff', N'comis.facts.BurialPermitApplication', N'comis.facts.BurialPermitApplication', N'APP', 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition] ([objid], [parentid], [fact_name], [fact_objid], [varname], [pos], [ruletext], [displaytext], [dynamic_datatype], [dynamic_key], [dynamic_value], [notexist]) VALUES (N'RC-2066edb5:178a07da6d9:-8000', N'RUL6020185:178a06ffea4:-79ff', N'comis.facts.CemeteryResource', N'comis.facts.CemeteryResource', N'RES', 1, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition] ([objid], [parentid], [fact_name], [fact_objid], [varname], [pos], [ruletext], [displaytext], [dynamic_datatype], [dynamic_key], [dynamic_value], [notexist]) VALUES (N'RC3d0a727c:17a3beb49e1:-7ff2', N'RUL72cbefee:17a3bef8ccd:-6fca', N'comis.facts.BurialPermitApplication', N'comis.facts.BurialPermitApplication', N'APP', 1, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition] ([objid], [parentid], [fact_name], [fact_objid], [varname], [pos], [ruletext], [displaytext], [dynamic_datatype], [dynamic_key], [dynamic_value], [notexist]) VALUES (N'RCOND-18956a1e:17a75a2ce82:-7551', N'RUL-18956a1e:17a75a2ce82:-7598', N'comis.facts.Fee', N'comis.facts.Fee', N'FEE', 2, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition] ([objid], [parentid], [fact_name], [fact_objid], [varname], [pos], [ruletext], [displaytext], [dynamic_datatype], [dynamic_key], [dynamic_value], [notexist]) VALUES (N'RCOND-18956a1e:17a75a2ce82:-76a6', N'RUL-18956a1e:17a75a2ce82:-76ed', N'comis.facts.Fee', N'comis.facts.Fee', N'FEE', 1, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition] ([objid], [parentid], [fact_name], [fact_objid], [varname], [pos], [ruletext], [displaytext], [dynamic_datatype], [dynamic_key], [dynamic_value], [notexist]) VALUES (N'RCOND-36ac8fe3:17a8917952b:-7765', N'RUL-18956a1e:17a75a2ce82:-76ed', N'comis.facts.PrevBurialPermitApplication', N'comis.facts.PrevBurialPermitApplication', N'APP', 2, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition] ([objid], [parentid], [fact_name], [fact_objid], [varname], [pos], [ruletext], [displaytext], [dynamic_datatype], [dynamic_key], [dynamic_value], [notexist]) VALUES (N'RCOND-36ac8fe3:17a8917952b:-7e4e', N'RUL-18956a1e:17a75a2ce82:-76ed', N'com.rameses.rules.common.CurrentDate', N'com.rameses.rules.common.CurrentDate', N'CURRDATE', 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition] ([objid], [parentid], [fact_name], [fact_objid], [varname], [pos], [ruletext], [displaytext], [dynamic_datatype], [dynamic_key], [dynamic_value], [notexist]) VALUES (N'RCOND47c70270:178a108c963:-7c3a', N'RUL47c70270:178a108c963:-7d4d', N'comis.facts.BurialPermitApplication', N'comis.facts.BurialPermitApplication', N'APP', 1, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition] ([objid], [parentid], [fact_name], [fact_objid], [varname], [pos], [ruletext], [displaytext], [dynamic_datatype], [dynamic_key], [dynamic_value], [notexist]) VALUES (N'RCOND47c70270:178a108c963:-7d1a', N'RUL47c70270:178a108c963:-7d4d', N'comis.facts.CemeteryResource', N'comis.facts.CemeteryResource', N'RES', 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition] ([objid], [parentid], [fact_name], [fact_objid], [varname], [pos], [ruletext], [displaytext], [dynamic_datatype], [dynamic_key], [dynamic_value], [notexist]) VALUES (N'RCOND-495f956b:17a894cf424:-72a6', N'RUL-18956a1e:17a75a2ce82:-7598', N'com.rameses.rules.common.CurrentDate', N'com.rameses.rules.common.CurrentDate', N'CURRDATE', 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition] ([objid], [parentid], [fact_name], [fact_objid], [varname], [pos], [ruletext], [displaytext], [dynamic_datatype], [dynamic_key], [dynamic_value], [notexist]) VALUES (N'RCOND-495f956b:17a894cf424:-7358', N'RUL-18956a1e:17a75a2ce82:-7598', N'comis.facts.PrevBurialPermitApplication', N'comis.facts.PrevBurialPermitApplication', N'APP', 1, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition] ([objid], [parentid], [fact_name], [fact_objid], [varname], [pos], [ruletext], [displaytext], [dynamic_datatype], [dynamic_key], [dynamic_value], [notexist]) VALUES (N'RCOND6020185:178a06ffea4:-7ae6', N'RUL6020185:178a06ffea4:-7b65', N'comis.facts.CemeteryResource', N'comis.facts.CemeteryResource', N'RES', 1, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition] ([objid], [parentid], [fact_name], [fact_objid], [varname], [pos], [ruletext], [displaytext], [dynamic_datatype], [dynamic_key], [dynamic_value], [notexist]) VALUES (N'RCOND6020185:178a06ffea4:-7b30', N'RUL6020185:178a06ffea4:-7b65', N'comis.facts.BurialPermitApplication', N'comis.facts.BurialPermitApplication', N'APP', 0, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition] ([objid], [parentid], [fact_name], [fact_objid], [varname], [pos], [ruletext], [displaytext], [dynamic_datatype], [dynamic_key], [dynamic_value], [notexist]) VALUES (N'RCOND72cbefee:17a3bef8ccd:-6533', N'RUL72cbefee:17a3bef8ccd:-6fca', N'comis.facts.CemeteryResource', N'comis.facts.CemeteryResource', N'RES', 1, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition_constraint] ([objid], [parentid], [field_objid], [fieldname], [varname], [operator_caption], [operator_symbol], [usevar], [var_objid], [var_name], [decimalvalue], [intvalue], [stringvalue], [listvalue], [datevalue], [pos]) VALUES (N'RCC-2066edb5:178a07da6d9:-7fff', N'RC-2066edb5:178a07da6d9:-8000', N'comis.facts.CemeteryResource.resourceid', N'resourceid', NULL, N'is any of the ff.', N'matches', NULL, NULL, NULL, NULL, NULL, NULL, N'[[key:"MAUSOLEUM",value:"MAUSOLEUM"],[key:"NICHE",value:"NICHE"],[key:"TOMB",value:"TOMB"]]', NULL, 0)
INSERT [dbo].[sys_rule_condition_constraint] ([objid], [parentid], [field_objid], [fieldname], [varname], [operator_caption], [operator_symbol], [usevar], [var_objid], [var_name], [decimalvalue], [intvalue], [stringvalue], [listvalue], [datevalue], [pos]) VALUES (N'RCONST-18956a1e:17a75a2ce82:-7517', N'RCOND-18956a1e:17a75a2ce82:-7551', N'comis.facts.Fee.amount', N'amount', N'AMOUNT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition_constraint] ([objid], [parentid], [field_objid], [fieldname], [varname], [operator_caption], [operator_symbol], [usevar], [var_objid], [var_name], [decimalvalue], [intvalue], [stringvalue], [listvalue], [datevalue], [pos]) VALUES (N'RCONST-18956a1e:17a75a2ce82:-766c', N'RCOND-18956a1e:17a75a2ce82:-76a6', N'comis.facts.Fee.amount', N'amount', N'AMOUNT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition_constraint] ([objid], [parentid], [field_objid], [fieldname], [varname], [operator_caption], [operator_symbol], [usevar], [var_objid], [var_name], [decimalvalue], [intvalue], [stringvalue], [listvalue], [datevalue], [pos]) VALUES (N'RCONST-36ac8fe3:17a8917952b:-7730', N'RCOND-36ac8fe3:17a8917952b:-7765', N'comis.facts.PrevBurialPermitApplication.dtexpiry', N'dtexpiry', N'DTEXPIRY', N'on or before', N'<=', 1, N'RCONST-36ac8fe3:17a8917952b:-7d3d', N'CDATE', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition_constraint] ([objid], [parentid], [field_objid], [fieldname], [varname], [operator_caption], [operator_symbol], [usevar], [var_objid], [var_name], [decimalvalue], [intvalue], [stringvalue], [listvalue], [datevalue], [pos]) VALUES (N'RCONST-36ac8fe3:17a8917952b:-7d3d', N'RCOND-36ac8fe3:17a8917952b:-7e4e', N'com.rameses.rules.common.CurrentDate.date', N'date', N'CDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition_constraint] ([objid], [parentid], [field_objid], [fieldname], [varname], [operator_caption], [operator_symbol], [usevar], [var_objid], [var_name], [decimalvalue], [intvalue], [stringvalue], [listvalue], [datevalue], [pos]) VALUES (N'RCONST47c70270:178a108c963:-7cfb', N'RCOND47c70270:178a108c963:-7d1a', N'comis.facts.CemeteryResource.resourceid', N'resourceid', NULL, N'is any of the ff.', N'matches', NULL, NULL, NULL, NULL, NULL, NULL, N'[[key:"TOMB",value:"TOMB"]]', NULL, 0)
INSERT [dbo].[sys_rule_condition_constraint] ([objid], [parentid], [field_objid], [fieldname], [varname], [operator_caption], [operator_symbol], [usevar], [var_objid], [var_name], [decimalvalue], [intvalue], [stringvalue], [listvalue], [datevalue], [pos]) VALUES (N'RCONST-495f956b:17a894cf424:-7277', N'RCOND-495f956b:17a894cf424:-72a6', N'com.rameses.rules.common.CurrentDate.date', N'date', N'CDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition_constraint] ([objid], [parentid], [field_objid], [fieldname], [varname], [operator_caption], [operator_symbol], [usevar], [var_objid], [var_name], [decimalvalue], [intvalue], [stringvalue], [listvalue], [datevalue], [pos]) VALUES (N'RCONST-495f956b:17a894cf424:-7322', N'RCOND-495f956b:17a894cf424:-7358', N'comis.facts.PrevBurialPermitApplication.dtexpiry', N'dtexpiry', N'DTEXPIRY', N'on or before', N'<=', 1, N'RCONST-495f956b:17a894cf424:-7277', N'CDATE', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[sys_rule_condition_constraint] ([objid], [parentid], [field_objid], [fieldname], [varname], [operator_caption], [operator_symbol], [usevar], [var_objid], [var_name], [decimalvalue], [intvalue], [stringvalue], [listvalue], [datevalue], [pos]) VALUES (N'RCONST6020185:178a06ffea4:-7ac7', N'RCOND6020185:178a06ffea4:-7ae6', N'comis.facts.CemeteryResource.resourceid', N'resourceid', NULL, N'is any of the ff.', N'matches', NULL, NULL, NULL, NULL, NULL, NULL, N'[[key:"MAUSOLEUM",value:"MAUSOLEUM"],[key:"NICHE",value:"NICHE"],[key:"TOMB",value:"TOMB"]]', NULL, 0)
INSERT [dbo].[sys_rule_condition_constraint] ([objid], [parentid], [field_objid], [fieldname], [varname], [operator_caption], [operator_symbol], [usevar], [var_objid], [var_name], [decimalvalue], [intvalue], [stringvalue], [listvalue], [datevalue], [pos]) VALUES (N'RCONST72cbefee:17a3bef8ccd:-6514', N'RCOND72cbefee:17a3bef8ccd:-6533', N'comis.facts.CemeteryResource.resourceid', N'resourceid', NULL, N'is any of the ff.', N'matches', NULL, NULL, NULL, NULL, NULL, NULL, N'[[key:"NICHE",value:"NICHE"]]', NULL, 0)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RC-2066edb5:178a07da6d9:-7ffe', N'RC-2066edb5:178a07da6d9:-7ffe', N'RUL6020185:178a06ffea4:-79ff', N'APP', N'comis.facts.BurialPermitApplication', 0)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RC-2066edb5:178a07da6d9:-8000', N'RC-2066edb5:178a07da6d9:-8000', N'RUL6020185:178a06ffea4:-79ff', N'RES', N'comis.facts.CemeteryResource', 1)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RC3d0a727c:17a3beb49e1:-7ff2', N'RC3d0a727c:17a3beb49e1:-7ff2', N'RUL72cbefee:17a3bef8ccd:-6fca', N'APP', N'comis.facts.BurialPermitApplication', 1)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCOND-18956a1e:17a75a2ce82:-7551', N'RCOND-18956a1e:17a75a2ce82:-7551', N'RUL-18956a1e:17a75a2ce82:-7598', N'FEE', N'comis.facts.Fee', 2)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCOND-18956a1e:17a75a2ce82:-76a6', N'RCOND-18956a1e:17a75a2ce82:-76a6', N'RUL-18956a1e:17a75a2ce82:-76ed', N'FEE', N'comis.facts.Fee', 1)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCOND-36ac8fe3:17a8917952b:-7765', N'RCOND-36ac8fe3:17a8917952b:-7765', N'RUL-18956a1e:17a75a2ce82:-76ed', N'APP', N'comis.facts.PrevBurialPermitApplication', 2)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCOND-36ac8fe3:17a8917952b:-7e4e', N'RCOND-36ac8fe3:17a8917952b:-7e4e', N'RUL-18956a1e:17a75a2ce82:-76ed', N'CURRDATE', N'com.rameses.rules.common.CurrentDate', 0)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCOND47c70270:178a108c963:-7c3a', N'RCOND47c70270:178a108c963:-7c3a', N'RUL47c70270:178a108c963:-7d4d', N'APP', N'comis.facts.BurialPermitApplication', 1)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCOND47c70270:178a108c963:-7d1a', N'RCOND47c70270:178a108c963:-7d1a', N'RUL47c70270:178a108c963:-7d4d', N'RES', N'comis.facts.CemeteryResource', 0)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCOND-495f956b:17a894cf424:-72a6', N'RCOND-495f956b:17a894cf424:-72a6', N'RUL-18956a1e:17a75a2ce82:-7598', N'CURRDATE', N'com.rameses.rules.common.CurrentDate', 0)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCOND-495f956b:17a894cf424:-7358', N'RCOND-495f956b:17a894cf424:-7358', N'RUL-18956a1e:17a75a2ce82:-7598', N'APP', N'comis.facts.PrevBurialPermitApplication', 1)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCOND6020185:178a06ffea4:-7ae6', N'RCOND6020185:178a06ffea4:-7ae6', N'RUL6020185:178a06ffea4:-7b65', N'RES', N'comis.facts.CemeteryResource', 1)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCOND6020185:178a06ffea4:-7b30', N'RCOND6020185:178a06ffea4:-7b30', N'RUL6020185:178a06ffea4:-7b65', N'APP', N'comis.facts.BurialPermitApplication', 0)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCOND72cbefee:17a3bef8ccd:-6533', N'RCOND72cbefee:17a3bef8ccd:-6533', N'RUL72cbefee:17a3bef8ccd:-6fca', N'RES', N'comis.facts.CemeteryResource', 1)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCONST-18956a1e:17a75a2ce82:-7517', N'RCOND-18956a1e:17a75a2ce82:-7551', N'RUL-18956a1e:17a75a2ce82:-7598', N'AMOUNT', N'decimal', 0)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCONST-18956a1e:17a75a2ce82:-766c', N'RCOND-18956a1e:17a75a2ce82:-76a6', N'RUL-18956a1e:17a75a2ce82:-76ed', N'AMOUNT', N'decimal', 0)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCONST-36ac8fe3:17a8917952b:-7730', N'RCOND-36ac8fe3:17a8917952b:-7765', N'RUL-18956a1e:17a75a2ce82:-76ed', N'DTEXPIRY', N'date', 0)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCONST-36ac8fe3:17a8917952b:-7d3d', N'RCOND-36ac8fe3:17a8917952b:-7e4e', N'RUL-18956a1e:17a75a2ce82:-76ed', N'CDATE', N'date', 0)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCONST-495f956b:17a894cf424:-7277', N'RCOND-495f956b:17a894cf424:-72a6', N'RUL-18956a1e:17a75a2ce82:-7598', N'CDATE', N'date', 0)
INSERT [dbo].[sys_rule_condition_var] ([objid], [parentid], [ruleid], [varname], [datatype], [pos]) VALUES (N'RCONST-495f956b:17a894cf424:-7322', N'RCOND-495f956b:17a894cf424:-7358', N'RUL-18956a1e:17a75a2ce82:-7598', N'DTEXPIRY', N'date', 0)
INSERT [dbo].[sys_rule_deployed] ([objid], [ruletext]) VALUES (N'RUL-18956a1e:17a75a2ce82:-7598', N'
package burialpermitapplicationbilling.PENALTY;
import burialpermitapplicationbilling.*;
import java.util.*;
import com.rameses.rules.common.*;

global RuleAction action;

rule "PENALTY"
	agenda-group "penalty"
	salience 50000
	no-loop
	when
		
		
		CURRDATE: com.rameses.rules.common.CurrentDate (  CDATE:date ) 
		
		APP: comis.facts.PrevBurialPermitApplication (  DTEXPIRY:dtexpiry <= CDATE ) 
		
		FEE: comis.facts.Fee (  AMOUNT:amount ) 
		
	then
		Map bindings = new HashMap();
		
		bindings.put("CURRDATE", CURRDATE );
		
		bindings.put("AMOUNT", AMOUNT );
		
		bindings.put("CDATE", CDATE );
		
		bindings.put("DTEXPIRY", DTEXPIRY );
		
		bindings.put("APP", APP );
		
		bindings.put("FEE", FEE );
		
	Map _p0 = new HashMap();
_p0.put( "fee", FEE );
_p0.put( "itemaccount", new KeyValue("BPAPEN", "BURIAL PERMIT APPLICATION - PENALTY") );
_p0.put( "expr", (new ActionExpression("AMOUNT * 0.02 *   (@MONTHDIFF( DTEXPIRY, CDATE, 1) + 2)", bindings)) );
action.execute( "calc-penalty",_p0,drools);

end


	')
INSERT [dbo].[sys_rule_deployed] ([objid], [ruletext]) VALUES (N'RUL-18956a1e:17a75a2ce82:-76ed', N'
package burialpermitapplicationbilling.SURCHARGE;
import burialpermitapplicationbilling.*;
import java.util.*;
import com.rameses.rules.common.*;

global RuleAction action;

rule "SURCHARGE"
	agenda-group "surcharge"
	salience 50000
	no-loop
	when
		
		
		CURRDATE: com.rameses.rules.common.CurrentDate (  CDATE:date ) 
		
		FEE: comis.facts.Fee (  AMOUNT:amount ) 
		
		APP: comis.facts.PrevBurialPermitApplication (  DTEXPIRY:dtexpiry <= CDATE ) 
		
	then
		Map bindings = new HashMap();
		
		bindings.put("CURRDATE", CURRDATE );
		
		bindings.put("AMOUNT", AMOUNT );
		
		bindings.put("DTEXPIRY", DTEXPIRY );
		
		bindings.put("CDATE", CDATE );
		
		bindings.put("FEE", FEE );
		
		bindings.put("APP", APP );
		
	Map _p0 = new HashMap();
_p0.put( "fee", FEE );
_p0.put( "itemaccount", new KeyValue("BPASUR", "BURIAL PERMIT APPLICATION - SURCHARGE") );
_p0.put( "expr", (new ActionExpression("AMOUNT * 0.20", bindings)) );
action.execute( "calc-surcharge",_p0,drools);

end


	')
INSERT [dbo].[sys_rule_deployed] ([objid], [ruletext]) VALUES (N'RUL47c70270:178a108c963:-7d4d', N'
package burialpermitapplication.FEE_TOMB;
import burialpermitapplication.*;
import java.util.*;
import com.rameses.rules.common.*;

global RuleAction action;

rule "FEE_TOMB"
	agenda-group "feecomputation"
	salience 50000
	no-loop
	when
		
		
		RES: comis.facts.CemeteryResource (  resourceid matches "TOMB" ) 
		
		APP: comis.facts.BurialPermitApplication (   ) 
		
	then
		Map bindings = new HashMap();
		
		bindings.put("RES", RES );
		
		bindings.put("APP", APP );
		
	Map _p0 = new HashMap();
_p0.put( "application", APP );
_p0.put( "itemaccount", new KeyValue("BPA", "BURIAL PERMIT APPLICATION") );
_p0.put( "expr", (new ActionExpression("3000", bindings)) );
action.execute( "add-fee",_p0,drools);

end


	')
INSERT [dbo].[sys_rule_deployed] ([objid], [ruletext]) VALUES (N'RUL6020185:178a06ffea4:-79ff', N'
package burialpermitapplication.DEFAULT_RENEWABLE_OPTION;
import burialpermitapplication.*;
import java.util.*;
import com.rameses.rules.common.*;

global RuleAction action;

rule "DEFAULT_RENEWABLE_OPTION"
	agenda-group "init"
	salience 50000
	no-loop
	when
		
		
		APP: comis.facts.BurialPermitApplication (   ) 
		
		RES: comis.facts.CemeteryResource (  resourceid matches "MAUSOLEUM|NICHE|TOMB" ) 
		
	then
		Map bindings = new HashMap();
		
		bindings.put("APP", APP );
		
		bindings.put("RES", RES );
		
	Map _p0 = new HashMap();
_p0.put( "application", APP );
_p0.put( "renewable", true );
action.execute( "setrenewable",_p0,drools);

end


	')
INSERT [dbo].[sys_rule_deployed] ([objid], [ruletext]) VALUES (N'RUL6020185:178a06ffea4:-7b65', N'
package burialpermitapplication.DEFAULT_LEASED_DURATION;
import burialpermitapplication.*;
import java.util.*;
import com.rameses.rules.common.*;

global RuleAction action;

rule "DEFAULT_LEASED_DURATION"
	agenda-group "init"
	salience 50000
	no-loop
	when
		
		
		APP: comis.facts.BurialPermitApplication (   ) 
		
		RES: comis.facts.CemeteryResource (  resourceid matches "MAUSOLEUM|NICHE|TOMB" ) 
		
	then
		Map bindings = new HashMap();
		
		bindings.put("APP", APP );
		
		bindings.put("RES", RES );
		
	Map _p0 = new HashMap();
_p0.put( "application", APP );
_p0.put( "expr", (new ActionExpression("7", bindings)) );
action.execute( "compute-lease-duration",_p0,drools);

end


	')
INSERT [dbo].[sys_rule_deployed] ([objid], [ruletext]) VALUES (N'RUL72cbefee:17a3bef8ccd:-6fca', N'
package burialpermitapplication.FEE_NICHE;
import burialpermitapplication.*;
import java.util.*;
import com.rameses.rules.common.*;

global RuleAction action;

rule "FEE_NICHE"
	agenda-group "feecomputation"
	salience 50000
	no-loop
	when
		
		
		APP: comis.facts.BurialPermitApplication (   ) 
		
		RES: comis.facts.CemeteryResource (  resourceid matches "NICHE" ) 
		
	then
		Map bindings = new HashMap();
		
		bindings.put("APP", APP );
		
		bindings.put("RES", RES );
		
	Map _p0 = new HashMap();
_p0.put( "application", APP );
_p0.put( "itemaccount", new KeyValue("BPA", "BURIAL PERMIT APPLICATION") );
_p0.put( "expr", (new ActionExpression("2500", bindings)) );
action.execute( "add-fee",_p0,drools);

end


	')
INSERT [dbo].[sys_rule_fact] ([objid], [name], [title], [factclass], [sortorder], [handler], [defaultvarname], [dynamic], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [dynamicfieldname], [builtinconstraints], [domain], [factsuperclass]) VALUES (N'com.rameses.rules.common.CurrentDate', N'com.rameses.rules.common.CurrentDate', N'Current Date', N'com.rameses.rules.common.CurrentDate', 0, NULL, N'CURRDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SYSTEM', NULL)
INSERT [dbo].[sys_rule_fact] ([objid], [name], [title], [factclass], [sortorder], [handler], [defaultvarname], [dynamic], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [dynamicfieldname], [builtinconstraints], [domain], [factsuperclass]) VALUES (N'comis.facts.BurialPermitApplication', N'comis.facts.BurialPermitApplication', N'Application', N'comis.facts.BurialPermitApplication', 3, NULL, N'APP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'COMIS', NULL)
INSERT [dbo].[sys_rule_fact] ([objid], [name], [title], [factclass], [sortorder], [handler], [defaultvarname], [dynamic], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [dynamicfieldname], [builtinconstraints], [domain], [factsuperclass]) VALUES (N'comis.facts.Cemetery', N'comis.facts.Cemetery', N'Cemetery', N'comis.facts.Cemetery', 1, NULL, N'CEM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'COMIS', NULL)
INSERT [dbo].[sys_rule_fact] ([objid], [name], [title], [factclass], [sortorder], [handler], [defaultvarname], [dynamic], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [dynamicfieldname], [builtinconstraints], [domain], [factsuperclass]) VALUES (N'comis.facts.CemeteryResource', N'comis.facts.CemeteryResource', N'Cemetery Resource', N'comis.facts.CemeteryResource', 1, NULL, N'RES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'COMIS', NULL)
INSERT [dbo].[sys_rule_fact] ([objid], [name], [title], [factclass], [sortorder], [handler], [defaultvarname], [dynamic], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [dynamicfieldname], [builtinconstraints], [domain], [factsuperclass]) VALUES (N'comis.facts.Fee', N'comis.facts.Fee', N'Fee', N'comis.facts.Fee', 20, NULL, N'FEE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'COMIS', NULL)
INSERT [dbo].[sys_rule_fact] ([objid], [name], [title], [factclass], [sortorder], [handler], [defaultvarname], [dynamic], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [dynamicfieldname], [builtinconstraints], [domain], [factsuperclass]) VALUES (N'comis.facts.PrevBurialPermitApplication', N'comis.facts.PrevBurialPermitApplication', N'Previous Application', N'comis.facts.PrevBurialPermitApplication', 25, NULL, N'PREVAPP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'COMIS', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'com.rameses.rules.common.CurrentDate.date', N'com.rameses.rules.common.CurrentDate', N'date', N'Date', N'date', 5, N'date', NULL, NULL, NULL, NULL, NULL, NULL, N'date', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'com.rameses.rules.common.CurrentDate.day', N'com.rameses.rules.common.CurrentDate', N'day', N'Day', N'integer', 4, N'integer', NULL, NULL, NULL, NULL, NULL, NULL, N'integer', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'com.rameses.rules.common.CurrentDate.month', N'com.rameses.rules.common.CurrentDate', N'month', N'Month', N'integer', 3, N'integer', NULL, NULL, NULL, NULL, NULL, NULL, N'integer', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'com.rameses.rules.common.CurrentDate.qtr', N'com.rameses.rules.common.CurrentDate', N'qtr', N'Qtr', N'integer', 2, N'integer', NULL, NULL, NULL, NULL, NULL, NULL, N'integer', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'com.rameses.rules.common.CurrentDate.year', N'com.rameses.rules.common.CurrentDate', N'year', N'Year', N'integer', 1, N'integer', NULL, NULL, NULL, NULL, NULL, NULL, N'integer', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.BurialPermitApplication.applicantid', N'comis.facts.BurialPermitApplication', N'applicantid', N'Applicant', N'string', 4, N'lookup', N'entity:lookup', N'objid', N'name', NULL, NULL, NULL, N'string', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.BurialPermitApplication.apptype', N'comis.facts.BurialPermitApplication', N'apptype', N'App Type', N'string', 1, N'string', N'burialpermitapplication:lookup', N'objid', N'appno', NULL, NULL, NULL, N'string', N'BURIAL_PERMIT_APP_TYPE')
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.BurialPermitApplication.deceasedid', N'comis.facts.BurialPermitApplication', N'deceasedid', N'Deceased', N'string', 5, N'lookup', N'deceased:lookup', N'objid', N'name', NULL, NULL, NULL, N'string', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.BurialPermitApplication.dtapproved', N'comis.facts.BurialPermitApplication', N'dtapproved', N'Date Approved', N'date', 2, N'date', NULL, NULL, NULL, NULL, NULL, NULL, N'date', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.BurialPermitApplication.dtexpiry', N'comis.facts.BurialPermitApplication', N'dtexpiry', N'Expiry Date', N'date', 3, N'date', NULL, NULL, NULL, NULL, NULL, NULL, N'date', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.BurialPermitApplication.leaseduration', N'comis.facts.BurialPermitApplication', N'leaseduration', N'Lease Duration', N'integer', 6, N'integer', NULL, NULL, NULL, NULL, NULL, NULL, N'integer', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.BurialPermitApplication.renewable', N'comis.facts.BurialPermitApplication', N'renewable', N'Is Renewable?', N'boolean', 7, N'boolean', NULL, NULL, NULL, NULL, NULL, NULL, N'boolean', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.Cemetery.objid', N'comis.facts.Cemetery', N'objid', N'CemeteryID', N'string', 1, N'lookup', N'cemetery:lookup', N'objid', N'name', NULL, NULL, NULL, N'string', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.CemeteryResource.areasqm', N'comis.facts.CemeteryResource', N'areasqm', N'Area (sqm)', N'decimal', 3, N'decimal', NULL, NULL, NULL, NULL, NULL, NULL, N'decimal', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.CemeteryResource.objid', N'comis.facts.CemeteryResource', N'objid', N'Id', N'string', 1, N'lookup', N'cemetery_resource:lookup:lookup', N'objid', N'name', NULL, NULL, NULL, N'string', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.CemeteryResource.resourceid', N'comis.facts.CemeteryResource', N'resourceid', N'Resource', N'string', 2, N'lookup', N'resource:lookup', N'objid', N'name', NULL, NULL, NULL, N'string', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.Fee.acctid', N'comis.facts.Fee', N'acctid', N'Account', N'string', 1, N'lookup', N'coms_itemaccount:lookup', N'objid', N'title', NULL, NULL, NULL, N'string', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.Fee.amount', N'comis.facts.Fee', N'amount', N'Amount', N'decimal', 4, N'decimal', NULL, NULL, NULL, NULL, NULL, NULL, N'decimal', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.Fee.penalty', N'comis.facts.Fee', N'penalty', N'Penalty', N'decimal', 6, N'decimal', NULL, NULL, NULL, NULL, NULL, NULL, N'decimal', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.Fee.penaltyacctid', N'comis.facts.Fee', N'penaltyacctid', N'Penalty Acct', N'string', 3, N'lookup', N'comis_itemaccount:lookup', N'objid', N'title', NULL, NULL, NULL, N'string', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.Fee.surcharge', N'comis.facts.Fee', N'surcharge', N'Surcharge', N'decimal', 5, N'decimal', NULL, NULL, NULL, NULL, NULL, NULL, N'decimal', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.Fee.surchargeacctid', N'comis.facts.Fee', N'surchargeacctid', N'Surcharge Acct', N'string', 2, N'lookup', N'comis_itemaccount:lookup', N'objid', N'title', NULL, NULL, NULL, N'string', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.PrevBurialPermitApplication.applicantid', N'comis.facts.PrevBurialPermitApplication', N'applicantid', N'Applicant', N'string', 4, N'lookup', N'entity:lookup', N'objid', N'name', NULL, NULL, NULL, N'string', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.PrevBurialPermitApplication.apptype', N'comis.facts.PrevBurialPermitApplication', N'apptype', N'App Type', N'string', 1, N'string', N'burialpermitapplication:lookup', N'objid', N'appno', NULL, NULL, NULL, N'string', N'BURIAL_PERMIT_APP_TYPE')
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.PrevBurialPermitApplication.deceasedid', N'comis.facts.PrevBurialPermitApplication', N'deceasedid', N'Deceased', N'string', 5, N'lookup', N'deceased:lookup', N'objid', N'name', NULL, NULL, NULL, N'string', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.PrevBurialPermitApplication.dtapproved', N'comis.facts.PrevBurialPermitApplication', N'dtapproved', N'Date Approved', N'date', 2, N'date', NULL, NULL, NULL, NULL, NULL, NULL, N'date', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.PrevBurialPermitApplication.dtexpiry', N'comis.facts.PrevBurialPermitApplication', N'dtexpiry', N'Expiry Date', N'date', 3, N'date', NULL, NULL, NULL, NULL, NULL, NULL, N'date', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.PrevBurialPermitApplication.leaseduration', N'comis.facts.PrevBurialPermitApplication', N'leaseduration', N'Lease Duration', N'integer', 6, N'integer', NULL, NULL, NULL, NULL, NULL, NULL, N'integer', NULL)
INSERT [dbo].[sys_rule_fact_field] ([objid], [parentid], [name], [title], [datatype], [sortorder], [handler], [lookuphandler], [lookupkey], [lookupvalue], [lookupdatatype], [multivalued], [required], [vardatatype], [lovname]) VALUES (N'comis.facts.PrevBurialPermitApplication.renewable', N'comis.facts.PrevBurialPermitApplication', N'renewable', N'Is Renewable?', N'boolean', 7, N'boolean', NULL, NULL, NULL, NULL, NULL, NULL, N'boolean', NULL)
INSERT [dbo].[sys_rulegroup] ([name], [ruleset], [title], [sortorder]) VALUES (N'after-feecomputation', N'burialpermitapplication', N'After Fee Computation', 5)
INSERT [dbo].[sys_rulegroup] ([name], [ruleset], [title], [sortorder]) VALUES (N'after-penalty', N'burialpermitapplicationbilling', N'After Penalty Computation', 7)
INSERT [dbo].[sys_rulegroup] ([name], [ruleset], [title], [sortorder]) VALUES (N'after-surcharge', N'burialpermitapplicationbilling', N'After Surcharge Computation', 4)
INSERT [dbo].[sys_rulegroup] ([name], [ruleset], [title], [sortorder]) VALUES (N'appinfo', N'burialpermitapplication', N'Application Info', 2)
INSERT [dbo].[sys_rulegroup] ([name], [ruleset], [title], [sortorder]) VALUES (N'before-feecomputation', N'burialpermitapplication', N'Before Fee Computation', 3)
INSERT [dbo].[sys_rulegroup] ([name], [ruleset], [title], [sortorder]) VALUES (N'before-penalty', N'burialpermitapplicationbilling', N'Before Penalty Computation', 5)
INSERT [dbo].[sys_rulegroup] ([name], [ruleset], [title], [sortorder]) VALUES (N'before-surcharge', N'burialpermitapplicationbilling', N'Before Surcharge Computation', 2)
INSERT [dbo].[sys_rulegroup] ([name], [ruleset], [title], [sortorder]) VALUES (N'feecomputation', N'burialpermitapplication', N'Fee Computation', 4)
INSERT [dbo].[sys_rulegroup] ([name], [ruleset], [title], [sortorder]) VALUES (N'init', N'burialpermitapplication', N'Init', 1)
INSERT [dbo].[sys_rulegroup] ([name], [ruleset], [title], [sortorder]) VALUES (N'init', N'burialpermitapplicationbilling', N'Initial', 1)
INSERT [dbo].[sys_rulegroup] ([name], [ruleset], [title], [sortorder]) VALUES (N'penalty', N'burialpermitapplicationbilling', N'Penalty Computation', 6)
INSERT [dbo].[sys_rulegroup] ([name], [ruleset], [title], [sortorder]) VALUES (N'surcharge', N'burialpermitapplicationbilling', N'Surcharge Computation', 3)
INSERT [dbo].[sys_ruleset] ([name], [title], [packagename], [domain], [role], [permission]) VALUES (N'burialpermitapplication', N'Burial Permit Application', N'burialpermitapplication', N'COMIS', N'RULE_AUTHOR', NULL)
INSERT [dbo].[sys_ruleset] ([name], [title], [packagename], [domain], [role], [permission]) VALUES (N'burialpermitapplicationbilling', N'Burial Permit Application Billing', N'burialpermitapplicationbillling', N'COMIS', N'RULE_AUTHOR', NULL)
INSERT [dbo].[sys_ruleset_actiondef] ([ruleset], [actiondef]) VALUES (N'burialpermitapplication', N'comis.actions.AddFee')
INSERT [dbo].[sys_ruleset_actiondef] ([ruleset], [actiondef]) VALUES (N'burialpermitapplication', N'comis.actions.CalcPenalty')
INSERT [dbo].[sys_ruleset_actiondef] ([ruleset], [actiondef]) VALUES (N'burialpermitapplicationbilling', N'comis.actions.CalcPenalty')
INSERT [dbo].[sys_ruleset_actiondef] ([ruleset], [actiondef]) VALUES (N'burialpermitapplication', N'comis.actions.CalcSurcharge')
INSERT [dbo].[sys_ruleset_actiondef] ([ruleset], [actiondef]) VALUES (N'burialpermitapplicationbilling', N'comis.actions.CalcSurcharge')
INSERT [dbo].[sys_ruleset_actiondef] ([ruleset], [actiondef]) VALUES (N'burialpermitapplication', N'comis.actions.ComputeLeaseDuration')
INSERT [dbo].[sys_ruleset_actiondef] ([ruleset], [actiondef]) VALUES (N'burialpermitapplication', N'comis.actions.SetRenewable')
INSERT [dbo].[sys_ruleset_fact] ([ruleset], [rulefact]) VALUES (N'burialpermitapplicationbilling', N'com.rameses.rules.common.CurrentDate')
INSERT [dbo].[sys_ruleset_fact] ([ruleset], [rulefact]) VALUES (N'burialpermitapplication', N'comis.facts.BurialPermitApplication')
INSERT [dbo].[sys_ruleset_fact] ([ruleset], [rulefact]) VALUES (N'burialpermitapplicationbilling', N'comis.facts.BurialPermitApplication')
INSERT [dbo].[sys_ruleset_fact] ([ruleset], [rulefact]) VALUES (N'burialpermitapplication', N'comis.facts.Cemetery')
INSERT [dbo].[sys_ruleset_fact] ([ruleset], [rulefact]) VALUES (N'burialpermitapplicationbilling', N'comis.facts.Cemetery')
INSERT [dbo].[sys_ruleset_fact] ([ruleset], [rulefact]) VALUES (N'burialpermitapplication', N'comis.facts.CemeteryResource')
INSERT [dbo].[sys_ruleset_fact] ([ruleset], [rulefact]) VALUES (N'burialpermitapplicationbilling', N'comis.facts.CemeteryResource')
INSERT [dbo].[sys_ruleset_fact] ([ruleset], [rulefact]) VALUES (N'burialpermitapplication', N'comis.facts.Fee')
INSERT [dbo].[sys_ruleset_fact] ([ruleset], [rulefact]) VALUES (N'burialpermitapplicationbilling', N'comis.facts.Fee')
INSERT [dbo].[sys_ruleset_fact] ([ruleset], [rulefact]) VALUES (N'burialpermitapplication', N'comis.facts.PrevBurialPermitApplication')
INSERT [dbo].[sys_ruleset_fact] ([ruleset], [rulefact]) VALUES (N'burialpermitapplicationbilling', N'comis.facts.PrevBurialPermitApplication')
INSERT [dbo].[sys_sequence] ([objid], [nextSeries]) VALUES (N'BURIAL-PERMIT-2021', 5)
INSERT [dbo].[sys_sequence] ([objid], [nextSeries]) VALUES (N'BURIAL-PERMIT-APP-2021', 39)
INSERT [dbo].[sys_sequence] ([objid], [nextSeries]) VALUES (N'BURIAL-PERMIT-APP-TEMP-2021', 8)
INSERT [dbo].[sys_wf] ([name], [title], [domain]) VALUES (N'application', N'Burial Permit Application', N'COMIS')
INSERT [dbo].[sys_wf_node] ([name], [processname], [title], [nodetype], [idx], [salience], [domain], [role], [ui], [properties], [tracktime]) VALUES (N'active', N'application', N'Active', N'state', 6, 0, NULL, N'SYSTEM', N'[type:"state",fillColor:"#c0c0c0",pos:[749,261],size:[98,43]]', N'[:]', 0)
INSERT [dbo].[sys_wf_node] ([name], [processname], [title], [nodetype], [idx], [salience], [domain], [role], [ui], [properties], [tracktime]) VALUES (N'approver', N'application', N'Approval', N'state', 3, 1, N'COMIS', N'APPROVER', N'[type:"state",fillColor:"#c0c0c0",pos:[301,104],size:[101,52]]', N'[:]', 1)
INSERT [dbo].[sys_wf_node] ([name], [processname], [title], [nodetype], [idx], [salience], [domain], [role], [ui], [properties], [tracktime]) VALUES (N'end', N'application', N'Closed', N'end', 9, 0, NULL, NULL, N'[type:"end",fillColor:"#ff0000",pos:[99,261],size:[32,32]]', N'[:]', 0)
INSERT [dbo].[sys_wf_node] ([name], [processname], [title], [nodetype], [idx], [salience], [domain], [role], [ui], [properties], [tracktime]) VALUES (N'expired', N'application', N'Expired', N'state', 7, NULL, NULL, N'SYSTEM', N'[type:"state",fillColor:"#c0c0c0",pos:[515,264],size:[102,46]]', N'[:]', 0)
INSERT [dbo].[sys_wf_node] ([name], [processname], [title], [nodetype], [idx], [salience], [domain], [role], [ui], [properties], [tracktime]) VALUES (N'for-payment', N'application', N'Payment', N'state', 4, 0, NULL, N'SYSTEM', N'[type:"state",fillColor:"#c0c0c0",pos:[510,92],size:[85,67]]', N'[:]', 0)
INSERT [dbo].[sys_wf_node] ([name], [processname], [title], [nodetype], [idx], [salience], [domain], [role], [ui], [properties], [tracktime]) VALUES (N'receiver', N'application', N'Receiving', N'state', 2, 1, N'COMIS', N'RECEIVER', N'[type:"state",fillColor:"#c0c0c0",pos:[135,106],size:[83,46]]', N'[:]', 1)
INSERT [dbo].[sys_wf_node] ([name], [processname], [title], [nodetype], [idx], [salience], [domain], [role], [ui], [properties], [tracktime]) VALUES (N'releaser', N'application', N'Releasing', N'state', 5, 1, N'COMIS', N'RELEASER', N'[type:"state",fillColor:"#c0c0c0",pos:[740,89],size:[119,62]]', N'[:]', 1)
INSERT [dbo].[sys_wf_node] ([name], [processname], [title], [nodetype], [idx], [salience], [domain], [role], [ui], [properties], [tracktime]) VALUES (N'renewed', N'application', N'Renewed', N'state', 8, 0, NULL, N'SYSTEM', N'[type:"state",fillColor:"#c0c0c0",pos:[284,257],size:[107,49]]', N'[:]', 0)
INSERT [dbo].[sys_wf_node] ([name], [processname], [title], [nodetype], [idx], [salience], [domain], [role], [ui], [properties], [tracktime]) VALUES (N'start', N'application', N'Start', N'start', 1, 0, NULL, NULL, N'[type:"start",fillColor:"#00ff00",pos:[49,107],size:[32,32]]', N'[:]', 0)
INSERT [dbo].[sys_wf_transition] ([parentid], [processname], [action], [to], [idx], [eval], [properties], [permission], [caption], [ui]) VALUES (N'active', N'application', N'closed', N'end', 0, NULL, N'[:]', NULL, N'Closed', N'[points:[749,281,476,428,293,427,131,277],type:"arrow",pos:[131,277],size:[618,151]]')
INSERT [dbo].[sys_wf_transition] ([parentid], [processname], [action], [to], [idx], [eval], [properties], [permission], [caption], [ui]) VALUES (N'active', N'application', N'expired', N'expired', 7, NULL, N'[:]', NULL, N'Expired', N'[points:[749,281,617,285],type:"arrow",pos:[617,281],size:[132,4]]')
INSERT [dbo].[sys_wf_transition] ([parentid], [processname], [action], [to], [idx], [eval], [properties], [permission], [caption], [ui]) VALUES (N'approver', N'application', N'approve', N'for-payment', 3, NULL, N'[:]', N'APPROVER', N'Approve', N'[points:[400,127,510,128],type:"arrow",pos:[400,127],size:[110,1]]')
INSERT [dbo].[sys_wf_transition] ([parentid], [processname], [action], [to], [idx], [eval], [properties], [permission], [caption], [ui]) VALUES (N'expired', N'application', N'closed', N'end', 0, NULL, N'[:]', NULL, N'Closed', N'[points:[519,299,353,359,131,283],type:"arrow",pos:[131,283],size:[388,76]]')
INSERT [dbo].[sys_wf_transition] ([parentid], [processname], [action], [to], [idx], [eval], [properties], [permission], [caption], [ui]) VALUES (N'expired', N'application', N'renewed', N'renewed', 8, NULL, N'[:]', NULL, N'Renewed', N'[points:[515,284,391,281],type:"arrow",pos:[391,281],size:[124,3]]')
INSERT [dbo].[sys_wf_transition] ([parentid], [processname], [action], [to], [idx], [eval], [properties], [permission], [caption], [ui]) VALUES (N'for-payment', N'application', N'post-payment', N'releaser', 4, NULL, N'[:]', NULL, N'For Release', N'[points:[595,132,658,92,737,122],type:"arrow",pos:[595,92],size:[142,40]]')
INSERT [dbo].[sys_wf_transition] ([parentid], [processname], [action], [to], [idx], [eval], [properties], [permission], [caption], [ui]) VALUES (N'receiver', N'application', N'submit', N'approver', 2, NULL, N'[:]', NULL, N'Submit for Approval', N'[points:[218,129,301,130],type:"arrow",pos:[218,129],size:[83,1]]')
INSERT [dbo].[sys_wf_transition] ([parentid], [processname], [action], [to], [idx], [eval], [properties], [permission], [caption], [ui]) VALUES (N'releaser', N'application', N'release', N'active', 5, NULL, N'[:]', NULL, N'Release', N'[points:[797,151,797,261],type:"arrow",pos:[797,151],size:[0,110]]')
INSERT [dbo].[sys_wf_transition] ([parentid], [processname], [action], [to], [idx], [eval], [properties], [permission], [caption], [ui]) VALUES (N'releaser', N'application', N'void-payment', N'for-payment', 6, NULL, N'[visibleWhen:"#{false}"]', NULL, N'Void Payment', N'[points:[741,136,671,175,590,148],type:"arrow",pos:[590,136],size:[151,39]]')
INSERT [dbo].[sys_wf_transition] ([parentid], [processname], [action], [to], [idx], [eval], [properties], [permission], [caption], [ui]) VALUES (N'renewed', N'application', N'closed', N'end', 9, NULL, N'[:]', NULL, N'Closed', N'[points:[284,280,131,277],type:"arrow",pos:[131,277],size:[153,3]]')
INSERT [dbo].[sys_wf_transition] ([parentid], [processname], [action], [to], [idx], [eval], [properties], [permission], [caption], [ui]) VALUES (N'start', N'application', N'init', N'receiver', 1, NULL, N'[:]', NULL, N'Init', N'[points:[81,121,135,122],type:"arrow",pos:[81,121],size:[54,1]]')
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_application_permit] ON [dbo].[application]
(
	[permitid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_application_prevapplication] ON [dbo].[application]
(
	[prevappid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_application_relation] ON [dbo].[application]
(
	[relation_objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_appplication_resourceinfo] ON [dbo].[application]
(
	[resourceinfo_objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_applicant_name] ON [dbo].[application]
(
	[applicant_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_apptype] ON [dbo].[application]
(
	[apptype] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ix_appyear] ON [dbo].[application]
(
	[appyear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_deceased_objid] ON [dbo].[application]
(
	[deceased_objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ix_dtexpiry] ON [dbo].[application]
(
	[dtexpiry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_state] ON [dbo].[application]
(
	[state] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_taskid] ON [dbo].[application]
(
	[taskid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_appno] ON [dbo].[application]
(
	[appno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_application_fee_itemaccount] ON [dbo].[application_fee]
(
	[item_objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_parentid] ON [dbo].[application_fee]
(
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_parentid_itemid] ON [dbo].[application_fee]
(
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_assignee_objid] ON [dbo].[application_task]
(
	[assignee_objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_refid] ON [dbo].[application_task]
(
	[refid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_refid] ON [dbo].[attachment]
(
	[refid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_refno] ON [dbo].[attachment]
(
	[refno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_title] ON [dbo].[causeofdeath]
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_state] ON [dbo].[cemetery]
(
	[state] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_code] ON [dbo].[cemetery]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_name] ON [dbo].[cemetery]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_parentid] ON [dbo].[cemetery_section]
(
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_parentid_code] ON [dbo].[cemetery_section]
(
	[parentid] ASC,
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_parentid_name] ON [dbo].[cemetery_section]
(
	[parentid] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_parentid] ON [dbo].[cemetery_section_block]
(
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_parentid_code] ON [dbo].[cemetery_section_block]
(
	[parentid] ASC,
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_parentid_name] ON [dbo].[cemetery_section_block]
(
	[parentid] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_currentappid] ON [dbo].[cemetery_section_block_resource]
(
	[currentappid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_parentid] ON [dbo].[cemetery_section_block_resource]
(
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_code] ON [dbo].[cemetery_section_block_resource]
(
	[parentid] ASC,
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_currentinfoid] ON [dbo].[cemetery_section_block_resource]
(
	[currentinfoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_name] ON [dbo].[cemetery_section_block_resource]
(
	[parentid] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_parentid_resourcetypeid_code] ON [dbo].[cemetery_section_block_resource]
(
	[parentid] ASC,
	[currentappid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_cemetery_section_block_resource_info_resourceid] ON [dbo].[cemetery_section_block_resource_info]
(
	[resource_objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_code] ON [dbo].[cemetery_section_block_resource_info]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_name] ON [dbo].[cemetery_section_block_resource_info]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_parentid] ON [dbo].[cemetery_section_block_resource_info]
(
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_parentid_code] ON [dbo].[cemetery_section_block_resource_info]
(
	[parentid] ASC,
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_parentid_name] ON [dbo].[cemetery_section_block_resource_info]
(
	[parentid] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_deceased_causeofdeath] ON [dbo].[deceased]
(
	[causeofdeath_objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ix_dtdied] ON [dbo].[deceased]
(
	[dtdied] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_lgu] ON [dbo].[deceased]
(
	[lgu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_name] ON [dbo].[deceased]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_placeofburial] ON [dbo].[deceased]
(
	[placeofburial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_placeofdeath] ON [dbo].[deceased]
(
	[placeofdeath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_refid] ON [dbo].[note]
(
	[refid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_refid_idx] ON [dbo].[note]
(
	[refid] ASC,
	[idx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_payment_application] ON [dbo].[payment]
(
	[appid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_refid] ON [dbo].[payment]
(
	[refid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_refno] ON [dbo].[payment]
(
	[refno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_payment_item_itemaccount] ON [dbo].[payment_item]
(
	[acct_objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_payment_item_payment] ON [dbo].[payment_item]
(
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_permit_application] ON [dbo].[permit]
(
	[appid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_permit_payment] ON [dbo].[permit]
(
	[paymentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_state] ON [dbo].[resource]
(
	[state] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_code] ON [dbo].[resource]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_name] ON [dbo].[resource]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_createdby_objid] ON [dbo].[sys_file]
(
	[createdby_objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ix_dtcreated] ON [dbo].[sys_file]
(
	[dtcreated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_keywords] ON [dbo].[sys_file]
(
	[keywords] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_title] ON [dbo].[sys_file]
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_filelocid] ON [dbo].[sys_fileitem]
(
	[filelocid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_parentid] ON [dbo].[sys_fileitem]
(
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_loctype] ON [dbo].[sys_fileloc]
(
	[loctype] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_sys_role_permission_role] ON [dbo].[sys_role_permission]
(
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [rulegroup] ON [dbo].[sys_rule]
(
	[rulegroup] ASC,
	[ruleset] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ruleset] ON [dbo].[sys_rule]
(
	[ruleset] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [parentid] ON [dbo].[sys_rule_action]
(
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [sys_rule_action_actiondef] ON [dbo].[sys_rule_action]
(
	[actiondef_objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_sys_rule_action_param_objkey] ON [dbo].[sys_rule_action_param]
(
	[obj_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [parentid] ON [dbo].[sys_rule_action_param]
(
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [sys_rule_action_param_actiondefparam] ON [dbo].[sys_rule_action_param]
(
	[actiondefparam_objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [var_objid] ON [dbo].[sys_rule_action_param]
(
	[var_objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [parentid] ON [dbo].[sys_rule_actiondef_param]
(
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fact_objid] ON [dbo].[sys_rule_condition]
(
	[fact_objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [parentid] ON [dbo].[sys_rule_condition]
(
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [parentid] ON [dbo].[sys_rule_condition_constraint]
(
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [sys_rule_condition_constraint_fact_field] ON [dbo].[sys_rule_condition_constraint]
(
	[field_objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [var_objid] ON [dbo].[sys_rule_condition_constraint]
(
	[var_objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [parentid] ON [dbo].[sys_rule_condition_var]
(
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [parentid] ON [dbo].[sys_rule_fact_field]
(
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ruleset] ON [dbo].[sys_rulegroup]
(
	[ruleset] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [actiondef] ON [dbo].[sys_ruleset_actiondef]
(
	[actiondef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [rulefact] ON [dbo].[sys_ruleset_fact]
(
	[rulefact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_lastname_firstname] ON [dbo].[sys_user]
(
	[lastname] ASC,
	[firstname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [ix_name] ON [dbo].[sys_user]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [uix_username] ON [dbo].[sys_user]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_sys_user_role_role] ON [dbo].[sys_user_role]
(
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_sys_user_role_userid] ON [dbo].[sys_user_role]
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [uix_sys_user_role_uid] ON [dbo].[sys_user_role]
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_sys_wf_node_role] ON [dbo].[sys_wf_node]
(
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_syw_wf_node_processname] ON [dbo].[sys_wf_node]
(
	[processname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [name] ON [dbo].[sys_wf_node]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [fk_sys_wf_transition_processname_parentid] ON [dbo].[sys_wf_transition]
(
	[processname] ASC,
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[application]  WITH CHECK ADD FOREIGN KEY([deceased_objid])
REFERENCES [dbo].[deceased] ([objid])
GO
ALTER TABLE [dbo].[application]  WITH CHECK ADD FOREIGN KEY([permitid])
REFERENCES [dbo].[permit] ([objid])
GO
ALTER TABLE [dbo].[application]  WITH CHECK ADD FOREIGN KEY([prevappid])
REFERENCES [dbo].[application] ([objid])
GO
ALTER TABLE [dbo].[application]  WITH CHECK ADD FOREIGN KEY([relation_objid])
REFERENCES [dbo].[relation] ([objid])
GO
ALTER TABLE [dbo].[application]  WITH CHECK ADD FOREIGN KEY([resourceinfo_objid])
REFERENCES [dbo].[cemetery_section_block_resource_info] ([objid])
GO
ALTER TABLE [dbo].[application_fee]  WITH CHECK ADD FOREIGN KEY([item_objid])
REFERENCES [dbo].[itemaccount] ([objid])
GO
ALTER TABLE [dbo].[application_fee]  WITH CHECK ADD FOREIGN KEY([parentid])
REFERENCES [dbo].[application] ([objid])
GO
ALTER TABLE [dbo].[application_task]  WITH CHECK ADD FOREIGN KEY([refid])
REFERENCES [dbo].[application] ([objid])
GO
ALTER TABLE [dbo].[cemetery_section]  WITH CHECK ADD FOREIGN KEY([parentid])
REFERENCES [dbo].[cemetery] ([objid])
GO
ALTER TABLE [dbo].[cemetery_section_block]  WITH CHECK ADD FOREIGN KEY([parentid])
REFERENCES [dbo].[cemetery_section] ([objid])
GO
ALTER TABLE [dbo].[cemetery_section_block_resource]  WITH CHECK ADD FOREIGN KEY([currentappid])
REFERENCES [dbo].[application] ([objid])
GO
ALTER TABLE [dbo].[cemetery_section_block_resource]  WITH CHECK ADD FOREIGN KEY([currentinfoid])
REFERENCES [dbo].[cemetery_section_block_resource_info] ([objid])
GO
ALTER TABLE [dbo].[cemetery_section_block_resource]  WITH CHECK ADD FOREIGN KEY([parentid])
REFERENCES [dbo].[cemetery_section_block] ([objid])
GO
ALTER TABLE [dbo].[cemetery_section_block_resource_info]  WITH CHECK ADD FOREIGN KEY([parentid])
REFERENCES [dbo].[cemetery_section_block_resource] ([objid])
GO
ALTER TABLE [dbo].[cemetery_section_block_resource_info]  WITH CHECK ADD FOREIGN KEY([resource_objid])
REFERENCES [dbo].[resource] ([objid])
GO
ALTER TABLE [dbo].[deceased]  WITH CHECK ADD FOREIGN KEY([causeofdeath_objid])
REFERENCES [dbo].[causeofdeath] ([objid])
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD FOREIGN KEY([appid])
REFERENCES [dbo].[application] ([objid])
GO
ALTER TABLE [dbo].[payment_item]  WITH CHECK ADD FOREIGN KEY([acct_objid])
REFERENCES [dbo].[itemaccount] ([objid])
GO
ALTER TABLE [dbo].[payment_item]  WITH CHECK ADD FOREIGN KEY([parentid])
REFERENCES [dbo].[payment] ([objid])
GO
ALTER TABLE [dbo].[permit]  WITH CHECK ADD FOREIGN KEY([appid])
REFERENCES [dbo].[application] ([objid])
GO
ALTER TABLE [dbo].[permit]  WITH CHECK ADD FOREIGN KEY([paymentid])
REFERENCES [dbo].[payment] ([objid])
GO
ALTER TABLE [dbo].[sys_fileitem]  WITH CHECK ADD FOREIGN KEY([parentid])
REFERENCES [dbo].[sys_file] ([objid])
GO
ALTER TABLE [dbo].[sys_role_permission]  WITH CHECK ADD FOREIGN KEY([role])
REFERENCES [dbo].[sys_role] ([name])
GO
ALTER TABLE [dbo].[sys_rule]  WITH CHECK ADD FOREIGN KEY([rulegroup], [ruleset])
REFERENCES [dbo].[sys_rulegroup] ([name], [ruleset])
GO
ALTER TABLE [dbo].[sys_rule]  WITH CHECK ADD FOREIGN KEY([ruleset])
REFERENCES [dbo].[sys_ruleset] ([name])
GO
ALTER TABLE [dbo].[sys_rule_action]  WITH CHECK ADD FOREIGN KEY([actiondef_objid])
REFERENCES [dbo].[sys_rule_actiondef] ([objid])
GO
ALTER TABLE [dbo].[sys_rule_action]  WITH CHECK ADD FOREIGN KEY([parentid])
REFERENCES [dbo].[sys_rule] ([objid])
GO
ALTER TABLE [dbo].[sys_rule_action_param]  WITH CHECK ADD FOREIGN KEY([actiondefparam_objid])
REFERENCES [dbo].[sys_rule_actiondef_param] ([objid])
GO
ALTER TABLE [dbo].[sys_rule_action_param]  WITH CHECK ADD FOREIGN KEY([obj_key])
REFERENCES [dbo].[itemaccount] ([objid])
GO
ALTER TABLE [dbo].[sys_rule_action_param]  WITH CHECK ADD FOREIGN KEY([parentid])
REFERENCES [dbo].[sys_rule_action] ([objid])
GO
ALTER TABLE [dbo].[sys_rule_action_param]  WITH CHECK ADD FOREIGN KEY([var_objid])
REFERENCES [dbo].[sys_rule_condition_var] ([objid])
GO
ALTER TABLE [dbo].[sys_rule_actiondef_param]  WITH CHECK ADD FOREIGN KEY([parentid])
REFERENCES [dbo].[sys_rule_actiondef] ([objid])
GO
ALTER TABLE [dbo].[sys_rule_condition]  WITH CHECK ADD FOREIGN KEY([fact_objid])
REFERENCES [dbo].[sys_rule_fact] ([objid])
GO
ALTER TABLE [dbo].[sys_rule_condition]  WITH CHECK ADD FOREIGN KEY([fact_objid])
REFERENCES [dbo].[sys_rule_fact] ([objid])
GO
ALTER TABLE [dbo].[sys_rule_condition]  WITH CHECK ADD FOREIGN KEY([parentid])
REFERENCES [dbo].[sys_rule] ([objid])
GO
ALTER TABLE [dbo].[sys_rule_condition_constraint]  WITH CHECK ADD FOREIGN KEY([field_objid])
REFERENCES [dbo].[sys_rule_fact_field] ([objid])
GO
ALTER TABLE [dbo].[sys_rule_condition_constraint]  WITH CHECK ADD FOREIGN KEY([parentid])
REFERENCES [dbo].[sys_rule_condition] ([objid])
GO
ALTER TABLE [dbo].[sys_rule_condition_constraint]  WITH CHECK ADD FOREIGN KEY([var_objid])
REFERENCES [dbo].[sys_rule_condition_var] ([objid])
GO
ALTER TABLE [dbo].[sys_rule_condition_var]  WITH CHECK ADD FOREIGN KEY([parentid])
REFERENCES [dbo].[sys_rule_condition] ([objid])
GO
ALTER TABLE [dbo].[sys_rule_deployed]  WITH CHECK ADD FOREIGN KEY([objid])
REFERENCES [dbo].[sys_rule] ([objid])
GO
ALTER TABLE [dbo].[sys_rule_fact_field]  WITH CHECK ADD FOREIGN KEY([parentid])
REFERENCES [dbo].[sys_rule_fact] ([objid])
GO
ALTER TABLE [dbo].[sys_rulegroup]  WITH CHECK ADD FOREIGN KEY([ruleset])
REFERENCES [dbo].[sys_ruleset] ([name])
GO
ALTER TABLE [dbo].[sys_ruleset_actiondef]  WITH CHECK ADD FOREIGN KEY([actiondef])
REFERENCES [dbo].[sys_rule_actiondef] ([objid])
GO
ALTER TABLE [dbo].[sys_ruleset_actiondef]  WITH CHECK ADD FOREIGN KEY([ruleset])
REFERENCES [dbo].[sys_ruleset] ([name])
GO
ALTER TABLE [dbo].[sys_ruleset_fact]  WITH CHECK ADD FOREIGN KEY([rulefact])
REFERENCES [dbo].[sys_rule_fact] ([objid])
GO
ALTER TABLE [dbo].[sys_ruleset_fact]  WITH CHECK ADD FOREIGN KEY([ruleset])
REFERENCES [dbo].[sys_ruleset] ([name])
GO
ALTER TABLE [dbo].[sys_user_role]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[sys_user] ([objid])
GO
ALTER TABLE [dbo].[sys_user_role]  WITH CHECK ADD FOREIGN KEY([role])
REFERENCES [dbo].[sys_role] ([name])
GO
ALTER TABLE [dbo].[sys_wf_node]  WITH CHECK ADD FOREIGN KEY([processname])
REFERENCES [dbo].[sys_wf] ([name])
GO
ALTER TABLE [dbo].[sys_wf_node]  WITH CHECK ADD FOREIGN KEY([role])
REFERENCES [dbo].[sys_role] ([name])
GO
ALTER DATABASE [comis] SET  READ_WRITE 
GO
