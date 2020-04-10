USE [bdWeb]
GO

/****** Object:  StoredProcedure [dbo].[spEliminarRol]    Script Date: 10/4/2020 13:42:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spEliminarRol]
	-- Add the parameters for the stored procedure here
(
@idRol int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from tbRoles
	where  idRol = @idRol 
END
GO


