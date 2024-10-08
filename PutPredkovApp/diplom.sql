USE [master]
GO
/****** Object:  Database [Diplom]    Script Date: 11.06.2024 22:02:56 ******/
CREATE DATABASE [Diplom]
 CONTAINMENT = NONE
 COLLATE Cyrillic_General_CI_AS
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Diplom] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Diplom].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Diplom] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Diplom] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Diplom] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Diplom] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Diplom] SET ARITHABORT OFF 
GO
ALTER DATABASE [Diplom] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Diplom] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Diplom] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Diplom] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Diplom] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Diplom] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Diplom] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Diplom] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Diplom] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Diplom] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Diplom] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Diplom] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Diplom] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Diplom] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Diplom] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Diplom] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Diplom] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Diplom] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Diplom] SET  MULTI_USER 
GO
ALTER DATABASE [Diplom] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Diplom] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Diplom] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Diplom] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Diplom] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Diplom] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Diplom] SET QUERY_STORE = ON
GO
ALTER DATABASE [Diplom] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Diplom]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11.06.2024 22:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Code] [int] NOT NULL,
	[Title] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommonUse]    Script Date: 11.06.2024 22:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommonUse](
	[ProductCode] [int] NOT NULL,
	[Quantity] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Status] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[CommonUseId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_CommonUse] PRIMARY KEY CLUSTERED 
