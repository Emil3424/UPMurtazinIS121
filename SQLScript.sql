USE [master]
GO
/****** Object:  Database [CoffeeDBMurtazin]    Script Date: 03.06.2025 0:38:54 ******/
CREATE DATABASE [CoffeeDBMurtazin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoffeeDBMurtazin', FILENAME = N'C:\Users\Emil\CoffeeDBMurtazin.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CoffeeDBMurtazin_log', FILENAME = N'C:\Users\Emil\CoffeeDBMurtazin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CoffeeDBMurtazin] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoffeeDBMurtazin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoffeeDBMurtazin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET  MULTI_USER 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoffeeDBMurtazin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CoffeeDBMurtazin] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CoffeeDBMurtazin] SET QUERY_STORE = OFF
GO
USE [CoffeeDBMurtazin]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](100) NULL,
	[PositionID] [int] NULL,
	[Phone] [nvarchar](25) NULL,
	[Email] [nvarchar](100) NULL,
	[HireDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[IngredientsName] [nvarchar](50) NOT NULL,
	[TypeIngredients] [nvarchar](50) NULL,
	[UnitOfMeasurement] [nvarchar](5) NULL,
	[KolichSklad] [decimal](18, 2) NULL,
	[MinimKolich] [int] NULL,
	[KolichUpakovka] [int] NULL,
	[CostForOne] [int] NULL,
	[Description] [nvarchar](100) NULL,
	[ExpirationDate] [datetime] NULL,
	[IngredientID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED 
(
	[IngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngredientSupplier]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientSupplier](
	[IngredientID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[IDIngredientSupplier] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_IngredientSupplier] PRIMARY KEY CLUSTERED 
(
	[IDIngredientSupplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryAlerts]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryAlerts](
	[AlertID] [int] IDENTITY(1,1) NOT NULL,
	[AlertDate] [datetime] NOT NULL,
	[IsResolved] [bit] NOT NULL,
	[ResolvedBy] [int] NULL,
	[ResolvedDate] [datetime] NULL,
	[IngredientID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AlertID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryTransactions]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryTransactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Quantity] [decimal](10, 2) NOT NULL,
	[TransactionType] [nvarchar](20) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ExpirationDate] [date] NULL,
	[IDSIngredienupplier] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuCategories]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItems](
	[MenuItemID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ItemName] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
	[ImagePath] [nvarchar](255) NULL,
	[Price] [decimal](10, 2) NULL,
	[Calories] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[MenuItemID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PriceOfOrder] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatuses](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PositionsEmployee]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PositionsEmployee](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK__Position__60BB9A5922B795D3] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipes]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipes](
	[RecipeID] [int] IDENTITY(1,1) NOT NULL,
	[MenuItemID] [int] NOT NULL,
	[Quantity] [decimal](10, 2) NOT NULL,
	[Instructions] [nvarchar](500) NULL,
	[IngredientID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Name] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](25) NULL,
	[YuridAdres] [nvarchar](100) NULL,
	[INN] [float] NULL,
	[FIO] [nvarchar](100) NULL,
	[Phone] [nvarchar](25) NULL,
	[Email] [nvarchar](100) NULL,
	[Logo] [nvarchar](100) NULL,
	[RatingReliability] [decimal](18, 2) NULL,
	[IDSuppliers] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[IDSuppliers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[TransactionType] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[TransactionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeIngredients]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeIngredients](
	[TypeIngredients] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeIngredients] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeSupplier]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeSupplier](
	[Type] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitOfMeasurement]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitOfMeasurement](
	[UnitOfMeasurement] [nvarchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitOfMeasurement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkSchedules]    Script Date: 03.06.2025 0:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkSchedules](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[WorkDate] [date] NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FIO], [PositionID], [Phone], [Email], [HireDate]) VALUES (1, N'Иванов Алексей Петрович', 1, N'+7(912)345-67-89', N'ivanov.ap@coffee.ru', CAST(N'2023-01-15' AS Date))
INSERT [dbo].[Employees] ([EmployeeID], [FIO], [PositionID], [Phone], [Email], [HireDate]) VALUES (2, N'Петрова Мария Сергеевна', 2, N'+7(923)456-78-90', N'petrova.ms@coffee.ru', CAST(N'2022-11-20' AS Date))
INSERT [dbo].[Employees] ([EmployeeID], [FIO], [PositionID], [Phone], [Email], [HireDate]) VALUES (3, N'Сидоров Дмитрий Иванович', 1, N'+7(934)567-89-01', N'sidorov.di@coffee.ru', CAST(N'2024-03-10' AS Date))
INSERT [dbo].[Employees] ([EmployeeID], [FIO], [PositionID], [Phone], [Email], [HireDate]) VALUES (4, N'Кузнецова Анна Владимировна', 3, N'+7(945)678-90-12', N'kuznetsova.av@coffee.ru', CAST(N'2021-09-05' AS Date))
INSERT [dbo].[Employees] ([EmployeeID], [FIO], [PositionID], [Phone], [Email], [HireDate]) VALUES (5, N'Васильев Игорь Николаевич', 4, N'+7(956)789-01-23', N'vasilev.in@coffee.ru', CAST(N'2023-07-22' AS Date))
INSERT [dbo].[Employees] ([EmployeeID], [FIO], [PositionID], [Phone], [Email], [HireDate]) VALUES (6, N'Николаева Елена Дмитриевна', 5, N'+7(967)890-12-34', N'nikolaeva.ed@coffee.ru', CAST(N'2022-05-18' AS Date))
INSERT [dbo].[Employees] ([EmployeeID], [FIO], [PositionID], [Phone], [Email], [HireDate]) VALUES (7, N'Федоров Павел Андреевич', 6, N'+7(978)901-23-45', N'fedorov.pa@coffee.ru', CAST(N'2024-01-30' AS Date))
INSERT [dbo].[Employees] ([EmployeeID], [FIO], [PositionID], [Phone], [Email], [HireDate]) VALUES (8, N'Морозова Ольга Игоревна', 7, N'+7(989)012-34-56', N'morozova.oi@coffee.ru', CAST(N'2023-08-14' AS Date))
INSERT [dbo].[Employees] ([EmployeeID], [FIO], [PositionID], [Phone], [Email], [HireDate]) VALUES (9, N'Григорьев Артем Викторович', 8, N'+7(990)123-45-67', N'grigoriev.av@coffee.ru', CAST(N'2022-12-01' AS Date))
INSERT [dbo].[Employees] ([EmployeeID], [FIO], [PositionID], [Phone], [Email], [HireDate]) VALUES (10, N'Белова Татьяна Александровна', 1, N'+7(901)234-56-78', N'belova.ta@coffee.ru', CAST(N'2024-02-25' AS Date))
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingredients] ON 

