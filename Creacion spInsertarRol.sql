USE [bdWeb]
GO

/****** Object:  StoredProcedure [dbo].[spInsertarRol]    Script Date: 10/4/2020 13:43:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertarRol] 
	-- Add the parameters for the stored procedure here
(

@empRol varchar(20),
@empMensaje VARCHAR(100) OUTPUT

)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

IF EXISTS(SELECT 1 FROM tbRoles where DescripcionRol = @empRol)
	
 BEGIN
	SET @empMensaje = 'El rol ya existe';
 END
 ELSE
 BEGIN
	INSERT INTO tbRoles(DescripcionRol)
	VALUES(@empRol);

	SET @empMensaje = 'Rol agregado conéxito'
 END

 IF @@ERROR != 0
 BEGIN
	SET @empMensaje = 'Se produjo un error durante el procedimiento';
 END




	
END
GO


