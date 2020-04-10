USE [bdWeb]
GO

/****** Object:  Table [dbo].[tbEmpleados]    Script Date: 10/4/2020 13:36:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbEmpleados](
	[empIdentificacion] [bigint] NOT NULL,
	[empNombres] [varchar](50) NOT NULL,
	[empApellidos] [varchar](50) NOT NULL,
	[empUsuario] [varchar](20) NOT NULL,
	[empContraseña] [varbinary](128) NOT NULL,
	[empRol] [int] NOT NULL,
 CONSTRAINT [PK_tbEmpleados] PRIMARY KEY CLUSTERED 
(
	[empIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


