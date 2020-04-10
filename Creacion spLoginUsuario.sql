USE [bdWeb]
GO

/****** Object:  StoredProcedure [dbo].[spLoginUsuario]    Script Date: 10/4/2020 13:44:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spLoginUsuario]
	-- Add the parameters for the stored procedure here
(
@empUsuario    varchar(20),
@empContrasena varbinary(128),
@empRolUsuario int output,
@empIdentificacion bigint output,
@empMensaje varchar(1) output
)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF EXISTS(SELECT 1 FROM tbEmpleados WHERE empUsuario = @empUsuario and empContraseña = @empContrasena) 
	begin
	    
		select @empRolUsuario     = empRol, 
		       @empIdentificacion = empIdentificacion  
		from tbEmpleados
		where empUsuario  = @empUsuario 
		and empContraseña = @empContrasena;

		SET @empMensaje = '1';
	end
	
else If NOT EXISTS(SELECT 1 FROM tbEmpleados WHERE empUsuario = @empUsuario)
	begin
		set @empIdentificacion = 0;
		set @empRolUsuario = 0;
		set @empMensaje = '2';
	end

ELSE
 
	begin
	
		SET @empMensaje        ='0';
		set @empRolUsuario     = 0;
		set @empIdentificacion = 0;

	end
END;


GO


