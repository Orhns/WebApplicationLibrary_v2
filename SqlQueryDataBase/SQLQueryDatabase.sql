USE [master]
GO
/****** Object:  Database [webappLibraryDB]    Script Date: 7.06.2023 09:41:15 ******/
CREATE DATABASE [webappLibraryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'webappLibraryDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\webappLibraryDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'webappLibraryDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\webappLibraryDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [webappLibraryDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [webappLibraryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [webappLibraryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [webappLibraryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [webappLibraryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [webappLibraryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [webappLibraryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [webappLibraryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [webappLibraryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [webappLibraryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [webappLibraryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [webappLibraryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [webappLibraryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [webappLibraryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [webappLibraryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [webappLibraryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [webappLibraryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [webappLibraryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [webappLibraryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [webappLibraryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [webappLibraryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [webappLibraryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [webappLibraryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [webappLibraryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [webappLibraryDB] SET RECOVERY FULL 
GO
ALTER DATABASE [webappLibraryDB] SET  MULTI_USER 
GO
ALTER DATABASE [webappLibraryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [webappLibraryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [webappLibraryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [webappLibraryDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [webappLibraryDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'webappLibraryDB', N'ON'
GO
ALTER DATABASE [webappLibraryDB] SET QUERY_STORE = OFF
GO
USE [webappLibraryDB]
GO
/****** Object:  Table [dbo].[admin_login_tbl]    Script Date: 7.06.2023 09:41:21 ******/
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
/****** Object:  Table [dbo].[author_master_tbl]    Script Date: 7.06.2023 09:41:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[author_master_tbl](
	[author_id] [nchar](10) NOT NULL,
	[author_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_issue_tbl]    Script Date: 7.06.2023 09:41:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_issue_tbl](
	[member_id] [nvarchar](50) NULL,
	[member_name] [nvarchar](50) NULL,
	[book_id] [nchar](10) NULL,
	[book_name] [nvarchar](max) NULL,
	[issue_date] [nvarchar](50) NULL,
	[due_date] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_master_tbl]    Script Date: 7.06.2023 09:41:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_master_tbl](
	[book_id] [nchar](10) NOT NULL,
	[book_name] [nvarchar](max) NULL,
	[genre] [nvarchar](50) NULL,
	[author_name] [nvarchar](50) NULL,
	[publisher_name] [nvarchar](50) NULL,
	[publish_date] [nvarchar](50) NULL,
	[language] [nvarchar](50) NULL,
	[edition] [nvarchar](max) NULL,
	[book_cost] [nchar](10) NULL,
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
/****** Object:  Table [dbo].[member_master_tbl]    Script Date: 7.06.2023 09:41:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member_master_tbl](
	[member_id] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[full_name] [nvarchar](50) NULL,
	[birthdate] [nvarchar](50) NULL,
	[contact_no] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[publisher_master_tbl]    Script Date: 7.06.2023 09:41:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publisher_master_tbl](
	[publisher_id] [nchar](10) NOT NULL,
	[publisher_name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[publisher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[admin_login_tbl] ([username], [password], [full_name]) VALUES (N'admin', N'admin', NULL)
GO
INSERT [dbo].[author_master_tbl] ([author_id], [author_name]) VALUES (N'a01       ', N'Harper Lee')
GO
INSERT [dbo].[author_master_tbl] ([author_id], [author_name]) VALUES (N'a02       ', N'John Steinbeck')
GO
INSERT [dbo].[author_master_tbl] ([author_id], [author_name]) VALUES (N'a03       ', N'George Orwell')
GO
INSERT [dbo].[author_master_tbl] ([author_id], [author_name]) VALUES (N'a04       ', N'J.R.R. Tolkien')
GO
INSERT [dbo].[book_issue_tbl] ([member_id], [member_name], [book_id], [book_name], [issue_date], [due_date]) VALUES (N'user1', N'Orhun Kırkağaçlıoğlu', N'b003      ', N'1984', N'2023-06-05', N'2023-06-10')
GO
INSERT [dbo].[book_issue_tbl] ([member_id], [member_name], [book_id], [book_name], [issue_date], [due_date]) VALUES (N'user1', N'Orhun Kırkağaçlıoğlu', N'b001      ', N'Bülbülü Öldürmek', N'2023-06-01', N'2023-06-04')
GO
INSERT [dbo].[book_master_tbl] ([book_id], [book_name], [genre], [author_name], [publisher_name], [publish_date], [language], [edition], [book_cost], [no_of_pages], [book_description], [actual_stock], [current_stock], [book_img_link]) VALUES (N'b001      ', N'Bülbülü Öldürmek', N'Classics', N'Harper Lee', N'Epsilon Yayınları', N'2020-03-03', N'Türkçe', N'1', N'77        ', N'360       ', N'Tüm zamanların en sevilen hikayelerinden biri olan, kırktan fazla dile çevrilen, Oscar ödüllü bir sinema filmi için temel oluşturan ve yirminci yüzyılın en iyi romanlardan biri seçilen Pulitzer ödüllü Bülbülü Öldürmek, Amerika''nın acımasız bir önyargı ile zehirlenmiş güneyinde geçen, sürükleyici, yürek burkan ve dikkat çekici bir büyüme hikayesi. Büyüleyici güzellikler ve vahşi eşitsizlikler dünyasında haksız yere korkunç bir suçla suçlanan bir "zenci"yi savunmak için her şeyi riske atan bir adamın hikayesi çocuk kahramanın gözünden anlatılıyor.', N'20        ', N'19        ', N'~/book_inventory/Bülbülü Öldürmek.png')
GO
INSERT [dbo].[book_master_tbl] ([book_id], [book_name], [genre], [author_name], [publisher_name], [publish_date], [language], [edition], [book_cost], [no_of_pages], [book_description], [actual_stock], [current_stock], [book_img_link]) VALUES (N'b002      ', N'Fareler ve İnsanlar', N'Classics', N'John Steinbeck', N'Sel Yayıncılık', N'2012-09-05', N'English', N'21', N'72        ', N'126       ', N'Fareler ve İnsanlar, birbirine zıt karakterdeki iki mevsimlik tarım işçisinin, zeki George Milton ve onun güçlü kuvvetli ama akli dengesi bozuk yoldaşı Lennie Small''un öyküsünü anlatır. Küçük bir toprak satın alıp insanca bir hayat yaşamanın hayalini kuran bu ikilinin öyküsünde dostluk ve dayanışma duygusu önemli bir yer tutar. Steinbeck insanın insanla ilişkisini anlatmakla kalmaz insanın doğayla ve toplumla kurduğu ilişkileri de konu eder bu destansı romanında. Kitabın ismine ilham veren Robert Burns şiirindeki gibi; "En iyi planları farelerin ve insanların / Sıkça ters gider..."', N'50        ', N'50        ', N'~/book_inventory/Fareler ve insanlar.png')
GO
INSERT [dbo].[book_master_tbl] ([book_id], [book_name], [genre], [author_name], [publisher_name], [publish_date], [language], [edition], [book_cost], [no_of_pages], [book_description], [actual_stock], [current_stock], [book_img_link]) VALUES (N'b003      ', N'1984', N'Classics', N'George Orwell', N'Can Yayınları', N'2016-11-17', N'Türkçe', N'73', N'45        ', N'352       ', N'George Orwell''in kült kitabı Bin Dokuz Yüz Seksen Dört, yazarın geleceğe ilişkin bir kabus senaryosudur. Bireyselliğin yok edildiği, zihnin kontrol altına alındığı, insanların makineleşmiş kitlelere dönüştürüldüğü totaliter bir dünya düzeni, romanda inanılmaz bir hayal gücüyle, en ince ayrıntısına kadar kurgulanmıştır. Geçmişte ve günümüzde dünya sahnesinde tezgahlanan oyunlar düşünüldüğünde, ütopik olduğu kadar gerçekçi bir romandır Bin Dokuz Yüz Seksen Dört. Güncelliğini hiçbir zaman yitirmeyen bir başyapıttır; yalnızca yarına değil, bugüne de ilişkin bir uyarı çığlığıdır.', N'50        ', N'49        ', N'~/book_inventory/1984.png')
GO
INSERT [dbo].[book_master_tbl] ([book_id], [book_name], [genre], [author_name], [publisher_name], [publish_date], [language], [edition], [book_cost], [no_of_pages], [book_description], [actual_stock], [current_stock], [book_img_link]) VALUES (N'b004      ', N'Yüzüklerin Efendisi 1: Yüzük Kardeşliği', N'Action,Adventure,Science Fiction', N'J.R.R. Tolkien', N'Metis Yayıncılık', N'2016-01-06', N'Türkçe', N'8', N'139       ', N'496       ', N'''Yüzüklerin Efendisi'' son yüzyılın en çok okunan yüz kitabı arasında en başta geliyor; bilimkurgu, fantezi, polisiye, best-seller ya da ana akım demeden, tüm edebiyat türleri arasında tartışmasız bir önderliğe sahip. Bir açıdan bakarsanız bir fantezi romanı, başka bir açıdan baktığınızda, insanlık durumu, sorumluluk, iktidar ve savaş üzerine bir roman. Bir yolculuk, bir büyüme öyküsü; fedakarlık ve dostluk üzerine, hırs ve ihanet üzerine bir roman.', N'10        ', N'10        ', N'~/book_inventory/Yüzüklerin efendisi.png')
GO
INSERT [dbo].[member_master_tbl] ([member_id], [password], [full_name], [birthdate], [contact_no], [email], [state], [city], [pincode], [full_address], [account_status]) VALUES (N'user1', N'123', N'Orhun Kırkağaçlıoğlu', N'', N'5393399626', N'm40agac@gmail.com', N'Turkey', N'Istanbul', N'34900', N'Tuzla/IST', N'active')
GO
INSERT [dbo].[publisher_master_tbl] ([publisher_id], [publisher_name]) VALUES (N'p01       ', N'Epsilon Yayınları')
GO
INSERT [dbo].[publisher_master_tbl] ([publisher_id], [publisher_name]) VALUES (N'p02       ', N'Sel Yayıncılık')
GO
INSERT [dbo].[publisher_master_tbl] ([publisher_id], [publisher_name]) VALUES (N'p03       ', N'Can Yayınları')
GO
INSERT [dbo].[publisher_master_tbl] ([publisher_id], [publisher_name]) VALUES (N'p04       ', N'Metis Yayıncılık')
GO
USE [master]
GO
ALTER DATABASE [webappLibraryDB] SET  READ_WRITE 
GO
