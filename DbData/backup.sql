USE [master]
GO
/****** Object:  Database [kondi]    Script Date: 6/11/2024 3:50:01 PM ******/
CREATE DATABASE [kondi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kondi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\kondi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kondi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\kondi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [kondi] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kondi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kondi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kondi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kondi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kondi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kondi] SET ARITHABORT OFF 
GO
ALTER DATABASE [kondi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kondi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kondi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kondi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kondi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kondi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kondi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kondi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kondi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kondi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kondi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kondi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kondi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kondi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kondi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kondi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kondi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kondi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [kondi] SET  MULTI_USER 
GO
ALTER DATABASE [kondi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kondi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kondi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kondi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kondi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kondi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [kondi] SET QUERY_STORE = ON
GO
ALTER DATABASE [kondi] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [kondi]
GO
/****** Object:  Table [dbo].[ClimateTechTypes]    Script Date: 6/11/2024 3:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClimateTechTypes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ClimateTechTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/11/2024 3:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[MasterID] [bigint] NOT NULL,
	[RequestID] [bigint] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 6/11/2024 3:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NOT NULL,
	[ClimateTechTypeId] [bigint] NOT NULL,
	[ClimateTechModel] [nvarchar](200) NOT NULL,
	[ProblemDescryption] [nvarchar](500) NOT NULL,
	[RequestStatusId] [bigint] NOT NULL,
	[CompletionDate] [date] NULL,
	[RepairParts] [nvarchar](1000) NULL,
	[MasterId] [bigint] NULL,
	[ClientId] [bigint] NOT NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestStatuses]    Script Date: 6/11/2024 3:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestStatuses](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_RequestStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/11/2024 3:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[ThirdName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[UserTypeId] [bigint] NOT NULL,
 CONSTRAINT [PK_WorkRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 6/11/2024 3:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ClimateTechTypes] ON 

INSERT [dbo].[ClimateTechTypes] ([Id], [Name]) VALUES (1, N'Кондиционер')
INSERT [dbo].[ClimateTechTypes] ([Id], [Name]) VALUES (2, N'Увлажнитель воздуха')
INSERT [dbo].[ClimateTechTypes] ([Id], [Name]) VALUES (3, N'Сушилка для рук')
SET IDENTITY_INSERT [dbo].[ClimateTechTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Message], [MasterID], [RequestID]) VALUES (1, N'Всё сделаем!', 12, 1)
INSERT [dbo].[Comments] ([Id], [Message], [MasterID], [RequestID]) VALUES (2, N'Всё сделаем!', 13, 2)
INSERT [dbo].[Comments] ([Id], [Message], [MasterID], [RequestID]) VALUES (3, N'Починим в момент.', 13, 3)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Requests] ON 

INSERT [dbo].[Requests] ([Id], [StartDate], [ClimateTechTypeId], [ClimateTechModel], [ProblemDescryption], [RequestStatusId], [CompletionDate], [RepairParts], [MasterId], [ClientId]) VALUES (1, CAST(N'2023-06-06' AS Date), 1, N'TCL TAC-12CHSA/TPG-W белый', N'Не охлаждает воздух', 1, NULL, N'', 12, 16)
INSERT [dbo].[Requests] ([Id], [StartDate], [ClimateTechTypeId], [ClimateTechModel], [ProblemDescryption], [RequestStatusId], [CompletionDate], [RepairParts], [MasterId], [ClientId]) VALUES (2, CAST(N'2023-05-05' AS Date), 1, N'Electrolux EACS/I-09HAT/N3_21Y белый', N'Выключается сам по себе', 1, NULL, NULL, 13, 17)
INSERT [dbo].[Requests] ([Id], [StartDate], [ClimateTechTypeId], [ClimateTechModel], [ProblemDescryption], [RequestStatusId], [CompletionDate], [RepairParts], [MasterId], [ClientId]) VALUES (3, CAST(N'2022-07-07' AS Date), 2, N'Xiaomi Smart Humidifier 2', N'Пар имеет неприятный запах', 2, CAST(N'2023-01-01' AS Date), NULL, 13, 18)
INSERT [dbo].[Requests] ([Id], [StartDate], [ClimateTechTypeId], [ClimateTechModel], [ProblemDescryption], [RequestStatusId], [CompletionDate], [RepairParts], [MasterId], [ClientId]) VALUES (4, CAST(N'2023-08-02' AS Date), 2, N'Polaris PUH 2300 WIFI IQ Home', N'Увлажнитель воздуха продолжает работать при предельном снижении уровня воды', 3, NULL, NULL, NULL, 17)
INSERT [dbo].[Requests] ([Id], [StartDate], [ClimateTechTypeId], [ClimateTechModel], [ProblemDescryption], [RequestStatusId], [CompletionDate], [RepairParts], [MasterId], [ClientId]) VALUES (5, CAST(N'2023-08-02' AS Date), 3, N'Ballu BAHD-1250', N'Не работает', 3, NULL, NULL, NULL, 19)
SET IDENTITY_INSERT [dbo].[Requests] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestStatuses] ON 

INSERT [dbo].[RequestStatuses] ([Id], [Name]) VALUES (1, N'В процессе ремонта')
INSERT [dbo].[RequestStatuses] ([Id], [Name]) VALUES (2, N'Готова к выдаче')
INSERT [dbo].[RequestStatuses] ([Id], [Name]) VALUES (3, N'Новая заявка')
SET IDENTITY_INSERT [dbo].[RequestStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [ThirdName], [PhoneNumber], [Login], [Password], [UserTypeId]) VALUES (11, N'Широков ', N'Василий', N'Матвеевич', N'89210563128', N'login1', N'pass1', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [ThirdName], [PhoneNumber], [Login], [Password], [UserTypeId]) VALUES (12, N'Кудрявцева', N'Ева', N'Ивановна', N'89535078985', N'login2', N'pass2', 2)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [ThirdName], [PhoneNumber], [Login], [Password], [UserTypeId]) VALUES (13, N'Гончарова', N'Ульяна', N'Ярославовна', N'89210673849', N'login3', N'pass3', 2)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [ThirdName], [PhoneNumber], [Login], [Password], [UserTypeId]) VALUES (14, N'Гусева', N'Виктория', N'Данииловна', N'89990563748', N'login4', N'pass4', 3)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [ThirdName], [PhoneNumber], [Login], [Password], [UserTypeId]) VALUES (15, N'Баранов', N'Артём', N'Юрьевич', N'89994563847', N'login5', N'pass5', 3)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [ThirdName], [PhoneNumber], [Login], [Password], [UserTypeId]) VALUES (16, N'Овчинников', N'Фёдор', N'Никитич', N'89219567849', N'login6', N'pass6', 4)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [ThirdName], [PhoneNumber], [Login], [Password], [UserTypeId]) VALUES (17, N'Петров', N'Никита', N'Артёмович', N'89219567841', N'login7', N'pass7', 4)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [ThirdName], [PhoneNumber], [Login], [Password], [UserTypeId]) VALUES (18, N'Ковалева', N'Софья', N'Владимировна', N'89219567842', N'login8', N'pass8', 4)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [ThirdName], [PhoneNumber], [Login], [Password], [UserTypeId]) VALUES (19, N'Кузнецов', N'Сергей', N'Матвеевич', N'89219567843', N'login9', N'pass9', 4)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [ThirdName], [PhoneNumber], [Login], [Password], [UserTypeId]) VALUES (20, N'Беспалова', N'Екатерина', N'Даниэльевна', N'89219567844', N'login10', N'pass10', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (1, N'Менеджер')
INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (2, N'Специалист')
INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (3, N'Оператор')
INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (4, N'Заказчик')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Requests] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Requests] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Requests]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([MasterID])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_ClimateTechTypes] FOREIGN KEY([ClimateTechTypeId])
REFERENCES [dbo].[ClimateTechTypes] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_ClimateTechTypes]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_RequestStatuses] FOREIGN KEY([RequestStatusId])
REFERENCES [dbo].[RequestStatuses] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_RequestStatuses]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users] FOREIGN KEY([MasterId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users1] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypes] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypes] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypes]
GO
USE [master]
GO
ALTER DATABASE [kondi] SET  READ_WRITE 
GO
