USE [bdWeb]
GO

/****** Object:  StoredProcedure [dbo].[spModificarEmpleado]    Script Date: 10/4/2020 13:44:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spModificarEmpleado]
(@nIdentificacion BIGINT,
 @empNombres VARCHAR(50),
 @empApellidos VARCHAR(50),
 @empRol int,
 @empUsuario VARCHAR(20),

 @empMensaje VARCHAR(100) OUTPUT)
 AS

 IF NOT EXISTS(SELECT 1 FROM tbEmpleados WHERE empIdentificacion = @nIdentificacion)
 BEGIN
	SET @empMensaje = 'El empleado con la identificaci�n dada no existe';
 END
 ELSE
 BEGIN
	UPDATE tbEmpleados
	SET
	empNombres   = @empNombres,
	empApellidos = @empApellidos,
	empRol       = @empRol,
	empUsuario   = @empUsuario
	WHERE
	empIdentificacion = @nIdentificacion;

	SET @empMensaje = 'Se modific� con �xito los datos.';
 END

 IF @@ERROR != 0
 BEGIN
	SET @empMensaje = 'Se produjo un error durante el procedimiento.'
 END
GO


