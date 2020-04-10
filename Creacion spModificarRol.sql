USE [bdWeb]
GO

/****** Object:  StoredProcedure [dbo].[spModificarRol]    Script Date: 10/4/2020 13:45:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spModificarRol]
(
@idRol int,
@descripcionRol varchar(20)

)


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update tbRoles
	set    DescripcionRol = @descripcionRol
	where  idRol = @idRol;

END
GO


