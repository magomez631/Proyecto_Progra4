<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="Web.Interfaces.frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<head runat="server">
    <title></title>
</head>
<body>
    <div class="container mdi">
        <form id="frmLogin" runat="server">

            <div class="row">
                <div class="col-md-2 celdas">
                    <div class="form-group">
                        <asp:Label Text="Usuario:" runat="server"></asp:Label>
                    </div>
                </div>

                <div class="col-md-3 celdas">
                    <div class="form-group">
                        <asp:TextBox ID="txtUsuario" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-2 celdas">
                    <div class="form-group">
                        <asp:Label Text="Contraseña:" runat="server"></asp:Label>
                    </div>
                </div>

                <div class="col-md-3 celdas">
                    <div class="form-group">
                        <asp:TextBox ID="txtContrasena" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top: 25px;">
                <div class="col-md-6 celdas" style="text-align:center">
                    <asp:Button CssClass="btn btn-primary" ID="btnLogin" runat="server" Text="Ingresar" OnClick="btnLogin_Click" />
                </div>
            </div>
        </form>

    </div>
</body>
</html>
