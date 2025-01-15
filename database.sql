USE [master]
GO
/****** Object:  Database [WebsiteASP_NET]    Script Date: 15/01/2025 2:00:10 CH ******/
CREATE DATABASE [WebsiteASP_NET]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebsiteASP_NET', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.THINH\MSSQL\DATA\WebsiteASP_NET.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebsiteASP_NET_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.THINH\MSSQL\DATA\WebsiteASP_NET_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebsiteASP_NET] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebsiteASP_NET].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebsiteASP_NET] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebsiteASP_NET] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebsiteASP_NET] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebsiteASP_NET] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebsiteASP_NET] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET RECOVERY FULL 
GO
ALTER DATABASE [WebsiteASP_NET] SET  MULTI_USER 
GO
ALTER DATABASE [WebsiteASP_NET] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebsiteASP_NET] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebsiteASP_NET] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebsiteASP_NET] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebsiteASP_NET] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebsiteASP_NET', N'ON'
GO
ALTER DATABASE [WebsiteASP_NET] SET QUERY_STORE = OFF
GO
USE [WebsiteASP_NET]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 15/01/2025 2:00:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[Deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 15/01/2025 2:00:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[Deleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 15/01/2025 2:00:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UserId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 15/01/2025 2:00:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15/01/2025 2:00:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[CategoryId] [int] NULL,
	[ShortDes] [nvarchar](100) NULL,
	[FullDescription] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[PriceDiscount] [float] NULL,
	[TypeId] [int] NULL,
	[Slug] [varchar](50) NULL,
	[BrandId] [int] NULL,
	[Deleted] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 15/01/2025 2:00:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (1, N'Áo hoodie', N'5.jpg                                                                                               ', N'ao-khoac-co-mu', 1, 1, CAST(N'2024-12-18T12:58:25.283' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (2, N'Áo thun', N'7.jpg                                                                                               ', N'ao-thun-ao-so-mi', 1, 2, CAST(N'2024-12-18T12:58:25.283' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (3, N'Quần và Váy', N'12.jpg                                                                                              ', N'quan-vay', 1, 3, CAST(N'2024-12-18T12:58:25.283' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (4, N'Phụ kiện Túi ', N'24.jpg                                                                                              ', N'tui-xach ', 1, 4, CAST(N'2024-12-18T12:58:25.283' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (5, N'PhụKiện Mới', N'27.jpg', N'phu-kien ', 1, 5, CAST(N'2024-12-18T12:58:25.283' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Áo khoác nón', N'5A.jpg                                                                                              ', N'khám phá ', 1, 1, 0, CAST(N'2024-12-18T12:58:25.287' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Áo thun', N'ao.jpg                                                                                              ', N'ao-thun-ao-so-mi', 1, 2, 0, CAST(N'2024-12-18T12:58:25.287' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Quần và Váy', N'quan.jpg                                                                                            ', N'quan-vay', 1, 3, 0, CAST(N'2024-12-18T12:58:25.287' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Phụ kiện Túi ', N'balo25.jpg                                                                                          ', N'tui-xach ', 1, 4, 0, CAST(N'2024-12-18T12:58:25.287' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'Phụ Kiện Mới', N'27.jpg                                                                                              ', N'phu-kien ', 1, 5, 0, CAST(N'2024-12-18T12:58:25.287' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (1, N'DonHang-20241225153917', 7, 17, CAST(N'2024-12-25T15:39:17.137' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (2, N'DonHang-20241229161933', 7, 17, CAST(N'2024-12-29T16:19:33.323' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (3, N'DonHang-20241229161946', 7, 17, CAST(N'2024-12-29T16:19:46.730' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (4, N'DonHang-20241229162039', 7, 17, CAST(N'2024-12-29T16:20:39.767' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (5, N'DonHang-20241229162040', 7, 17, CAST(N'2024-12-29T16:20:40.337' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (6, N'DonHang-20241229162237', 7, 17, CAST(N'2024-12-29T16:22:37.047' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (7, N'DonHang-20241229162240', 7, 17, CAST(N'2024-12-29T16:22:40.720' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (8, N'DonHang-20241230124252', 7, 17, CAST(N'2024-12-30T12:42:52.500' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (9, N'DonHang-20241230144602', 7, 17, CAST(N'2024-12-30T14:46:02.997' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (10, N'DonHang-20241230144617', 7, 17, CAST(N'2024-12-30T14:46:17.207' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (11, N'DonHang-20241230155039', 7, 17, CAST(N'2024-12-30T15:50:39.013' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (12, N'DonHang-20241230155526', 7, 17, CAST(N'2024-12-30T15:55:26.430' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (13, N'DonHang-20241230155831', 7, 17, CAST(N'2024-12-30T15:58:31.573' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (14, N'DonHang-20241230160034', 7, 17, CAST(N'2024-12-30T16:00:34.240' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (15, N'DonHang-20241230162102', 9, 17, CAST(N'2024-12-30T16:21:02.877' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (16, N'DonHang-20250108152424', 7, 17, CAST(N'2025-01-08T15:24:24.427' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (17, N'DonHang-20250108152549', 7, 17, CAST(N'2025-01-08T15:25:49.733' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1, 1, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (2, 2, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (3, 3, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (4, 4, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (5, 5, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (6, 6, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (7, 7, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (8, 8, 7, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (9, 9, 1, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (10, 11, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (11, 12, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (12, 13, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (13, 15, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (14, 16, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (15, 17, 5, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Áo Lưới Jersey 777', N'1.jpg                                                                                               ', 2, N' Áo thun Jersey thiết kế unisex', N'Áo được thiết kế với typographic in kéo lụa ở mặt trước và sau, cùng logo thêu tinh tế trên tay áo. Chất liệu vải lưới thoáng mát, giúp áo đứng form và tạo cảm giác dễ chịu khi mặc. Lưu ý rằng màu sắc sản phẩm có thể khác biệt so với hình ảnh do điều kiện ánh sáng khi chụp. Model cao 1m81, nặng 70kg, mặc size XL. Sản phẩm có thời gian vận chuyển từ 2-3 ngày và được thiết kế, sản xuất bởi HADES.', 490000, NULL, 1, N'ao-thun-ao-so-mi', 2, NULL, NULL, NULL, CAST(N'2024-12-18T12:58:25.000' AS DateTime), CAST(N'2024-12-18T12:58:25.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Áo Khoác Da Pinkie', N'4.jpg                                                                                               ', 2, N'Áo khoác da khoá kéo zip full thân', N'Cổ áo sơ mi với thiết kế độc đáo, kết hợp các chi tiết rách tạo điểm nhấn ấn tượng trên toàn bộ thân áo. Logo phía trước được dập nổi, trong khi logo phía sau được thêu tinh xảo. Phía sau hai tay áo có khoá kéo zip tiện dụng, cùng các chi tiết nút bấm kim loại mang đến vẻ ngoài hiện đại và cá tính. Chất liệu da PU mang đến sự sang trọng và độ bền cao. Lưu ý: Màu sắc sản phẩm có thể thay đổi nhẹ do ánh sáng khi chụp ảnh. MODEL: Cao 1m70, số đo 79-60-89, mặc size S. Vận chuyển trong 2-3 ngà', 1090000, 990000, 1, N'ao-thun-ao-so-mi', 2, 0, 1, 2, CAST(N'2024-12-18T12:58:25.300' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Áo Khoác Saigon Vital', N'3.jpg                                                                                               ', 1, N'Hoodie zip full thân thiết kế unisex', N'
Áo hoodie với thiết kế nổi bật, graphic mặt trước được in kéo lụa kết hợp đính đá tinh tế, tạo điểm nhấn độc đáo. Symbol "H" ở mặt sau áo được thêu tỉ mỉ, mang đến vẻ đẹp tinh xảo. Hoodie có 2 túi mổ tiện dụng ở mặt trước, cùng logo HADES thêu tinh tế trên nón. Bo tay và thân áo ôm sát, tạo cảm giác thoải mái và phong cách.', 790000, 760000, 1, N'ao-khoac-co-mu', 1, 0, 1, 3, CAST(N'2024-12-18T12:58:25.300' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Áo Lưới Jersey 777', N'2.jpg                                                                                               ', 2, N' Áo thun Jersey thiết kế unisex', N'Áo được thiết kế với typographic in kéo lụa ở mặt trước và sau, cùng logo thêu tinh tế trên tay áo. Chất liệu vải lưới thoáng mát, giúp áo đứng form và tạo cảm giác dễ chịu khi mặc. Lưu ý rằng màu sắc sản phẩm có thể khác biệt so với hình ảnh do điều kiện ánh sáng khi chụp. Model cao 1m81, nặng 70kg, mặc size XL. Sản phẩm có thời gian vận chuyển từ 2-3 ngày và được thiết kế, sản xuất bởi HADES.', 490000, 390000, 1, N'ao-thun-ao-so-mi', 2, 0, 1, 4, CAST(N'2024-12-18T12:58:25.300' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'Áo Ba Lỗ Classic', N'6.jpg                                                                                               ', 2, N' Form áo tank top', N'Áo với hoạ tiết logo HADES cách điệu được thêu tinh tế ở mặt trước, tạo điểm nhấn ấn tượng. Chất liệu thun gân cotton mềm mại, mang lại cảm giác thoải mái và dễ chịu khi mặc. Lưu ý: Màu sắc sản phẩm có thể khác trên ảnh do điều kiện ánh sáng khi chụp. MODEL: Cao 1m81, 70kg, mặc size L. Vận chuyển trong 2-3 ngày. Thiết kế và sản xuất bởi HADES.', 380000, 370000, 1, N'ao-thun-ao-so-mi', 2, 0, 1, 5, CAST(N'2024-12-18T12:58:25.300' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, N'Áo Thun  Angry Mood', N'7.jpg                                                                                               ', 2, N' Form basic mới', N'Áo với graphic độc đáo sử dụng kết hợp kỹ thuật in kéo lụa và decal đá, tạo điểm nhấn nổi bật. Mạc label đính ở mặt trước áo cùng logo Hades thêu nổi ở tay áo, thể hiện sự tinh tế và đẳng cấp. Chất liệu cotton thoáng mát, dễ chịu khi mặc. Lưu ý: Màu sắc sản phẩm có thể khác trên ảnh do điều kiện ánh sáng khi chụp. MODEL: Cao 1m8, 61kg, mặc size XL. Vận chuyển trong 2-3 ngày. Thiết kế và sản xuất bởi HADES.', 520000, 510000, 1, N'ao-thun-ao-so-mi', 2, 0, 0, 6, CAST(N'2024-12-18T12:58:25.300' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, N'Áo Dài Tay Outlaw', N'8.jpg                                                                                               ', 1, N'Form oversize rộng rãi, thoải mái', N'Áo với graphic in kéo lụa full bản ở mặt trước và sau, mang đến sự nổi bật và ấn tượng. Chất liệu cotton mềm mại, thoải mái khi mặc. Lưu ý: Màu sắc sản phẩm có thể khác trên ảnh do điều kiện ánh sáng khi chụp. MODEL: Cao 1m81, 70kg, mặc size L. Vận chuyển trong 2-3 ngày. Thiết kế và sản xuất bởi HADES.', 550000, 540000, 1, N'ao-khoac-co-mu', 1, 0, 1, 5, CAST(N'2024-12-18T12:58:25.307' AS DateTime), CAST(N'2024-12-18T12:58:25.310' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (8, N'Áo Khoác Hoodie hoa đỏ', N'10.jpg                                                                                              ', 1, N'Hoạ tiết chữ in kéo lụa full bản ở mặt trước và mặt sau áo', N'Áo có 2 charm FLOWER được đính bất đối xứng, có thể tách rời, tạo điểm nhấn độc đáo. Logo Hades thêu nổi ở nón và bo tay, thân áo mang đến sự hoàn thiện cho thiết kế. Chất liệu nỉ bông mềm mại, giữ ấm và thoải mái khi mặc. Lưu ý: Màu sắc sản phẩm có thể khác trên ảnh do điều kiện ánh sáng khi chụp. MODEL: Cao 1m77, 68kg, mặc size L. Vận chuyển trong 2-3 ngày. Thiết kế và sản xuất bởi HADES.', 790000, 780000, 1, N'ao-khoac-co-mu', 1, 0, 0, 6, CAST(N'2024-12-18T12:58:25.307' AS DateTime), CAST(N'2024-12-18T12:58:25.310' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (10, N'Quần Short Beatniz', N'11.jpg                                                                                              ', 3, N'Quần lưng thun có dây rút, nút chặn kim loại', N'Quần với logo thêu 3D ở mặt trước, tạo điểm nhấn độc đáo. Ráp nối vải ở mặt trước và sau quần tạo các mảng màu tương phản, mang đến vẻ ngoài nổi bật. Quần có hai túi mổ sâu ở mặt trước tiện dụng. Chất liệu dù nhẹ, bền, và thoáng mát. Lưu ý: Màu sắc sản phẩm có thể khác trên ảnh do điều kiện ánh sáng khi chụp. MODEL: Cao 1m8, 61kg, mặc size L. Vận chuyển trong 2-3 ngày. Thiết kế và sản xuất bởi HADES.', 490000, 480000, 1, N'quan-vay', 3, 0, 1, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (11, N'Quần Jean Arthropod Wash', N'12.jpg                                                                                              ', 3, N' Quần jeans form suông, cạp quần trễ, độ dài phủ gót', N'Quần jean với xử lý wash tạo hiệu ứng độc đáo, mang lại vẻ ngoài cá tính và khác biệt. Logo HADES thêu 3D cùng màu tinh tế, kẹp inox mạc nhựa ở lưng quần phía sau tạo thêm điểm nhấn. Quần có hai túi mổ sâu phía trước và hai túi phía sau tiện dụng. Các chi tiết rả và rách dọc ống quần làm tăng thêm phong cách phá cách.', 790000, 780000, 1, N'quan-vay', 3, 0, 1, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (12, N'Quần Jean Tectonic Rift', N'14.jpg                                                                                              ', 3, N'Quần jeans form suông, cạp quần trễ, độ dài phủ gót', N'
Quần jean với xử lý wash tạo hiệu ứng độc đáo, mang đến vẻ ngoài phá cách và cá tính. Quần được thiết kế với các mảng vải ráp nối dọc mặt trước và mặt sau, kết hợp với các chi tiết rách tạo điểm nhấn nổi bật', 790000, 770000, 1, N'quan-vay', 3, 0, 0, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (13, N'Quần Jean Fence Wash', N'13.jpg                                                                                              ', 3, N'Quần jeans NỮ form suông, cạp quần trễ, độ dài phủ gó', N'Quần jean với thiết kế độc đáo, các chi tiết rả chạy dọc mặt trước và sau quần tạo vẻ ngoài phá cách. Sở hữu hai túi mổ sâu cùng sáu túi hộp lớn nhỏ dọc ống quần, mang đến sự tiện dụng và phong cách.', 850000, 840000, 1, N'quan-vay', 3, 0, 0, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (14, N'Quần Năng Động', N'15.jpg                                                                                              ', 3, N'Quần form suông', N'Quần kaki với nẹp sắt logo Hades đặc trưng, tạo điểm nhấn độc đáo cho sản phẩm. Biểu tượng "H" thêu tinh xảo ở hai túi trước và các đường line dọc mặt trước và sau quần làm nổi bật vẻ ngoài cá tính, hiện đại. Chất liệu kaki bền, dễ chịu khi mặc và dễ dàng kết hợp với nhiều phong cách khác nhau. Vận chuyển trong 2-3 ngày. Thiết kế và sản xuất bởi HADES.', 455000, 450000, 1, N'quan-vay', 3, 0, 0, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (15, N'Áo Dài Tay Knock Out', N'16.jpg                                                                                              ', 2, N'Áo dài tay có cổ ', N'Áo với họa tiết tràn thân in kéo lụa ở mặt trước và sau, tạo nên một phong cách ấn tượng. Chi tiết layer ở tay áo và biểu tượng "H" cách điệu in kéo lụa ở mặt sau áo thêm phần cá tính. Chất liệu cotton mềm mại, dễ chịu khi mặc. Lưu ý: Màu sắc sản phẩm có thể khác trên ảnh do điều kiện ánh sáng khi chụp. MODEL nam: 1m77, 68kg, mặc size L. Vận chuyển từ 2-3 ngày. Thiết kế và sản xuất bởi HADES.', 650000, 630000, 1, N'ao-thun-ao-so-mi', 2, 0, 0, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (16, N'Áo Sơ Mi Astral Trắn', N'17.jpg                                                                                              ', 2, N'Áo sơmi tay dài unisex', N'Áo với biểu tượng "H" cách điệu thêu trên túi áo trước, cùng 2 charm bông hình Bling đính ở mặt trước áo, tạo nên điểm nhấn nổi bật. Chất liệu cotton thoáng mát, dễ chịu khi mặc. Lưu ý: Màu sắc sản phẩm có thể khác trên ảnh do điều kiện ánh sáng khi chụp. MODEL: 1m66, 81-60-87, mặc size M. Vận chuyển từ 2-3 ngày. Thiết kế và sản xuất bởi HADES.', 520000, 510000, 1, N'ao-thun-ao-so-mi', 2, 0, 0, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (17, N'Áo Thun Falling Down', N'18.jpg                                                                                              ', 2, N'Form basic mới', N'Áo với graphic chữ thêu nổi kết hợp in kéo lụa, tạo nên sự độc đáo và ấn tượng. Chi tiết đắp vải in graphic full bản ở mặt trước áo, cùng logo Hades thêu nổi ở tay áo. Chất liệu cotton 2 chiều mang đến sự thoải mái và bền bỉ. Lưu ý: Màu sắc sản phẩm có thể khác trên ảnh do điều kiện ánh sáng khi chụp. MODEL: 1m66, 81-60-87, mặc size M. Vận chuyển từ 2-3 ngày. Thiết kế và sản xuất bởi HADES.', 450000, 430000, 1, N'ao-thun-ao-so-mi', 2, 0, NULL, 3, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (18, N'Áo Khoác Varsity Nổi Loạn', N'19.jpg                                                                                              ', 2, N' Graphic kết hợp giữa 2 kỹ thuật thêu xù và thêu thường', N'Áo với lớp lót chần bông mặt trong, bo cổ áo và tà áo, cùng nút bấm dọc áo tạo điểm nhấn. Chất liệu da phối mang đến vẻ ngoài thời thượng và sang trọng. Lưu ý: Màu sắc sản phẩm có thể khác trên ảnh do điều kiện ánh sáng khi chụp. MODEL: 1m86, 74kg, mặc size L. Vận chuyển từ 2-3 ngày. Thiết kế và sản xuất bởi HADES.', 1190000, 1100000, 1, N'ao-thun-ao-so-mi', 2, 0, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (19, N'Áo Khoác Biker Nâu Wax', N'20.jpg                                                                                              ', 1, N'Áo khoác da khoá kéo zip full thân', N'Áo có cổ với nút bấm kim loại logo HADES, chi tiết logo in dập nổi ở mặt trước và chi tiết typo thêu ở mặt sau áo. Áo được trang bị 2 túi zip phía trước, làm từ chất liệu Da PU cao cấp. Lưu ý: Màu sắc sản phẩm có thể khác trên ảnh do điều kiện ánh sáng khi chụp. MODEL nữ: 1m70, 78-58-87 mặc size M. Vận chuyển từ 2-3 ngày. Thiết kế và sản xuất bởi HADES.', 1090000, 1000000, 1, N'ao-khoac-co-mu', 1, 0, NULL, 5, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (20, N'Áo Khoác Dáng Racer', N'21.jpg                                                                                              ', 1, N'Áo khoác dù có khoá kéo zip full thân', N'Áo có 2 túi phía trước, bo cổ tay và thân áo. Các chi tiết rả ở mặt trước và sau kết hợp với các line phản quang tạo hiệu ứng nổi bật. Sử dụng kỹ thuật in kéo lụa ở mặt trước và sau áo, làm từ chất liệu Dù cao cấp. Lưu ý: Màu sắc sản phẩm có thể khác trên ảnh do điều kiện ánh sáng khi chụp. MODEL: 1m82, 85-71-91 mặc size L. Vận chuyển từ 2-3 ngày. Thiết kế và sản xuất bởi HADES.', 720000, 710000, 1, N'ao-khoac-co-mu', 1, 0, NULL, 6, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (21, N'Áo Khoác Exodus Symblue Có Dây Kéo', N'22.jpg                                                                                              ', 1, N' Boxy Fit', N'Áo có khoá kéo zip toàn thân, hoạ tiết in kéo lụa full bản ở mặt trước và sau áo. Bo cổ tay và thân áo dày dặn, tạo cảm giác chắc chắn và ấm áp. Hoạ tiết chữ và logo Hades được đính ở nón thêu nổi, thêm phần nổi bật. Chất liệu: Chân cua cao cấp. MODEL: 1m83, 73kg, 97-79-97 mặc size L. Vận chuyển từ 2-3 ngày. Thiết kế và sản xuất bởi HADES.






', 750000, 730000, 1, N'ao-khoac-co-mu', 1, 0, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (22, N'Áo Khoác Major Pieces', N'23.jpg                                                                                              ', 1, N'Jacket khoá kéo zip dọc thân', N'Áo có dây rút ở tay và thân áo, giúp điều chỉnh phù hợp với vóc dáng. Sử dụng kỹ thuật ráp nối vải tinh tế, tạo điểm nhấn đặc biệt. Chi tiết chữ phía trước áo được thêu viền sắc nét. Có 2 túi to phía trước và các nút kim loại tạo sự phá cách cho thiết kế. Chất liệu: Kaki bền đẹp. MODEL: 1m68, 47kg, 75-59-90 mặc size M. Vận chuyển từ 2-3 ngày. Thiết kế và sản xuất bởi HADES.






', 760000, 720000, 1, N'ao-khoac-co-mu', 1, 0, NULL, 5, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (23, N'Balo Hades Da 24', N'24.jpg                                                                                              ', 4, N' Logo Hades thêu 3D ở mặt trước', N'
Túi có khóa kéo kim loại chắc chắn, đảm bảo an toàn cho đồ dùng bên trong. Hai quai đeo túi được thiết kế với dây zip, mang được 2 kiểu, linh hoạt và tiện lợi. Ngăn chứa đồ rộng rãi, dễ dàng để bạn sắp xếp các vật dụng. Các chi tiết đinh tán trang trí thêm phần nổi bật và cá tính. Túi còn có khả năng chống thấm nước, bảo vệ đồ đạc của bạn trong mọi điều kiện thời tiết. Chất liệu: Simili bền đẹp. Kích thước: cao 35cm x ngang 26cm x rộng 12cm', 795000, 760000, 1, N'tui-xach ', 4, 0, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (24, N'Balo Jumble Prim', N'25.jpg                                                                                              ', 4, N' inox được đính ở mặt trước balo', N'Túi thiết kế với khóa nhựa PU và khóa kéo kim loại chắc chắn, đảm bảo an toàn cho đồ dùng. Typo thêu nổi tạo điểm nhấn độc đáo. Với nhiều ngăn chứa đồ rộng rãi, bạn có thể sắp xếp các vật dụng một cách gọn gàng và tiện lợi. Túi còn có khả năng chống thấm nước, bảo vệ đồ đạc trong mọi điều kiện thời tiết. Chất liệu: Dù lạnh phối da bền đẹp. Kích thước: cao 42cm x ngang 32cm x rộng 12cm.', 795000, 760000, 1, N'tui-xach ', 4, 0, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (25, N'Balo Motivation Phong Cách Grunge', N'26.jpg                                                                                              ', 4, N' Logo Hades bằng kim loại', N'Túi với khóa kéo và các chi tiết nút kim loại chắc chắn, đảm bảo độ bền cao. Thiết kế chống thấm nước giúp bảo vệ đồ dùng khỏi những yếu tố bên ngoài. Với nhiều ngăn và túi chứa đồ rộng rãi, bạn có thể dễ dàng sắp xếp vật dụng của mình một cách gọn gàng và tiện lợi. Chất liệu: Dù bền và nhẹ. Kích thước: 42 x 33 x 17cm', 620000, 610000, 1, N'tui-xach ', 4, 0, NULL, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (26, N'Khăn Turban Phong Cách', N'28.jpg                                                                                              ', 5, N'Khăn turban', N'Khăn turban với kích thước 57 x 57 cm, làm từ chất liệu Kate mềm mại, thoáng mát và dễ chịu khi sử dụng. Lưu ý: Màu sắc sản phẩm có thể khác trên ảnh do điều kiện ánh sáng khi chụp. Vận chuyển từ 2-3 ngày. Thiết kế và sản xuất bởi HADES.', 180000, 150000, 1, N'phu-kien ', 5, 0, NULL, 6, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (27, N'Mũ Lưỡi Trai Profile Ellipse', N'non.jpg                                                                                             ', 1, N'Nón lưỡi trai thêu typo ở phía trước và bên trái, lót mềm phía trong', N'Nón lưỡi trai thêu typo ở phía trước và bên trái, với lót mềm phía trong mang đến sự thoải mái. Các chi tiết xử lý rách tạo điểm nhấn phong cách, và nón có nút kim loại tăng giảm độ rộng phía sau để vừa vặn với người sử dụng. Chất liệu: Kaki Jean bền bỉ và phong cách.', 350000, 320000, 1, N'phu-kien ', 1, 0, NULL, 3, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (36, N'Áo khoác n999', N'aothun.jpg                                                                                          ', 1, N'ghedfgh', N'sdv', 123456, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (7, N'thinh', N'nguyen', N'thinh@gmail.com', N'202cb962ac59075b964b07152d234b70', 1)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (8, N'thinh', N'nguyen', N'phu@gmail.com', N'202cb962ac59075b964b07152d234b70', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (9, N'thinh', N'nguyen', N'th@gmail.com', N'202cb962ac59075b964b07152d234b70', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (10, N'thinh', N'nguyen', N'hhh@gmail.com', N'202cb962ac59075b964b07152d234b70', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
USE [master]
GO
ALTER DATABASE [WebsiteASP_NET] SET  READ_WRITE 
GO
