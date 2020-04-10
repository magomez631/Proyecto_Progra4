USE [bdWeb]
GO

/****** Object:  StoredProcedure [dbo].[spEliminarEmpleado]    Script Date: 10/4/2020 13:42:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEliminarEmpleado]
(@nIdentificacion int,
 @empMensaje VARCHAR(100) OUTPUT)
 AS

 IF NOT EXISTS(SELECT 1 FROM tbEmpleados WHERE empIdentificacion = @nIdentificacion)
 BEGIN
	SET @empMensaje = 'El empleado con la identificaci�n  indicada no existe';
 END
 ELSE
 BEGIN
	DELETE FROM tbEmpleados
	WHERE
	empIdentificacion = @nIdentificacion;

	SET @empMensaje = 'Se elimin� con �xito el empleado con la identificaci�n dada';
 END

 IF @@ERROR != 0
 BEGIN
	SET @empMensaje = 'Se produjo un error durante el procedimiento al eliminar al usuario';
 END
GO


