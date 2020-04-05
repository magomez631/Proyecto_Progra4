USE [bdWeb]
GO
/****** Object:  StoredProcedure [dbo].[spConsultarMarca]    Script Date: 15/3/2020 15:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[spConsultarMarca]

@empIdentficacion bigint

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   	   SELECT   tbEmpleados.empIdentificacion as empIdentificacion, 
	            tbEmpleados.empNombres as empNombres,
				tbEmpleados.empApellidos as empApellidos, 
	            tbMarcasEmpleado.empHora as empHora
		FROM    tbEmpleados 
		inner join tbMarcasEmpleado on  tbEmpleados.empIdentificacion = @empIdentficacion
		and tbMarcasEmpleado.empIdentificacion = @empIdentficacion
		order by tbEmpleados.empNombres;

    
	
END
