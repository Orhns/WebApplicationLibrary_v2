USE [master]
GO
/****** Object:  Database [webappLibraryDB_v2]    Script Date: 23.06.2023 14:24:09 ******/
CREATE DATABASE [webappLibraryDB_v2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'webappLibraryDB_v2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\webappLibraryDB_v2\webappLibraryDB_v2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'webappLibraryDB_v2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\webappLibraryDB_v2\webappLibraryDB_v2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [webappLibraryDB_v2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [webappLibraryDB_v2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [webappLibraryDB_v2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET ARITHABORT OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [webappLibraryDB_v2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [webappLibraryDB_v2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [webappLibraryDB_v2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [webappLibraryDB_v2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [webappLibraryDB_v2] SET  MULTI_USER 
GO
ALTER DATABASE [webappLibraryDB_v2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [webappLibraryDB_v2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [webappLibraryDB_v2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [webappLibraryDB_v2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [webappLibraryDB_v2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'webappLibraryDB_v2', N'ON'
GO
ALTER DATABASE [webappLibraryDB_v2] SET QUERY_STORE = OFF
GO
USE [webappLibraryDB_v2]
GO
/****** Object:  Table [dbo].[admin_login_tbl]    Script Date: 23.06.2023 14:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_login_tbl](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[full_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_issue_tbl]    Script Date: 23.06.2023 14:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_issue_tbl](
	[transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[member_id] [nvarchar](50) NULL,
	[member_name] [nvarchar](50) NULL,
	[book_id] [nchar](10) NULL,
	[book_name] [nvarchar](max) NULL,
	[issue_date] [nvarchar](50) NULL,
	[due_date] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_master_tbl]    Script Date: 23.06.2023 14:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_master_tbl](
	[book_id] [int] IDENTITY(1,1) NOT NULL,
	[book_name] [nvarchar](max) NULL,
	[genre] [nvarchar](50) NULL,
	[author_name] [nvarchar](50) NULL,
	[publisher_name] [nvarchar](50) NULL,
	[publish_date] [nvarchar](50) NULL,
	[language] [nvarchar](50) NULL,
	[edition] [nvarchar](max) NULL,
	[no_of_pages] [nchar](10) NULL,
	[book_description] [nvarchar](max) NULL,
	[actual_stock] [nchar](10) NULL,
	[current_stock] [nchar](10) NULL,
	[book_img_link] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[member_master_tbl]    Script Date: 23.06.2023 14:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member_master_tbl](
	[member_id] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[full_name] [nvarchar](50) NULL,
	[birthdate] [nvarchar](50) NULL,
	[contact_no] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[state] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[pincode] [nvarchar](50) NULL,
	[full_address] [nvarchar](max) NULL,
	[account_status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[admin_login_tbl] ([username], [password], [full_name]) VALUES (N'admin', N'admin', NULL)
SET IDENTITY_INSERT [dbo].[book_issue_tbl] ON 

INSERT [dbo].[book_issue_tbl] ([transaction_id], [member_id], [member_name], [book_id], [book_name], [issue_date], [due_date], [status]) VALUES (2, N'2', N'emre yılmaz', N'1         ', N'Yüzüklerin Efendisi 1: Yüzük Kardeşliği', N'6/20/2023 6:28:58 PM', N'6/4/2023 6:28:58 PM', N'Returned')
INSERT [dbo].[book_issue_tbl] ([transaction_id], [member_id], [member_name], [book_id], [book_name], [issue_date], [due_date], [status]) VALUES (3, N'2', N'emre yılmaz', N'7         ', N'Bülbülü Öldürmek', N'6/20/2023 6:29:04 PM', N'7/4/2023 6:29:04 PM', N'Returned')
INSERT [dbo].[book_issue_tbl] ([transaction_id], [member_id], [member_name], [book_id], [book_name], [issue_date], [due_date], [status]) VALUES (4, N'1', N'Orhun Kırkağaçlıoğlu', N'9         ', N'1984', N'6/20/2023 6:29:20 PM', N'6/4/2023 6:29:20 PM', N'Not Returned')
INSERT [dbo].[book_issue_tbl] ([transaction_id], [member_id], [member_name], [book_id], [book_name], [issue_date], [due_date], [status]) VALUES (5, N'1', N'Orhun Kırkağaçlıoğlu', N'9         ', N'1984', N'6/20/2023 7:00:09 PM', N'7/4/2023 7:00:09 PM', N'Returned')
INSERT [dbo].[book_issue_tbl] ([transaction_id], [member_id], [member_name], [book_id], [book_name], [issue_date], [due_date], [status]) VALUES (6, N'1', N'Orhun Kırkağaçlıoğlu', N'1         ', N'Yüzüklerin Efendisi 1: Yüzük Kardeşliği', N'6/20/2023 9:01:24 PM', N'7/4/2023 9:01:24 PM', N'Returned')
INSERT [dbo].[book_issue_tbl] ([transaction_id], [member_id], [member_name], [book_id], [book_name], [issue_date], [due_date], [status]) VALUES (7, N'1', N'Orhun Kırkağaçlıoğlu', N'7         ', N'Bülbülü Öldürmek', N'6/20/2023 9:01:29 PM', N'7/4/2023 9:01:29 PM', N'Not Returned')
INSERT [dbo].[book_issue_tbl] ([transaction_id], [member_id], [member_name], [book_id], [book_name], [issue_date], [due_date], [status]) VALUES (8, N'2', N'emre yılmaz', N'7         ', N'Bülbülü Öldürmek', N'6/20/2023 9:01:44 PM', N'7/4/2023 9:01:44 PM', N'Not Returned')
INSERT [dbo].[book_issue_tbl] ([transaction_id], [member_id], [member_name], [book_id], [book_name], [issue_date], [due_date], [status]) VALUES (9, N'2', N'emre yılmaz', N'9         ', N'1984', N'6/20/2023 9:01:53 PM', N'7/4/2023 9:01:53 PM', N'Not Returned')
INSERT [dbo].[book_issue_tbl] ([transaction_id], [member_id], [member_name], [book_id], [book_name], [issue_date], [due_date], [status]) VALUES (10, N'2', N'emre yılmaz', N'8         ', N'Fareler ve İnsanlar', N'6/21/2023 10:56:14 AM', N'7/5/2023 10:56:14 AM', N'Returned')
INSERT [dbo].[book_issue_tbl] ([transaction_id], [member_id], [member_name], [book_id], [book_name], [issue_date], [due_date], [status]) VALUES (11, N'2', N'emre yılmaz', N'9         ', N'1984', N'6/21/2023 10:56:22 AM', N'7/5/2023 10:56:22 AM', N'Not Returned')
INSERT [dbo].[book_issue_tbl] ([transaction_id], [member_id], [member_name], [book_id], [book_name], [issue_date], [due_date], [status]) VALUES (12, N'2', N'emre yılmaz', N'9         ', N'1984', N'6/21/2023 11:14:41 PM', N'7/5/2023 11:14:41 PM', N'Not Returned')
INSERT [dbo].[book_issue_tbl] ([transaction_id], [member_id], [member_name], [book_id], [book_name], [issue_date], [due_date], [status]) VALUES (13, N'1', N'Orhun Kırkağaçlıoğlu', N'1         ', N'Yüzüklerin Efendisi 1: Yüzük Kardeşliği', N'6/22/2023 10:23:30 AM', N'7/6/2023 10:23:30 AM', N'Not Returned')
INSERT [dbo].[book_issue_tbl] ([transaction_id], [member_id], [member_name], [book_id], [book_name], [issue_date], [due_date], [status]) VALUES (14, N'2', N'emre yılmaz', N'7         ', N'Bülbülü Öldürmek', N'6/22/2023 10:38:28 AM', N'7/6/2023 10:38:28 AM', N'Not Returned')
INSERT [dbo].[book_issue_tbl] ([transaction_id], [member_id], [member_name], [book_id], [book_name], [issue_date], [due_date], [status]) VALUES (15, N'1', N'Orhun Kırkağaçlıoğlu', N'7         ', N'Bülbülü Öldürmek', N'6/22/2023 7:36:26 PM', N'7/6/2023 7:36:26 PM', N'Not Returned')
SET IDENTITY_INSERT [dbo].[book_issue_tbl] OFF
SET IDENTITY_INSERT [dbo].[book_master_tbl] ON 

INSERT [dbo].[book_master_tbl] ([book_id], [book_name], [genre], [author_name], [publisher_name], [publish_date], [language], [edition], [no_of_pages], [book_description], [actual_stock], [current_stock], [book_img_link]) VALUES (1, N'Yüzüklerin Efendisi 1: Yüzük Kardeşliği', N'Action,Adventure,Science Fiction', N'J.R.R. Tolkien', N'Metis Yayıncılık', N'2016-01-06', N'Türkçe', N'8', N'496       ', N'''Yüzüklerin Efendisi'' son yüzyılın en çok okunan yüz kitabı arasında en başta geliyor; bilimkurgu, fantezi, polisiye, best-seller ya da ana akım demeden, tüm edebiyat türleri arasında tartışmasız bir önderliğe sahip. Bir açıdan bakarsanız bir fantezi romanı, başka bir açıdan baktığınızda, insanlık durumu, sorumluluk, iktidar ve savaş üzerine bir roman. Bir yolculuk, bir büyüme öyküsü; fedakarlık ve dostluk üzerine, hırs ve ihanet üzerine bir roman.', N'10        ', N'10        ', N'~/book_inventory/Yüzüklerin efendisi.png')
INSERT [dbo].[book_master_tbl] ([book_id], [book_name], [genre], [author_name], [publisher_name], [publish_date], [language], [edition], [no_of_pages], [book_description], [actual_stock], [current_stock], [book_img_link]) VALUES (7, N'Bülbülü Öldürmek', N'Classics', N'Harper Lee', N'Epsilon Yayınları', N'2020-03-03', N'Türkçe', N'1', N'360       ', N'Tüm zamanların en sevilen hikayelerinden biri olan, kırktan fazla dile çevrilen, Oscar ödüllü bir sinema filmi için temel oluşturan ve yirminci yüzyılın en iyi romanlardan biri seçilen Pulitzer ödüllü Bülbülü Öldürmek, Amerika''nın acımasız bir önyargı ile zehirlenmiş güneyinde geçen, sürükleyici, yürek burkan ve dikkat çekici bir büyüme hikayesi. Büyüleyici güzellikler ve vahşi eşitsizlikler dünyasında haksız yere korkunç bir suçla suçlanan bir "zenci"yi savunmak için her şeyi riske atan bir adamın hikayesi çocuk kahramanın gözünden anlatılıyor.', N'20        ', N'16        ', N'~/book_inventory/Bülbülü Öldürmek.png')
INSERT [dbo].[book_master_tbl] ([book_id], [book_name], [genre], [author_name], [publisher_name], [publish_date], [language], [edition], [no_of_pages], [book_description], [actual_stock], [current_stock], [book_img_link]) VALUES (8, N'Fareler ve İnsanlar', N'Classics', N'John Steinbeck', N'Sel Yayıncılık', N'2012-09-05', N'English', N'21', N'126       ', N'Fareler ve İnsanlar, birbirine zıt karakterdeki iki mevsimlik tarım işçisinin, zeki George Milton ve onun güçlü kuvvetli ama akli dengesi bozuk yoldaşı Lennie Small''un öyküsünü anlatır. Küçük bir toprak satın alıp insanca bir hayat yaşamanın hayalini kuran bu ikilinin öyküsünde dostluk ve dayanışma duygusu önemli bir yer tutar. Steinbeck insanın insanla ilişkisini anlatmakla kalmaz insanın doğayla ve toplumla kurduğu ilişkileri de konu eder bu destansı romanında. Kitabın ismine ilham veren Robert Burns şiirindeki gibi; "En iyi planları farelerin ve insanların / Sıkça ters gider..."', N'50        ', N'50        ', N'~/book_inventory/Fareler ve insanlar.png')
INSERT [dbo].[book_master_tbl] ([book_id], [book_name], [genre], [author_name], [publisher_name], [publish_date], [language], [edition], [no_of_pages], [book_description], [actual_stock], [current_stock], [book_img_link]) VALUES (9, N'1984', N'Classics', N'George Orwell', N'Can Yayınları', N'2016-11-17', N'Türkçe', N'73', N'352       ', N'George Orwell''in kült kitabı Bin Dokuz Yüz Seksen Dört, yazarın geleceğe ilişkin bir kabus senaryosudur. Bireyselliğin yok edildiği, zihnin kontrol altına alındığı, insanların makineleşmiş kitlelere dönüştürüldüğü totaliter bir dünya düzeni, romanda inanılmaz bir hayal gücüyle, en ince ayrıntısına kadar kurgulanmıştır. Geçmişte ve günümüzde dünya sahnesinde tezgahlanan oyunlar düşünüldüğünde, ütopik olduğu kadar gerçekçi bir romandır Bin Dokuz Yüz Seksen Dört. Güncelliğini hiçbir zaman yitirmeyen bir başyapıttır; yalnızca yarına değil, bugüne de ilişkin bir uyarı çığlığıdır.', N'50        ', N'48        ', N'~/book_inventory/1984.png')
SET IDENTITY_INSERT [dbo].[book_master_tbl] OFF
SET IDENTITY_INSERT [dbo].[member_master_tbl] ON 

INSERT [dbo].[member_master_tbl] ([member_id], [password], [full_name], [birthdate], [contact_no], [email], [state], [city], [pincode], [full_address], [account_status]) VALUES (1, N'12345', N'Orhun Kırkağaçlıoğlu', N'', N'5393399626', N'm40agac@gmail.com', N'Turkey', N'Istanbul', N'34900', N'Tuzla/IST', NULL)
INSERT [dbo].[member_master_tbl] ([member_id], [password], [full_name], [birthdate], [contact_no], [email], [state], [city], [pincode], [full_address], [account_status]) VALUES (2, N'123', N'emre yılmaz', N'', N'11111111', N'eyilmaz@gmail.com', N'Greece', N'Athens', N'9999', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', NULL)
SET IDENTITY_INSERT [dbo].[member_master_tbl] OFF
USE [master]
GO
ALTER DATABASE [webappLibraryDB_v2] SET  READ_WRITE 
GO
