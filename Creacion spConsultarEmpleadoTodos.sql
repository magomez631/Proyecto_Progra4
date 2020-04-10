USE [bdWeb]
GO

/****** Object:  StoredProcedure [dbo].[spConsultarEmpleadoTodos]    Script Date: 10/4/2020 13:39:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spConsultarEmpleadoTodos]

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
	


end;
GO


