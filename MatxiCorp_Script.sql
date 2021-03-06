USE [DbMatxiCorpApp]
GO
/****** Object:  UserDefinedFunction [dbo].[Sys_GetLevelFormat]    Script Date: 2/11/2022 9:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		sontn
-- Create date: 10/02/2022
-- =============================================
CREATE FUNCTION [dbo].[Sys_GetLevelFormat]
( 
	@LEVEL_ID int
)
RETURNS nvarchar(200)
AS
BEGIN
	Declare @Result nvarchar(200) = ''
	SET @Result = CASE @LEVEL_ID	WHEN 1 THEN ''
									WHEN 2 THEN '&nbsp;&nbsp;-->&nbsp;'
									WHEN 3 THEN '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->&nbsp;'
									WHEN 4 THEN '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->&nbsp;'
									WHEN 5 THEN '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->&nbsp;'
									WHEN 6 THEN '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->&nbsp;'
									WHEN 7 THEN '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->&nbsp;'
									WHEN 8 THEN '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->&nbsp;'
									WHEN 9 THEN '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->&nbsp;'
									WHEN 10 THEN '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->&nbsp;'
						ELSE ''
					END
	RETURN @Result
END
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2/11/2022 9:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[EmpCode] [varchar](50) NOT NULL,
	[EmpName] [nvarchar](250) NOT NULL,
	[OrgID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 2/11/2022 9:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrgID] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [varchar](50) NOT NULL,
	[OrgName] [nvarchar](250) NOT NULL,
	[LevelID] [int] NOT NULL,
	[ParentOrgID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmpID], [EmpCode], [EmpName], [OrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'NV01', N'Nguyễn Thành Trung', 2, 1, N'sontn', CAST(N'2022-02-10T13:59:26.307' AS DateTime), NULL, NULL)
INSERT [dbo].[Employee] ([EmpID], [EmpCode], [EmpName], [OrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'NV02', N'Lý Mỹ Lan', 3, 1, N'sontn', CAST(N'2022-02-10T13:59:53.550' AS DateTime), NULL, NULL)
INSERT [dbo].[Employee] ([EmpID], [EmpCode], [EmpName], [OrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'NV03', N'Nguyễn Tấn Lợi', 4, 1, N'sontn', CAST(N'2022-02-10T14:00:14.810' AS DateTime), NULL, NULL)
INSERT [dbo].[Employee] ([EmpID], [EmpCode], [EmpName], [OrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'NV04', N'Trần Nam Phong', 5, 1, N'sontn', CAST(N'2022-02-10T14:00:38.160' AS DateTime), N'sontn', CAST(N'2022-02-11T07:48:59.813' AS DateTime))
INSERT [dbo].[Employee] ([EmpID], [EmpCode], [EmpName], [OrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'NV05', N'Nguyễn Thị Hoa', 6, 1, N'sontn', CAST(N'2022-02-10T17:08:15.380' AS DateTime), N'sontn', CAST(N'2022-02-11T07:48:08.503' AS DateTime))
INSERT [dbo].[Employee] ([EmpID], [EmpCode], [EmpName], [OrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'NV06', N'Trần Quỳnh Giao', 7, 1, N'sontn', CAST(N'2022-02-10T17:08:32.503' AS DateTime), N'sontn', CAST(N'2022-02-11T07:50:37.760' AS DateTime))
INSERT [dbo].[Employee] ([EmpID], [EmpCode], [EmpName], [OrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'NV07', N'Mai Quốc Hoan', 10, 1, N'sontn', CAST(N'2022-02-10T17:09:02.260' AS DateTime), NULL, NULL)
INSERT [dbo].[Employee] ([EmpID], [EmpCode], [EmpName], [OrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, N'NV08', N'Ngô Ngọc Huy', 10, 1, N'sontn', CAST(N'2022-02-10T17:09:21.893' AS DateTime), NULL, NULL)
INSERT [dbo].[Employee] ([EmpID], [EmpCode], [EmpName], [OrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, N'NV09', N'Nguyễn Thị Lệ', 8, 1, N'sontn', CAST(N'2022-02-10T17:09:46.233' AS DateTime), NULL, NULL)
INSERT [dbo].[Employee] ([EmpID], [EmpCode], [EmpName], [OrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, N'NV10', N'Nguyễn Thị Đài', 9, 1, N'sontn', CAST(N'2022-02-10T17:10:02.897' AS DateTime), NULL, NULL)
INSERT [dbo].[Employee] ([EmpID], [EmpCode], [EmpName], [OrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, N'NV11', N'Nguyễn Văn Nam', 11, 1, N'sontn', CAST(N'2022-02-10T20:28:25.517' AS DateTime), N'sontn', CAST(N'2022-02-10T20:42:35.960' AS DateTime))
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Organization] ON 

INSERT [dbo].[Organization] ([OrgID], [OrgCode], [OrgName], [LevelID], [ParentOrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Company', N'Matxi Corp', 1, 0, 1, N'sontn', CAST(N'2022-02-09T15:55:05.993' AS DateTime), N'sontn', CAST(N'2022-02-10T16:27:00.787' AS DateTime))
INSERT [dbo].[Organization] ([OrgID], [OrgCode], [OrgName], [LevelID], [ParentOrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Leader1', N'Leader HR', 2, 1, 1, N'sontn', CAST(N'2022-02-09T16:01:10.090' AS DateTime), N'sontn', CAST(N'2022-02-10T17:01:41.370' AS DateTime))
INSERT [dbo].[Organization] ([OrgID], [OrgCode], [OrgName], [LevelID], [ParentOrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'Leader2', N'Leader IT', 2, 1, 1, N'sontn', CAST(N'2022-02-09T16:01:32.477' AS DateTime), N'sontn', CAST(N'2022-02-10T17:01:49.843' AS DateTime))
INSERT [dbo].[Organization] ([OrgID], [OrgCode], [OrgName], [LevelID], [ParentOrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'QLTT1', N'Giám sát C&B', 3, 2, 1, N'sontn', CAST(N'2022-02-10T08:20:09.433' AS DateTime), N'sontn', CAST(N'2022-02-10T17:02:31.690' AS DateTime))
INSERT [dbo].[Organization] ([OrgID], [OrgCode], [OrgName], [LevelID], [ParentOrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'QLTT2', N'Giám sát Hạ tầng', 3, 3, 1, N'sontn', CAST(N'2022-02-10T09:21:55.840' AS DateTime), N'sontn', CAST(N'2022-02-10T17:02:53.560' AS DateTime))
INSERT [dbo].[Organization] ([OrgID], [OrgCode], [OrgName], [LevelID], [ParentOrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'QLTT3', N'Giám sát Tuyển dụng', 3, 2, 1, N'sontn', CAST(N'2022-02-10T09:22:13.800' AS DateTime), N'sontn', CAST(N'2022-02-10T17:02:42.120' AS DateTime))
INSERT [dbo].[Organization] ([OrgID], [OrgCode], [OrgName], [LevelID], [ParentOrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'QLTT4', N'Giám sát Kỹ thuật', 3, 3, 1, N'sontn', CAST(N'2022-02-10T09:23:03.773' AS DateTime), N'sontn', CAST(N'2022-02-10T17:03:11.793' AS DateTime))
INSERT [dbo].[Organization] ([OrgID], [OrgCode], [OrgName], [LevelID], [ParentOrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, N'EMP01', N'Nhân viên C&B', 4, 4, 1, N'sontn', CAST(N'2022-02-10T09:35:28.490' AS DateTime), N'sontn', CAST(N'2022-02-10T17:06:35.960' AS DateTime))
INSERT [dbo].[Organization] ([OrgID], [OrgCode], [OrgName], [LevelID], [ParentOrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, N'EMP02', N'Nhân viên tuyển dụng', 4, 6, 1, N'sontn', CAST(N'2022-02-10T17:04:48.610' AS DateTime), N'sontn', CAST(N'2022-02-10T17:06:44.950' AS DateTime))
INSERT [dbo].[Organization] ([OrgID], [OrgCode], [OrgName], [LevelID], [ParentOrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, N'EMP03', N'Nhân viên hạ tầng', 4, 5, 1, N'sontn', CAST(N'2022-02-10T17:05:08.097' AS DateTime), N'sontn', CAST(N'2022-02-10T17:06:51.877' AS DateTime))
INSERT [dbo].[Organization] ([OrgID], [OrgCode], [OrgName], [LevelID], [ParentOrgID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, N'EMP04', N'Nhân viên kỹ thuật', 4, 7, 1, N'sontn', CAST(N'2022-02-10T17:05:26.033' AS DateTime), N'sontn', CAST(N'2022-02-10T17:06:59.260' AS DateTime))
SET IDENTITY_INSERT [dbo].[Organization] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_Employee]    Script Date: 2/11/2022 9:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		sontn
-- Create date: 10/02/2022
-- Description:	
-- select * from Employee
-- =============================================
CREATE PROCEDURE [dbo].[sp_Employee]
	@EmpID int = NULL,
	@EmpCode varchar(50) = NULL,
	@EmpName nvarchar(250) = NULL,
	@OrgId int = NULL,
	@Status int = NULL,
	@CreatedBy nvarchar(100) = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy nvarchar(100) = NULL,
	@UpdatedDate datetime = NULL,
	@keyword nvarchar(50) = null,
	@FLAG varchar(50)

AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT DMY;
	SET @CreatedDate = GETDATE()
	SET @UpdatedDate = GETDATE()
	DECLARE @res_code INT = 0

	IF @FLAG = 'GETLIST'
	BEGIN
		SELECT *
		FROM Employee
		WHERE Status = 1
	END
	ELSE IF @FLAG = 'GETWITHID'
	BEGIN
		SELECT * FROM Employee WHERE EmpID = @EmpID
	END
	ELSE IF @FLAG = 'CHECK_DUPLICATE_EMP'
	BEGIN
		If @EmpID = 0
		Begin
			SELECT *
			FROM Employee
			WHERE EmpCode = @EmpCode
				AND Status = 1
		End
		Else
		Begin
			SELECT *
			FROM Employee
			WHERE EmpID <> @EmpID
				AND EmpCode = @EmpCode
				AND Status = 1
		End
	END
	ELSE IF @FLAG = 'INSERT'
	BEGIN
		INSERT INTO Employee(EmpCode, EmpName, OrgID, Status, CreatedBy, CreatedDate)
		VALUES(@EmpCode, @EmpName, @OrgId, 1, @CreatedBy, @CreatedDate)

		SET @res_code = 1
		SELECT @res_code ResponseCode
	END
	ELSE IF @FLAG = 'UPDATE'
	BEGIN
		UPDATE Employee
		SET EmpCode = @EmpCode, EmpName = @EmpName, OrgID = @OrgId, UpdatedBy = @CreatedBy, UpdatedDate = @UpdatedDate
		WHERE EmpID = @EmpID

		SET @res_code = 1
		SELECT @res_code ResponseCode
	END
	ELSE IF @FLAG = 'DELETE'
	BEGIN
		UPDATE Employee
		SET Status = 0
		WHERE EmpID = @EmpID

		SET @res_code = 1
		SELECT @res_code ResponseCode
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_Info_Emp]    Script Date: 2/11/2022 9:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		sontn
-- Create date: 11/02/2022
-- Description: Get Information employee
-- EXEC [dbo].[sp_Get_Info_Emp] 10
-- =============================================
CREATE PROCEDURE [dbo].[sp_Get_Info_Emp]
	@EmpID INT = NULL

AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT DMY;
	
	SELECT EmpCode, EmpName,
		CASE WHEN o.LevelID = 1 THEN N'Công ty' 
			WHEN o.LevelID = 2 THEN N'Leader' 
			WHEN o.LevelID = 3 THEN N'Quản lý trực tiếp'
			ELSE N'Nhân viên' END As [Organization]
	FROM Employee e
		JOIN Organization o ON o.OrgID = e.OrgID 
	WHERE e.Status = 1
		AND o.Status = 1
		AND e.EmpID = @EmpID
	UNION ALL
	SELECT EmpCode, EmpName,
		CASE WHEN o.LevelID = 1 THEN N'Công ty' 
			WHEN o.LevelID = 2 THEN N'Leader' 
			WHEN o.LevelID = 3 THEN N'Quản lý trực tiếp'
			ELSE N'Nhân viên' END As [Organization]
	FROM Employee e
		JOIN Organization o ON o.OrgID = e.OrgID 
	WHERE e.Status = 1
		AND o.Status = 1
		AND e.OrgID = (SELECT ParentOrgID
						FROM Organization
						WHERE Status = 1
							AND OrgID = (SELECT OrgID
											FROM Employee
											WHERE Status = 1
												AND EmpID = @EmpID))
	
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LoadDropdownlist]    Script Date: 2/11/2022 9:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		sontn
-- Create date: 10/02/2022
-- =============================================
CREATE PROCEDURE [dbo].[sp_LoadDropdownlist]
	@FLAG varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT DMY;

	If @FLAG = 'DDL_ORG'
	BEGIN
		SELECT *
		INTO #TMP_Organization
		FROM (
			SELECT 0  As OrgID, OrgCode = '0',
					N'-- Chọn --' As OrgName,
					SortCode = '', LevelID = 0, ParentOrgID = -1
				 
			UNION ALL
			SELECT OrgID, OrgCode,
						Replace(dbo.Sys_GetLevelFormat(a.LevelID), '&nbsp;', '-')  + OrgName As OrgName,
						SortCode = OrgCode
						, LevelID,  ParentOrgID
			FROM Organization a
			WHERE a.Status = 1
		) TBL
		--ORDER BY  Sort_Code
			
		DECLARE @iMIN_LEVEL_ID int = 2
		DECLARE @iMAX_LEVEL_ID int = 0
		SELECT @iMAX_LEVEL_ID = MAX(LevelID)
		FROM #TMP_Organization

		IF @iMAX_LEVEL_ID > @iMIN_LEVEL_ID
		BEGIN
			WHILE (@iMIN_LEVEL_ID <= @iMAX_LEVEL_ID)
			BEGIN
				UPDATE a
				SET SortCode = isnull((Select SortCode From #TMP_Organization  p Where p.OrgID = a.ParentOrgID) + '' + OrgCode, OrgCode)
				FROM #TMP_Organization a
				WHERE LevelID = @iMIN_LEVEL_ID

				SET @iMIN_LEVEL_ID = @iMIN_LEVEL_ID + 1
			END
		END

		SELECT *
		FROM #TMP_Organization
		ORDER BY  SortCode
	END
	ELSE IF @FLAG = 'DDL_EMP'
	BEGIN
		SELECT 0  As EmpID, N'-- Chọn --' As EmpName
		UNION ALL
		SELECT EmpID, EmpName
		FROM Employee
		WHERE Status = 1
	END

	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Organization]    Script Date: 2/11/2022 9:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		sontn
-- Create date: 09/02/2022
-- Description:	
-- select * from Organization
-- =============================================
CREATE PROCEDURE [dbo].[sp_Organization]
	@OrgID int = NULL,
	@OrgCode varchar(50) = NULL,
	@OrgName nvarchar(250) = NULL,
	@LevelID int = NULL,
	@ParentOrgID int = NULL,
	@Status int = NULL,
	@CreatedBy nvarchar(100) = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy nvarchar(100) = NULL,
	@UpdatedDate datetime = NULL,
	@keyword nvarchar(50) = null,
	@FLAG varchar(50)

AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT DMY;
	SET @CreatedDate = GETDATE()
	SET @UpdatedDate = GETDATE()
	DECLARE @res_code INT = 0

	IF @FLAG = 'GETLIST'
	BEGIN
		SELECT * 
		FROM Organization
		WHERE Status = 1
	END
	ELSE IF @FLAG = 'GETWITHID'
	BEGIN
		SELECT * FROM Organization WHERE OrgID = @OrgID
	END
	ELSE IF @FLAG = 'INSERT'
	BEGIN
		SELECT @LevelID = ISNULL(MAX(LevelID), 0) + 1

		FROM Organization
		WHERE OrgID = @ParentOrgID

		INSERT INTO Organization(OrgCode, OrgName, LevelID, ParentOrgID, Status, CreatedBy, CreatedDate)
		VALUES(@OrgCode, @OrgName, @LevelID, @ParentOrgID, 1, @CreatedBy, @CreatedDate)

		SET @res_code = 1
		SELECT @res_code ResponseCode
	END
	ELSE IF @FLAG = 'UPDATE'
	BEGIN
		UPDATE Organization
		SET OrgCode = @OrgCode, OrgName = @OrgName, ParentOrgID = @ParentOrgID, UpdatedBy = @CreatedBy, UpdatedDate = @UpdatedDate
		WHERE OrgID = @OrgID

		SET @res_code = 1
		SELECT @res_code ResponseCode
	END
	ELSE IF @FLAG = 'DELETE'
	BEGIN
		UPDATE Organization
		SET Status = 0
		WHERE OrgID = @OrgID

		SET @res_code = 1
		SELECT @res_code ResponseCode
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_OrgEmp]    Script Date: 2/11/2022 9:14:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		sontn
-- Create date: 10/02/2022
-- Description:
-- =============================================
CREATE PROCEDURE [dbo].[sp_OrgEmp]
	@keyword nvarchar(150) = NULL,
	@FLAG varchar(50)

AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT DMY;
	
	IF @FLAG = 'GET_EMPORG_WITH_KEYWORD'
	BEGIN
		SELECT *
		FROM Employee e
			JOIN Organization o ON o.OrgID = e.OrgID
		WHERE e.Status = 1
			AND o.Status = 1
			AND (e.EmpCode LIKE N'%' + @keyword + '%' OR e.EmpName LIKE N'%' + @keyword + '%' OR
				o.OrgCode LIKE N'%' + @keyword + '%' OR o.OrgName LIKE N'%' + @keyword + '%')
	END
	
END
GO
