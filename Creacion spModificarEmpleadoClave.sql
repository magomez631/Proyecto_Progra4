USE [bdWeb]
GO

/****** Object:  StoredProcedure [dbo].[spModificarEmpleadoClave]    Script Date: 10/4/2020 13:44:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spModificarEmpleadoClave]
	-- Add the parameters for the stored procedure here
(
 @nIdentificacion BIGINT,
 @empNombres VARCHAR(50),
 @empApellidos VARCHAR(50),
 @empUsuario VARCHAR(20),
 @empRol int,
 @empContrasena  VARBINARY(128),
 @empMensaje VARCHAR(100) OUTPUT
 )



AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	
 IF NOT EXISTS(SELECT 1 FROM tbEmpleados WHERE empIdentificacion = @nIdentificacion)
 BEGIN
	SET @empMensaje = 'El empleado con la identificación dada no existe';
 END
 ELSE
 BEGIN
	UPDATE tbEmpleados
	SET
	empNombres    = @empNombres,
	empApellidos  = @empApellidos,
	empRol        = @empRol,
	empUsuario    = @empUsuario,
	empContraseña = @empContrasena 
	WHERE
	empIdentificacion = @nIdentificacion;

	SET @empMensaje = 'Se modificó con éxito los datos.';
 END

 IF @@ERROR != 0
 BEGIN
	SET @empMensaje = 'Se produjo un error durante el procedimiento.'
 END


END
GO


