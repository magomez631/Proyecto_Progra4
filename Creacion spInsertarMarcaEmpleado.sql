USE [bdWeb]
GO

/****** Object:  StoredProcedure [dbo].[spInsertarMarcaEmpleado]    Script Date: 10/4/2020 13:43:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[spInsertarMarcaEmpleado]
(@nIdentificacion BIGINT,
 @empHora Datetime,
 @empMensaje VARCHAR(100) OUTPUT)
 AS

 IF EXISTS(select empIdentificacion from tbEmpleados WHERE empIdentificacion = @nIdentificacion)
 BEGIN
	INSERT INTO tbMarcasEmpleado(empIdentificacion, empHora)
	VALUES(@nIdentificacion, @empHora);
	SET @empMensaje = 'Se registró la marca con éxito';
 END
 ELSE
 BEGIN
	SET @empMensaje = 'El empleado con la cédula ingresada no existe';
 END

 IF @@ERROR != 0
 BEGIN
	SET @empMensaje = 'Se produjo un error durante el procedimiento de insertar la marca de la identificación';
 END
GO


