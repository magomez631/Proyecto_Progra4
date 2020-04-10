﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMarcaEmpleado.aspx.cs" Inherits="Web.Interfaces.frmMarcaEmpleado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <table style="width: 100%">
            <tr>
                <td style="width: 50%">Identificacion:</td>
                <td style="width: 50%">
                    <asp:TextBox ID="txtIdentificacion2" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td style="width: 50%" colspan="2">
                    <asp:Button ID="btnConsultarMarcas" runat="server" Text="Consultar" OnClick="btnConsultarMarcas_Click" />
                    <asp:Button ID="btnMarcar" runat="server" Text="Marcar" OnClick="btnMarcar_Click" />
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Empleado" OnClick="btnRegistrar_Click" />
                    <asp:Button ID="btnExportarExcel" runat="server" Text="Exportar a excel" Width="153px" OnClick="btnExportarExcel_Click" />
                </td> 
            </tr>

             <tr>
                <td style="width: 50%" colspan="2">
                  
                    <asp:Label ID="lblMensaje" runat="server" style="color: #FF3300; font-weight: 700"></asp:Label>
            
                </td>
            </tr>
            <tr>
                <td style="width: 50%" colspan="2">
                    <asp:GridView ID="gvwDatosMarca" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" EmptyDataText="No se encontraron registros">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="Identificacion" DataField="empIdentificacion" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Nombres" DataField="empNombres" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Apellidos" DataField="empApellidos" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Hora" DataField="empHora" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"/>
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
