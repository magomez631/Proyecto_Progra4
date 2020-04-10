USE [bdWeb]
GO

/****** Object:  StoredProcedure [dbo].[spInsertarEmpleado]    Script Date: 10/4/2020 13:43:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertarEmpleado]
(@nIdentificacion BIGINT,
 @empNombres VARCHAR(50),
 @empApellidos VARCHAR(50),
 @empUsuario VARCHAR(20),
 @empContrasena VARBINARY(128),
 @empRol varchar(1),
 @empMensaje VARCHAR(100) OUTPUT)
 AS

 IF EXISTS(SELECT 1 FROM tbEmpleados WHERE empIdentificacion = @nIdentificacion)
 BEGIN
	SET @empMensaje = 'El empleado con la identificación dada ya existe';
 END
 ELSE
 BEGIN
	INSERT INTO tbEmpleados(empIdentificacion,	empNombres,	empApellidos,	empUsuario,	empContraseña,	empRol)
	VALUES(@nIdentificacion,@empNombres,@empApellidos,@empUsuario,@empContrasena,@empRol);

	SET @empMensaje = 'Se ingresó con éxito el empleado';
 END

 IF @@ERROR != 0
 BEGIN
	SET @empMensaje = 'Se produjo un error durante el procedimiento de insertar al usuario';
 END
GO


