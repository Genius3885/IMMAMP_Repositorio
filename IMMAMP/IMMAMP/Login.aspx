<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="IMMAMP_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <link rel="shotcut icon" href="../Resources/images/imammpsico.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>Login</title>
</head>
<body>
    <!-- #include file ="/Globales/Header.aspx" -->
    <form id="form1" runat="server">
        <div style="padding-top:200px">
            <table class="normal">
                <th scope="col">Usuario</th>
                <th>
                    <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
                </th>
                <tr></tr>
                <th scope="col">Clave</th>
                <th>
                    <asp:TextBox ID="txtClave" runat="server"></asp:TextBox>
                </th>

            </table>
            <asp:Button ID="Button1" runat="server" Text="Entrar"
                PostBackUrl="~/Administrador/CrearPerfiles.aspx" />
        </div>
    </form>

    <!-- #include file ="/Globales/footer.aspx" -->
</body>
</html>
