
USE [labPerm]
GO
/****** Object:  Table [dbo].[Analyzer]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analyzer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Biomaterial] [int] NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Analyzer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnalyzerOperation]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnalyzerOperation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Analyzer] [int] NULL,
	[ID_OrderList] [int] NULL,
	[DateOfReceipt] [datetime] NULL,
	[DateOFCompletion] [int] NULL,
 CONSTRAINT [PK_AnalyzerOperation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttemptStatus]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttemptStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_AttemptStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Biomaterial]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Biomaterial](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Biomaterial] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsuranceCompany]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranceCompany](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](70) NULL,
	[INN] [nchar](10) NULL,
	[R/s] [nvarchar](20) NULL,
	[BIC] [nchar](9) NULL,
 CONSTRAINT [PK_InsuranceCompany] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginHistory]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NULL,
	[DateOfEntry] [datetime] NULL,
	[ID_AttemptStatus] [int] NULL,
 CONSTRAINT [PK_LoginHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateOfCreation] [datetime] NULL,
	[ID_OrderStatus] [int] NULL,
	[Rumtime] [int] NULL,
	[ID_User] [int] NULL,
	[ID_Patient] [int] NULL,
	[ID_Biomaterial] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderList]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Order] [int] NULL,
	[ID_Service] [int] NULL,
	[ID_ServiceStatus] [int] NULL,
 CONSTRAINT [PK_OrderList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[Series] [nchar](4) NULL,
	[Number] [nchar](6) NULL,
	[Phone] [nvarchar](15) NULL,
	[Policy] [nvarchar](16) NULL,
	[TypePolicy] [int] NULL,
	[InsuranceCompany] [int] NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PolicyType]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PolicyType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_PolicyType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RenderingOfServisec]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RenderingOfServisec](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Users] [int] NULL,
	[ID_Services] [int] NULL,
	[ID_Analyzer] [int] NULL,
	[Rendered] [date] NULL,
 CONSTRAINT [PK_RenderingOfServisec] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Cost] [nvarchar](50) NULL,
	[Period] [nvarchar](50) NULL,
	[AverageDeviation] [float] NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceStatus]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_ServiceStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17.05.2024 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Ip] [nvarchar](50) NULL,
	[LastEnter] [datetime] NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Analyzer] ON 

INSERT [dbo].[Analyzer] ([ID], [ID_Biomaterial], [Name]) VALUES (1, NULL, N'Гематологические')
INSERT [dbo].[Analyzer] ([ID], [ID_Biomaterial], [Name]) VALUES (2, NULL, N'Биохимические')
INSERT [dbo].[Analyzer] ([ID], [ID_Biomaterial], [Name]) VALUES (3, NULL, N'Иммуноферментные')
INSERT [dbo].[Analyzer] ([ID], [ID_Biomaterial], [Name]) VALUES (5, NULL, N'Влагометры')
INSERT [dbo].[Analyzer] ([ID], [ID_Biomaterial], [Name]) VALUES (6, NULL, N'Фотометры')
INSERT [dbo].[Analyzer] ([ID], [ID_Biomaterial], [Name]) VALUES (7, NULL, N'Коагулометры')
INSERT [dbo].[Analyzer] ([ID], [ID_Biomaterial], [Name]) VALUES (8, NULL, N'Гемоглобинометры')
SET IDENTITY_INSERT [dbo].[Analyzer] OFF
GO
SET IDENTITY_INSERT [dbo].[AttemptStatus] ON 

INSERT [dbo].[AttemptStatus] ([ID], [Name]) VALUES (1, N'Успешный')
INSERT [dbo].[AttemptStatus] ([ID], [Name]) VALUES (2, N'Ошибочная')
SET IDENTITY_INSERT [dbo].[AttemptStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Biomaterial] ON 

INSERT [dbo].[Biomaterial] ([ID], [Name]) VALUES (1, N'Кровь')
INSERT [dbo].[Biomaterial] ([ID], [Name]) VALUES (2, N'Плазма крови')
INSERT [dbo].[Biomaterial] ([ID], [Name]) VALUES (3, N'Ликвор')
SET IDENTITY_INSERT [dbo].[Biomaterial] OFF
GO
SET IDENTITY_INSERT [dbo].[InsuranceCompany] ON 

INSERT [dbo].[InsuranceCompany] ([ID], [Name], [Address], [INN], [R/s], [BIC]) VALUES (1, N'МАКС-М', N'г. Пермь, ул. Пушкина, д. 78а, 2-й этаж', N'7702030351', N'40701810938180120035', N'044525225')
INSERT [dbo].[InsuranceCompany] ([ID], [Name], [Address], [INN], [R/s], [BIC]) VALUES (2, N'АСТРАМЕД-МС', N'г. Пермь, ул. Белинского, д. 47а', N'6685000585', N'45212358001275638592', N'046123512')
INSERT [dbo].[InsuranceCompany] ([ID], [Name], [Address], [INN], [R/s], [BIC]) VALUES (3, N'Капитал МС', N'г. Пермь, ул. Героев Хасана, д. 9', N'7813171100', N'563041562098458273', N'645212531')
INSERT [dbo].[InsuranceCompany] ([ID], [Name], [Address], [INN], [R/s], [BIC]) VALUES (4, N'РЕСО-Мед', N'г. Пермь, ул. М. Горького, дю 9', N'5035000265', N'40701810601850000286', N'044525593')
SET IDENTITY_INSERT [dbo].[InsuranceCompany] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (1, N'В процессе')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (2, N'Оформлен')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (3, N'Выполнен')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[PolicyType] ON 

INSERT [dbo].[PolicyType] ([ID], [Name]) VALUES (1, N'Бумажный')
INSERT [dbo].[PolicyType] ([ID], [Name]) VALUES (2, N'Электронный')
INSERT [dbo].[PolicyType] ([ID], [Name]) VALUES (3, N'Универсальная электронная карта(УЭК)')
SET IDENTITY_INSERT [dbo].[PolicyType] OFF
GO
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([ID], [Name], [Image]) VALUES (1, N'Администратор', NULL)
INSERT [dbo].[Positions] ([ID], [Name], [Image]) VALUES (2, N'Лаборатн', NULL)
INSERT [dbo].[Positions] ([ID], [Name], [Image]) VALUES (3, N'Лаборант-исследователь', NULL)
INSERT [dbo].[Positions] ([ID], [Name], [Image]) VALUES (4, N'Бухгалтер ', NULL)
SET IDENTITY_INSERT [dbo].[Positions] OFF
GO
SET IDENTITY_INSERT [dbo].[RenderingOfServisec] ON 

INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (1, 1, 557, NULL, CAST(N'2020-02-10' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (2, 1, 836, NULL, CAST(N'2020-02-10' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (3, 1, 287, NULL, CAST(N'2020-02-10' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (4, 2, 855, NULL, CAST(N'2020-06-20' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (5, 2, 619, NULL, CAST(N'2020-06-20' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (6, 2, 557, NULL, CAST(N'2020-06-20' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (7, 2, 836, NULL, CAST(N'2020-06-20' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (8, 2, 548, NULL, CAST(N'2020-06-20' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (9, 3, 543, NULL, CAST(N'2020-05-19' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (10, 3, 836, NULL, CAST(N'2020-05-19' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (11, 4, 855, NULL, CAST(N'2020-06-22' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (12, 4, 258, NULL, CAST(N'2020-06-22' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (13, 5, 543, NULL, CAST(N'2020-03-18' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (14, 5, 415, NULL, CAST(N'2020-03-18' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (15, 5, 619, NULL, CAST(N'2020-03-18' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (16, 5, 557, NULL, CAST(N'2020-03-18' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (17, 6, 557, NULL, CAST(N'2020-07-04' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (18, 6, 836, NULL, CAST(N'2020-07-04' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (19, 6, 229, NULL, CAST(N'2020-07-04' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (20, 7, 287, NULL, CAST(N'2020-09-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (21, 7, 619, NULL, CAST(N'2020-09-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (22, 7, 548, NULL, CAST(N'2020-09-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (23, 7, 346, NULL, CAST(N'2020-09-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (24, 8, 415, NULL, CAST(N'2020-08-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (25, 8, 311, NULL, CAST(N'2020-08-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (26, 8, 176, NULL, CAST(N'2020-08-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (27, 8, 855, NULL, CAST(N'2020-08-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (28, 9, 323, NULL, CAST(N'2020-05-22' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (29, 9, 548, NULL, CAST(N'2020-05-22' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (30, 9, 346, NULL, CAST(N'2020-05-22' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (31, 10, 229, NULL, CAST(N'2020-06-06' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (32, 10, 346, NULL, CAST(N'2020-06-06' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (33, 10, 501, NULL, CAST(N'2020-06-06' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (34, 10, 548, NULL, CAST(N'2020-06-06' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (35, 11, 287, NULL, CAST(N'2020-08-21' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (36, 12, 619, NULL, CAST(N'2019-10-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (37, 12, 258, NULL, CAST(N'2019-10-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (38, 12, 229, NULL, CAST(N'2019-10-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (39, 12, 557, NULL, CAST(N'2019-10-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (40, 12, 797, NULL, CAST(N'2019-10-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (41, 13, 323, NULL, CAST(N'2020-01-22' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (42, 13, 311, NULL, CAST(N'2020-01-22' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (43, 13, 557, NULL, CAST(N'2020-01-22' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (44, 14, 855, NULL, CAST(N'2020-07-09' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (45, 14, 176, NULL, CAST(N'2020-07-09' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (46, 15, 229, NULL, CAST(N'2020-04-24' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (47, 15, 836, NULL, CAST(N'2020-04-24' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (48, 15, 287, NULL, CAST(N'2020-04-24' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (49, 15, 619, NULL, CAST(N'2020-04-24' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (50, 16, 557, NULL, CAST(N'2020-04-20' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (51, 17, 346, NULL, CAST(N'2020-06-09' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (52, 17, 836, NULL, CAST(N'2020-06-09' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (53, 18, 619, NULL, CAST(N'2020-04-20' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (54, 18, 258, NULL, CAST(N'2020-04-20' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (55, 19, 176, NULL, CAST(N'2019-12-02' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (56, 19, 543, NULL, CAST(N'2019-12-02' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (57, 19, 855, NULL, CAST(N'2019-12-02' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (58, 19, 258, NULL, CAST(N'2019-12-02' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (59, 20, 323, NULL, CAST(N'2020-06-21' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (60, 20, 855, NULL, CAST(N'2020-06-21' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (61, 20, 659, NULL, CAST(N'2020-06-21' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (62, 20, 287, NULL, CAST(N'2020-06-21' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (63, 21, 346, NULL, CAST(N'2019-11-08' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (64, 21, 855, NULL, CAST(N'2019-11-08' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (65, 21, 323, NULL, CAST(N'2019-11-08' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (66, 21, 557, NULL, CAST(N'2019-11-08' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (67, 21, 501, NULL, CAST(N'2019-11-08' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (68, 22, 855, NULL, CAST(N'2020-04-28' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (69, 22, 287, NULL, CAST(N'2020-04-28' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (70, 23, 836, NULL, CAST(N'2020-05-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (71, 23, 229, NULL, CAST(N'2020-05-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (72, 23, 258, NULL, CAST(N'2020-05-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (73, 24, 548, NULL, CAST(N'2019-11-15' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (74, 24, 557, NULL, CAST(N'2019-11-15' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (75, 24, 176, NULL, CAST(N'2019-11-15' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (76, 25, 543, NULL, CAST(N'2020-02-19' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (77, 25, 836, NULL, CAST(N'2020-02-19' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (78, 26, 548, NULL, CAST(N'2019-09-18' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (79, 26, 855, NULL, CAST(N'2019-09-18' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (80, 27, 501, NULL, CAST(N'2020-01-11' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (81, 27, 797, NULL, CAST(N'2020-01-11' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (82, 28, 176, NULL, CAST(N'2020-03-22' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (83, 28, 855, NULL, CAST(N'2020-03-22' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (84, 29, 836, NULL, CAST(N'2020-07-19' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (85, 29, 176, NULL, CAST(N'2020-07-19' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (86, 29, 619, NULL, CAST(N'2020-07-19' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (87, 29, 258, NULL, CAST(N'2020-07-19' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (88, 30, 346, NULL, CAST(N'2019-12-17' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (89, 31, 548, NULL, CAST(N'2020-08-09' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (90, 31, 229, NULL, CAST(N'2020-08-09' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (91, 31, 258, NULL, CAST(N'2020-08-09' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (92, 31, 619, NULL, CAST(N'2020-08-09' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (93, 32, 836, NULL, CAST(N'2020-03-29' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (94, 32, 797, NULL, CAST(N'2020-03-29' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (95, 33, 548, NULL, CAST(N'2020-01-29' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (96, 34, 501, NULL, CAST(N'2019-12-14' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (97, 34, 258, NULL, CAST(N'2019-12-14' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (98, 34, 659, NULL, CAST(N'2019-12-14' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (99, 35, 797, NULL, CAST(N'2019-12-25' AS Date))
GO
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (100, 35, 287, NULL, CAST(N'2019-12-25' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (101, 35, 855, NULL, CAST(N'2019-12-25' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (102, 35, 346, NULL, CAST(N'2019-12-25' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (103, 36, 415, NULL, CAST(N'2020-02-05' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (104, 36, 543, NULL, CAST(N'2020-02-05' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (105, 36, 836, NULL, CAST(N'2020-02-05' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (106, 37, 836, NULL, CAST(N'2020-01-23' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (107, 38, 501, NULL, CAST(N'2020-06-17' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (108, 39, 836, NULL, CAST(N'2019-12-27' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (109, 39, 258, NULL, CAST(N'2019-12-27' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (110, 39, 619, NULL, CAST(N'2019-12-27' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (111, 40, 797, NULL, CAST(N'2019-12-29' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (112, 40, 346, NULL, CAST(N'2019-12-29' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (113, 40, 543, NULL, CAST(N'2019-12-29' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (114, 40, 501, NULL, CAST(N'2019-12-29' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (115, 40, 258, NULL, CAST(N'2019-12-29' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (116, 41, 176, NULL, CAST(N'2020-02-10' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (117, 41, 619, NULL, CAST(N'2020-02-10' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (118, 42, 501, NULL, CAST(N'2020-06-13' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (119, 42, 258, NULL, CAST(N'2020-06-13' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (120, 43, 619, NULL, CAST(N'2020-03-19' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (121, 44, 415, NULL, CAST(N'2019-10-17' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (122, 44, 619, NULL, CAST(N'2019-10-17' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (123, 45, 543, NULL, CAST(N'2020-01-26' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (124, 46, 415, NULL, CAST(N'2020-05-22' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (125, 47, 323, NULL, CAST(N'2020-06-17' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (126, 47, 548, NULL, CAST(N'2020-06-17' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (127, 48, 176, NULL, CAST(N'2019-11-16' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (128, 48, 659, NULL, CAST(N'2019-11-16' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (129, 48, 287, NULL, CAST(N'2019-11-16' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (130, 49, 548, NULL, CAST(N'2020-05-06' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (131, 50, 659, NULL, CAST(N'2020-03-30' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (132, 50, 501, NULL, CAST(N'2020-03-30' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (133, 50, 415, NULL, CAST(N'2020-03-30' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (134, 51, 176, NULL, CAST(N'2020-06-24' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (135, 51, 311, NULL, CAST(N'2020-06-24' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (136, 51, 855, NULL, CAST(N'2020-06-24' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (137, 52, 287, NULL, CAST(N'2020-08-19' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (138, 52, 659, NULL, CAST(N'2020-08-19' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (139, 53, 797, NULL, CAST(N'2019-12-17' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (140, 53, 323, NULL, CAST(N'2019-12-17' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (141, 53, 548, NULL, CAST(N'2019-12-17' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (142, 54, 836, NULL, CAST(N'2020-03-14' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (143, 54, 543, NULL, CAST(N'2020-03-14' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (144, 54, 548, NULL, CAST(N'2020-03-14' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (145, 54, 311, NULL, CAST(N'2020-03-14' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (146, 55, 543, NULL, CAST(N'2019-10-07' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (147, 55, 287, NULL, CAST(N'2019-10-07' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (148, 55, 258, NULL, CAST(N'2019-10-07' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (149, 56, 287, NULL, CAST(N'2020-02-25' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (150, 56, 557, NULL, CAST(N'2020-02-25' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (151, 56, 543, NULL, CAST(N'2020-02-25' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (152, 57, 619, NULL, CAST(N'2020-07-29' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (153, 57, 323, NULL, CAST(N'2020-07-29' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (154, 57, 855, NULL, CAST(N'2020-07-29' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (155, 57, 229, NULL, CAST(N'2020-07-29' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (156, 58, 176, NULL, CAST(N'2020-02-19' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (157, 58, 855, NULL, CAST(N'2020-02-19' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (158, 59, 836, NULL, CAST(N'2020-07-15' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (159, 59, 548, NULL, CAST(N'2020-07-15' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (160, 60, 543, NULL, CAST(N'2019-12-20' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (161, 61, 557, NULL, CAST(N'2020-09-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (162, 61, 287, NULL, CAST(N'2020-09-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (163, 61, 836, NULL, CAST(N'2020-09-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (164, 62, 346, NULL, CAST(N'2020-01-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (165, 62, 258, NULL, CAST(N'2020-01-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (166, 62, 543, NULL, CAST(N'2020-01-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (167, 62, 323, NULL, CAST(N'2020-01-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (168, 62, 176, NULL, CAST(N'2020-01-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (169, 63, 323, NULL, CAST(N'2020-01-01' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (170, 63, 501, NULL, CAST(N'2020-01-01' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (171, 64, 258, NULL, CAST(N'2019-10-05' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (172, 65, 176, NULL, CAST(N'2019-10-12' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (173, 65, 229, NULL, CAST(N'2019-10-12' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (174, 66, 855, NULL, CAST(N'2020-08-14' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (175, 66, 287, NULL, CAST(N'2020-08-14' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (176, 66, 797, NULL, CAST(N'2020-08-14' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (177, 67, 229, NULL, CAST(N'2020-05-26' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (178, 67, 323, NULL, CAST(N'2020-05-26' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (179, 67, 501, NULL, CAST(N'2020-05-26' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (180, 67, 258, NULL, CAST(N'2020-05-26' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (181, 67, 415, NULL, CAST(N'2020-05-26' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (182, 68, 619, NULL, CAST(N'2020-02-23' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (183, 68, 258, NULL, CAST(N'2020-02-23' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (184, 68, 501, NULL, CAST(N'2020-02-23' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (185, 68, 287, NULL, CAST(N'2020-02-23' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (186, 69, 346, NULL, CAST(N'2020-06-17' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (187, 69, 311, NULL, CAST(N'2020-06-17' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (188, 69, 176, NULL, CAST(N'2020-06-17' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (189, 70, 836, NULL, CAST(N'2019-12-04' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (190, 70, 346, NULL, CAST(N'2019-12-04' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (191, 71, 346, NULL, CAST(N'2020-06-30' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (192, 72, 548, NULL, CAST(N'2019-12-05' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (193, 72, 258, NULL, CAST(N'2019-12-05' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (194, 72, 311, NULL, CAST(N'2019-12-05' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (195, 72, 229, NULL, CAST(N'2019-12-05' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (196, 73, 619, NULL, CAST(N'2020-01-26' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (197, 73, 659, NULL, CAST(N'2020-01-26' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (198, 73, 346, NULL, CAST(N'2020-01-26' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (199, 74, 346, NULL, CAST(N'2020-05-01' AS Date))
GO
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (200, 74, 176, NULL, CAST(N'2020-05-01' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (201, 74, 415, NULL, CAST(N'2020-05-01' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (202, 75, 176, NULL, CAST(N'2020-04-02' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (203, 75, 287, NULL, CAST(N'2020-04-02' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (204, 75, 311, NULL, CAST(N'2020-04-02' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (205, 75, 619, NULL, CAST(N'2020-04-02' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (206, 76, 548, NULL, CAST(N'2020-05-02' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (207, 76, 543, NULL, CAST(N'2020-05-02' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (208, 76, 855, NULL, CAST(N'2020-05-02' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (209, 77, 258, NULL, CAST(N'2020-08-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (210, 78, 323, NULL, CAST(N'2020-09-11' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (211, 78, 287, NULL, CAST(N'2020-09-11' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (212, 78, 659, NULL, CAST(N'2020-09-11' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (213, 78, 176, NULL, CAST(N'2020-09-11' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (214, 79, 287, NULL, CAST(N'2020-04-28' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (215, 80, 287, NULL, CAST(N'2020-02-06' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (216, 81, 501, NULL, CAST(N'2020-01-06' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (217, 81, 176, NULL, CAST(N'2020-01-06' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (218, 82, 287, NULL, CAST(N'2020-01-20' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (219, 82, 501, NULL, CAST(N'2020-01-20' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (220, 82, 311, NULL, CAST(N'2020-01-20' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (221, 83, 659, NULL, CAST(N'2020-03-18' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (222, 83, 543, NULL, CAST(N'2020-03-18' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (223, 83, 501, NULL, CAST(N'2020-03-18' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (224, 83, 548, NULL, CAST(N'2020-03-18' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (225, 84, 415, NULL, CAST(N'2020-01-22' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (226, 84, 323, NULL, CAST(N'2020-01-22' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (227, 84, 346, NULL, CAST(N'2020-01-22' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (228, 84, 311, NULL, CAST(N'2020-01-22' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (229, 85, 415, NULL, CAST(N'2020-06-25' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (230, 85, 176, NULL, CAST(N'2020-06-25' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (231, 85, 836, NULL, CAST(N'2020-06-25' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (232, 85, 287, NULL, CAST(N'2020-06-25' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (233, 86, 836, NULL, CAST(N'2020-06-15' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (234, 86, 229, NULL, CAST(N'2020-06-15' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (235, 86, 346, NULL, CAST(N'2020-06-15' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (236, 87, 323, NULL, CAST(N'2020-01-06' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (237, 87, 229, NULL, CAST(N'2020-01-06' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (238, 87, 258, NULL, CAST(N'2020-01-06' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (239, 87, 415, NULL, CAST(N'2020-01-06' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (240, 88, 346, NULL, CAST(N'2020-07-10' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (241, 88, 548, NULL, CAST(N'2020-07-10' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (242, 89, 855, NULL, CAST(N'2020-06-16' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (243, 89, 619, NULL, CAST(N'2020-06-16' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (244, 90, 548, NULL, CAST(N'2020-02-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (245, 90, 311, NULL, CAST(N'2020-02-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (246, 90, 346, NULL, CAST(N'2020-02-03' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (247, 91, 557, NULL, CAST(N'2020-01-24' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (248, 91, 548, NULL, CAST(N'2020-01-24' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (249, 91, 323, NULL, CAST(N'2020-01-24' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (250, 92, 323, NULL, CAST(N'2020-04-10' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (251, 92, 855, NULL, CAST(N'2020-04-10' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (252, 92, 229, NULL, CAST(N'2020-04-10' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (253, 93, 501, NULL, CAST(N'2020-02-02' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (254, 93, 855, NULL, CAST(N'2020-02-02' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (255, 93, 797, NULL, CAST(N'2020-02-02' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (256, 94, 323, NULL, CAST(N'2020-06-26' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (257, 95, 415, NULL, CAST(N'2020-06-12' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (258, 95, 543, NULL, CAST(N'2020-06-12' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (259, 96, 311, NULL, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (260, 96, 797, NULL, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (261, 96, 855, NULL, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (262, 97, 176, NULL, CAST(N'2020-08-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (263, 97, 836, NULL, CAST(N'2020-08-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (264, 97, 346, NULL, CAST(N'2020-08-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (265, 97, 501, NULL, CAST(N'2020-08-31' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (266, 98, 229, NULL, CAST(N'2019-11-09' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (267, 98, 415, NULL, CAST(N'2019-11-09' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (268, 98, 258, NULL, CAST(N'2019-11-09' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (269, 98, 619, NULL, CAST(N'2019-11-09' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (270, 99, 659, NULL, CAST(N'2019-12-11' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (271, 100, 548, NULL, CAST(N'2020-09-07' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (272, 100, 346, NULL, CAST(N'2020-09-07' AS Date))
INSERT [dbo].[RenderingOfServisec] ([ID], [ID_Users], [ID_Services], [ID_Analyzer], [Rendered]) VALUES (273, 100, 311, NULL, CAST(N'2020-09-07' AS Date))
SET IDENTITY_INSERT [dbo].[RenderingOfServisec] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (176, N'Билирубин общий', N'102.85', N'1 день', 0.07)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (229, N'СПИД', N'341.78', N'3 дня', 0.09)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (258, N'Креатинин', N'143.22', N'1 день', 0.04)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (287, N'Волчаночный антикоагулянт', N'290.11', N'1 день', 0.03)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (311, N'Амилаза', N'361.88', N'2-3 дня', 0.08)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (323, N'Глюкоза', N'447.65', N'1 день', 0.05)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (346, N'Общий белок', N'396.03', N'1 день', 0.01)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (415, N'Кальций общий', N'419.9', N'1-2 дня', 0.02)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (501, N'Гепатит В', N'176.83', N'4 дня', 0.01)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (543, N'Гепатит С', N'289.99', N'8-9 дней', 0.03)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (548, N'Альбумин', N'234.09', N'1 день', 0.01)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (557, N'ВИЧ', N'490.77', N'3 дня', 0.16)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (619, N'TSH', N'262.71', N'2 дня', 0.05)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (659, N'Сифилис RPR', N'443.66', N'2 дня', 0.07)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (797, N'АТ и АГ к ВИЧ 1/2', N'370.62', N'3 дня', 0.11)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (836, N'Железо', N'105.32', N'1 день', 0.04)
INSERT [dbo].[Services] ([ID], [Name], [Cost], [Period], [AverageDeviation]) VALUES (855, N'Ковид IgM', N'209.78', N'1 день', 0.08)
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceStatus] ON 

INSERT [dbo].[ServiceStatus] ([ID], [Name]) VALUES (1, N'Выполнен')
INSERT [dbo].[ServiceStatus] ([ID], [Name]) VALUES (2, N'Ожидает выполнения')
INSERT [dbo].[ServiceStatus] ([ID], [Name]) VALUES (3, N'Выполняется')
SET IDENTITY_INSERT [dbo].[ServiceStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (1, N'Clareta Hacking', N'chacking0', N'4tzqHdkqzo4', N'147.231.50.234', CAST(N'2020-02-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (2, N'Northrop Mably', N'nmably1', N'ukM0e6', N'22.32.15.211', CAST(N'2020-06-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (3, N'Fabian Rolf', N'frolf2', N'7QpCwac0yi', N'113.92.142.29', CAST(N'2020-05-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (4, N'Lauree Raden', N'lraden3', N'5Ydp2mz', N'39.24.146.52', CAST(N'2020-06-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (5, N'Barby Follos', N'bfollos4', N'ckmAJPQV', N'87.232.97.3', CAST(N'2020-03-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (6, N'Mile Enterle', N'menterle5', N'0PRom6i', N'85.121.209.6', CAST(N'2020-07-04T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (7, N'Midge Peaker', N'mpeaker6', N'0Tc5oRc', N'196.39.132.128', CAST(N'2020-09-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (8, N'Manon Robichon', N'mrobichon7', N'LEwEjMlmE5X', N'143.159.207.105', CAST(N'2020-08-31T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (9, N'Stavro Robken', N'srobken8', N'Cbmj3Yi', N'12.154.73.196', CAST(N'2020-05-22T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (10, N'Bryan Tidmas', N'btidmas9', N'dYDHbBQfK', N'24.42.134.21', CAST(N'2020-06-06T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (11, N'Jeannette Fussie', N'jfussiea', N'EGxXuLQ9', N'98.194.112.137', CAST(N'2020-08-21T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (12, N'Stephen Antonacci', N'santonaccib', N'YcXAhY3Pja', N'198.146.255.15', CAST(N'2019-10-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (13, N'Niccolo Bountiff', N'nbountiffc', N'5xfyjS9ZULGA', N'231.78.246.229', CAST(N'2020-01-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (14, N'Clemente Benjefield', N'cbenjefieldd', N'tQOsP0ei9TuD', N'88.126.93.246', CAST(N'2020-07-09T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (15, N'Orlan Corbyn', N'ocorbyne', N'bG1ZIzwIoU', N'232.175.48.179', CAST(N'2020-04-24T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (16, N'Coreen Stickins', N'cstickinsf', N'QRYADbgNj', N'64.30.175.158', CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (17, N'Daveta Clarage', N'dclarageg', N'Yp59ZIDnWe', N'139.88.229.111', CAST(N'2020-06-09T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (18, N'Javier McCawley', N'jmccawleyh', N'g58zLcmCYON', N'14.199.67.32', CAST(N'2020-04-20T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (19, N'Daile Band', N'dbandi', N'yFAaYuVW', N'206.105.148.56', CAST(N'2019-12-02T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (20, N'Angil Buttery', N'abutteryj', N'ttOFbWWGtD', N'192.158.7.138', CAST(N'2020-06-21T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (21, N'Kyla Kinman', N'kkinmank', N'qUr6fdWP6L5G', N'134.99.243.113', CAST(N'2019-11-08T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (22, N'Selena Skepper', N'sskepperl', N'jHYN0v3', N'52.90.89.126', CAST(N'2020-04-28T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (23, N'Alyson Yeoland', N'ayeolandm', N'QQezRBV9', N'239.7.55.187', CAST(N'2020-05-31T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (24, N'Claudie Speeding', N'cspeedingn', N'UCLYITfw2Vo', N'127.37.194.127', CAST(N'2019-11-15T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (25, N'Alaric Scarisbrick', N'ascarisbricko', N'fzBcv6GbyCp', N'97.227.15.172', CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (26, N'Marie Thurby', N'mthurbyp', N'wg0uIskqei', N'94.70.148.135', CAST(N'2019-09-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (27, N'Cloe Roxbrough', N'croxbroughq', N'67CVVym', N'185.110.201.36', CAST(N'2020-01-11T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (28, N'Pegeen McCotter', N'pmccotterr', N'QG5tdzRpGZJ2', N'22.179.187.229', CAST(N'2020-03-22T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (29, N'Iggie Calleja', N'icallejas', N'aeDvZk8o9', N'67.237.123.227', CAST(N'2020-07-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (30, N'Nelle Brosch', N'nbroscht', N'DmPJt2', N'251.1.59.65', CAST(N'2019-12-17T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (31, N'Shae Allsepp', N'sallseppu', N't0ko0854Cpvv', N'88.20.74.85', CAST(N'2020-08-09T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (32, N'Eldridge Abbatucci', N'eabbatucciv', N'gUtNdsDu', N'52.44.134.126', CAST(N'2020-03-29T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (33, N'Skip Garnham', N'sgarnhamw', N'eml6RqbK', N'100.17.131.54', CAST(N'2020-01-29T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (34, N'Ric Kitchenside', N'rkitchensidex', N'xaa7miQ7yB', N'29.100.76.146', CAST(N'2019-12-14T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (35, N'Urbanus Di Meo', N'udiy', N'dHqu78cU6NOP', N'90.30.202.251', CAST(N'2019-12-25T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (36, N'Monty Beidebeke', N'mbeidebekez', N'F5T5spAU9A4O', N'3.32.202.92', CAST(N'2020-02-05T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (37, N'Byrann Savins', N'bsavins10', N'l6sYf29NLN', N'123.187.14.103', CAST(N'2020-01-23T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (38, N'Sonnie Riby', N'sriby11', N'Va34LYqFh', N'16.81.16.23', CAST(N'2020-06-17T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (39, N'Sherill Birney', N'sbirney12', N'Ggygo2ePsETs', N'144.76.193.237', CAST(N'2019-12-27T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (40, N'Indira Kleanthous', N'ikleanthous13', N'3H0GS7a', N'169.108.108.88', CAST(N'2019-12-29T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (41, N'Maison Skerme', N'mskerme14', N'wy1HWA', N'143.177.136.232', CAST(N'2020-02-10T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (42, N'Hanan Cahey', N'hcahey15', N'NSXcG9khd', N'18.127.87.158', CAST(N'2020-06-13T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (43, N'Tore Rusling', N'trusling16', N'abol9dYC8e', N'142.216.95.251', CAST(N'2020-03-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (44, N'Jeddy De Souza', N'jde17', N'gK6Hsl8Q', N'229.104.255.175', CAST(N'2019-10-17T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (45, N'Flossi McLeoid', N'fmcleoid18', N'B9zr0N7cJw', N'90.207.38.179', CAST(N'2020-01-26T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (46, N'Nikoletta Megainey', N'nmegainey19', N'gph7QurFf', N'172.249.218.50', CAST(N'2020-05-22T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (47, N'Adan Bliven', N'abliven1a', N'vVxlf94KpeX', N'49.101.94.118', CAST(N'2020-06-17T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (48, N'Mohandis Rossoni', N'mrossoni1b', N'nLXj2lS', N'161.5.132.42', CAST(N'2019-11-16T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (49, N'Nappie Redington', N'nredington1c', N'DCbOb1SX', N'174.42.8.3', CAST(N'2020-05-06T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (50, N'Lenka Francie', N'lfrancie1d', N'DoGeHWuAAM', N'182.2.128.34', CAST(N'2020-03-30T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (51, N'Ashley Blowin', N'ablowin1e', N'aQygVtMjN', N'73.212.243.168', CAST(N'2020-06-24T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (52, N'Vale Goroni', N'vgoroni1f', N'bWr0QU', N'93.126.120.134', CAST(N'2020-08-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (53, N'Suki Grafom', N'sgrafom1g', N'JcNcVDAouYzA', N'9.26.5.107', CAST(N'2019-12-17T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (54, N'Justis Gianneschi', N'jgianneschi1h', N'oieX5u3sUfpD', N'139.241.156.87', CAST(N'2020-03-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (55, N'Emilie Collett', N'ecollett1i', N'Y0uMyKB0W', N'47.0.240.7', CAST(N'2019-10-07T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (56, N'Byrom Terrell', N'bterrell1j', N'hswseW', N'157.21.33.53', CAST(N'2020-02-25T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (57, N'Daphne Bifield', N'dbifield1k', N'oYAQ4URihIA', N'24.185.229.169', CAST(N'2020-07-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (58, N'Blanca Staig', N'bstaig1l', N'MygqEtjMtUbC', N'171.78.28.229', CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (59, N'Adriaens Kennsley', N'akennsley1m', N'CTUdBfJsy6qF', N'208.81.128.179', CAST(N'2020-07-15T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (60, N'Emlyn Bartak', N'ebartak1n', N'y3t4H1', N'130.247.20.138', CAST(N'2019-12-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (61, N'Victoria Willshire', N'vwillshire1o', N'VFSLc2t', N'243.230.165.161', CAST(N'2020-09-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (62, N'Egon Savin', N'esavin1p', N'axnJY9s', N'40.140.160.210', CAST(N'2020-01-31T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (63, N'Phillie Elsom', N'pelsom1q', N'OXzMECG', N'253.7.8.82', CAST(N'2020-01-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (64, N'Adan Semaine', N'asemaine1r', N'MdJRkHor5SP', N'76.252.15.218', CAST(N'2019-10-05T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (65, N'Constantino Northrop', N'cnorthrop1s', N'UIwCvTA7MRS0', N'119.130.24.85', CAST(N'2019-10-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (66, N'Rodie Easson', N'reasson1t', N'3J0jgg9RWlXs', N'212.248.119.232', CAST(N'2020-08-14T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (67, N'Alida Boleyn', N'aboleyn1u', N'3q2mQdDRmtr', N'181.14.56.184', CAST(N'2020-05-26T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (68, N'Hill Scholfield', N'hscholfield1v', N'1Pbs3K6qXYB', N'15.7.205.224', CAST(N'2020-02-23T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (69, N'Cordell Cowpe', N'ccowpe1w', N'VHr417Ft0', N'237.236.173.63', CAST(N'2020-06-17T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (70, N'Alexandro Eldon', N'aeldon1x', N'rrywOQRmFKyh', N'4.174.11.210', CAST(N'2019-12-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (71, N'Kayle Collin', N'kcollin1y', N'Q0ZV21vew0', N'52.19.142.168', CAST(N'2020-06-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (72, N'Inesita Larkins', N'ilarkins1z', N'DEFNpHtU', N'3.26.42.188', CAST(N'2019-12-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (73, N'Waylin Lound', N'wlound20', N'a2G4Ihh2o', N'31.243.68.215', CAST(N'2020-01-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (74, N'Mechelle Gillogley', N'mgillogley21', N'EjUHfCUFqF', N'79.38.53.53', CAST(N'2020-05-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (75, N'Donal Muccino', N'dmuccino22', N'E4okVgx', N'109.138.101.234', CAST(N'2020-04-02T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (76, N'Joye Leadbetter', N'jleadbetter23', N'ZNsaKdgb', N'51.245.190.167', CAST(N'2020-05-02T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (77, N'Gianina Trump', N'gtrump24', N'6XXY7IS26Ci', N'11.191.37.17', CAST(N'2020-08-03T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (78, N'Read LeEstut', N'rleestut25', N'zq3C4rUR', N'119.247.100.162', CAST(N'2020-09-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (79, N'Jill Anscott', N'janscott26', N'5maCRrCZLu', N'104.85.178.46', CAST(N'2020-04-28T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (80, N'Bud Douch', N'bdouch27', N'KAkwrli', N'72.132.101.188', CAST(N'2020-02-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (81, N'Cicily Ossenna', N'cossenna28', N'vfKJkCeohOzZ', N'230.85.180.186', CAST(N'2020-01-06T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (82, N'Hew Izzat', N'hizzat29', N'Uifdtu', N'143.246.125.169', CAST(N'2020-01-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (83, N'Eddie Gimeno', N'egimeno2a', N'oF1hbmKlZ', N'60.57.115.125', CAST(N'2020-03-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (84, N'Sybyl Fierro', N'sfierro2b', N'VjUrQ2', N'250.233.247.215', CAST(N'2020-01-22T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (85, N'Nicol Troup', N'ntroup2c', N'KmDDYf1Pu', N'121.7.142.165', CAST(N'2020-06-25T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (86, N'Bondy Pattenden', N'bpattenden2d', N'IOUkHpOn', N'45.121.26.90', CAST(N'2020-06-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (87, N'Angus Cockman', N'acockman2e', N'fDKhK7OK', N'167.9.255.77', CAST(N'2020-01-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (88, N'Mord Hanscome', N'mhanscome2f', N'xBHzpa7eP0u', N'121.181.10.230', CAST(N'2020-07-10T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (89, N'Susy Leblanc', N'sleblanc2g', N'T2et1U5M', N'118.164.120.202', CAST(N'2020-06-16T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (90, N'Gerard Ciccoloi', N'gciccoloi2h', N'w4dZ3hxiCiAg', N'71.235.27.27', CAST(N'2020-02-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (91, N'Seamus Sayburn', N'ssayburn2i', N'1hTM7EVKaS', N'75.194.92.114', CAST(N'2020-01-24T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (92, N'Washington Gentiry', N'wgentiry2j', N'z2X9UH5', N'188.49.78.185', CAST(N'2020-04-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (93, N'Rebekkah Westall', N'rwestall2k', N'xLgunbO9x6', N'212.150.81.93', CAST(N'2020-02-02T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (94, N'Court Kulic', N'ckulic2l', N'FLHYRN', N'154.121.193.131', CAST(N'2020-06-26T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (95, N'Lorilee Roux', N'lroux2m', N'98cCxHeeK31', N'229.187.60.106', CAST(N'2020-06-12T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (96, N'Modestine Rolinson', N'mrolinson2n', N'faGzyW8hEca', N'9.203.185.188', CAST(N'2019-10-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (97, N'Shelbi Ellgood', N'sellgood2o', N'3do5MME', N'199.226.26.7', CAST(N'2020-08-31T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (98, N'Barbabra Retchless', N'bretchless2p', N'WraGihh', N'86.66.23.203', CAST(N'2019-11-09T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (99, N'Robinetta Jerzak', N'rjerzak2q', N'hAp8jki', N'205.158.144.210', CAST(N'2019-12-11T00:00:00.000' AS DateTime), 2)
GO
INSERT [dbo].[Users] ([ID], [Name], [Login], [Password], [Ip], [LastEnter], [Type]) VALUES (100, N'Vance Boots', N'vboots2r', N'bgJfSDEVEQm6', N'91.73.40.29', CAST(N'2020-09-07T00:00:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Analyzer]  WITH CHECK ADD  CONSTRAINT [FK_Analyzer_Biomaterial] FOREIGN KEY([ID_Biomaterial])
REFERENCES [dbo].[Biomaterial] ([ID])
GO
ALTER TABLE [dbo].[Analyzer] CHECK CONSTRAINT [FK_Analyzer_Biomaterial]
GO
ALTER TABLE [dbo].[AnalyzerOperation]  WITH CHECK ADD  CONSTRAINT [FK_AnalyzerOperation_Analyzer] FOREIGN KEY([ID_Analyzer])
REFERENCES [dbo].[Analyzer] ([ID])
GO
ALTER TABLE [dbo].[AnalyzerOperation] CHECK CONSTRAINT [FK_AnalyzerOperation_Analyzer]
GO
ALTER TABLE [dbo].[AnalyzerOperation]  WITH CHECK ADD  CONSTRAINT [FK_AnalyzerOperation_OrderList] FOREIGN KEY([ID_OrderList])
REFERENCES [dbo].[OrderList] ([ID])
GO
ALTER TABLE [dbo].[AnalyzerOperation] CHECK CONSTRAINT [FK_AnalyzerOperation_OrderList]
GO
ALTER TABLE [dbo].[LoginHistory]  WITH CHECK ADD  CONSTRAINT [FK_LoginHistory_AttemptStatus] FOREIGN KEY([ID_AttemptStatus])
REFERENCES [dbo].[AttemptStatus] ([ID])
GO
ALTER TABLE [dbo].[LoginHistory] CHECK CONSTRAINT [FK_LoginHistory_AttemptStatus]
GO
ALTER TABLE [dbo].[LoginHistory]  WITH CHECK ADD  CONSTRAINT [FK_LoginHistory_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[LoginHistory] CHECK CONSTRAINT [FK_LoginHistory_Users]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Biomaterial] FOREIGN KEY([ID_Biomaterial])
REFERENCES [dbo].[Biomaterial] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Biomaterial]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([ID_OrderStatus])
REFERENCES [dbo].[OrderStatus] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Patient] FOREIGN KEY([ID_Patient])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Patient]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[OrderList]  WITH CHECK ADD  CONSTRAINT [FK_OrderList_Order] FOREIGN KEY([ID_Order])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderList] CHECK CONSTRAINT [FK_OrderList_Order]
GO
ALTER TABLE [dbo].[OrderList]  WITH CHECK ADD  CONSTRAINT [FK_OrderList_Services] FOREIGN KEY([ID_Service])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[OrderList] CHECK CONSTRAINT [FK_OrderList_Services]
GO
ALTER TABLE [dbo].[OrderList]  WITH CHECK ADD  CONSTRAINT [FK_OrderList_ServiceStatus] FOREIGN KEY([ID_ServiceStatus])
REFERENCES [dbo].[ServiceStatus] ([ID])
GO
ALTER TABLE [dbo].[OrderList] CHECK CONSTRAINT [FK_OrderList_ServiceStatus]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_InsuranceCompany] FOREIGN KEY([InsuranceCompany])
REFERENCES [dbo].[InsuranceCompany] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_InsuranceCompany]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_PolicyType] FOREIGN KEY([TypePolicy])
REFERENCES [dbo].[PolicyType] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_PolicyType]
GO
ALTER TABLE [dbo].[RenderingOfServisec]  WITH CHECK ADD  CONSTRAINT [FK_RenderingOfServisec_Analyzer] FOREIGN KEY([ID_Analyzer])
REFERENCES [dbo].[Analyzer] ([ID])
GO
ALTER TABLE [dbo].[RenderingOfServisec] CHECK CONSTRAINT [FK_RenderingOfServisec_Analyzer]
GO
ALTER TABLE [dbo].[RenderingOfServisec]  WITH CHECK ADD  CONSTRAINT [FK_RenderingOfServisec_Services] FOREIGN KEY([ID_Services])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[RenderingOfServisec] CHECK CONSTRAINT [FK_RenderingOfServisec_Services]
GO
ALTER TABLE [dbo].[RenderingOfServisec]  WITH CHECK ADD  CONSTRAINT [FK_RenderingOfServisec_Users] FOREIGN KEY([ID_Users])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[RenderingOfServisec] CHECK CONSTRAINT [FK_RenderingOfServisec_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Positions] FOREIGN KEY([Type])
REFERENCES [dbo].[Positions] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Positions]
GO
USE [master]
GO
ALTER DATABASE [labPerm] SET  READ_WRITE 
GO
