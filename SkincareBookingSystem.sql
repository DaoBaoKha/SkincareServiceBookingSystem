USE [master]
GO
/****** Object:  Database [SkincareBookingSystem]    Script Date: 2/7/2025 11:42:05 PM ******/
CREATE DATABASE [SkincareBookingSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SkincareBookingSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS04\MSSQL\DATA\SkincareBookingSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SkincareBookingSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS04\MSSQL\DATA\SkincareBookingSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SkincareBookingSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SkincareBookingSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SkincareBookingSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SkincareBookingSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SkincareBookingSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SkincareBookingSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SkincareBookingSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SkincareBookingSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SkincareBookingSystem] SET  MULTI_USER 
GO
ALTER DATABASE [SkincareBookingSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SkincareBookingSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SkincareBookingSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SkincareBookingSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SkincareBookingSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SkincareBookingSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SkincareBookingSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [SkincareBookingSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SkincareBookingSystem]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountId] [int] IDENTITY(1,1) NOT NULL,
	[accountName] [nvarchar](100) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[role] [nvarchar](50) NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blogId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NULL,
	[customerId] [int] NULL,
	[image] [nvarchar](255) NULL,
	[createAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[blogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[bookingId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NULL,
	[location] [nvarchar](255) NULL,
	[date] [datetime] NULL,
	[createAt] [datetime] NULL,
	[status] [nvarchar](50) NULL,
	[amount] [decimal](10, 2) NULL,
	[skintherapistId] [int] NULL,
	[updateAt] [datetime] NULL,
	[serviceName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[bookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[skintypeId] [int] NULL,
	[accountId] [int] NULL,
	[phoneNumber] [nvarchar](20) NULL,
	[image] [nvarchar](255) NULL,
	[email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerSurvey]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerSurvey](
	[customersurveyId] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[skintypeId] [int] NULL,
	[questionsId] [int] NULL,
	[customerId] [int] NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[customersurveyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerSurveyAnswer]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerSurveyAnswer](
	[customersurveyanswerId] [int] IDENTITY(1,1) NOT NULL,
	[customersurveyId] [int] NULL,
	[answerId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[customersurveyanswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedbackId] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NULL,
	[customerId] [int] NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizAnswer]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizAnswer](
	[answerId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NULL,
	[quizquestionId] [int] NULL,
	[skintypeId] [int] NULL,
	[answer] [nvarchar](max) NULL,
	[serviceImpact] [nvarchar](255) NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[answerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizQuestion]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizQuestion](
	[quizquestionId] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[questionsId] [int] NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[quizquestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizQuestionSet]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizQuestionSet](
	[questionsId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[questionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[ratingId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NULL,
	[createAt] [datetime] NULL,
	[stars] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ratingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[scheduleId] [int] IDENTITY(1,1) NOT NULL,
	[skinTherapistId] [int] NULL,
	[slotId] [int] NULL,
	[date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[scheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[serviceId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](255) NULL,
	[price] [decimal](10, 2) NULL,
	[image] [nvarchar](255) NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[serviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkinTherapist]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkinTherapist](
	[skintherapistId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[speciality] [nvarchar](255) NULL,
	[email] [nvarchar](100) NULL,
	[experience] [nvarchar](255) NULL,
	[image] [nvarchar](255) NULL,
	[accountId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[skintherapistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkinTherapistService]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkinTherapistService](
	[skintherapistserviceId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[speciality] [nvarchar](255) NULL,
	[email] [nvarchar](100) NULL,
	[experience] [nvarchar](255) NULL,
	[skintherapistId] [int] NULL,
	[serviceId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[skintherapistserviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkinType]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkinType](
	[skintypeId] [int] IDENTITY(1,1) NOT NULL,
	[skintypeName] [nvarchar](100) NOT NULL,
	[description] [nvarchar](255) NULL,
	[image] [nvarchar](255) NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[skintypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkintypeService]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkintypeService](
	[skintypeServiceId] [int] IDENTITY(1,1) NOT NULL,
	[skintypeId] [int] NULL,
	[serviceId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[skintypeServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 2/7/2025 11:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[slotId] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](50) NULL,
	[time] [nvarchar](50) NULL,
	[bookingId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[slotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Blog] ADD  DEFAULT (getdate()) FOR [createAt]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT (getdate()) FOR [createAt]
GO
ALTER TABLE [dbo].[CustomerSurvey] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[CustomerSurvey] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[QuizAnswer] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[QuizQuestion] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[QuizQuestionSet] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Rating] ADD  DEFAULT (getdate()) FOR [createAt]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([customerId])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([customerId])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([skintherapistId])
REFERENCES [dbo].[SkinTherapist] ([skintherapistId])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([skintypeId])
REFERENCES [dbo].[SkinType] ([skintypeId])
GO
ALTER TABLE [dbo].[CustomerSurvey]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([customerId])
GO
ALTER TABLE [dbo].[CustomerSurvey]  WITH CHECK ADD FOREIGN KEY([questionsId])
REFERENCES [dbo].[QuizQuestionSet] ([questionsId])
GO
ALTER TABLE [dbo].[CustomerSurvey]  WITH CHECK ADD FOREIGN KEY([skintypeId])
REFERENCES [dbo].[SkinType] ([skintypeId])
GO
ALTER TABLE [dbo].[CustomerSurveyAnswer]  WITH CHECK ADD FOREIGN KEY([answerId])
REFERENCES [dbo].[QuizAnswer] ([answerId])
GO
ALTER TABLE [dbo].[CustomerSurveyAnswer]  WITH CHECK ADD FOREIGN KEY([customersurveyId])
REFERENCES [dbo].[CustomerSurvey] ([customersurveyId])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([customerId])
GO
ALTER TABLE [dbo].[QuizAnswer]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([customerId])
GO
ALTER TABLE [dbo].[QuizAnswer]  WITH CHECK ADD FOREIGN KEY([quizquestionId])
REFERENCES [dbo].[QuizQuestion] ([quizquestionId])
GO
ALTER TABLE [dbo].[QuizAnswer]  WITH CHECK ADD FOREIGN KEY([skintypeId])
REFERENCES [dbo].[SkinType] ([skintypeId])
GO
ALTER TABLE [dbo].[QuizQuestion]  WITH CHECK ADD FOREIGN KEY([questionsId])
REFERENCES [dbo].[QuizQuestionSet] ([questionsId])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([customerId])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([skinTherapistId])
REFERENCES [dbo].[SkinTherapist] ([skintherapistId])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([slotId])
REFERENCES [dbo].[Slot] ([slotId])
GO
ALTER TABLE [dbo].[SkinTherapist]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[SkinTherapistService]  WITH CHECK ADD FOREIGN KEY([serviceId])
REFERENCES [dbo].[Services] ([serviceId])
GO
ALTER TABLE [dbo].[SkinTherapistService]  WITH CHECK ADD FOREIGN KEY([skintherapistId])
REFERENCES [dbo].[SkinTherapist] ([skintherapistId])
GO
ALTER TABLE [dbo].[SkintypeService]  WITH CHECK ADD FOREIGN KEY([serviceId])
REFERENCES [dbo].[Services] ([serviceId])
GO
ALTER TABLE [dbo].[SkintypeService]  WITH CHECK ADD FOREIGN KEY([skintypeId])
REFERENCES [dbo].[SkinType] ([skintypeId])
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD FOREIGN KEY([bookingId])
REFERENCES [dbo].[Booking] ([bookingId])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD CHECK  (([stars]>=(1) AND [stars]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [SkincareBookingSystem] SET  READ_WRITE 
GO
