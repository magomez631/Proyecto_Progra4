USE [bdWeb]
GO

/****** Object:  StoredProcedure [dbo].[spConsultarMarca]    Script Date: 10/4/2020 13:41:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarMarca]

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
GO


