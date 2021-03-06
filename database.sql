USE [PolyOEAsgJv4]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 08/03/2021 4:24:19 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[FavoriteId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NULL,
	[VideoId] [varchar](50) NULL,
	[LikedDate] [date] NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[FavoriteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shares]    Script Date: 08/03/2021 4:24:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shares](
	[ShareId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NULL,
	[VideoId] [varchar](50) NULL,
	[Emails] [nvarchar](250) NULL,
	[ShareDate] [date] NULL,
 CONSTRAINT [PK_Shares] PRIMARY KEY CLUSTERED 
(
	[ShareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08/03/2021 4:24:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](30) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Admin] [bit] NOT NULL,
	[Password] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 08/03/2021 4:24:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[VideoId] [varchar](50) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Poster] [nvarchar](150) NOT NULL,
	[Views] [int] NOT NULL,
	[Description] [nvarchar](1500) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[VideoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (1, N'sangdt', N'ID01', CAST(N'2021-03-03' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (3, N'sangdt', N'ID03', CAST(N'2021-03-01' AS Date))
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikedDate]) VALUES (4, N'sang612', N'ID01', CAST(N'2021-03-07' AS Date))
SET IDENTITY_INSERT [dbo].[Favorites] OFF
SET IDENTITY_INSERT [dbo].[Shares] ON 

INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Emails], [ShareDate]) VALUES (1, N'sang612', N'ID01', N'thanchet612@gmail.com', CAST(N'2021-03-07' AS Date))
SET IDENTITY_INSERT [dbo].[Shares] OFF
INSERT [dbo].[Users] ([Username], [Fullname], [Email], [Admin], [Password]) VALUES (N'sang612', N'Sang Thanh', N'thanchet612@gmail.com', 0, N'123')
INSERT [dbo].[Users] ([Username], [Fullname], [Email], [Admin], [Password]) VALUES (N'sangdt', N'Do Thanh Sang', N'sangdtps12385@fpt.edu.vn', 0, N'123')
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'ID01', N'java', N'uploads/', 22, N'', 0)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'ID03', N'Java3', N'uploads/', 111, N'aass', 1)
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Users]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Videos] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([VideoId])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Videos]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_Shares_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_Shares_Users]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_Shares_Videos] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([VideoId])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_Shares_Videos]
GO
