USE [bdWeb]
GO

/****** Object:  Table [dbo].[tbMarcasEmpleado]    Script Date: 10/4/2020 13:37:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbMarcasEmpleado](
	[id_Historico_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[empIdentificacion] [bigint] NOT NULL,
	[empHora] [datetime] NOT NULL,
 CONSTRAINT [PK_tbMarcasEmpleado] PRIMARY KEY CLUSTERED 
(
	[id_Historico_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbMarcasEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_empIdentificacion] FOREIGN KEY([empIdentificacion])
REFERENCES [dbo].[tbEmpleados] ([empIdentificacion])
GO

ALTER TABLE [dbo].[tbMarcasEmpleado] CHECK CONSTRAINT [FK_empIdentificacion]
GO