INSERT [dbo].[Ingredients] ([IngredientsName], [TypeIngredients], [UnitOfMeasurement], [KolichSklad], [MinimKolich], [KolichUpakovka], [CostForOne], [Description], [ExpirationDate], [IngredientID]) VALUES (N'Корица молотаяЯЯ', N'Специи', N'кг', CAST(0.90 AS Decimal(18, 2)), 4, 1, 1200, N'Ароматная молотая корица', CAST(N'2026-03-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Ingredients] ([IngredientsName], [TypeIngredients], [UnitOfMeasurement], [KolichSklad], [MinimKolich], [KolichUpakovka], [CostForOne], [Description], [ExpirationDate], [IngredientID]) VALUES (N'Кофе арабика БразилиЯААА', N'Сиропы', N'кг', CAST(4.00 AS Decimal(18, 2)), 10, 5, 1500, N'Ароматный кофе с насыщенным вкусом', CAST(N'2025-12-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Ingredients] ([IngredientsName], [TypeIngredients], [UnitOfMeasurement], [KolichSklad], [MinimKolich], [KolichUpakovka], [CostForOne], [Description], [ExpirationDate], [IngredientID]) VALUES (N'Молоко 3.2%', N'Молочные продукты', N'л', CAST(22.00 AS Decimal(18, 2)), 15, 10, 85, N'Пастеризованное молоко средней жирности', CAST(N'2025-06-10T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Ingredients] ([IngredientsName], [TypeIngredients], [UnitOfMeasurement], [KolichSklad], [MinimKolich], [KolichUpakovka], [CostForOne], [Description], [ExpirationDate], [IngredientID]) VALUES (N'Мука пшеничнаяЯ', N'Сыпучие продукты', N'кг', CAST(18.00 AS Decimal(18, 2)), 25, 25, 55, N'Мука высшего сорта для выпечки', CAST(N'2026-06-30T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Ingredients] ([IngredientsName], [TypeIngredients], [UnitOfMeasurement], [KolichSklad], [MinimKolich], [KolichUpakovka], [CostForOne], [Description], [ExpirationDate], [IngredientID]) VALUES (N'Сахар-песок', N'Сыпучие продукты', N'кг', CAST(15.00 AS Decimal(18, 2)), 20, 25, 65, N'Белый кристаллический сахар', CAST(N'2026-12-31T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Ingredients] ([IngredientsName], [TypeIngredients], [UnitOfMeasurement], [KolichSklad], [MinimKolich], [KolichUpakovka], [CostForOne], [Description], [ExpirationDate], [IngredientID]) VALUES (N'Сироп ванильный', N'Сиропы', N'л', CAST(1.80 AS Decimal(18, 2)), 3, 1, 450, N'Сладкий сироп с ароматом ванили', CAST(N'2026-01-15T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Ingredients] ([IngredientsName], [TypeIngredients], [UnitOfMeasurement], [KolichSklad], [MinimKolich], [KolichUpakovka], [CostForOne], [Description], [ExpirationDate], [IngredientID]) VALUES (N'Шоколад темный', N'Десертные ингредиенты', N'кг', CAST(3.20 AS Decimal(18, 2)), 5, 5, 320, N'Горький шоколад для десертов', CAST(N'2025-11-20T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Ingredients] ([IngredientsName], [TypeIngredients], [UnitOfMeasurement], [KolichSklad], [MinimKolich], [KolichUpakovka], [CostForOne], [Description], [ExpirationDate], [IngredientID]) VALUES (N'Яйца куриные', N'Свежие продукты', N'шт', CAST(45.00 AS Decimal(18, 2)), 60, 30, 12, N'Свежие куриные яйца, отборная категория', CAST(N'2025-06-05T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Ingredients] ([IngredientsName], [TypeIngredients], [UnitOfMeasurement], [KolichSklad], [MinimKolich], [KolichUpakovka], [CostForOne], [Description], [ExpirationDate], [IngredientID]) VALUES (N'Новый ингредиецукцукцунт', N'Сиропы', N'кг', CAST(4.53 AS Decimal(18, 2)), 30, 1, 3, NULL, CAST(N'2025-12-02T10:24:27.013' AS DateTime), 2015)
INSERT [dbo].[Ingredients] ([IngredientsName], [TypeIngredients], [UnitOfMeasurement], [KolichSklad], [MinimKolich], [KolichUpakovka], [CostForOne], [Description], [ExpirationDate], [IngredientID]) VALUES (N'Новый ингредие232нт', N'Специи', N'кг', CAST(0.00 AS Decimal(18, 2)), 0, 1, 0, NULL, CAST(N'2025-12-02T10:49:25.440' AS DateTime), 2016)
SET IDENTITY_INSERT [dbo].[Ingredients] OFF
GO
SET IDENTITY_INSERT [dbo].[IngredientSupplier] ON 

INSERT [dbo].[IngredientSupplier] ([IngredientID], [SupplierID], [IDIngredientSupplier]) VALUES (1, 1, 1)
INSERT [dbo].[IngredientSupplier] ([IngredientID], [SupplierID], [IDIngredientSupplier]) VALUES (2, 3, 2)
INSERT [dbo].[IngredientSupplier] ([IngredientID], [SupplierID], [IDIngredientSupplier]) VALUES (2, 4, 3)
INSERT [dbo].[IngredientSupplier] ([IngredientID], [SupplierID], [IDIngredientSupplier]) VALUES (3, 5, 4)
INSERT [dbo].[IngredientSupplier] ([IngredientID], [SupplierID], [IDIngredientSupplier]) VALUES (4, 2, 5)
INSERT [dbo].[IngredientSupplier] ([IngredientID], [SupplierID], [IDIngredientSupplier]) VALUES (7, 2, 6)
INSERT [dbo].[IngredientSupplier] ([IngredientID], [SupplierID], [IDIngredientSupplier]) VALUES (7, 3, 7)
INSERT [dbo].[IngredientSupplier] ([IngredientID], [SupplierID], [IDIngredientSupplier]) VALUES (8, 1, 8)
INSERT [dbo].[IngredientSupplier] ([IngredientID], [SupplierID], [IDIngredientSupplier]) VALUES (9, 1, 9)
INSERT [dbo].[IngredientSupplier] ([IngredientID], [SupplierID], [IDIngredientSupplier]) VALUES (10, 5, 10)
SET IDENTITY_INSERT [dbo].[IngredientSupplier] OFF
GO
SET IDENTITY_INSERT [dbo].[InventoryAlerts] ON 

INSERT [dbo].[InventoryAlerts] ([AlertID], [AlertDate], [IsResolved], [ResolvedBy], [ResolvedDate], [IngredientID]) VALUES (1, CAST(N'2025-04-10T09:00:00.000' AS DateTime), 1, 2, CAST(N'2025-04-10T11:30:00.000' AS DateTime), 1)
INSERT [dbo].[InventoryAlerts] ([AlertID], [AlertDate], [IsResolved], [ResolvedBy], [ResolvedDate], [IngredientID]) VALUES (2, CAST(N'2025-04-15T14:00:00.000' AS DateTime), 1, 2, CAST(N'2025-04-15T16:45:00.000' AS DateTime), 3)
INSERT [dbo].[InventoryAlerts] ([AlertID], [AlertDate], [IsResolved], [ResolvedBy], [ResolvedDate], [IngredientID]) VALUES (3, CAST(N'2025-04-20T10:30:00.000' AS DateTime), 1, 4, CAST(N'2025-04-20T12:15:00.000' AS DateTime), 8)
INSERT [dbo].[InventoryAlerts] ([AlertID], [AlertDate], [IsResolved], [ResolvedBy], [ResolvedDate], [IngredientID]) VALUES (4, CAST(N'2025-04-25T08:45:00.000' AS DateTime), 0, NULL, NULL, 10)
INSERT [dbo].[InventoryAlerts] ([AlertID], [AlertDate], [IsResolved], [ResolvedBy], [ResolvedDate], [IngredientID]) VALUES (5, CAST(N'2025-05-01T11:20:00.000' AS DateTime), 1, 2, CAST(N'2025-05-01T13:00:00.000' AS DateTime), 2)
INSERT [dbo].[InventoryAlerts] ([AlertID], [AlertDate], [IsResolved], [ResolvedBy], [ResolvedDate], [IngredientID]) VALUES (6, CAST(N'2025-05-05T15:30:00.000' AS DateTime), 0, NULL, NULL, 7)
INSERT [dbo].[InventoryAlerts] ([AlertID], [AlertDate], [IsResolved], [ResolvedBy], [ResolvedDate], [IngredientID]) VALUES (7, CAST(N'2025-05-10T09:15:00.000' AS DateTime), 1, 4, CAST(N'2025-05-10T10:45:00.000' AS DateTime), 9)
INSERT [dbo].[InventoryAlerts] ([AlertID], [AlertDate], [IsResolved], [ResolvedBy], [ResolvedDate], [IngredientID]) VALUES (8, CAST(N'2025-05-15T16:00:00.000' AS DateTime), 0, NULL, NULL, 4)
SET IDENTITY_INSERT [dbo].[InventoryAlerts] OFF
GO
SET IDENTITY_INSERT [dbo].[InventoryTransactions] ON 

INSERT [dbo].[InventoryTransactions] ([TransactionID], [TransactionDate], [Quantity], [TransactionType], [EmployeeID], [ExpirationDate], [IDSIngredienupplier]) VALUES (1, CAST(N'2025-04-01T10:00:00.000' AS DateTime), CAST(10.00 AS Decimal(10, 2)), N'Поступление', 2, CAST(N'2025-12-01' AS Date), 1)
INSERT [dbo].[InventoryTransactions] ([TransactionID], [TransactionDate], [Quantity], [TransactionType], [EmployeeID], [ExpirationDate], [IDSIngredienupplier]) VALUES (2, CAST(N'2025-04-02T08:30:00.000' AS DateTime), CAST(20.00 AS Decimal(10, 2)), N'Поступление', 2, CAST(N'2025-06-10' AS Date), 2)
INSERT [dbo].[InventoryTransactions] ([TransactionID], [TransactionDate], [Quantity], [TransactionType], [EmployeeID], [ExpirationDate], [IDSIngredienupplier]) VALUES (3, CAST(N'2025-04-03T11:15:00.000' AS DateTime), CAST(25.00 AS Decimal(10, 2)), N'Поступление', 4, CAST(N'2026-12-31' AS Date), 3)
INSERT [dbo].[InventoryTransactions] ([TransactionID], [TransactionDate], [Quantity], [TransactionType], [EmployeeID], [ExpirationDate], [IDSIngredienupplier]) VALUES (4, CAST(N'2025-04-10T12:00:00.000' AS DateTime), CAST(2.00 AS Decimal(10, 2)), N'Поступление', 2, CAST(N'2026-03-01' AS Date), 5)
INSERT [dbo].[InventoryTransactions] ([TransactionID], [TransactionDate], [Quantity], [TransactionType], [EmployeeID], [ExpirationDate], [IDSIngredienupplier]) VALUES (5, CAST(N'2025-04-16T09:00:00.000' AS DateTime), CAST(15.00 AS Decimal(10, 2)), N'Поступление', 2, CAST(N'2025-06-15' AS Date), 4)
INSERT [dbo].[InventoryTransactions] ([TransactionID], [TransactionDate], [Quantity], [TransactionType], [EmployeeID], [ExpirationDate], [IDSIngredienupplier]) VALUES (6, CAST(N'2025-04-20T13:00:00.000' AS DateTime), CAST(2.00 AS Decimal(10, 2)), N'Поступление', 4, CAST(N'2026-01-15' AS Date), 4)
INSERT [dbo].[InventoryTransactions] ([TransactionID], [TransactionDate], [Quantity], [TransactionType], [EmployeeID], [ExpirationDate], [IDSIngredienupplier]) VALUES (7, CAST(N'2025-05-01T14:00:00.000' AS DateTime), CAST(5.00 AS Decimal(10, 2)), N'Поступление', 2, CAST(N'2025-12-15' AS Date), 4)
INSERT [dbo].[InventoryTransactions] ([TransactionID], [TransactionDate], [Quantity], [TransactionType], [EmployeeID], [ExpirationDate], [IDSIngredienupplier]) VALUES (8, CAST(N'2025-05-10T11:00:00.000' AS DateTime), CAST(3.00 AS Decimal(10, 2)), N'Поступление', 4, CAST(N'2025-11-20' AS Date), 5)
INSERT [dbo].[InventoryTransactions] ([TransactionID], [TransactionDate], [Quantity], [TransactionType], [EmployeeID], [ExpirationDate], [IDSIngredienupplier]) VALUES (9, CAST(N'2025-04-25T10:00:00.000' AS DateTime), CAST(30.00 AS Decimal(10, 2)), N'Списание', 2, NULL, 6)
INSERT [dbo].[InventoryTransactions] ([TransactionID], [TransactionDate], [Quantity], [TransactionType], [EmployeeID], [ExpirationDate], [IDSIngredienupplier]) VALUES (10, CAST(N'2025-05-15T17:00:00.000' AS DateTime), CAST(5.00 AS Decimal(10, 2)), N'Списание', 4, NULL, 7)
SET IDENTITY_INSERT [dbo].[InventoryTransactions] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuCategories] ON 

INSERT [dbo].[MenuCategories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Кофе', N'Различные виды кофейных напитков')
INSERT [dbo].[MenuCategories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Чай', N'Черный, зеленый и травяные чаи')
INSERT [dbo].[MenuCategories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Десерты', N'Домашние десерты и выпечка')
INSERT [dbo].[MenuCategories] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'Коктейли', N'Алкогольные и безалкогольные коктейли')
INSERT [dbo].[MenuCategories] ([CategoryID], [CategoryName], [Description]) VALUES (5, N'Завтраки', N'Утренние блюда и сэндвичи')
INSERT [dbo].[MenuCategories] ([CategoryID], [CategoryName], [Description]) VALUES (6, N'Сэндвичи', N'Горячие и холодные сэндвичи')
INSERT [dbo].[MenuCategories] ([CategoryID], [CategoryName], [Description]) VALUES (7, N'Салаты', N'Легкие и питательные салаты')
INSERT [dbo].[MenuCategories] ([CategoryID], [CategoryName], [Description]) VALUES (8, N'Специальные предложения', N'Сезонные и акционные позиции')
SET IDENTITY_INSERT [dbo].[MenuCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuItems] ON 

INSERT [dbo].[MenuItems] ([MenuItemID], [CategoryID], [ItemName], [Description], [ImagePath], [Price], [Calories]) VALUES (1, 1, N'Эспрессо', N'Классический крепкий кофе 30 мл', N'\images\espresso.jpg', CAST(150.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[MenuItems] ([MenuItemID], [CategoryID], [ItemName], [Description], [ImagePath], [Price], [Calories]) VALUES (2, 1, N'Американо', N'Эспрессо с добавлением горячей воды 120 мл', N'\images\americano.jpg', CAST(180.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[MenuItems] ([MenuItemID], [CategoryID], [ItemName], [Description], [ImagePath], [Price], [Calories]) VALUES (3, 1, N'Капучино', N'Эспрессо с молочной пеной 180 мл', N'\images\cappuccino.jpg', CAST(220.00 AS Decimal(10, 2)), 120)
INSERT [dbo].[MenuItems] ([MenuItemID], [CategoryID], [ItemName], [Description], [ImagePath], [Price], [Calories]) VALUES (4, 1, N'Латте', N'Эспрессо с большим количеством молока 250 мл', N'\images\latte.jpg', CAST(240.00 AS Decimal(10, 2)), 180)
INSERT [dbo].[MenuItems] ([MenuItemID], [CategoryID], [ItemName], [Description], [ImagePath], [Price], [Calories]) VALUES (5, 2, N'Черный чай', N'Классический черный чай с бергамотом 200 мл', N'\images\black_tea.jpg', CAST(120.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[MenuItems] ([MenuItemID], [CategoryID], [ItemName], [Description], [ImagePath], [Price], [Calories]) VALUES (6, 2, N'Зеленый чай', N'Ароматный зеленый чай с жасмином 200 мл', N'\images\green_tea.jpg', CAST(130.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[MenuItems] ([MenuItemID], [CategoryID], [ItemName], [Description], [ImagePath], [Price], [Calories]) VALUES (7, 3, N'Тирамису', N'Классический итальянский десерт', N'\images\tiramisu.jpg', CAST(320.00 AS Decimal(10, 2)), 350)
INSERT [dbo].[MenuItems] ([MenuItemID], [CategoryID], [ItemName], [Description], [ImagePath], [Price], [Calories]) VALUES (8, 3, N'Чизкейк', N'Нежный чизкейк с ягодным топпингом', N'\images\cheesecake.jpg', CAST(280.00 AS Decimal(10, 2)), 420)
INSERT [dbo].[MenuItems] ([MenuItemID], [CategoryID], [ItemName], [Description], [ImagePath], [Price], [Calories]) VALUES (9, 4, N'Мохито', N'Освежающий безалкогольный коктейль', N'\images\mojito.jpg', CAST(250.00 AS Decimal(10, 2)), 150)
INSERT [dbo].[MenuItems] ([MenuItemID], [CategoryID], [ItemName], [Description], [ImagePath], [Price], [Calories]) VALUES (10, 5, N'Завтрак бариста', N'Яичница с тостами и свежими овощами', N'\images\breakfast.jpg', CAST(350.00 AS Decimal(10, 2)), 450)
SET IDENTITY_INSERT [dbo].[MenuItems] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (1, 1, 1, 1, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (2, 1, 5, 1, CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (3, 1, 7, 1, CAST(320.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (4, 2, 3, 2, CAST(440.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (5, 3, 4, 1, CAST(240.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (6, 3, 8, 1, CAST(280.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (7, 3, 10, 1, CAST(350.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (8, 4, 2, 1, CAST(180.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (9, 4, 6, 1, CAST(130.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (10, 5, 3, 1, CAST(220.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (11, 5, 9, 1, CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (12, 6, 1, 2, CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (13, 7, 4, 2, CAST(480.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (14, 7, 7, 1, CAST(320.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (15, 8, 5, 1, CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (16, 8, 8, 1, CAST(280.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (17, 9, 3, 1, CAST(220.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (18, 10, 7, 1, CAST(320.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [MenuItemID], [Quantity], [PriceOfOrder]) VALUES (19, 10, 10, 1, CAST(350.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [OrderDate], [EmployeeID], [StatusID], [TotalAmount]) VALUES (1, CAST(N'2025-05-01T08:15:00.000' AS DateTime), 1, 4, CAST(370.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [EmployeeID], [StatusID], [TotalAmount]) VALUES (2, CAST(N'2025-05-01T09:30:00.000' AS DateTime), 3, 4, CAST(520.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [EmployeeID], [StatusID], [TotalAmount]) VALUES (3, CAST(N'2025-05-01T12:45:00.000' AS DateTime), 1, 4, CAST(750.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [EmployeeID], [StatusID], [TotalAmount]) VALUES (4, CAST(N'2025-05-02T10:20:00.000' AS DateTime), 3, 4, CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [EmployeeID], [StatusID], [TotalAmount]) VALUES (5, CAST(N'2025-05-02T14:10:00.000' AS DateTime), 10, 4, CAST(600.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [EmployeeID], [StatusID], [TotalAmount]) VALUES (6, CAST(N'2025-05-03T08:45:00.000' AS DateTime), 1, 4, CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [EmployeeID], [StatusID], [TotalAmount]) VALUES (7, CAST(N'2025-05-03T16:30:00.000' AS DateTime), 3, 4, CAST(940.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [EmployeeID], [StatusID], [TotalAmount]) VALUES (8, CAST(N'2025-05-04T11:15:00.000' AS DateTime), 10, 4, CAST(470.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [EmployeeID], [StatusID], [TotalAmount]) VALUES (9, CAST(N'2025-05-04T18:20:00.000' AS DateTime), 1, 4, CAST(220.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [EmployeeID], [StatusID], [TotalAmount]) VALUES (10, CAST(N'2025-05-05T09:50:00.000' AS DateTime), 3, 4, CAST(680.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatuses] ON 

INSERT [dbo].[OrderStatuses] ([StatusID], [StatusName], [Description]) VALUES (1, N'Новый', N'Заказ только создан и ожидает обработки')
INSERT [dbo].[OrderStatuses] ([StatusID], [StatusName], [Description]) VALUES (2, N'В процессе', N'Заказ готовится')
INSERT [dbo].[OrderStatuses] ([StatusID], [StatusName], [Description]) VALUES (3, N'Готов', N'Заказ готов к выдаче')
INSERT [dbo].[OrderStatuses] ([StatusID], [StatusName], [Description]) VALUES (4, N'Выдан', N'Заказ получен клиентом')
INSERT [dbo].[OrderStatuses] ([StatusID], [StatusName], [Description]) VALUES (5, N'Отменен', N'Заказ отменен')
INSERT [dbo].[OrderStatuses] ([StatusID], [StatusName], [Description]) VALUES (6, N'Оплачен', N'Заказ оплачен, ожидает приготовления')
INSERT [dbo].[OrderStatuses] ([StatusID], [StatusName], [Description]) VALUES (7, N'На доставке', N'Заказ в процессе доставки')
INSERT [dbo].[OrderStatuses] ([StatusID], [StatusName], [Description]) VALUES (8, N'Возврат', N'Заказ возвращен клиентом')
SET IDENTITY_INSERT [dbo].[OrderStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[PositionsEmployee] ON 

INSERT [dbo].[PositionsEmployee] ([PositionID], [PositionName], [Description]) VALUES (1, N'Бариста', N'Приготовление кофейных напитков и обслуживание клиентов')
INSERT [dbo].[PositionsEmployee] ([PositionID], [PositionName], [Description]) VALUES (2, N'Менеджер', N'Управление заказами и взаимодействие с поставщиками')
INSERT [dbo].[PositionsEmployee] ([PositionID], [PositionName], [Description]) VALUES (3, N'Администратор', N'Общее управление кофейней и персоналом')
INSERT [dbo].[PositionsEmployee] ([PositionID], [PositionName], [Description]) VALUES (4, N'Уборщик', N'Поддержание чистоты в помещении')
INSERT [dbo].[PositionsEmployee] ([PositionID], [PositionName], [Description]) VALUES (5, N'Повар', N'Приготовление десертов и закусок')
INSERT [dbo].[PositionsEmployee] ([PositionID], [PositionName], [Description]) VALUES (6, N'Кассир', N'Обслуживание клиентов на кассе')
INSERT [dbo].[PositionsEmployee] ([PositionID], [PositionName], [Description]) VALUES (7, N'Бармен', N'Приготовление алкогольных и безалкогольных коктейлей')
INSERT [dbo].[PositionsEmployee] ([PositionID], [PositionName], [Description]) VALUES (8, N'Маркетолог', N'Продвижение кофейни и организация акций')
SET IDENTITY_INSERT [dbo].[PositionsEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[Recipes] ON 

INSERT [dbo].[Recipes] ([RecipeID], [MenuItemID], [Quantity], [Instructions], [IngredientID]) VALUES (1, 1, CAST(0.01 AS Decimal(10, 2)), N'Помолоть 7 г кофе, утрамбовать, варить 25-30 сек', 2)
INSERT [dbo].[Recipes] ([RecipeID], [MenuItemID], [Quantity], [Instructions], [IngredientID]) VALUES (2, 3, CAST(0.01 AS Decimal(10, 2)), N'Помолоть 7 г кофе, варить эспрессо', 2)
INSERT [dbo].[Recipes] ([RecipeID], [MenuItemID], [Quantity], [Instructions], [IngredientID]) VALUES (3, 3, CAST(0.15 AS Decimal(10, 2)), N'Взбить молоко до температуры 60-65°C', 3)
INSERT [dbo].[Recipes] ([RecipeID], [MenuItemID], [Quantity], [Instructions], [IngredientID]) VALUES (4, 4, CAST(0.01 AS Decimal(10, 2)), N'Помолоть 7 г кофе, варить эспрессо', 2)
INSERT [dbo].[Recipes] ([RecipeID], [MenuItemID], [Quantity], [Instructions], [IngredientID]) VALUES (5, 4, CAST(0.20 AS Decimal(10, 2)), N'Подогреть молоко до 60-65°C без пены', 3)
INSERT [dbo].[Recipes] ([RecipeID], [MenuItemID], [Quantity], [Instructions], [IngredientID]) VALUES (6, 7, CAST(0.10 AS Decimal(10, 2)), N'Просейте муку для бисквита', 4)
INSERT [dbo].[Recipes] ([RecipeID], [MenuItemID], [Quantity], [Instructions], [IngredientID]) VALUES (7, 7, CAST(3.00 AS Decimal(10, 2)), N'Отделите желтки от белков', 10)
INSERT [dbo].[Recipes] ([RecipeID], [MenuItemID], [Quantity], [Instructions], [IngredientID]) VALUES (8, 7, CAST(0.10 AS Decimal(10, 2)), N'Добавьте к желткам и взбейте', 7)
INSERT [dbo].[Recipes] ([RecipeID], [MenuItemID], [Quantity], [Instructions], [IngredientID]) VALUES (9, 8, CAST(0.15 AS Decimal(10, 2)), N'Просейте муку для основы', 4)
INSERT [dbo].[Recipes] ([RecipeID], [MenuItemID], [Quantity], [Instructions], [IngredientID]) VALUES (10, 8, CAST(0.12 AS Decimal(10, 2)), N'Смешайте с творожной массой', 7)
SET IDENTITY_INSERT [dbo].[Recipes] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([Name], [Type], [YuridAdres], [INN], [FIO], [Phone], [Email], [Logo], [RatingReliability], [IDSuppliers]) VALUES (N'SweetFlavorsSS', N'Производитель', N'ГГГГг. Казань, ул. Сладкая, 7', 1601234567, N'Гарифуллин Рамиль Фанисович', N'+7(843)777-44-99', N'order@sweetflavors.com', N'\logos\sweetflavors_icon.png', CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Suppliers] ([Name], [Type], [YuridAdres], [INN], [FIO], [Phone], [Email], [Logo], [RatingReliability], [IDSuppliers]) VALUES (N'ВыпечкаМастер', N'Дистрибьютор', N'г. Екатеринбург, ул. Кондитерская, 19', 6601555666, N'Волков Андрей Дмитриевич', N'+7(343)666-77-88', N'bakerymaster@yandex.ru', N'\logos\bakerymaster_logo.png', CAST(7.90 AS Decimal(18, 2)), 2)
INSERT [dbo].[Suppliers] ([Name], [Type], [YuridAdres], [INN], [FIO], [Phone], [Email], [Logo], [RatingReliability], [IDSuppliers]) VALUES (N'Зерновой Дом', N'Производитель', N'г. Краснодар, ул. Зерновая, 42', 2301876543, N'Петренко Мария Ивановна', N'+7(861)222-33-44', N'zernodom@mail.ru', N'\logos\zernodom_logo.png', CAST(8.50 AS Decimal(18, 2)), 3)
INSERT [dbo].[Suppliers] ([Name], [Type], [YuridAdres], [INN], [FIO], [Phone], [Email], [Logo], [RatingReliability], [IDSuppliers]) VALUES (N'Кофейный Союз', N'Производитель', N'г. Москва, ул. Промышленная, 15', 7701123456, N'Иванов Петр Сергеевич', N'+7(495)111-22-33', N'sales@coffee-union.ru', N'\logos\coffee_union.png', CAST(9.30 AS Decimal(18, 2)), 4)
INSERT [dbo].[Suppliers] ([Name], [Type], [YuridAdres], [INN], [FIO], [Phone], [Email], [Logo], [RatingReliability], [IDSuppliers]) VALUES (N'МолПродукт', N'Дистрибьютор', N'г. Санкт-Петербург, пр. Молочный, 28', 7801987654, N'Смирнова Ольга Владимировна', N'+7(812)444-55-66', N'info@molproduct.spb.ru', N'\logos\molproduct_logo.jpg', CAST(8.70 AS Decimal(18, 2)), 5)
INSERT [dbo].[Suppliers] ([Name], [Type], [YuridAdres], [INN], [FIO], [Phone], [Email], [Logo], [RatingReliability], [IDSuppliers]) VALUES (N'Новый п45646456оставщик', N'Производитель', N'Адрес', 0, N'ФИО', N'Телефон', N'email@example.com', NULL, NULL, 6)
INSERT [dbo].[Suppliers] ([Name], [Type], [YuridAdres], [INN], [FIO], [Phone], [Email], [Logo], [RatingReliability], [IDSuppliers]) VALUES (N'Новый поставщик', N'Дистрибьютор', N'1ывфыАдрес', 223123123, N'Ф232323ИО', N'546456456', N'email@example.com', NULL, NULL, 7)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
INSERT [dbo].[TransactionType] ([TransactionType]) VALUES (N'Инвентаризация')
INSERT [dbo].[TransactionType] ([TransactionType]) VALUES (N'Корректировка')
INSERT [dbo].[TransactionType] ([TransactionType]) VALUES (N'Перемещение')
INSERT [dbo].[TransactionType] ([TransactionType]) VALUES (N'Поступление')
INSERT [dbo].[TransactionType] ([TransactionType]) VALUES (N'Продажа')
INSERT [dbo].[TransactionType] ([TransactionType]) VALUES (N'Производство')
INSERT [dbo].[TransactionType] ([TransactionType]) VALUES (N'Списание')
INSERT [dbo].[TransactionType] ([TransactionType]) VALUES (N'Утилизация')
GO
INSERT [dbo].[TypeIngredients] ([TypeIngredients]) VALUES (N'Все типы')
INSERT [dbo].[TypeIngredients] ([TypeIngredients]) VALUES (N'Десертные ингредиенты')
INSERT [dbo].[TypeIngredients] ([TypeIngredients]) VALUES (N'Кофейные зерна')
INSERT [dbo].[TypeIngredients] ([TypeIngredients]) VALUES (N'Молочные продукты')
INSERT [dbo].[TypeIngredients] ([TypeIngredients]) VALUES (N'Свежие продукты')
INSERT [dbo].[TypeIngredients] ([TypeIngredients]) VALUES (N'Сиропы')
INSERT [dbo].[TypeIngredients] ([TypeIngredients]) VALUES (N'Специи')
INSERT [dbo].[TypeIngredients] ([TypeIngredients]) VALUES (N'Сыпучие продукты')
GO
INSERT [dbo].[TypeSupplier] ([Type]) VALUES (N'Дистрибьютор')
INSERT [dbo].[TypeSupplier] ([Type]) VALUES (N'Производитель')
GO
INSERT [dbo].[UnitOfMeasurement] ([UnitOfMeasurement]) VALUES (N'кг')
INSERT [dbo].[UnitOfMeasurement] ([UnitOfMeasurement]) VALUES (N'л')
INSERT [dbo].[UnitOfMeasurement] ([UnitOfMeasurement]) VALUES (N'шт')
GO
SET IDENTITY_INSERT [dbo].[WorkSchedules] ON 

INSERT [dbo].[WorkSchedules] ([ScheduleID], [EmployeeID], [WorkDate], [StartTime], [EndTime]) VALUES (1, 1, CAST(N'2025-06-01' AS Date), CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[WorkSchedules] ([ScheduleID], [EmployeeID], [WorkDate], [StartTime], [EndTime]) VALUES (2, 2, CAST(N'2025-06-01' AS Date), CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[WorkSchedules] ([ScheduleID], [EmployeeID], [WorkDate], [StartTime], [EndTime]) VALUES (3, 3, CAST(N'2025-06-01' AS Date), CAST(N'16:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[WorkSchedules] ([ScheduleID], [EmployeeID], [WorkDate], [StartTime], [EndTime]) VALUES (4, 1, CAST(N'2025-06-02' AS Date), CAST(N'12:00:00' AS Time), CAST(N'20:00:00' AS Time))
INSERT [dbo].[WorkSchedules] ([ScheduleID], [EmployeeID], [WorkDate], [StartTime], [EndTime]) VALUES (5, 4, CAST(N'2025-06-02' AS Date), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[WorkSchedules] ([ScheduleID], [EmployeeID], [WorkDate], [StartTime], [EndTime]) VALUES (6, 5, CAST(N'2025-06-03' AS Date), CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[WorkSchedules] ([ScheduleID], [EmployeeID], [WorkDate], [StartTime], [EndTime]) VALUES (7, 6, CAST(N'2025-06-03' AS Date), CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time))
INSERT [dbo].[WorkSchedules] ([ScheduleID], [EmployeeID], [WorkDate], [StartTime], [EndTime]) VALUES (8, 7, CAST(N'2025-06-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[WorkSchedules] ([ScheduleID], [EmployeeID], [WorkDate], [StartTime], [EndTime]) VALUES (9, 8, CAST(N'2025-06-04' AS Date), CAST(N'16:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[WorkSchedules] ([ScheduleID], [EmployeeID], [WorkDate], [StartTime], [EndTime]) VALUES (10, 9, CAST(N'2025-06-05' AS Date), CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[WorkSchedules] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_IngredientsName]    Script Date: 03.06.2025 0:38:55 ******/
ALTER TABLE [dbo].[Ingredients] ADD  CONSTRAINT [UQ_IngredientsName] UNIQUE NONCLUSTERED 
(
	[IngredientsName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InventoryAlerts] ADD  DEFAULT ((0)) FOR [IsResolved]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK__Employees__Posit__412EB0B6] FOREIGN KEY([PositionID])
REFERENCES [dbo].[PositionsEmployee] ([PositionID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK__Employees__Posit__412EB0B6]
GO
ALTER TABLE [dbo].[Ingredients]  WITH CHECK ADD FOREIGN KEY([TypeIngredients])
REFERENCES [dbo].[TypeIngredients] ([TypeIngredients])
GO
ALTER TABLE [dbo].[Ingredients]  WITH CHECK ADD  CONSTRAINT [FK_Ingredients_UnitOfMeasurement] FOREIGN KEY([UnitOfMeasurement])
REFERENCES [dbo].[UnitOfMeasurement] ([UnitOfMeasurement])
GO
ALTER TABLE [dbo].[Ingredients] CHECK CONSTRAINT [FK_Ingredients_UnitOfMeasurement]
GO
ALTER TABLE [dbo].[IngredientSupplier]  WITH CHECK ADD  CONSTRAINT [FK_IngredientSupplier_Ingredients] FOREIGN KEY([IngredientID])
REFERENCES [dbo].[Ingredients] ([IngredientID])
GO
ALTER TABLE [dbo].[IngredientSupplier] CHECK CONSTRAINT [FK_IngredientSupplier_Ingredients]
GO
ALTER TABLE [dbo].[IngredientSupplier]  WITH CHECK ADD  CONSTRAINT [FK_IngredientSupplier_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([IDSuppliers])
GO
ALTER TABLE [dbo].[IngredientSupplier] CHECK CONSTRAINT [FK_IngredientSupplier_Suppliers]
GO
ALTER TABLE [dbo].[InventoryAlerts]  WITH CHECK ADD  CONSTRAINT [FK_InventoryAlerts_Employees] FOREIGN KEY([ResolvedBy])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[InventoryAlerts] CHECK CONSTRAINT [FK_InventoryAlerts_Employees]
GO
ALTER TABLE [dbo].[InventoryAlerts]  WITH CHECK ADD  CONSTRAINT [FK_InventoryAlerts_Ingredients] FOREIGN KEY([IngredientID])
REFERENCES [dbo].[Ingredients] ([IngredientID])
GO
ALTER TABLE [dbo].[InventoryAlerts] CHECK CONSTRAINT [FK_InventoryAlerts_Ingredients]
GO
ALTER TABLE [dbo].[InventoryTransactions]  WITH CHECK ADD FOREIGN KEY([TransactionType])
REFERENCES [dbo].[TransactionType] ([TransactionType])
GO
ALTER TABLE [dbo].[InventoryTransactions]  WITH CHECK ADD  CONSTRAINT [FK_InventoryTransactions_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[InventoryTransactions] CHECK CONSTRAINT [FK_InventoryTransactions_Employees]
GO
ALTER TABLE [dbo].[InventoryTransactions]  WITH CHECK ADD  CONSTRAINT [FK_InventoryTransactions_IngredientSupplier] FOREIGN KEY([IDSIngredienupplier])
REFERENCES [dbo].[IngredientSupplier] ([IDIngredientSupplier])
GO
ALTER TABLE [dbo].[InventoryTransactions] CHECK CONSTRAINT [FK_InventoryTransactions_IngredientSupplier]
GO
ALTER TABLE [dbo].[MenuItems]  WITH CHECK ADD  CONSTRAINT [FK_MenuItems_MenuCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[MenuCategories] ([CategoryID])
GO
ALTER TABLE [dbo].[MenuItems] CHECK CONSTRAINT [FK_MenuItems_MenuCategories]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_MenuItems] FOREIGN KEY([MenuItemID])
REFERENCES [dbo].[MenuItems] ([MenuItemID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_MenuItems]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[OrderStatuses] ([StatusID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatuses]
GO
ALTER TABLE [dbo].[Recipes]  WITH CHECK ADD  CONSTRAINT [FK_Recipes_Ingredients] FOREIGN KEY([IngredientID])
REFERENCES [dbo].[Ingredients] ([IngredientID])
GO
ALTER TABLE [dbo].[Recipes] CHECK CONSTRAINT [FK_Recipes_Ingredients]
GO
ALTER TABLE [dbo].[Recipes]  WITH CHECK ADD  CONSTRAINT [FK_Recipes_MenuItems] FOREIGN KEY([MenuItemID])
REFERENCES [dbo].[MenuItems] ([MenuItemID])
GO
ALTER TABLE [dbo].[Recipes] CHECK CONSTRAINT [FK_Recipes_MenuItems]
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD FOREIGN KEY([Type])
REFERENCES [dbo].[TypeSupplier] ([Type])
GO
ALTER TABLE [dbo].[WorkSchedules]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
USE [master]
GO
ALTER DATABASE [CoffeeDBMurtazin] SET  READ_WRITE 
GO
