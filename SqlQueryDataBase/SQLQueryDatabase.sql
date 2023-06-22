CREATE DATABASE [webappLibraryDB_v2]
GO

USE [webappLibraryDB_v2]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[admin_login_tbl] (
    [username]  NVARCHAR (50) NOT NULL,
    [password]  NVARCHAR (50) NULL,
    [full_name] NVARCHAR (50) NULL
);


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[book_issue_tbl] (
    [transaction_id] INT            IDENTITY (1, 1) NOT NULL,
    [member_id]      NVARCHAR (50)  NULL,
    [member_name]    NVARCHAR (50)  NULL,
    [book_id]        NCHAR (10)     NULL,
    [book_name]      NVARCHAR (MAX) NULL,
    [issue_date]     NVARCHAR (50)  NULL,
    [due_date]       NVARCHAR (50)  NULL,
    [status]         NVARCHAR (50)  NULL
);


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[book_master_tbl] (
    [book_id]          INT            IDENTITY (1, 1) NOT NULL,
    [book_name]        NVARCHAR (MAX) NULL,
    [genre]            NVARCHAR (50)  NULL,
    [author_name]      NVARCHAR (50)  NULL,
    [publisher_name]   NVARCHAR (50)  NULL,
    [publish_date]     NVARCHAR (50)  NULL,
    [language]         NVARCHAR (50)  NULL,
    [edition]          NVARCHAR (MAX) NULL,
    [no_of_pages]      NCHAR (10)     NULL,
    [book_description] NVARCHAR (MAX) NULL,
    [actual_stock]     NCHAR (10)     NULL,
    [current_stock]    NCHAR (10)     NULL,
    [book_img_link]    NVARCHAR (MAX) NULL
);


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[member_master_tbl] (
    [member_id]      INT            IDENTITY (1, 1) NOT NULL,
    [password]       NVARCHAR (50)  NOT NULL,
    [full_name]      NVARCHAR (50)  NULL,
    [birthdate]      NVARCHAR (50)  NULL,
    [contact_no]     NVARCHAR (50)  NULL,
    [email]          NVARCHAR (50)  NOT NULL,
    [state]          NVARCHAR (50)  NULL,
    [city]           NVARCHAR (50)  NULL,
    [pincode]        NVARCHAR (50)  NULL,
    [full_address]   NVARCHAR (MAX) NULL,
    [account_status] NVARCHAR (50)  NULL
);


