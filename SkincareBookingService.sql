USE [master]
GO
/****** Object:  Database [SkincareServiceBookingSystem]    Script Date: 2/2/2025 1:31:51 AM ******/
CREATE DATABASE [SkincareServiceBookingSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SkincareServiceBookingSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS04\MSSQL\DATA\SkincareServiceBookingSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SkincareServiceBookingSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS04\MSSQL\DATA\SkincareServiceBookingSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SkincareServiceBookingSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET  MULTI_USER 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SkincareServiceBookingSystem]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountId] [int] IDENTITY(1,1) NOT NULL,
	[accountName] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[phoneNumber] [nvarchar](20) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[roleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blogId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [text] NOT NULL,
	[customerId] [int] NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[blogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[bookingId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[skinTherapistName] [nvarchar](255) NULL,
	[serviceName] [nvarchar](255) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[bookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[accountId] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[skinTypeName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedbackId] [int] IDENTITY(1,1) NOT NULL,
	[content] [text] NOT NULL,
	[customerId] [int] NOT NULL,
	[serviceId] [int] NOT NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[accountId] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizAnswer]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizAnswer](
	[answerId] [int] IDENTITY(1,1) NOT NULL,
	[questionId] [int] NULL,
	[customerId] [int] NULL,
	[answerText] [nvarchar](255) NOT NULL,
	[score] [int] NOT NULL,
	[createdAt] [datetime] NULL,
	[questionSetId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[answerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizQuestion]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizQuestion](
	[questionId] [int] IDENTITY(1,1) NOT NULL,
	[questionSetId] [int] NULL,
	[content] [text] NOT NULL,
	[skinTypeName] [nvarchar](255) NOT NULL,
	[updatedAt] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[skinTypeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[questionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizQuestionSet]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizQuestionSet](
	[questionSetId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[questionSetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizServiceResult]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizServiceResult](
	[quizResultId] [int] IDENTITY(1,1) NOT NULL,
	[answerId] [int] NULL,
	[result] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[quizResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[ratingId] [int] IDENTITY(1,1) NOT NULL,
	[stars] [int] NOT NULL,
	[serviceId] [int] NOT NULL,
	[customerId] [int] NOT NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ratingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[reportId] [int] IDENTITY(1,1) NOT NULL,
	[totalRevenue] [decimal](18, 2) NOT NULL,
	[totalAppointments] [int] NOT NULL,
	[totalCustomers] [int] NOT NULL,
	[staffFeedback] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[reportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[scheduleId] [int] IDENTITY(1,1) NOT NULL,
	[therapistId] [int] NULL,
	[description] [nvarchar](255) NULL,
	[staffId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[scheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[serviceId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [text] NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[serviceTypeId] [int] NOT NULL,
	[quizResultId] [int] NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[serviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[serviceTypeId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [text] NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[period] [int] NOT NULL,
	[serviceId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[serviceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkinTherapist]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkinTherapist](
	[accountId] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[specialty] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[experience] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkinType]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkinType](
	[skinTypeId] [int] IDENTITY(1,1) NOT NULL,
	[description] [text] NOT NULL,
	[customerId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[skinTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[slotId] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[time] [time](7) NOT NULL,
	[bookingId] [int] NULL,
	[scheduleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[slotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2/2/2025 1:31:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[accountId] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[position] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[Blog] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[QuizAnswer] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[QuizQuestion] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[QuizQuestion] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[QuizQuestionSet] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Rating] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Service] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([accountId])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([accountId])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([accountId])
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[QuizAnswer]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([accountId])
GO
ALTER TABLE [dbo].[QuizAnswer]  WITH CHECK ADD FOREIGN KEY([questionId])
REFERENCES [dbo].[QuizQuestion] ([questionId])
GO
ALTER TABLE [dbo].[QuizAnswer]  WITH CHECK ADD FOREIGN KEY([questionSetId])
REFERENCES [dbo].[QuizQuestionSet] ([questionSetId])
GO
ALTER TABLE [dbo].[QuizQuestion]  WITH CHECK ADD FOREIGN KEY([questionSetId])
REFERENCES [dbo].[QuizQuestionSet] ([questionSetId])
GO
ALTER TABLE [dbo].[QuizQuestion]  WITH CHECK ADD FOREIGN KEY([skinTypeId])
REFERENCES [dbo].[SkinType] ([skinTypeId])
GO
ALTER TABLE [dbo].[QuizServiceResult]  WITH CHECK ADD FOREIGN KEY([answerId])
REFERENCES [dbo].[QuizAnswer] ([answerId])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([accountId])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([staffId])
REFERENCES [dbo].[Staff] ([accountId])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([therapistId])
REFERENCES [dbo].[SkinTherapist] ([accountId])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([quizResultId])
REFERENCES [dbo].[QuizServiceResult] ([quizResultId])
GO
ALTER TABLE [dbo].[ServiceType]  WITH CHECK ADD FOREIGN KEY([serviceId])
REFERENCES [dbo].[Service] ([serviceId])
GO
ALTER TABLE [dbo].[SkinTherapist]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[SkinType]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([accountId])
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD FOREIGN KEY([bookingId])
REFERENCES [dbo].[Booking] ([bookingId])
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD FOREIGN KEY([scheduleId])
REFERENCES [dbo].[Schedule] ([scheduleId])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[QuizAnswer]  WITH CHECK ADD CHECK  (([score]>=(0) AND [score]<=(10)))
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD CHECK  (([stars]>=(1) AND [stars]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [SkincareServiceBookingSystem] SET  READ_WRITE 
GO
