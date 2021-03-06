USE [AcademyHW]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 18.09.2021 23:34:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](5) NOT NULL,
	[IS_Active] [int] NOT NULL,
	[Created_at] [datetime] NOT NULL,
	[Updated_at] [datetime] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 18.09.2021 23:34:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Account_Id] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Created_At] [datetime] NOT NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [Account], [IS_Active], [Created_at], [Updated_at]) VALUES (2, N'2222', 1, CAST(N'2021-09-18T13:11:31.243' AS DateTime), NULL)
INSERT [dbo].[Accounts] ([Id], [Account], [IS_Active], [Created_at], [Updated_at]) VALUES (3, N'00003', 1, CAST(N'2021-09-18T15:48:38.373' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([id], [Account_Id], [Amount], [Created_At], [Type]) VALUES (37, 2, CAST(300.00 AS Decimal(18, 2)), CAST(N'2021-09-18T22:41:05.963' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([id], [Account_Id], [Amount], [Created_At], [Type]) VALUES (38, 2, CAST(200.00 AS Decimal(18, 2)), CAST(N'2021-09-18T22:41:34.843' AS DateTime), N'C')
INSERT [dbo].[Transactions] ([id], [Account_Id], [Amount], [Created_At], [Type]) VALUES (39, 2, CAST(50.00 AS Decimal(18, 2)), CAST(N'2021-09-18T22:44:07.493' AS DateTime), N'C')
INSERT [dbo].[Transactions] ([id], [Account_Id], [Amount], [Created_At], [Type]) VALUES (40, 3, CAST(50.00 AS Decimal(18, 2)), CAST(N'2021-09-18T22:44:07.500' AS DateTime), N'D')
INSERT [dbo].[Transactions] ([id], [Account_Id], [Amount], [Created_At], [Type]) VALUES (41, 2, CAST(50.00 AS Decimal(18, 2)), CAST(N'2021-09-18T22:44:54.133' AS DateTime), N'C')
INSERT [dbo].[Transactions] ([id], [Account_Id], [Amount], [Created_At], [Type]) VALUES (42, 3, CAST(50.00 AS Decimal(18, 2)), CAST(N'2021-09-18T22:44:54.140' AS DateTime), N'D')
INSERT [dbo].[Transactions] ([id], [Account_Id], [Amount], [Created_At], [Type]) VALUES (45, 3, CAST(50.00 AS Decimal(18, 2)), CAST(N'2021-09-18T23:25:26.570' AS DateTime), N'C')
INSERT [dbo].[Transactions] ([id], [Account_Id], [Amount], [Created_At], [Type]) VALUES (46, 2, CAST(50.00 AS Decimal(18, 2)), CAST(N'2021-09-18T23:25:26.580' AS DateTime), N'D')
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((1)) FOR [IS_Active]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT (getdate()) FOR [Created_at]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Accounts] FOREIGN KEY([Account_Id])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Accounts]
GO
