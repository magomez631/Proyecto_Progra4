USE [bdWeb]
GO

/****** Object:  StoredProcedure [dbo].[spConsultarEmpleado]    Script Date: 10/4/2020 13:39:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultarEmpleado]
(@nIdentificacion BIGINT)
 AS

 begin

 SET NOCOUNT ON;


	SELECT 
	empIdentificacion,
	empNombres,
	empApellidos,
	(select DescripcionRol from tbRoles where tbRoles.idRol = tbEmpleados.empRol) DescripcionRol,
	empUsuario
	FROM tbEmpleados
	WHERE
	empIdentificacion = @nIdentificacion





end;
GO