(
	[CommonUseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 11.06.2024 22:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Name] [nvarchar](max) COLLATE Cyrillic_General_CI_AS NULL,
	[PositionCode] [int] NULL,
	[JoiningDate] [date] NULL,
	[PhoneNumber] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[PassportDetails] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Address] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Birthday] [date] NULL,
	[IDEmpioyees] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[IDEmpioyees] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 11.06.2024 22:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[OrderNumber] [int] IDENTITY(1,1) NOT NULL,
	[InventoriNumberEquipment] [int] NOT NULL,
	[IDEmployee] [int] NULL,
	[DateInventory] [date] NULL,
	[BookValue] [money] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[OrderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryResult]    Script Date: 11.06.2024 22:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryResult](
	[InventoryResultId] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [text] COLLATE Cyrillic_General_CI_AS NULL,
	[CommonUseQuantity] [int] NULL,
	[PersonalUseQuantity] [int] NULL,
	[FullPrice] [float] NULL,
	[Result] [bit] NULL,
	[IDEmployee] [int] NULL,
	[DateTime] [datetime] NULL,
 CONSTRAINT [PK_InventoryResult] PRIMARY KEY CLUSTERED 
(
	[InventoryResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemsResultInventory]    Script Date: 11.06.2024 22:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemsResultInventory](
	[ItemsResultInventory] [int] IDENTITY(1,1) NOT NULL,
	[ResultId] [int] NULL,
	[InventoryResultId] [int] NULL,
 CONSTRAINT [PK_ItemsResultInventory] PRIMARY KEY CLUSTERED 
(
	[ItemsResultInventory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 11.06.2024 22:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[InventoryNumber] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[CategoryCode] [int] NOT NULL,
	[Cost] [float] NOT NULL,
	[DatePurchase] [date] NULL,
	[Manufacturer] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[ReceiptNumber] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[WriteOffsId] [int] NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[InventoryNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movement]    Script Date: 11.06.2024 22:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movement](
	[Code] [int] IDENTITY(1,1) NOT NULL,
	[MaterialCode] [int] NOT NULL,
	[EmployeesCode] [int] NOT NULL,
	[DateMovement] [date] NULL,
	[MovementStatus] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_Movement] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalUse]    Script Date: 11.06.2024 22:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalUse](
	[Name] [nvarchar](max) COLLATE Cyrillic_General_CI_AS NULL,
	[ProductCode] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[PersonslUse] [int] NOT NULL,
 CONSTRAINT [PK_PersonslUse] PRIMARY KEY CLUSTERED 
(
	[PersonslUse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 11.06.2024 22:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Code] [int] NOT NULL,
	[Title] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 11.06.2024 22:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[StatusCode] [int] NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[ResultDate] [datetime] NULL,
	[ResultName] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11.06.2024 22:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WriteOffs]    Script Date: 11.06.2024 22:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WriteOffs](
	[Code] [int] IDENTITY(1,1) NOT NULL,
	[MaterialCode] [int] NOT NULL,
	[DateWriteOff] [date] NULL,
	[Reason] [nvarchar](max) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_WriteOffs] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([Code], [Title]) VALUES (1, N'Оружие')
INSERT [dbo].[Categories] ([Code], [Title]) VALUES (2, N'Доспехи')
INSERT [dbo].[Categories] ([Code], [Title]) VALUES (3, N'Элементы защиты')
INSERT [dbo].[Categories] ([Code], [Title]) VALUES (4, N'Прочее')
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Name], [PositionCode], [JoiningDate], [PhoneNumber], [PassportDetails], [Address], [Birthday], [IDEmpioyees]) VALUES (N'Сидоров Иван Петрович', 100, CAST(N'1999-01-12' AS Date), N'89505422343', N'5467 987654', N'Курск, ул.Павлуновкого, 87', CAST(N'1979-12-03' AS Date), 1)
INSERT [dbo].[Employees] ([Name], [PositionCode], [JoiningDate], [PhoneNumber], [PassportDetails], [Address], [Birthday], [IDEmpioyees]) VALUES (N'Коровьев Дмитрий Иванович', 101, CAST(N'2005-12-12' AS Date), N'89787865645', N'3465 678905', N'Курск, ул.Дзержинского,2', CAST(N'1998-11-02' AS Date), 2)
INSERT [dbo].[Employees] ([Name], [PositionCode], [JoiningDate], [PhoneNumber], [PassportDetails], [Address], [Birthday], [IDEmpioyees]) VALUES (N'Пархоменко Наталья Сергеевна', 102, CAST(N'2012-12-31' AS Date), N'83458764875', N'8715 765123', N'Курск, ул.Радищева, 23,34', CAST(N'1991-05-04' AS Date), 3)
INSERT [dbo].[Employees] ([Name], [PositionCode], [JoiningDate], [PhoneNumber], [PassportDetails], [Address], [Birthday], [IDEmpioyees]) VALUES (N'Свиридова Светлана Алексеевна', 103, CAST(N'2000-07-16' AS Date), N'89009876565', N'8787 456976', N'Курск, Ул.Союзная,23,34', CAST(N'1988-07-07' AS Date), 4)
INSERT [dbo].[Employees] ([Name], [PositionCode], [JoiningDate], [PhoneNumber], [PassportDetails], [Address], [Birthday], [IDEmpioyees]) VALUES (N'Крылов Пётр Петрович', 104, CAST(N'1999-09-04' AS Date), N'89874565432', N'4567 876234', N'Курск, ул.Большевиков,97,54', CAST(N'1981-09-06' AS Date), 5)
INSERT [dbo].[Employees] ([Name], [PositionCode], [JoiningDate], [PhoneNumber], [PassportDetails], [Address], [Birthday], [IDEmpioyees]) VALUES (N'Перепёлкина Снежана Викторовна', 104, CAST(N'2017-09-07' AS Date), N'89765678553', N'6787 765432', N'Курск, ул.Сумская,98', CAST(N'1993-08-09' AS Date), 6)
INSERT [dbo].[Employees] ([Name], [PositionCode], [JoiningDate], [PhoneNumber], [PassportDetails], [Address], [Birthday], [IDEmpioyees]) VALUES (N'Курилин Леонид Александрович', 105, CAST(N'2018-05-06' AS Date), N'83457652396', N'1', N'Курск, ул.Ленина 20,34', CAST(N'1983-08-12' AS Date), 7)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (201, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (202, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (203, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (204, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (205, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (206, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (207, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (208, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (209, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (210, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (211, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (212, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (213, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (214, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (215, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (216, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (217, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (218, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (219, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (220, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (221, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (222, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (223, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (224, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (225, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (226, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (227, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (228, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (229, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (230, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (231, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (232, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (233, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (234, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (235, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (236, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (237, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (238, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (239, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (240, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (241, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (242, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (243, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (244, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (245, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (246, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (247, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (248, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (249, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (250, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (251, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (252, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (253, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (254, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (255, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (256, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (257, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (258, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (259, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (260, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1256, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 3)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1257, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1258, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1259, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1260, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1261, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 2)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1262, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1263, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1264, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 3)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1265, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1266, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 2)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1267, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1268, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1269, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1270, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1271, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 2)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1272, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1273, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1274, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1275, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1276, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1277, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1278, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1279, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1280, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1281, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1282, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1283, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1284, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1285, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1286, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 3)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1287, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1288, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1289, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1290, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1291, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1292, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1293, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1294, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
GO
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1295, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1296, 1, NULL, CAST(N'2024-05-17' AS Date), NULL, 2)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1297, 2, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1298, 3, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1299, 5, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1300, 6, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1301, 7, NULL, CAST(N'2024-05-17' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1302, 1, NULL, CAST(N'2024-05-18' AS Date), NULL, 2)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1303, 2, NULL, CAST(N'2024-05-18' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1304, 3, NULL, CAST(N'2024-05-18' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1305, 5, NULL, CAST(N'2024-05-18' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1306, 6, NULL, CAST(N'2024-05-18' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1307, 7, NULL, CAST(N'2024-05-18' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1308, 1, NULL, CAST(N'2024-05-18' AS Date), NULL, 2)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1309, 2, NULL, CAST(N'2024-05-18' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1310, 3, NULL, CAST(N'2024-05-18' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1311, 5, NULL, CAST(N'2024-05-18' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1312, 6, NULL, CAST(N'2024-05-18' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1313, 7, NULL, CAST(N'2024-05-18' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1314, 1, NULL, CAST(N'2024-06-07' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1315, 2, NULL, CAST(N'2024-06-07' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1316, 3, NULL, CAST(N'2024-06-07' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1317, 5, NULL, CAST(N'2024-06-07' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1318, 6, NULL, CAST(N'2024-06-07' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1319, 7, NULL, CAST(N'2024-06-07' AS Date), NULL, 2)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1320, 1, NULL, CAST(N'2024-06-11' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1321, 2, NULL, CAST(N'2024-06-11' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1322, 3, NULL, CAST(N'2024-06-11' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1323, 4, NULL, CAST(N'2024-06-11' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1324, 5, NULL, CAST(N'2024-06-11' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1325, 6, NULL, CAST(N'2024-06-11' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1326, 7, NULL, CAST(N'2024-06-11' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1327, 1, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1328, 2, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1329, 3, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1330, 4, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1331, 5, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1332, 6, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1333, 7, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1334, 1, NULL, CAST(N'2024-06-11' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1335, 2, NULL, CAST(N'2024-06-11' AS Date), NULL, 3)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1336, 3, NULL, CAST(N'2024-06-11' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1337, 4, NULL, CAST(N'2024-06-11' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1338, 5, NULL, CAST(N'2024-06-11' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1339, 6, NULL, CAST(N'2024-06-11' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1340, 7, NULL, CAST(N'2024-06-11' AS Date), NULL, 0)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1341, 1, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1342, 2, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1343, 3, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1344, 4, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1345, 5, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1346, 6, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1347, 7, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1348, 1, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1349, 2, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1350, 3, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1351, 4, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1352, 5, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1353, 6, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1354, 7, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1355, 1, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1356, 2, NULL, CAST(N'2024-06-11' AS Date), NULL, 2)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1357, 3, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1358, 4, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1359, 5, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1360, 6, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
INSERT [dbo].[Inventory] ([OrderNumber], [InventoriNumberEquipment], [IDEmployee], [DateInventory], [BookValue], [Quantity]) VALUES (1361, 7, NULL, CAST(N'2024-06-11' AS Date), NULL, 1)
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
SET IDENTITY_INSERT [dbo].[InventoryResult] ON 

INSERT [dbo].[InventoryResult] ([InventoryResultId], [Reason], [CommonUseQuantity], [PersonalUseQuantity], [FullPrice], [Result], [IDEmployee], [DateTime]) VALUES (1064, N'Плановая инвентаризация', NULL, NULL, NULL, 0, 1, CAST(N'2024-06-11T21:57:15.997' AS DateTime))
INSERT [dbo].[InventoryResult] ([InventoryResultId], [Reason], [CommonUseQuantity], [PersonalUseQuantity], [FullPrice], [Result], [IDEmployee], [DateTime]) VALUES (1065, N'Плановая инвентаризация', NULL, NULL, NULL, 1, 1, CAST(N'2024-06-11T21:57:28.863' AS DateTime))
INSERT [dbo].[InventoryResult] ([InventoryResultId], [Reason], [CommonUseQuantity], [PersonalUseQuantity], [FullPrice], [Result], [IDEmployee], [DateTime]) VALUES (1066, N'Плановая инвентаризация', NULL, NULL, NULL, 0, 1, CAST(N'2024-06-11T21:57:36.667' AS DateTime))
INSERT [dbo].[InventoryResult] ([InventoryResultId], [Reason], [CommonUseQuantity], [PersonalUseQuantity], [FullPrice], [Result], [IDEmployee], [DateTime]) VALUES (1067, N'Плановая инвентаризация', NULL, NULL, NULL, 1, 1, CAST(N'2024-06-11T21:57:51.817' AS DateTime))
INSERT [dbo].[InventoryResult] ([InventoryResultId], [Reason], [CommonUseQuantity], [PersonalUseQuantity], [FullPrice], [Result], [IDEmployee], [DateTime]) VALUES (1068, N'Плановая инвентаризация', NULL, NULL, NULL, 0, 1, CAST(N'2024-06-11T21:58:47.043' AS DateTime))
INSERT [dbo].[InventoryResult] ([InventoryResultId], [Reason], [CommonUseQuantity], [PersonalUseQuantity], [FullPrice], [Result], [IDEmployee], [DateTime]) VALUES (1069, N'Плановая инвентаризация', NULL, NULL, NULL, 1, 1, CAST(N'2024-06-11T21:58:57.657' AS DateTime))
SET IDENTITY_INSERT [dbo].[InventoryResult] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemsResultInventory] ON 

INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1310, 1315, 1064)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1311, 1316, 1064)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1312, 1317, 1064)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1313, 1318, 1064)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1314, 1319, 1064)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1315, 1320, 1064)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1316, 1321, 1064)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1317, 1322, 1065)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1318, 1323, 1065)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1319, 1324, 1065)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1320, 1325, 1065)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1321, 1326, 1065)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1322, 1327, 1065)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1323, 1328, 1065)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1324, 1329, 1066)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1325, 1330, 1066)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1326, 1331, 1066)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1327, 1332, 1066)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1328, 1333, 1066)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1329, 1334, 1066)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1330, 1335, 1066)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1331, 1336, 1067)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1332, 1337, 1067)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1333, 1338, 1067)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1334, 1339, 1067)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1335, 1340, 1067)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1336, 1341, 1067)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1337, 1342, 1067)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1338, 1343, 1068)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1339, 1344, 1068)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1340, 1345, 1068)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1341, 1346, 1068)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1342, 1347, 1068)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1343, 1348, 1068)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1344, 1349, 1068)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1345, 1350, 1069)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1346, 1351, 1069)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1347, 1352, 1069)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1348, 1353, 1069)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1349, 1354, 1069)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1350, 1355, 1069)
INSERT [dbo].[ItemsResultInventory] ([ItemsResultInventory], [ResultId], [InventoryResultId]) VALUES (1351, 1356, 1069)
SET IDENTITY_INSERT [dbo].[ItemsResultInventory] OFF
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([InventoryNumber], [Name], [CategoryCode], [Cost], [DatePurchase], [Manufacturer], [ReceiptNumber], [WriteOffsId], [EmployeeId]) VALUES (1, N'Меч новейший', 1, 15000, CAST(N'2020-05-10' AS Date), N'ООО "Альбинос"', N'543543', NULL, 1)
INSERT [dbo].[Material] ([InventoryNumber], [Name], [CategoryCode], [Cost], [DatePurchase], [Manufacturer], [ReceiptNumber], [WriteOffsId], [EmployeeId]) VALUES (2, N'Алебарда', 1, 12322, CAST(N'2000-04-12' AS Date), N'ООО "Плохие товары"', N'534888', 1, NULL)
INSERT [dbo].[Material] ([InventoryNumber], [Name], [CategoryCode], [Cost], [DatePurchase], [Manufacturer], [ReceiptNumber], [WriteOffsId], [EmployeeId]) VALUES (3, N'Кольчуга', 2, 6000, CAST(N'2023-05-12' AS Date), N'ООО "Трейд Рус"', N'765333', NULL, NULL)
INSERT [dbo].[Material] ([InventoryNumber], [Name], [CategoryCode], [Cost], [DatePurchase], [Manufacturer], [ReceiptNumber], [WriteOffsId], [EmployeeId]) VALUES (4, N'Шлем', 2, 15000, CAST(N'2021-05-12' AS Date), N'ООО "Альбинос"', N'654756', NULL, NULL)
INSERT [dbo].[Material] ([InventoryNumber], [Name], [CategoryCode], [Cost], [DatePurchase], [Manufacturer], [ReceiptNumber], [WriteOffsId], [EmployeeId]) VALUES (5, N'Клей ПВА', 4, 1000, CAST(N'2021-05-12' AS Date), N'ООО "Плохие товары"', N'665465', NULL, NULL)
INSERT [dbo].[Material] ([InventoryNumber], [Name], [CategoryCode], [Cost], [DatePurchase], [Manufacturer], [ReceiptNumber], [WriteOffsId], [EmployeeId]) VALUES (6, N'Нагрудник', 2, 6000, CAST(N'2021-05-12' AS Date), N'ООО "Альбинос"', N'654645', NULL, NULL)
INSERT [dbo].[Material] ([InventoryNumber], [Name], [CategoryCode], [Cost], [DatePurchase], [Manufacturer], [ReceiptNumber], [WriteOffsId], [EmployeeId]) VALUES (7, N'Пачка гвоздей(100шт)', 4, 1200, CAST(N'2024-05-16' AS Date), N'ООО "Гвоздь"', N'753533', NULL, NULL)
INSERT [dbo].[Material] ([InventoryNumber], [Name], [CategoryCode], [Cost], [DatePurchase], [Manufacturer], [ReceiptNumber], [WriteOffsId], [EmployeeId]) VALUES (9, N'Алебарда', 1, 12322, CAST(N'2022-04-12' AS Date), N'ООО "Плохие товары"', N'654677', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[Movement] ON 

INSERT [dbo].[Movement] ([Code], [MaterialCode], [EmployeesCode], [DateMovement], [MovementStatus]) VALUES (10, 3, 1, CAST(N'2024-05-15' AS Date), N'Перемещён в общее пользование')
INSERT [dbo].[Movement] ([Code], [MaterialCode], [EmployeesCode], [DateMovement], [MovementStatus]) VALUES (11, 3, 1, CAST(N'2024-05-15' AS Date), N'Перемещён в личное пользование')
INSERT [dbo].[Movement] ([Code], [MaterialCode], [EmployeesCode], [DateMovement], [MovementStatus]) VALUES (12, 3, 1, CAST(N'2024-05-15' AS Date), N'Перемещён в общее пользование')
INSERT [dbo].[Movement] ([Code], [MaterialCode], [EmployeesCode], [DateMovement], [MovementStatus]) VALUES (13, 6, 1, CAST(N'2024-05-19' AS Date), N'Перемещён в личное пользование')
INSERT [dbo].[Movement] ([Code], [MaterialCode], [EmployeesCode], [DateMovement], [MovementStatus]) VALUES (14, 6, 1, CAST(N'2024-05-19' AS Date), N'Списан')
SET IDENTITY_INSERT [dbo].[Movement] OFF
GO
INSERT [dbo].[Position] ([Code], [Title]) VALUES (100, N'Президент')
INSERT [dbo].[Position] ([Code], [Title]) VALUES (101, N'Кадровик')
INSERT [dbo].[Position] ([Code], [Title]) VALUES (102, N'PR-менеджер')
INSERT [dbo].[Position] ([Code], [Title]) VALUES (103, N'Заведующий складом')
INSERT [dbo].[Position] ([Code], [Title]) VALUES (104, N'Менеджер по закупкам')
INSERT [dbo].[Position] ([Code], [Title]) VALUES (105, N'Специалист по охране труда')
INSERT [dbo].[Position] ([Code], [Title]) VALUES (106, N'Плотник')
INSERT [dbo].[Position] ([Code], [Title]) VALUES (107, N'Ювелир')
INSERT [dbo].[Position] ([Code], [Title]) VALUES (108, N'Рабочий')
INSERT [dbo].[Position] ([Code], [Title]) VALUES (109, N'Водитель')
GO
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 206, 201, CAST(N'2024-05-17T02:36:14.953' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 207, 202, CAST(N'2024-05-17T02:36:14.953' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 208, 203, CAST(N'2024-05-17T02:36:14.953' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 209, 204, CAST(N'2024-05-17T02:36:14.953' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 210, 205, CAST(N'2024-05-17T02:36:14.953' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 211, 206, CAST(N'2024-05-17T02:37:15.433' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 212, 207, CAST(N'2024-05-17T02:37:15.433' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 213, 208, CAST(N'2024-05-17T02:37:15.433' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 214, 209, CAST(N'2024-05-17T02:37:15.433' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 215, 210, CAST(N'2024-05-17T02:37:15.433' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 216, 211, CAST(N'2024-05-17T02:38:26.693' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 217, 212, CAST(N'2024-05-17T02:38:26.693' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 218, 213, CAST(N'2024-05-17T02:38:26.693' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 219, 214, CAST(N'2024-05-17T02:38:26.693' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 220, 215, CAST(N'2024-05-17T02:38:26.693' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 221, 216, CAST(N'2024-05-17T02:42:14.523' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 222, 217, CAST(N'2024-05-17T02:42:14.523' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 223, 218, CAST(N'2024-05-17T02:42:14.523' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 224, 219, CAST(N'2024-05-17T02:42:14.523' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 225, 220, CAST(N'2024-05-17T02:42:14.523' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 226, 221, CAST(N'2024-05-17T02:46:25.423' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 227, 222, CAST(N'2024-05-17T02:46:25.423' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 228, 223, CAST(N'2024-05-17T02:46:25.423' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 229, 224, CAST(N'2024-05-17T02:46:25.423' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 230, 225, CAST(N'2024-05-17T02:46:25.423' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 231, 226, CAST(N'2024-05-17T02:47:13.150' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 232, 227, CAST(N'2024-05-17T02:47:13.150' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 233, 228, CAST(N'2024-05-17T02:47:13.150' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 234, 229, CAST(N'2024-05-17T02:47:13.150' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 235, 230, CAST(N'2024-05-17T02:47:13.150' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 236, 231, CAST(N'2024-05-17T02:53:50.957' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 237, 232, CAST(N'2024-05-17T02:53:50.957' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 238, 233, CAST(N'2024-05-17T02:53:50.957' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 239, 234, CAST(N'2024-05-17T02:53:50.957' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 240, 235, CAST(N'2024-05-17T02:53:50.957' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 241, 236, CAST(N'2024-05-17T02:54:54.393' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 242, 237, CAST(N'2024-05-17T02:54:54.393' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 243, 238, CAST(N'2024-05-17T02:54:54.393' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 244, 239, CAST(N'2024-05-17T02:54:54.393' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 245, 240, CAST(N'2024-05-17T02:54:54.393' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 246, 241, CAST(N'2024-05-17T02:55:30.870' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 247, 242, CAST(N'2024-05-17T02:55:30.870' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 248, 243, CAST(N'2024-05-17T02:55:30.870' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 249, 244, CAST(N'2024-05-17T02:55:30.870' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 250, 245, CAST(N'2024-05-17T02:55:30.870' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 251, 246, CAST(N'2024-05-17T02:55:52.583' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 252, 247, CAST(N'2024-05-17T02:55:52.583' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 253, 248, CAST(N'2024-05-17T02:55:52.583' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 254, 249, CAST(N'2024-05-17T02:55:52.583' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 255, 250, CAST(N'2024-05-17T02:55:52.583' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 256, 251, CAST(N'2024-05-17T03:54:06.907' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 257, 252, CAST(N'2024-05-17T03:54:06.907' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 258, 253, CAST(N'2024-05-17T03:54:06.907' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 259, 254, CAST(N'2024-05-17T03:54:06.907' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 260, 255, CAST(N'2024-05-17T03:54:06.907' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1256, 1251, CAST(N'2024-05-17T16:24:28.913' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1257, 1252, CAST(N'2024-05-17T16:24:28.913' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1258, 1253, CAST(N'2024-05-17T16:24:28.913' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1259, 1254, CAST(N'2024-05-17T16:24:28.913' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1260, 1255, CAST(N'2024-05-17T16:24:28.913' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1261, 1256, CAST(N'2024-05-17T16:29:29.040' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1262, 1257, CAST(N'2024-05-17T16:29:29.040' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1263, 1258, CAST(N'2024-05-17T16:29:29.040' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1264, 1259, CAST(N'2024-05-17T16:29:29.040' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1265, 1260, CAST(N'2024-05-17T16:29:29.040' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1266, 1261, CAST(N'2024-05-17T16:33:36.887' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1267, 1262, CAST(N'2024-05-17T16:33:36.887' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1268, 1263, CAST(N'2024-05-17T16:33:36.887' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1269, 1264, CAST(N'2024-05-17T16:33:36.887' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1270, 1265, CAST(N'2024-05-17T16:33:36.887' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1271, 1266, CAST(N'2024-05-17T16:34:08.427' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1272, 1267, CAST(N'2024-05-17T16:34:08.427' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1273, 1268, CAST(N'2024-05-17T16:34:08.427' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1274, 1269, CAST(N'2024-05-17T16:34:08.427' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1275, 1270, CAST(N'2024-05-17T16:34:08.427' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1276, 1271, CAST(N'2024-05-17T17:17:42.907' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1277, 1272, CAST(N'2024-05-17T17:17:42.907' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1278, 1273, CAST(N'2024-05-17T17:17:42.907' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1279, 1274, CAST(N'2024-05-17T17:17:42.907' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1280, 1275, CAST(N'2024-05-17T17:17:42.907' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1281, 1276, CAST(N'2024-05-17T17:18:54.133' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1282, 1277, CAST(N'2024-05-17T17:18:54.133' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1283, 1278, CAST(N'2024-05-17T17:18:54.133' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1284, 1279, CAST(N'2024-05-17T17:18:54.133' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1285, 1280, CAST(N'2024-05-17T17:18:54.133' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1286, 1281, CAST(N'2024-05-17T19:10:34.017' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1287, 1282, CAST(N'2024-05-17T19:10:34.017' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1288, 1283, CAST(N'2024-05-17T19:10:34.017' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1289, 1284, CAST(N'2024-05-17T19:10:34.017' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1290, 1285, CAST(N'2024-05-17T19:10:34.017' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1291, 1286, CAST(N'2024-05-17T19:11:33.420' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1292, 1287, CAST(N'2024-05-17T19:11:33.420' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1293, 1288, CAST(N'2024-05-17T19:11:33.420' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1294, 1289, CAST(N'2024-05-17T19:11:33.420' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1295, 1290, CAST(N'2024-05-17T19:11:33.420' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1296, 1291, CAST(N'2024-05-17T19:48:40.580' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1297, 1292, CAST(N'2024-05-17T19:48:40.580' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1298, 1293, CAST(N'2024-05-17T19:48:40.580' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1299, 1294, CAST(N'2024-05-17T19:48:40.580' AS DateTime), N'Кол-во совпадает')
GO
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1300, 1295, CAST(N'2024-05-17T19:48:40.580' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1301, 1296, CAST(N'2024-05-17T19:48:40.580' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1302, 1297, CAST(N'2024-05-18T04:06:37.877' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1303, 1298, CAST(N'2024-05-18T04:06:37.877' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1304, 1299, CAST(N'2024-05-18T04:06:37.877' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1305, 1300, CAST(N'2024-05-18T04:06:37.877' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1306, 1301, CAST(N'2024-05-18T04:06:37.877' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1307, 1302, CAST(N'2024-05-18T04:06:37.877' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1308, 1303, CAST(N'2024-05-18T04:15:25.147' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1309, 1304, CAST(N'2024-05-18T04:15:25.147' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1310, 1305, CAST(N'2024-05-18T04:15:25.147' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1311, 1306, CAST(N'2024-05-18T04:15:25.147' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1312, 1307, CAST(N'2024-05-18T04:15:25.147' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1313, 1308, CAST(N'2024-05-18T04:15:25.147' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1314, 1309, CAST(N'2024-06-07T20:05:49.440' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1315, 1310, CAST(N'2024-06-07T20:05:49.440' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1316, 1311, CAST(N'2024-06-07T20:05:49.440' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1317, 1312, CAST(N'2024-06-07T20:05:49.440' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1318, 1313, CAST(N'2024-06-07T20:05:49.440' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1319, 1314, CAST(N'2024-06-07T20:05:49.440' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1320, 1315, CAST(N'2024-06-11T21:57:15.997' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1321, 1316, CAST(N'2024-06-11T21:57:15.997' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1322, 1317, CAST(N'2024-06-11T21:57:15.997' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1323, 1318, CAST(N'2024-06-11T21:57:15.997' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1324, 1319, CAST(N'2024-06-11T21:57:15.997' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1325, 1320, CAST(N'2024-06-11T21:57:15.997' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1326, 1321, CAST(N'2024-06-11T21:57:15.997' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1327, 1322, CAST(N'2024-06-11T21:57:28.863' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1328, 1323, CAST(N'2024-06-11T21:57:28.863' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1329, 1324, CAST(N'2024-06-11T21:57:28.863' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1330, 1325, CAST(N'2024-06-11T21:57:28.863' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1331, 1326, CAST(N'2024-06-11T21:57:28.863' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1332, 1327, CAST(N'2024-06-11T21:57:28.863' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1333, 1328, CAST(N'2024-06-11T21:57:28.863' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1334, 1329, CAST(N'2024-06-11T21:57:36.667' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1335, 1330, CAST(N'2024-06-11T21:57:36.667' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1336, 1331, CAST(N'2024-06-11T21:57:36.667' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1337, 1332, CAST(N'2024-06-11T21:57:36.667' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1338, 1333, CAST(N'2024-06-11T21:57:36.667' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1339, 1334, CAST(N'2024-06-11T21:57:36.667' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1340, 1335, CAST(N'2024-06-11T21:57:36.667' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1341, 1336, CAST(N'2024-06-11T21:57:51.817' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1342, 1337, CAST(N'2024-06-11T21:57:51.817' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1343, 1338, CAST(N'2024-06-11T21:57:51.817' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1344, 1339, CAST(N'2024-06-11T21:57:51.817' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1345, 1340, CAST(N'2024-06-11T21:57:51.817' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1346, 1341, CAST(N'2024-06-11T21:57:51.817' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1347, 1342, CAST(N'2024-06-11T21:57:51.817' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1348, 1343, CAST(N'2024-06-11T21:58:47.043' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (2, 1349, 1344, CAST(N'2024-06-11T21:58:47.043' AS DateTime), N'Не совпадает кол-во')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1350, 1345, CAST(N'2024-06-11T21:58:47.043' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1351, 1346, CAST(N'2024-06-11T21:58:47.043' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1352, 1347, CAST(N'2024-06-11T21:58:47.043' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1353, 1348, CAST(N'2024-06-11T21:58:47.043' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1354, 1349, CAST(N'2024-06-11T21:58:47.043' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1355, 1350, CAST(N'2024-06-11T21:58:57.657' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1356, 1351, CAST(N'2024-06-11T21:58:57.657' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1357, 1352, CAST(N'2024-06-11T21:58:57.657' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1358, 1353, CAST(N'2024-06-11T21:58:57.657' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1359, 1354, CAST(N'2024-06-11T21:58:57.657' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1360, 1355, CAST(N'2024-06-11T21:58:57.657' AS DateTime), N'Кол-во совпадает')
INSERT [dbo].[Result] ([StatusCode], [OrderNumber], [ResultId], [ResultDate], [ResultName]) VALUES (1, 1361, 1356, CAST(N'2024-06-11T21:58:57.657' AS DateTime), N'Кол-во совпадает')
SET IDENTITY_INSERT [dbo].[Result] OFF
GO
INSERT [dbo].[Status] ([Code], [Name]) VALUES (1, N'Прошёл')
INSERT [dbo].[Status] ([Code], [Name]) VALUES (2, N'Не прошёл')
GO
SET IDENTITY_INSERT [dbo].[WriteOffs] ON 

INSERT [dbo].[WriteOffs] ([Code], [MaterialCode], [DateWriteOff], [Reason]) VALUES (1, 2, CAST(N'2024-05-12' AS Date), N'Сломался')
INSERT [dbo].[WriteOffs] ([Code], [MaterialCode], [DateWriteOff], [Reason]) VALUES (2, 6, CAST(N'2024-05-19' AS Date), N'н реазон')
SET IDENTITY_INSERT [dbo].[WriteOffs] OFF
GO
ALTER TABLE [dbo].[CommonUse]  WITH CHECK ADD  CONSTRAINT [FK_CommonUse_Material] FOREIGN KEY([ProductCode])
REFERENCES [dbo].[Material] ([InventoryNumber])
GO
ALTER TABLE [dbo].[CommonUse] CHECK CONSTRAINT [FK_CommonUse_Material]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Position] FOREIGN KEY([PositionCode])
REFERENCES [dbo].[Position] ([Code])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Position]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Employees] FOREIGN KEY([IDEmployee])
REFERENCES [dbo].[Employees] ([IDEmpioyees])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Employees]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Material] FOREIGN KEY([InventoriNumberEquipment])
REFERENCES [dbo].[Material] ([InventoryNumber])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Material]
GO
ALTER TABLE [dbo].[InventoryResult]  WITH CHECK ADD  CONSTRAINT [FK_InventoryResult_Employees] FOREIGN KEY([IDEmployee])
REFERENCES [dbo].[Employees] ([IDEmpioyees])
GO
ALTER TABLE [dbo].[InventoryResult] CHECK CONSTRAINT [FK_InventoryResult_Employees]
GO
ALTER TABLE [dbo].[ItemsResultInventory]  WITH CHECK ADD  CONSTRAINT [FK_ItemsResultInventory_InventoryResult] FOREIGN KEY([InventoryResultId])
REFERENCES [dbo].[InventoryResult] ([InventoryResultId])
GO
ALTER TABLE [dbo].[ItemsResultInventory] CHECK CONSTRAINT [FK_ItemsResultInventory_InventoryResult]
GO
ALTER TABLE [dbo].[ItemsResultInventory]  WITH CHECK ADD  CONSTRAINT [FK_ItemsResultInventory_Result] FOREIGN KEY([ResultId])
REFERENCES [dbo].[Result] ([ResultId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemsResultInventory] CHECK CONSTRAINT [FK_ItemsResultInventory_Result]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Categories] FOREIGN KEY([CategoryCode])
REFERENCES [dbo].[Categories] ([Code])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Categories]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([IDEmpioyees])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Employees]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_WriteOffs] FOREIGN KEY([WriteOffsId])
REFERENCES [dbo].[WriteOffs] ([Code])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_WriteOffs]
GO
ALTER TABLE [dbo].[Movement]  WITH CHECK ADD  CONSTRAINT [FK_Movement_Employees] FOREIGN KEY([EmployeesCode])
REFERENCES [dbo].[Employees] ([IDEmpioyees])
GO
ALTER TABLE [dbo].[Movement] CHECK CONSTRAINT [FK_Movement_Employees]
GO
ALTER TABLE [dbo].[Movement]  WITH CHECK ADD  CONSTRAINT [FK_Movement_Material] FOREIGN KEY([MaterialCode])
REFERENCES [dbo].[Material] ([InventoryNumber])
GO
ALTER TABLE [dbo].[Movement] CHECK CONSTRAINT [FK_Movement_Material]
GO
ALTER TABLE [dbo].[PersonalUse]  WITH CHECK ADD  CONSTRAINT [FK_PersonslUse_Material] FOREIGN KEY([ProductCode])
REFERENCES [dbo].[Material] ([InventoryNumber])
GO
ALTER TABLE [dbo].[PersonalUse] CHECK CONSTRAINT [FK_PersonslUse_Material]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Inventory1] FOREIGN KEY([OrderNumber])
REFERENCES [dbo].[Inventory] ([OrderNumber])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Inventory1]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Status1] FOREIGN KEY([StatusCode])
REFERENCES [dbo].[Status] ([Code])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Status1]
GO
ALTER TABLE [dbo].[WriteOffs]  WITH CHECK ADD  CONSTRAINT [FK_WriteOffs_Material] FOREIGN KEY([MaterialCode])
REFERENCES [dbo].[Material] ([InventoryNumber])
GO
ALTER TABLE [dbo].[WriteOffs] CHECK CONSTRAINT [FK_WriteOffs_Material]
GO
USE [master]
GO
ALTER DATABASE [Diplom] SET  READ_WRITE 
GO
