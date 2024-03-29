/****** Insert duplicate rows except with UnID indexed by VALUE  ******/
GO
	-- Declare the variable to be used.
	DECLARE @UnID int;

	-- Initialize the variable.
	SET @UnID = 100000;

	SET IDENTITY_INSERT [TOWELDB].[dbo].[Transactions] ON
	GO


	INSERT INTO [TOWELDB].[dbo].[Transactions] ([UnID]
      ,[TransTypeID]
      ,[MachineID]
      ,[MachineName]
      ,[MachineIP]
      ,[TagID]
      ,[TransDate]
      ,[TowelReturnDate]
      ,[ReconcileCode]
      ,[ErrorID]
      ,[MemberID]
      ,[NOTES]
      ,[LastUpdated]
      ,[LastUpdatedBy])
	SELECT [UnID]+ @UnID
      ,[TransTypeID]
      ,[MachineID]
      ,[MachineName]
      ,[MachineIP]
      ,[TagID]
      ,[TransDate]
      ,[TowelReturnDate]
      ,[ReconcileCode]
      ,[ErrorID]
      ,[MemberID]
      ,[NOTES]
      ,[LastUpdated]
      ,[LastUpdatedBy]
	FROM [TOWELDB].[dbo].[Transactions]
	WHERE [UnID] < @UnID
	GO

	SET IDENTITY_INSERT [TOWELDB].[dbo].[Transactions] OFF
	GO

	/****** Delete old rows******/
	delete
		FROM [TOWELDB].[dbo].[Transactions]
		where [UnID]<@UnID