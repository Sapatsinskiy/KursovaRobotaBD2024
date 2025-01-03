USE [master]
GO
/****** Object:  Database [stories_site]    Script Date: 22.12.2024 19:35:03 ******/
CREATE DATABASE [stories_site]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'stories_site', FILENAME = N'C:\MY PROGRAMS AND GAMES\SQL2022\MSSQL16.MSSQLSERVER\MSSQL\DATA\stories_site.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'stories_site_log', FILENAME = N'C:\MY PROGRAMS AND GAMES\SQL2022\MSSQL16.MSSQLSERVER\MSSQL\DATA\stories_site_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [stories_site] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [stories_site].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [stories_site] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [stories_site] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [stories_site] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [stories_site] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [stories_site] SET ARITHABORT OFF 
GO
ALTER DATABASE [stories_site] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [stories_site] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [stories_site] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [stories_site] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [stories_site] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [stories_site] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [stories_site] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [stories_site] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [stories_site] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [stories_site] SET  ENABLE_BROKER 
GO
ALTER DATABASE [stories_site] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [stories_site] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [stories_site] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [stories_site] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [stories_site] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [stories_site] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [stories_site] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [stories_site] SET RECOVERY FULL 
GO
ALTER DATABASE [stories_site] SET  MULTI_USER 
GO
ALTER DATABASE [stories_site] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [stories_site] SET DB_CHAINING OFF 
GO
ALTER DATABASE [stories_site] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [stories_site] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [stories_site] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [stories_site] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'stories_site', N'ON'
GO
ALTER DATABASE [stories_site] SET QUERY_STORE = ON
GO
ALTER DATABASE [stories_site] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [stories_site]
GO
/****** Object:  Table [dbo].[Autor_fans]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor_fans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Autor_id] [int] NOT NULL,
	[User_id] [int] NOT NULL,
	[Fan_date] [date] NOT NULL,
 CONSTRAINT [PK__Autor_fa__3214EC072FB4EB8A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_name] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coments]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Story_id] [int] NOT NULL,
	[User_id] [int] NOT NULL,
	[Message] [varchar](255) NOT NULL,
	[Created_date] [date] NOT NULL,
 CONSTRAINT [PK__Coments__3214EC0700C67790] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follow_story]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follow_story](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Story_id] [int] NOT NULL,
	[User_id] [int] NOT NULL,
	[Follow_date] [date] NOT NULL,
 CONSTRAINT [PK__Follow_s__3214EC07F8C36F85] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sections]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Section_name] [varchar](250) NOT NULL,
	[Section_text_file] [varchar](250) NULL,
	[Story_id] [int] NOT NULL,
	[Created_date] [date] NOT NULL,
	[Watches] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stories]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Story_name] [varchar](250) NOT NULL,
	[About_story] [text] NULL,
	[Autor_id] [int] NOT NULL,
	[Category_id] [int] NOT NULL,
	[Created_date] [date] NOT NULL,
	[Main_likes] [int] NULL,
	[Main_watches] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[About] [text] NULL,
	[Email] [varchar](250) NOT NULL,
	[Password] [varchar](250) NOT NULL,
	[Registration_date] [date] NOT NULL,
	[is_autor] [int] NOT NULL,
	[is_admin] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autor_fans] ON 

INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (1, 2, 5, CAST(N'2024-10-10' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (2, 2, 6, CAST(N'2024-10-10' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (3, 3, 7, CAST(N'2024-10-10' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (4, 3, 8, CAST(N'2024-10-11' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (5, 4, 9, CAST(N'2024-10-12' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (6, 3, 9, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (8, 2, 10, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (9, 2, 9, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (10, 2, 8, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (11, 2, 7, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (12, 3015, 1012, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (13, 3015, 3012, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (14, 3015, 3013, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (15, 3015, 3014, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (16, 3015, 3016, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (17, 3018, 3016, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (18, 3018, 3017, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (19, 3022, 5, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (20, 3022, 6, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (21, 3025, 7, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (22, 3025, 8, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (23, 3026, 10, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (24, 3026, 1012, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (25, 3029, 3012, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (26, 3029, 3013, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (27, 3032, 3014, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (28, 3032, 3016, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (29, 3033, 3017, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (30, 3033, 3019, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (31, 3034, 3020, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (32, 3034, 3021, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (33, 3039, 3023, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (34, 3039, 3024, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (35, 3044, 3027, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Autor_fans] ([Id], [Autor_id], [User_id], [Fan_date]) VALUES (36, 3044, 3028, CAST(N'2024-12-20' AS Date))
SET IDENTITY_INSERT [dbo].[Autor_fans] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1, N'Фентезі')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (2, N'Наукова фантастика')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (4, N'Історичні романи')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (5, N'Короткі оповідання')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1006, N'Детективи')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1007, N'Романтика')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1008, N'Гумор')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1009, N'Трилери')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1010, N'Поезія')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1011, N'Пригодницькі романи')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1012, N'Епічні саги')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1013, N'Драми')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1014, N'Моторошні історії')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1015, N'Екологічна література')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1016, N'Мемуари')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1017, N'Біографії')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1018, N'Філософська література')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1019, N'Публіцистика')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1020, N'Кіберпанк')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1021, N'Містика')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1022, N'Фентезі для підлітків')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1023, N'Науково-популярна література')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1024, N'Класика')
INSERT [dbo].[Categories] ([Id], [Category_name]) VALUES (1025, N'Мультжанрові твори')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Coments] ON 

INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (5, 1, 5, N'Це неймовірна історія! Не можу дочекатися продовження!', CAST(N'2024-01-01' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (6, 1, 6, N'Подорож крізь час просто фантастична!', CAST(N'2024-01-02' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (8, 1, 6, N'Подорож крізь час просто фантастична!', CAST(N'2024-01-02' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (13, 2, 7, N'Фентезійний світ захоплює, люблю цю історію!', CAST(N'2024-12-03' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (15, 2, 5, N'Чекаю на нові пригоди!', CAST(N'2024-06-04' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (19, 3, 8, N'Революція в майбутньому викликала багато думок.', CAST(N'2024-05-09' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (20, 3, 2, N'Цей роман про революцію просто вражає!', CAST(N'2024-05-08' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (21, 6, 1, N'Нова історія виглядає дуже інтригуюче!', CAST(N'2024-10-20' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (22, 6, 5, N'Чекаю, що буде далі в цій історії.', CAST(N'2024-10-22' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (23, 1006, 3, N'Це було цікаво, сподіваюся на продовження.', CAST(N'2024-01-06' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (24, 1006, 4, N'Не зовсім зрозумів фінал, але все одно цікаво.', CAST(N'2024-01-08' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (25, 1007, 2, N'Справжня магія у кожному рядку!', CAST(N'2024-01-13' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (26, 1007, 8, N'Це фантастично! Дуже люблю такий жанр.', CAST(N'2024-01-14' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (27, 1008, 1, N'Відмінна історія! Подобається сюжет.', CAST(N'2024-01-19' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (28, 1008, 7, N'Цікаво, сподіваюся, що історія буде розвиватися в тому ж напрямку.', CAST(N'2024-01-21' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (29, 1009, 5, N'Тема дуже актуальна, цікаво побачити, що буде далі.', CAST(N'2024-02-06' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (30, 1009, 9, N'Захоплююче початок! Сподіваюся, буде ще краще.', CAST(N'2024-02-07' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (31, 1010, 2, N'Неймовірно, такий цікавий початок!', CAST(N'2024-02-16' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (32, 1010, 3, N'Захоплююче! Буду чекати продовження.', CAST(N'2024-02-18' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (33, 1011, 5, N'Тема просто чудова, чекаю на нові розділи!', CAST(N'2024-02-21' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (34, 1011, 6, N'Це дуже цікаво! Підписуюсь на продовження.', CAST(N'2024-02-22' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (35, 1013, 1, N'Тема виглядає дуже перспективною. Чекаю продовження!', CAST(N'2024-04-02' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (36, 1013, 9, N'Історія цікава, буду слідкувати.', CAST(N'2024-04-03' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (37, 1014, 8, N'Цікаво, як розвиватиметься ця історія.', CAST(N'2024-04-11' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (38, 1014, 5, N'Це дійсно захоплююче, не можу дочекатися наступної частини.', CAST(N'2024-04-12' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (39, 1015, 6, N'Прекрасна історія! Буду чекати продовження.', CAST(N'2024-04-16' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (40, 1015, 7, N'Цікаво, що буде далі. Сподіваюся, буде більше екшну!', CAST(N'2024-04-17' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (41, 1016, 2, N'Нова історія виглядає багатообіцяючою.', CAST(N'2024-05-06' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (42, 1016, 9, N'Тема дуже цікава, чекаю на нові розділи.', CAST(N'2024-05-07' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (43, 1017, 3, N'Цікава історія! Сподіваюся, буде більше розвитку подій.', CAST(N'2024-05-16' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (44, 1017, 4, N'Не можу дочекатися, що буде далі!', CAST(N'2024-05-17' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (45, 1, 1012, N'Чудова історія, дуже цікава!', CAST(N'2024-01-01' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (46, 2, 1, N'Чудово написано, чекаю на наступні розділи.', CAST(N'2024-03-05' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (47, 3, 3017, N'Захоплююча історія, цікаво побачити, що буде далі!', CAST(N'2024-05-01' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (50, 6, 3030, N'Дуже інтригуючий початок, чекаю на розвиток!', CAST(N'2024-10-20' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (55, 1006, 3020, N'Неймовірно захоплююча історія, буду чекати на продовження!', CAST(N'2024-01-05' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (57, 1, 1012, N'Це коментар від користувача 1012', CAST(N'2023-12-16' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (58, 2, 3012, N'Це коментар від користувача 3012', CAST(N'2024-03-06' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (59, 3, 3013, N'Це коментар від користувача 3013', CAST(N'2024-05-02' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (60, 6, 3014, N'Це коментар від користувача 3014', CAST(N'2024-10-21' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (61, 1006, 3015, N'Це коментар від користувача 3015', CAST(N'2024-01-06' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (62, 1007, 3016, N'Це коментар від користувача 3016', CAST(N'2024-01-13' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (63, 1008, 3017, N'Це коментар від користувача 3017', CAST(N'2024-01-19' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (64, 1009, 3018, N'Це коментар від користувача 3018', CAST(N'2024-02-06' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (65, 1010, 3019, N'Це коментар від користувача 3019', CAST(N'2024-02-16' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (66, 1011, 3020, N'Це коментар від користувача 3020', CAST(N'2024-02-21' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (67, 1013, 3021, N'Це коментар від користувача 3021', CAST(N'2024-04-02' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (68, 1014, 3022, N'Це коментар від користувача 3022', CAST(N'2024-04-11' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (69, 1015, 3023, N'Це коментар від користувача 3023', CAST(N'2024-04-16' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (70, 1016, 3024, N'Це коментар від користувача 3024', CAST(N'2024-05-06' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (71, 1017, 3025, N'Це коментар від користувача 3025', CAST(N'2024-05-16' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (72, 1018, 3026, N'Це коментар від користувача 3026', CAST(N'2024-05-26' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (73, 1022, 3027, N'Це коментар від користувача 3027', CAST(N'2024-07-03' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (74, 1023, 3028, N'Це коментар від користувача 3028', CAST(N'2024-07-16' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (75, 1024, 3029, N'Це коментар від користувача 3029', CAST(N'2024-07-21' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (76, 1025, 3030, N'Це коментар від користувача 3030', CAST(N'2024-08-06' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (77, 1026, 3031, N'Це коментар від користувача 3031', CAST(N'2024-08-21' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (78, 1027, 3032, N'Це коментар від користувача 3032', CAST(N'2024-08-26' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (79, 1028, 3033, N'Це коментар від користувача 3033', CAST(N'2024-09-11' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (80, 1029, 3034, N'Це коментар від користувача 3034', CAST(N'2024-09-26' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (81, 1030, 3035, N'Це коментар від користувача 3035', CAST(N'2024-10-01' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (82, 1034, 3036, N'Це коментар від користувача 3036', CAST(N'2024-11-06' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (83, 1035, 3037, N'Це коментар від користувача 3037', CAST(N'2024-11-21' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (84, 1036, 3038, N'Це коментар від користувача 3038', CAST(N'2024-11-26' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (85, 1037, 3039, N'Це коментар від користувача 3039', CAST(N'2024-12-06' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (86, 1038, 3040, N'Це коментар від користувача 3040', CAST(N'2024-12-16' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (87, 1039, 3041, N'Це коментар від користувача 3041', CAST(N'2024-12-21' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (88, 1046, 3042, N'Це коментар від користувача 3042', CAST(N'2024-11-16' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (89, 1047, 3043, N'Це коментар від користувача 3043', CAST(N'2024-11-21' AS Date))
INSERT [dbo].[Coments] ([Id], [Story_id], [User_id], [Message], [Created_date]) VALUES (90, 1048, 3044, N'Це коментар від користувача 3044', CAST(N'2024-12-06' AS Date))
SET IDENTITY_INSERT [dbo].[Coments] OFF
GO
SET IDENTITY_INSERT [dbo].[Follow_story] ON 

INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (29, 1, 5, CAST(N'2024-10-01' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (30, 2, 6, CAST(N'2024-10-12' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (31, 3, 7, CAST(N'2024-10-11' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (32, 1, 1, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (33, 2, 5, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (34, 3, 6, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (35, 6, 7, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (36, 1006, 8, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (37, 1007, 9, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (38, 1008, 10, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (39, 1009, 1012, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (40, 1010, 3012, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (41, 1011, 3013, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (42, 1013, 3014, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (43, 1014, 3016, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (44, 1015, 3017, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (45, 1016, 3019, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (46, 1017, 3020, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (47, 1018, 3021, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (48, 1022, 3023, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (49, 1023, 3024, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (50, 1024, 3027, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (51, 1025, 3028, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (52, 1026, 3030, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (55, 1037, 3042, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (60, 1027, 3031, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (69, 1028, 3035, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (88, 1029, 3036, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (90, 1030, 3037, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (91, 1034, 3038, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (92, 1035, 3040, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (93, 1036, 3041, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (94, 1038, 3042, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (95, 1039, 3043, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Follow_story] ([Id], [Story_id], [User_id], [Follow_date]) VALUES (96, 1046, 3044, CAST(N'2024-12-20' AS Date))
SET IDENTITY_INSERT [dbo].[Follow_story] OFF
GO
SET IDENTITY_INSERT [dbo].[Sections] ON 

INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (3, N'Розділ 1: Подорож', N'journey.txt', 2, CAST(N'2024-03-06' AS Date), 75)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (4, N'Розділ 2: Магія', N'magic.txt', 2, CAST(N'2024-03-07' AS Date), 65)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (8, N'Таємниці стародавнього світу', N'таємниці_давнього_світу.txt', 2, CAST(N'2024-10-22' AS Date), 20)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1006, N'Розділ 1: Початок', N'start.txt', 1, CAST(N'2023-12-15' AS Date), 50)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1007, N'Розділ 2: Розвиток', N'development.txt', 1, CAST(N'2024-01-01' AS Date), 45)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1008, N'Розділ 3: Конфлікти', N'conflicts.txt', 1, CAST(N'2024-02-01' AS Date), 60)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1009, N'Розділ 4: Розв’язка', N'resolution.txt', 1, CAST(N'2024-03-01' AS Date), 55)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1010, N'Розділ 1: Відкриття', N'discovery.txt', 2, CAST(N'2024-03-05' AS Date), 75)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1011, N'Розділ 2: Перешкоди', N'obstacles.txt', 2, CAST(N'2024-04-01' AS Date), 80)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1012, N'Розділ 3: Перемога', N'victory.txt', 2, CAST(N'2024-05-01' AS Date), 85)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1013, N'Розділ 1: Початок пригоди', N'start_adventure.txt', 3, CAST(N'2024-05-01' AS Date), 90)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1014, N'Розділ 2: Несподівана зустріч', N'unexpected_meeting.txt', 3, CAST(N'2024-06-01' AS Date), 95)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1015, N'Розділ 3: Ключове рішення', N'key_decision.txt', 3, CAST(N'2024-07-01' AS Date), 100)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1016, N'Розділ 1: Темні часи', N'dark_times.txt', 6, CAST(N'2024-10-20' AS Date), 0)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1017, N'Розділ 2: Пошук істини', N'truth_search.txt', 6, CAST(N'2024-11-01' AS Date), 10)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1018, N'Розділ 1: Початок нової ери', N'new_era_start.txt', 1006, CAST(N'2024-01-05' AS Date), 70)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1019, N'Розділ 2: Міфи і реальність', N'myths_and_reality.txt', 1006, CAST(N'2024-02-01' AS Date), 65)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1020, N'Розділ 3: Перемога над темрявою', N'victory_over_darkness.txt', 1006, CAST(N'2024-03-01' AS Date), 75)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1021, N'Розділ 1: Легенда про короля', N'king_legends.txt', 1007, CAST(N'2024-01-12' AS Date), 80)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1022, N'Розділ 2: Битва за трон', N'battle_for_throne.txt', 1007, CAST(N'2024-02-01' AS Date), 85)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1023, N'Розділ 1: Секрети древнього світу', N'secrets_ancient_world.txt', 1008, CAST(N'2024-01-18' AS Date), 90)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1024, N'Розділ 2: Легенда в снах', N'legend_in_dreams.txt', 1008, CAST(N'2024-02-01' AS Date), 95)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1025, N'Розділ 1: Перша трагедія', N'first_tragedy.txt', 1009, CAST(N'2024-02-05' AS Date), 80)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1026, N'Розділ 2: Розкриття правди', N'truth_revealed.txt', 1009, CAST(N'2024-03-01' AS Date), 85)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1027, N'Розділ 1: Невідомі горизонти', N'unknown_horizons.txt', 1010, CAST(N'2024-02-15' AS Date), 60)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1028, N'Розділ 2: Потужність знань', N'power_of_knowledge.txt', 1010, CAST(N'2024-03-01' AS Date), 65)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1029, N'Розділ 1: Перше випробування', N'first_trial.txt', 1011, CAST(N'2024-02-20' AS Date), 55)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1030, N'Розділ 2: У темряві', N'in_darkness.txt', 1011, CAST(N'2024-03-10' AS Date), 60)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1031, N'Розділ 1: Тиша перед бурею', N'calm_before_storm.txt', 1013, CAST(N'2024-04-01' AS Date), 50)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1032, N'Розділ 2: Шлях до істини', N'path_to_truth.txt', 1013, CAST(N'2024-05-01' AS Date), 55)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1033, N'Розділ 1: Темні сили', N'dark_forces.txt', 1014, CAST(N'2024-04-10' AS Date), 60)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1034, N'Розділ 2: Ворог серед нас', N'enemy_among_us.txt', 1014, CAST(N'2024-05-01' AS Date), 65)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1035, N'Розділ 1: Мандрівка до зірок', N'journey_to_stars.txt', 1015, CAST(N'2024-04-15' AS Date), 70)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1036, N'Розділ 2: Загроза з космосу', N'threat_from_space.txt', 1015, CAST(N'2024-05-01' AS Date), 75)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1037, N'Розділ 1: Відновлення нації', N'nation_recovery.txt', 1016, CAST(N'2024-05-05' AS Date), 80)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1038, N'Розділ 2: Зрада серед своїх', N'betrayal_among_own.txt', 1016, CAST(N'2024-06-01' AS Date), 85)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1039, N'Розділ 1: Відродження сили', N'force_renewal.txt', 1017, CAST(N'2024-05-15' AS Date), 90)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1040, N'Розділ 2: Рішучий крок', N'decisive_step.txt', 1017, CAST(N'2024-06-01' AS Date), 95)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1041, N'Розділ 1: Подорож у невідомість', N'journey_into_unknown.txt', 1018, CAST(N'2024-05-25' AS Date), 100)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1042, N'Розділ 2: Розкриття таємниць', N'unveiling_secrets.txt', 1018, CAST(N'2024-06-15' AS Date), 105)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1043, N'Розділ 1: Магія в серці', N'magic_in_heart.txt', 1022, CAST(N'2024-07-02' AS Date), 60)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1044, N'Розділ 2: Вогонь та лід', N'fire_and_ice.txt', 1022, CAST(N'2024-08-01' AS Date), 65)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1045, N'Розділ 1: Пригоди в світі магії', N'adventures_in_magic_world.txt', 1023, CAST(N'2024-07-15' AS Date), 70)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1046, N'Розділ 2: Спокуса зла', N'temptation_of_evil.txt', 1023, CAST(N'2024-08-01' AS Date), 75)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1047, N'Розділ 1: Подорож до безодні', N'journey_to_depths.txt', 1024, CAST(N'2024-07-20' AS Date), 80)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1048, N'Розділ 2: Вихід з темряви', N'exit_from_darkness.txt', 1024, CAST(N'2024-08-15' AS Date), 85)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1049, N'Розділ 1: Кров і магія', N'blood_and_magic.txt', 1025, CAST(N'2024-08-05' AS Date), 90)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1050, N'Розділ 2: Меч і вогонь', N'sword_and_fire.txt', 1025, CAST(N'2024-09-01' AS Date), 95)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1051, N'Розділ 1: Світло серед темряви', N'light_in_darkness.txt', 1026, CAST(N'2024-08-20' AS Date), 100)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1052, N'Розділ 2: Шлях до перемоги', N'path_to_victory.txt', 1026, CAST(N'2024-09-01' AS Date), 105)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1053, N'Розділ 1: Справедливість вічно', N'justice_forever.txt', 1027, CAST(N'2024-08-25' AS Date), 110)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1054, N'Розділ 2: Місто на руїнах', N'city_on_ruins.txt', 1027, CAST(N'2024-09-10' AS Date), 115)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1055, N'Розділ 1: Заворушення', N'uproar.txt', 1028, CAST(N'2024-09-10' AS Date), 120)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1056, N'Розділ 2: Падіння імперії', N'fall_of_empire.txt', 1028, CAST(N'2024-10-01' AS Date), 125)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1057, N'Розділ 1: Легенда про древнє королівство', N'ancient_kingdom_legend.txt', 1029, CAST(N'2024-09-25' AS Date), 130)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1058, N'Розділ 2: Магія на межі', N'magic_on_edge.txt', 1029, CAST(N'2024-10-01' AS Date), 135)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1059, N'Розділ 1: Далека планета', N'distant_planet.txt', 1030, CAST(N'2024-09-30' AS Date), 140)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1060, N'Розділ 2: Війна за майбутнє', N'war_for_future.txt', 1030, CAST(N'2024-10-15' AS Date), 145)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1061, N'Розділ 1: Різноманіття світів', N'worlds_diversity.txt', 1034, CAST(N'2024-11-05' AS Date), 150)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1062, N'Розділ 2: Спільний ворог', N'common_enemy.txt', 1034, CAST(N'2024-11-20' AS Date), 155)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1063, N'Розділ 1: Спалах на горизонті', N'flare_on_horizon.txt', 1035, CAST(N'2024-11-20' AS Date), 160)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1064, N'Розділ 2: Повернення старого ворога', N'return_of_old_enemy.txt', 1035, CAST(N'2024-12-01' AS Date), 165)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1065, N'Розділ 1: Темні води', N'dark_waters.txt', 1036, CAST(N'2024-11-25' AS Date), 170)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1066, N'Розділ 2: Тайна прокляття', N'curse_secret.txt', 1036, CAST(N'2024-12-01' AS Date), 175)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1067, N'Розділ 1: Вибір без вибору', N'choice_without_choice.txt', 1037, CAST(N'2024-12-05' AS Date), 180)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1068, N'Розділ 2: Врятовані не будуть', N'saved_will_not_be.txt', 1037, CAST(N'2024-12-15' AS Date), 185)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1069, N'Розділ 1: Остання битва', N'last_battle.txt', 1038, CAST(N'2024-12-15' AS Date), 190)
INSERT [dbo].[Sections] ([Id], [Section_name], [Section_text_file], [Story_id], [Created_date], [Watches]) VALUES (1070, N'Розділ 2: Залишки імперії', N'remnants_of_empire.txt', 1038, CAST(N'2024-12-20' AS Date), 195)
SET IDENTITY_INSERT [dbo].[Sections] OFF
GO
SET IDENTITY_INSERT [dbo].[Stories] ON 

INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1, N'Подорож крізь час', N'Історія про подорож у часі та просторові.', 2, 2, CAST(N'2023-12-15' AS Date), 2, 210)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (2, N'Пригоди в невідомому світі', N'Фентезійні пригоди в магічному світі.', 3, 1, CAST(N'2024-03-05' AS Date), 2, 400)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (3, N'Революція в майбутньому', N'Науково-фантастичний роман про революцію.', 4, 2, CAST(N'2024-05-01' AS Date), 2, 285)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (6, N'Темне середньовіччя', N'Історія про подорожі та пригоди в середньовічному світі.', 2, 1, CAST(N'2024-10-20' AS Date), 1, 10)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1006, N'Загадкове відкриття', N'Роман про таємничі знахідки в стародавньому місті.', 2, 1009, CAST(N'2024-01-05' AS Date), 1, 210)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1007, N'Магія і світ', N'Історія про магічний світ, де кожен має свої сили.', 3, 1, CAST(N'2024-01-12' AS Date), 1, 165)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1008, N'Секрети майбутнього', N'Науково-фантастична історія про технології, які змінюють світ.', 4, 2, CAST(N'2024-01-18' AS Date), 1, 185)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1009, N'Майбутнє у небезпеці', N'Науково-фантастична історія про боротьбу за майбутнє.', 5, 2, CAST(N'2024-02-05' AS Date), 1, 165)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1010, N'Далекі світи', N'Історія про дослідження нових планет.', 3033, 2, CAST(N'2024-02-15' AS Date), 1, 125)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1011, N'Відчайдушна боротьба', N'Пригоди героя, який намагається врятувати своє місто.', 3015, 1025, CAST(N'2024-02-20' AS Date), 1, 115)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1013, N'Таємниці старого замку', N'Герої потрапляють до старого замку з безліччю таємниць.', 2, 1006, CAST(N'2024-04-01' AS Date), 1, 105)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1014, N'Революція майбутнього', N'Науково-фантастична історія про революцію в майбутньому.', 4, 2, CAST(N'2024-04-10' AS Date), 1, 125)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1015, N'Загадкове кохання', N'Романтична історія про кохання в умовах війни.', 3022, 1007, CAST(N'2024-04-15' AS Date), 1, 145)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1016, N'Пороги часу', N'Історія про подорож у часі, де все змінюється.', 3, 2, CAST(N'2024-05-05' AS Date), 1, 165)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1017, N'Древня магія', N'Фентезі про магів та їхні могутні сили.', 2, 1, CAST(N'2024-05-15' AS Date), 1, 185)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1018, N'Романтичні миті', N'Поетична історія про кохання та втрату.', 3026, 1007, CAST(N'2024-05-25' AS Date), 1, 205)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1022, N'Темна поезія', N'Поезія про темні аспекти людської душі.', 2, 1010, CAST(N'2024-07-02' AS Date), 1, 125)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1023, N'Таємний світ', N'Містичні події, що розгортаються у секретному місті.', 4, 1021, CAST(N'2024-07-15' AS Date), 1, 145)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1024, N'Сонце в темряві', N'Історія про боротьбу з темними силами, що охопили землю.', 3015, 1006, CAST(N'2024-07-20' AS Date), 1, 165)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1025, N'Пошуки істини', N'Історія про героя, який шукає правду в великому світі.', 2, 1009, CAST(N'2024-08-05' AS Date), 1, 185)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1026, N'Останній день на Землі', N'Фантастика про останній день існування людства.', 3, 1020, CAST(N'2024-08-20' AS Date), 1, 205)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1027, N'Забуті часи', N'Історія про подорож у втрачені епохи, де все змінюється.', 3029, 1, CAST(N'2024-08-25' AS Date), 1, 225)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1028, N'Могутній ворог', N'Історія про боротьбу з великою темною силою.', 4, 1006, CAST(N'2024-09-10' AS Date), 1, 245)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1029, N'Магія та війна', N'Фентезі, де магія є найважливішим інструментом у війні.', 3, 1, CAST(N'2024-09-25' AS Date), 1, 265)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1030, N'Трилер із середини', N'Детективна історія про зникнення людини з невідомих причин.', 3022, 1009, CAST(N'2024-09-30' AS Date), 1, 285)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1034, N'Відкриття світу', N'Роман про відкриття нових світів та незвіданих земель.', 2, 1023, CAST(N'2024-11-05' AS Date), 1, 305)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1035, N'Темна ніч', N'Трилер про загадкові події, що відбуваються вночі.', 4, 1009, CAST(N'2024-11-20' AS Date), 1, 325)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1036, N'Життя на краю', N'Містична історія про життя на межі реальності та вигадки.', 3029, 1021, CAST(N'2024-11-25' AS Date), 1, 345)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1037, N'Зимова магія', N'Історія про магію, що розкривається лише в зимовий період.', 3, 1010, CAST(N'2024-12-05' AS Date), 1, 365)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1038, N'Скриті світи', N'Містична розповідь про загадкові світи, що існують паралельно з нашим.', 2, 1006, CAST(N'2024-12-15' AS Date), 1, 385)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1039, N'Повернення у минуле', N'Подорож у минуле для виправлення великої помилки.', 3022, 1025, CAST(N'2024-12-20' AS Date), 1, 0)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1046, N'Магія світів', N'Фентезійна історія про пригоди в світі магії.', 2, 1, CAST(N'2024-11-15' AS Date), 1, 0)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1047, N'Зоряний код', N'Науково-фантастичний трилер про відкриття нової планети.', 3, 2, CAST(N'2024-11-20' AS Date), 0, 0)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1048, N'Пригода на острові', N'Історія про екстремальну подорож на віддалений острів.', 3015, 5, CAST(N'2024-12-05' AS Date), 0, 0)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1049, N'Містерія вночі', N'Загадкова розповідь про нічні пригоди в місті.', 3018, 1006, CAST(N'2024-12-08' AS Date), 0, 0)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1050, N'Танець сердець', N'Романтична історія про несподівану зустріч двох закоханих.', 3022, 1007, CAST(N'2024-12-10' AS Date), 0, 0)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1051, N'Гумор в кожному кроці', N'Смішні історії з життя персонажів.', 3025, 1008, CAST(N'2024-12-12' AS Date), 0, 0)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1052, N'Королівство магії', N'Фентезійна епопея про боротьбу за магічне королівство.', 3029, 1, CAST(N'2024-12-18' AS Date), 0, 0)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1053, N'Неймовірні пригоди', N'Захоплююча історія про боротьбу з невідомими монстрами.', 3032, 1011, CAST(N'2024-12-20' AS Date), 0, 0)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1054, N'Тіні минулого', N'Поетична розповідь про сумні та загадкові події.', 3033, 1010, CAST(N'2024-12-22' AS Date), 0, 0)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1055, N'Темний лабіринт', N'Детективний трилер про невідомого злочинця в лабіринті.', 3034, 1009, CAST(N'2024-12-24' AS Date), 0, 0)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1056, N'Розумний і смертельний', N'Науково-фантастичний твір про штучний інтелект, що виходить з-під контролю.', 3039, 1023, CAST(N'2024-12-27' AS Date), 0, 0)
INSERT [dbo].[Stories] ([Id], [Story_name], [About_story], [Autor_id], [Category_id], [Created_date], [Main_likes], [Main_watches]) VALUES (1057, N'Тайна природи', N'Екологічна історія про збереження навколишнього середовища.', 3044, 1015, CAST(N'2024-12-29' AS Date), 0, 0)
SET IDENTITY_INSERT [dbo].[Stories] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (1, N'Admin Super User', N'Системний адміністратор', N'admin@example.com', N'password123', CAST(N'2024-01-15' AS Date), 0, 1)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (2, N'First', N'Перший автор, пише фентезі.', N'author1@example.com', N'password123', CAST(N'2023-11-20' AS Date), 1, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3, N'Author Two', N'Другий автор, спеціалізується на науковій фантастиці.', N'author2@example.com', N'password123', CAST(N'2023-12-05' AS Date), 1, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (4, N'Author Three', N'Третій автор, пише пригодницькі романи.', N'author3@example.com', N'password123', CAST(N'2024-02-10' AS Date), 1, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (5, N'User One', N'Активний користувач сайту', N'user1@example.com', N'password123', CAST(N'2023-08-18' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (6, N'User Two', N'Любитель читання коротких оповідань.', N'user2@example.com', N'password123', CAST(N'2023-09-01' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (7, N'User Three', N'Захоплюється історичними романами.', N'user3@example.com', N'password123', CAST(N'2024-03-25' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (8, N'User Four', N'Пише відгуки на історії.', N'user4@example.com', N'password123', CAST(N'2024-04-30' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (9, N'User Five', N'Фанат фентезі.', N'user5@example.com', N'password123', CAST(N'2023-10-10' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (10, N'User Six', N'Любить наукову фантастику.', N'user6@example.com', N'password123', CAST(N'2024-06-05' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (1012, N'Adam', N'Я новачок, ще нічого не писав', N'adam@gmail.com', N'password123', CAST(N'2024-12-01' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3012, N'Beta Reader', N'Читаю історії перед публікацією, пишу коментарі.', N'betareader@gmail.com', N'password123', CAST(N'2024-12-02' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3013, N'Fantasy Lover', N'Обожнюю епічне фентезі та драконів.', N'fantasylove@gmail.com', N'password123', CAST(N'2024-12-03' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3014, N'Sci-Fi Fan', N'Прихильник наукової фантастики, іноді пишу рецензії.', N'scififan@gmail.com', N'password123', CAST(N'2024-12-04' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3015, N'Novice Writer', N'Пишу свої перші історії. Люблю пригоди.', N'novicewriter@gmail.com', N'password123', CAST(N'2024-02-01' AS Date), 1, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3016, N'Reader1', N'Захоплююсь літературою різних жанрів.', N'reader1@gmail.com', N'password123', CAST(N'2024-12-06' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3017, N'AdventureFan', N'Шанувальник пригодницьких романів.', N'adventurefan@gmail.com', N'password123', CAST(N'2024-12-07' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3018, N'MysteryWriter', N'Пишу загадкові історії, іноді беру участь у конкурсах.', N'mysterywriter@gmail.com', N'password123', CAST(N'2024-02-01' AS Date), 1, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3019, N'PoetLover', N'Люблю поезію та короткі оповідання.', N'poetlover@gmail.com', N'password123', CAST(N'2024-12-09' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3020, N'ThrillerFan', N'Фанат гостросюжетних романів.', N'thrillerfan@gmail.com', N'password123', CAST(N'2024-12-10' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3021, N'ClassicReader', N'Шанувальник класичної літератури.', N'classicreader@gmail.com', N'password123', CAST(N'2024-12-11' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3022, N'RomanticSoul', N'Пишу романтичні оповідання та читаю драми.', N'romanticsoul@gmail.com', N'password123', CAST(N'2024-01-01' AS Date), 1, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3023, N'CritiqueMaster', N'Займаюся критикою текстів на форумах.', N'critiquemaster@gmail.com', N'password123', CAST(N'2024-12-13' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3024, N'HistoryBuff', N'Шанувальник історичної прози та наукових книг.', N'historybuff@gmail.com', N'password123', CAST(N'2024-12-14' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3025, N'ComedyWriter', N'Пишу гумористичні історії для розваги.', N'comedywriter@gmail.com', N'password123', CAST(N'2024-02-01' AS Date), 1, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3026, N'YoungAuthor', N'Новачок, який працює над своїм першим романом.', N'youngauthor@gmail.com', N'password123', CAST(N'2024-02-01' AS Date), 1, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3027, N'MysteryFan', N'Люблю читати детективи та розгадувати загадки.', N'mysteryfan@gmail.com', N'password123', CAST(N'2024-12-17' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3028, N'SciFiLover', N'Прихильник наукової фантастики та космічних історій.', N'scifilover@gmail.com', N'password123', CAST(N'2024-12-18' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3029, N'FantasyKing', N'Автор, що пише історії про магію та пригоди.', N'fantasyking@gmail.com', N'password123', CAST(N'2024-01-01' AS Date), 1, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3030, N'BookCollector', N'Колекціоную книги та часто залишаю відгуки.', N'bookcollector@gmail.com', N'password123', CAST(N'2024-12-20' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3031, N'LiteratureGeek', N'Фанат класики, читаю та аналізую твори.', N'literaturegeek@gmail.com', N'password123', CAST(N'2024-12-10' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3032, N'AdventureWriter', N'Автор пригодницьких історій для підлітків.', N'adventurewriter@gmail.com', N'password123', CAST(N'2024-01-10' AS Date), 1, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3033, N'DarkPoet', N'Пишу похмурі вірші та короткі історії.', N'darkpoet@gmail.com', N'password123', CAST(N'2024-02-02' AS Date), 1, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3034, N'ThrillerWriter', N'Шанувальник трилерів та автор детективів.', N'thrillerwriter@gmail.com', N'password123', CAST(N'2024-12-24' AS Date), 1, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3035, N'EpicReader', N'Люблю епічні саги та довгі історії.', N'epicreader@gmail.com', N'password123', CAST(N'2024-12-25' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3036, N'ShortStoryFan', N'Читаю короткі історії та есе.', N'shortstoryfan@gmail.com', N'password123', CAST(N'2024-10-26' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3037, N'DramaQueen', N'Фанат драматичних історій та сильних емоцій.', N'dramaqueen@gmail.com', N'password123', CAST(N'2024-12-27' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3038, N'ScienceFan', N'Цікавлюся науковими темами та фантастикою.', N'sciencefan@gmail.com', N'password123', CAST(N'2024-12-28' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3039, N'ProWriter', N'Професійний письменник з багаторічним досвідом.', N'prowriter@gmail.com', N'password123', CAST(N'2024-02-29' AS Date), 1, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3040, N'TeenReader', N'Читаю книги для молоді та підлітків.', N'teenreader@gmail.com', N'password123', CAST(N'2024-12-30' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3041, N'FantasyGirl', N'Фанатка фентезі та романтичних історій.', N'fantasygirl@gmail.com', N'password123', CAST(N'2024-12-31' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3042, N'LiteraryCritic', N'Займаюся аналізом літературних текстів.', N'literarycritic@gmail.com', N'password123', CAST(N'2024-12-01' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3043, N'HorrorFan', N'Фанат страшних історій та моторошних романів.', N'horrorfan@gmail.com', N'password123', CAST(N'2024-12-02' AS Date), 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3044, N'NatureWriter', N'Пишу про природу та екологічні теми.', N'naturewriter@gmail.com', N'password123', CAST(N'2024-01-03' AS Date), 1, 0)
INSERT [dbo].[Users] ([Id], [Name], [About], [Email], [Password], [Registration_date], [is_autor], [is_admin]) VALUES (3046, N'NewUser', NULL, N'newuser@gmail.com', N'12345', CAST(N'2024-12-21' AS Date), 0, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D1053431DDEA3A]    Script Date: 22.12.2024 19:35:03 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Autor_fans] ADD  CONSTRAINT [DF_Fan_date]  DEFAULT (getdate()) FOR [Fan_date]
GO
ALTER TABLE [dbo].[Follow_story] ADD  CONSTRAINT [DF_Follow_date]  DEFAULT (getdate()) FOR [Follow_date]
GO
ALTER TABLE [dbo].[Sections] ADD  DEFAULT ((0)) FOR [Watches]
GO
ALTER TABLE [dbo].[Stories] ADD  DEFAULT (getdate()) FOR [Created_date]
GO
ALTER TABLE [dbo].[Stories] ADD  DEFAULT ((0)) FOR [Main_likes]
GO
ALTER TABLE [dbo].[Stories] ADD  DEFAULT ((0)) FOR [Main_watches]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [Registration_date]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [is_autor]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [is_admin]
GO
ALTER TABLE [dbo].[Autor_fans]  WITH CHECK ADD  CONSTRAINT [FK__Autor_fan__Autor__4E88ABD4] FOREIGN KEY([Autor_id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Autor_fans] CHECK CONSTRAINT [FK__Autor_fan__Autor__4E88ABD4]
GO
ALTER TABLE [dbo].[Autor_fans]  WITH CHECK ADD  CONSTRAINT [FK__Autor_fan__User___4F7CD00D] FOREIGN KEY([User_id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Autor_fans] CHECK CONSTRAINT [FK__Autor_fan__User___4F7CD00D]
GO
ALTER TABLE [dbo].[Autor_fans]  WITH CHECK ADD  CONSTRAINT [FK_Fan_Autor] FOREIGN KEY([User_id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Autor_fans] CHECK CONSTRAINT [FK_Fan_Autor]
GO
ALTER TABLE [dbo].[Coments]  WITH CHECK ADD  CONSTRAINT [FK__Coments__User_id__70DDC3D8] FOREIGN KEY([User_id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Coments] CHECK CONSTRAINT [FK__Coments__User_id__70DDC3D8]
GO
ALTER TABLE [dbo].[Coments]  WITH CHECK ADD  CONSTRAINT [FK_Coments_Story_id] FOREIGN KEY([Story_id])
REFERENCES [dbo].[Stories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Coments] CHECK CONSTRAINT [FK_Coments_Story_id]
GO
ALTER TABLE [dbo].[Follow_story]  WITH CHECK ADD  CONSTRAINT [FK__Follow_st__User___5441852A] FOREIGN KEY([User_id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Follow_story] CHECK CONSTRAINT [FK__Follow_st__User___5441852A]
GO
ALTER TABLE [dbo].[Sections]  WITH CHECK ADD FOREIGN KEY([Story_id])
REFERENCES [dbo].[Stories] ([Id])
GO
ALTER TABLE [dbo].[Sections]  WITH CHECK ADD  CONSTRAINT [FK_Section_Stories] FOREIGN KEY([Story_id])
REFERENCES [dbo].[Stories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sections] CHECK CONSTRAINT [FK_Section_Stories]
GO
ALTER TABLE [dbo].[Stories]  WITH CHECK ADD FOREIGN KEY([Autor_id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Stories]  WITH CHECK ADD FOREIGN KEY([Category_id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Stories]  WITH CHECK ADD  CONSTRAINT [FK_Autors_Users] FOREIGN KEY([Autor_id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Stories] CHECK CONSTRAINT [FK_Autors_Users]
GO
ALTER TABLE [dbo].[Stories]  WITH CHECK ADD  CONSTRAINT [FK_Stories_Category] FOREIGN KEY([Category_id])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Stories] CHECK CONSTRAINT [FK_Stories_Category]
GO
ALTER TABLE [dbo].[Autor_fans]  WITH CHECK ADD  CONSTRAINT [CK__Autor_fans__5070F446] CHECK  (([Autor_id]<>[User_id]))
GO
ALTER TABLE [dbo].[Autor_fans] CHECK CONSTRAINT [CK__Autor_fans__5070F446]
GO
/****** Object:  StoredProcedure [dbo].[CountAuthorsFans]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountAuthorsFans]
AS
BEGIN
	SELECT Users.Name AS Author_Name, COUNT(Autor_fans.User_id) AS Fan_Count
	FROM Users
	JOIN Autor_fans ON Users.Id = Autor_fans.Autor_id
	WHERE Users.is_autor = 1
	GROUP BY Users.Name
END;

EXEC CountAuthorsFans;
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorFans]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAuthorFans]
    @AuthorId INT
AS
BEGIN
    SELECT u.Name AS FanName, af.Fan_date
    FROM Autor_fans af
    JOIN Users u ON af.User_id = u.Id
    WHERE af.Autor_id = @AuthorId
    ORDER BY af.Fan_date DESC;
END;

GO
/****** Object:  StoredProcedure [dbo].[GetAutorFansStatistics]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAutorFansStatistics]
    @Month INT = NULL,
    @Year INT = NULL
AS
BEGIN
    IF @Month IS NULL OR @Year IS NULL
    BEGIN
        -- Загальна кількість підписників для кожного автора
        SELECT 
            A.Id AS Autor_Id,
            U.Name AS Autor_Name,
            COUNT(AF.Id) AS Total_Fans
        FROM Autor_fans AF
        JOIN Users U ON AF.Autor_id = U.Id
        JOIN Users A ON AF.Autor_id = A.Id
        GROUP BY A.Id, U.Name
        ORDER BY Total_Fans DESC;
    END
    ELSE
    BEGIN
        -- Кількість підписників для кожного автора за певний місяць та рік
        SELECT 
            A.Id AS Autor_Id,
            U.Name AS Autor_Name,
            COUNT(AF.Id) AS Fans_In_Month
        FROM Autor_fans AF
        JOIN Users U ON AF.Autor_id = U.Id
        JOIN Users A ON AF.Autor_id = A.Id
        WHERE MONTH(AF.Fan_date) = @Month AND YEAR(AF.Fan_date) = @Year
        GROUP BY A.Id, U.Name
        ORDER BY Fans_In_Month DESC;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[GetStoriesStatistics]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStoriesStatistics]
    @Month INT = NULL,
    @Year INT = NULL
AS
BEGIN
    IF @Month IS NULL OR @Year IS NULL
    BEGIN
        -- Загальна кількість історій за весь період
        SELECT COUNT(*) AS Total_Stories_Written
        FROM Stories;
    END
    ELSE
    BEGIN
        -- Кількість історій за вказаний місяць та рік
        SELECT COUNT(*) AS Stories_Written_In_Month
        FROM Stories
        WHERE MONTH(Created_date) = @Month AND YEAR(Created_date) = @Year;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[GetStoryComments]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStoryComments]
    @StoryId INT
AS
BEGIN
    SELECT c.Message, c.Created_date, u.Name AS UserName
    FROM Coments c
    JOIN Users u ON c.User_id = u.Id
    WHERE c.Story_id = @StoryId
    ORDER BY c.Created_date ASC;
END;

GO
/****** Object:  StoredProcedure [dbo].[GetStoryDetails]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStoryDetails]
AS
BEGIN
    SELECT Stories.Story_name, 
           Stories.About_story, 
           Users.Name AS Author_Name, 
           Categories.Category_name
    FROM Stories
    JOIN Users ON Stories.Autor_id = Users.Id
    JOIN Categories ON Stories.Category_id = Categories.Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetStoryLikesStatistics]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStoryLikesStatistics]
    @Month INT = NULL,
    @Year INT = NULL
AS
BEGIN
    IF @Month IS NULL OR @Year IS NULL
    BEGIN
        -- Загальна кількість лайків по історіях
        SELECT 
            Id AS StoryId,
            Story_name AS StoryTitle,
            SUM(Main_likes) AS Total_Likes
        FROM Stories
        GROUP BY Id, Story_name;
    END
    ELSE
    BEGIN
        -- Кількість лайків по історіях за певний місяць та рік
        SELECT 
            Id AS StoryId,
            Story_name AS StoryTitle,
            SUM(Main_likes) AS Likes_In_Month
        FROM Stories
        WHERE MONTH(Created_date) = @Month AND YEAR(Created_date) = @Year
        GROUP BY Id, Story_name;
    END
END;


GO
/****** Object:  StoredProcedure [dbo].[GetStorySections]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStorySections]
    @StoryId INT
AS
BEGIN
    SELECT s.Section_name, s.Section_text_file, s.Created_date, s.Watches
    FROM Sections s
    WHERE s.Story_id = @StoryId
    ORDER BY s.Created_date ASC;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetTop10Authors]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTop10Authors]
AS
BEGIN
    WITH AuthorStats AS (
        -- Підрахуємо сумарні лайки та перегляди для кожного автора
        SELECT 
            S.Autor_id,                     -- Ідентифікатор автора
            U.Name AS Autor_Name,           -- Ім'я автора
            ISNULL(SUM(S.Main_likes), 0) AS Total_Likes,   -- Підсумок лайків
            ISNULL(SUM(S.Main_watches), 0) AS Total_Watches  -- Підсумок переглядів
        FROM Stories S
        JOIN Users U ON S.Autor_id = U.Id
        GROUP BY S.Autor_id, U.Name
    )
    -- Тепер додаємо кількість фанатів до підсумків
    SELECT 
        A.Autor_id,
        A.Autor_Name,
        ISNULL(COUNT(DISTINCT AF.Id), 0) AS Total_Fans,  -- Підсумок фанатів
        A.Total_Likes,
        A.Total_Watches
    FROM AuthorStats A
    LEFT JOIN Autor_fans AF ON A.Autor_id = AF.Autor_id  -- З'єднуємо з таблицею фанатів
    GROUP BY A.Autor_id, A.Autor_Name, A.Total_Likes, A.Total_Watches
    ORDER BY Total_Fans DESC,  -- Спочатку сортуємо за кількістю фанатів
             Total_Likes DESC,  -- Потім сортуємо за лайками
             Total_Watches DESC  -- І сортуємо за переглядами
    OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;  -- Повертаємо тільки топ 10 авторів
END
GO
/****** Object:  StoredProcedure [dbo].[GetTop10StoriesByViews]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTop10StoriesByViews]
AS
BEGIN
    SELECT TOP 10
        s.Id,
        s.Story_name,
        s.About_story,
        s.Created_date,
        s.Main_likes,
        s.Main_watches
    FROM Stories s
    ORDER BY s.Main_watches DESC, s.Main_likes DESC;
END;

GO
/****** Object:  StoredProcedure [dbo].[GetUserFollowedStories]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserFollowedStories]
    @UserId INT
AS
BEGIN
    SELECT s.Story_name, fs.Follow_date
    FROM Follow_story fs
    JOIN Stories s ON fs.Story_id = s.Id
    WHERE fs.User_id = @UserId
    ORDER BY fs.Follow_date DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetUserRegistrationStatistics]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserRegistrationStatistics]
    @Month INT = NULL,
    @Year INT = NULL
AS
BEGIN
    IF @Month IS NULL OR @Year IS NULL
    BEGIN
        -- Загальна кількість користувачів за весь період
        SELECT COUNT(*) AS Total_Users_Registered
        FROM Users;
    END
    ELSE
    BEGIN
        -- Кількість користувачів за вказаний місяць та рік
        SELECT COUNT(*) AS Users_Registered_In_Month
        FROM Users
        WHERE MONTH(Registration_date) = @Month AND YEAR(Registration_date) = @Year;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateMainLikes]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateMainLikes]
AS
BEGIN
    UPDATE Stories
    SET Main_likes = (
        SELECT COUNT(*)
        FROM follow_story
        WHERE follow_story.Story_id = Stories.Id
    );
END;

GO
/****** Object:  StoredProcedure [dbo].[UpdateMainWatches]    Script Date: 22.12.2024 19:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateMainWatches]
AS
BEGIN
    UPDATE Stories
    SET Main_watches = (
        SELECT ISNULL(SUM(s.Watches), 0)
        FROM Sections s
        WHERE s.Story_id = Stories.Id
    );
END;
GO
USE [master]
GO
ALTER DATABASE [stories_site] SET  READ_WRITE 
GO
