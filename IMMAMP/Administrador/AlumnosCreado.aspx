<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AlumnosCreado.aspx.vb" Inherits="AlumnosCreado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%--<link href="../Resources/Styles/css/bootstrap.min.css" rel="stylesheet" />--%>

    <link href="../Resources/Styles/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="shotcut icon" href="../Resources/images/imammpsico.png" />
    <link href="../Resources/Styles/Admin.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="../Resources/Scripts/ValidaCrearPerfiles.js"></script>
    <script src="../Resources/Scripts/CalculaEdad.js"></script>
    <script src="../Resources/Scripts/ValidadoresCP.js"></script>
    <script src="../Resources/Scripts/ValidadoresFullCP-min.js"></script>
    <script src="../Resources/Scripts/ValidadoresFullCP.js"></script>
    <script src="../Resources/scripts/jquery-2.1.1.min.js" async="async"></script>
    <script src="../Resources/scripts/General/jquery-ui-1.10.2.custom.js" async="async"></script>
    <script src="../Resources/scripts/Validadores.js" async="async"></script>
</head>
<body>
    <!-- #include file ="/Globales/Header.aspx" -->
    <div class="main">
        <form runat="server">
            <div style="padding-top: 200px;" class="col-md-8 offset-2  col-xs-12 form-group">
                <p style="font-size: 70px; color: black;">¡Se Ha creado el Registro de Manera Exitosa! </p>
                <div class="col-md-12" style="margin-top: 50px;">
                    <asp:Button runat="server" type="button" ID="crearUser" class="crearUser" value="CrearAlumno" OnClick="Redireccion" Text="Crear Nuevo Alumno"></asp:Button>
                </div>
            </div>
        </form>
    </div>
    <!-- #include file ="/Globales/footer.aspx" -->
</body>
</html>
