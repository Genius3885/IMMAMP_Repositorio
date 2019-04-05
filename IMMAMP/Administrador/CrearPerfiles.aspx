<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CrearPerfiles.aspx.vb" Inherits="Admintrador_CrearPerfiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%--<link href="../Resources/Styles/css/bootstrap.min.css" rel="stylesheet" />--%>

    <link href="../Resources/Styles/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="shotcut icon" href="../Resources/images/immamp.png" />
    <link href="../Resources/Styles/Admin.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>IMMAMP-CREAR-USUARIOS</title>
    <script src="../Resources/Scripts/ValidaCrearPerfiles.js"></script>
    <script src="../Resources/Scripts/CalculaEdad.js"></script>
    <script src="../Resources/scripts/jquery-2.1.1.min.js" async="async"></script>
    <script src="../Resources/scripts/General/jquery-ui-1.10.2.custom.js" async="async"></script>
    <script src="../Resources/scripts/Validadores.js" async="async"></script>
</head>

<%--<script>
    function validaTipoPerfil(variable) {
        if (variable == "0") { //Alumno
            document.getElementById("nombre").style.display = "block";
            document.getElementById("instrum").style.display = "block";
            document.getElementById("btnAlum").className = "btn btn-circulo";
            document.getElementById("btnProf").className = "btn btn-circle";
            document.getElementById("btnAdmin").className = "btn btn-circle";
        }
        else if (variable == "1") { //profesor
            document.getElementById("nombre").style.display = "block";
            document.getElementById("instrum").style.display = "none";
            document.getElementById("btnAlum").className = "btn btn-circle";
            document.getElementById("btnProf").className = "btn btn-circulo";
            document.getElementById("btnAdmin").className = "btn btn-circle";
        }
        else if (variable == "2") { //Menor Edad            
            document.getElementById("apellidoM").style.display = "block";
            document.getElementById("instrum").style.display = "none";
            document.getElementById("btnAlum").className = " btn btn-circle";
            document.getElementById("btnProf").className = "btn btn-circle";
            document.getElementById("btnAdmin").className = "btn btn-circulo";
        }
    }
</script>--%>
<body>

    <!-- #include file ="/Globales/Header.aspx" -->
    <div class="main">
        <form runat="server">
            <h1 style="color: #092740c4; text-align: center">Crear Usuarios</h1>
            <%-- <div id="opcionMultiple" style="aling-center: -63; margin-left: auto; margin-right: auto; display: block; width: 482px; margin-bottom: 20px;">
                    <input type="hidden" runat="server" name="validaTipoPerfil" id="validaTipoPerfil" value="0" />
                    <a id="btnAlum" ng-click="hasPerfil1 = true; hasPerfil2 = false ; hasPerfil3 = false; hasPerfil4 = false; hasPerfil5 = false; hasPerfil6 = false;" ng-class="{'active':hasPerfil1}" class="btn btn-circle" onclick="validaTipoPerfil(0);document.getElementById('validaTipoPerfil').value='0'"></a><span>Alumno</span>
                    <a id="btnProf" ng-click="hasPerfil1 = false; hasPerfil2 = true ; hasPerfil3 = false ; hasPerfil4 = false ; hasPerfil5 = false ;  hasPerfil6 = false ;" ng-class="{'active':hasPerfil2}" class="btn btn-circle" onclick="validaTipoPerfil(1);document.getElementById('validaTipoPerfil').value='1'"></a><span>Profesor</span>
                    <a id="btnAdmin" ng-click="hasPerfil1 = false; hasPerfil2 = false ; hasPerfil3 = true ; hasPerfil4 = false ; hasPerfil5 = false ; hasPerfil6 = false ;" ng-class="{'active':hasPerfil3}" class="btn btn-circle" onclick="validaTipoPerfil(2);document.getElementById('validaTipoPerfil').value='2'"></a><span>Menor De Edad</span>
                </div>--%>

            <div class="col-md-8 offset-2  col-xs-12 col-sm-8 offset-sm-2 offset-xs-0 form-group pointer-event">

                <div class="col-md-6 col-sm-6 offset-md-3 col-xs-12 form-group">
                    <div class="field">
                        <input type="text" style="text-transform: uppercase;" name="nombre" id="nombre" placeholder="NOMBRE" class="form-control" maxlength="100" onblur="validaformulario(this.id);" />
                    </div>
                    <div class="error" id="nombreError"></div>
                </div>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12 form-group">
                    <div class="field">
                        <input type="text" style="text-transform: uppercase;" name="apellidoP" id="apellidoP" placeholder="APELLIDO PATERNO" class="form-control" maxlength="100" onblur="validaformulario(this.id);" />
                    </div>
                    <div class="error" id="apellidoPError"></div>
                </div>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12 form-group">
                    <div class="field">
                        <input type="text" style="text-transform: uppercase;" name="apellidoM" id="apellidoM" placeholder="APELLIDO MATERNO" class="form-control" maxlength="100" onblur="validaformulario(this.id); " />
                    </div>
                    <div class="error" id="apellidoMError"></div>
                </div>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12 form-group">
                    <input type="text" name="email" id="email" placeholder="CORREO ELECTRÓNICO" class="form-control" maxlength="100" onblur="validaformulario(this.id);" />
                    <div>
                        <div class="error light" id="emailError"></div>
                    </div>
                </div>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12 form-group">
                    <asp:DropDownList ID="Semestre" name="Semestre" runat="server" class="form-control">
                        <asp:ListItem Value='SELECCIONASEM'>SELECCIONA SEMESTRE</asp:ListItem>
                        <asp:ListItem Value='PRIMERO'>PRIMERO</asp:ListItem>
                        <asp:ListItem Value='SEGUNDO'>SEGUNDO</asp:ListItem>
                        <asp:ListItem Value='TERCERO'>TERCERO</asp:ListItem>
                        <asp:ListItem Value='CUARTO'>CUARTO</asp:ListItem>
                        <asp:ListItem Value='QUINTO'>QUINTO</asp:ListItem>
                        <asp:ListItem Value='SEXTO'>SEXTO</asp:ListItem>
                    </asp:DropDownList>
                    <div class="error light" id="SemestreError"></div>
                </div>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12 form-group">
                    <asp:DropDownList ID="edoCivil" name="edoCivil" runat="server" class="form-control">
                        <asp:ListItem Value='ESTADO CIVIL'>ESTADO CIVIL</asp:ListItem>
                        <asp:ListItem Value='SOLTERO'>SOLTERO</asp:ListItem>
                        <asp:ListItem Value='CASADO'>CASADO</asp:ListItem>
                        <asp:ListItem Value='VIUDO/A'>VIUDO/A</asp:ListItem>
                    </asp:DropDownList>
                    <div class="error light" id="edoCivileRROR"></div>
                </div>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12 form-group">
                    <asp:DropDownList ID="ocupacion" name="ocupacion" runat="server" class="form-control">
                        <asp:ListItem Value='OCUPACION'>OCUPACIÓN</asp:ListItem>
                        <asp:ListItem Value='ESTUDIANTE'>ESTUDIANTE</asp:ListItem>
                        <asp:ListItem Value='TRABAJADOR'>TRABAJADOR</asp:ListItem>
                        <asp:ListItem Value='AMBOS'>AMBOS</asp:ListItem>
                    </asp:DropDownList>
                    <div class="error light" id="ocupacionError"></div>
                </div>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12 form-group">
                    <input type="hidden" name="instrumento" id="instru" />
                    <asp:DropDownList runat="server" name="instrumento" ID="instrum" class="form-control" onchange="ShowLabel(this.id);validacion(this.id, 'lista', 'instrumento',1, 0)" Style="display: block;">
                        <asp:ListItem Value='INSTRUMENTO'>INSTRUMENTO</asp:ListItem>
                        <asp:ListItem Value='PIANO'>PIANO</asp:ListItem>
                        <asp:ListItem Value='VIOLIN'>VIOLIN</asp:ListItem>
                        <asp:ListItem Value='CELLO'>CELLO</asp:ListItem>
                        <asp:ListItem Value='GUITARRA'>GUITARRA</asp:ListItem>
                        <asp:ListItem Value='BAJO'>BAJO</asp:ListItem>
                        <asp:ListItem Value='FLAUTA'>FLAUTA TRANSVERSAL</asp:ListItem>
                        <asp:ListItem Value='SAXOFON'>SAXOFON</asp:ListItem>
                    </asp:DropDownList>
                    <div class="error light" id="instrumento"></div>
                    <div class="field col-md-6" style="padding-left: initial;">
                        <asp:DropDownList ID="genero" name="generoUser" runat="server" class="form-control">
                            <asp:ListItem Value='select'>GÉNERO</asp:ListItem>
                            <asp:ListItem Value='M'>MASCULINO</asp:ListItem>
                            <asp:ListItem Value='F'>FEMENINO</asp:ListItem>
                        </asp:DropDownList>
                        <div class="error light" id="generoUserError"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-8 offset-md-2  col-sm-6 col-xs-12 col-sm-8 offset-sm-2 offset-xs-0 form-group pointer-event">
                <h2 style="color: #092740c4; text-align: center; font-size: 30px;">Fecha Nacimiento</h2>
                <div class="">
                    <select name="dia" id="dia" class="col-md-6 offset-md-3 col-xs-12 form-group form-control" runat="server">
                        <option value="select">Día</option>
                        <option value="01">01</option>
                        <option value="02">02</option>
                        <option value="03">03</option>
                        <option value="04">04</option>
                        <option value="05">05</option>
                        <option value="06">06</option>
                        <option value="07">07</option>
                        <option value="08">08</option>
                        <option value="09">09</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                        <option value="30">30</option>
                        <option value="31">31</option>
                    </select>
                    <div class="error light" id="diaError"></div>
                </div>
                <div class="field">
                    <select name="mes" id="mes" class="col-md-6 offset-md-3 col-xs-12 form-group form-control" runat="server">
                        <option value="select">Mes</option>
                        <option value="01">Enero</option>
                        <option value="02">Febrero</option>
                        <option value="03">Marzo</option>
                        <option value="04">Abril</option>
                        <option value="05">Mayo</option>
                        <option value="06">Junio</option>
                        <option value="07">Julio</option>
                        <option value="08">Agosto</option>
                        <option value="09">Septiempre</option>
                        <option value="10">Octubre</option>
                        <option value="11">Noviembre</option>
                        <option value="12">Diciembre</option>
                    </select>
                    <div class="error light" id="mesError"></div>
                </div>
                <select name="anio" id="anio" class="col-md-6 offset-md-3 col-sm-6 col-xs-12 form-group form-control" onblur="CalculaEdad();"></select>
                <div class="error light" id="anioError"></div>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12 form-group">
                    <input type="text" name="edad" id="edad" class="form-control" placeholder="Edad" maxlength="3" onblur="validaformulario(this.id);" />
                    <div class="error light" id="edadError"></div>
                </div>
            </div>
            <div class="col-md-8 offset-md-2 col-sm-6  col-xs-12 col-sm-8 offset-sm-2 offset-xs-0 form-group pointer-event">
                <h2 style="color: #092740c4; text-align: center; font-size: 30px;">Datos Contacto</h2>
                <div>
                    <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                        <div class="field" style="height: 60px">
                            <input type="text" name="BautAgua" id="BautAgua" style="padding-left: initial;" placeholder="INGRESA AÑO BAUTISMO EN AGUA" maxlength="4" class="form-control" onblur="validaformulario(this.id);" />
                            <div class="error light" id="BautAguaError"></div>
                        </div>
                    </div>
                    <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                        <div class="field" style="height: 60px">
                            <input type="text" name="BautES" id="BautES" placeholder="INGRESA AÑO BAUTISMO EN ESPIRITU SANTO" maxlength="4" class="form-control" onblur="validaformulario(this.id);" />
                            <div class="error light" id="BautESerror"></div>
                        </div>
                    </div>
                    <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                        <div class="field">
                            <select name="tiempocongregante" id="tiempocongregante" class="form-control" runat="server">
                                <option value="select">INGRESA TIEMPO DE SER CONGREGANTE</option>
                                <option value="MENOS 1 AÑO">MENOS 1 AÑO</option>
                                <option value="1-3 AÑOS">1-3 AÑOS</option>
                                <option value="3-5 AÑOS">3-5 AÑOS</option>
                                <option value="5-10 AÑOS">5-10 AÑOS</option>
                                <option value="SIEMPRE">SIEMPRE</option>
                            </select>
                            <div class="error light" id="tiempocongreganteError"></div>
                        </div>
                    </div>
                    <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                        <div class="field">
                            <select name="tiempocongregante" id="tipocont" class="form-control" runat="server">
                                <option value="select">¿ERES ESTUDIANTE O TUTOR?</option>
                                <option value="ESTUDIANTE">ESTUDIANTE</option>
                                <option value="TUTOR">TUTOR</option>
                            </select>
                            <div class="error light" id="tiempocongreganteError"></div>
                        </div>
                    </div>
                    <%--Telefono y Celular--%>
                    <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                        <div class="field" style="height: 60px">
                            <input type="text" name="telefono" id="telefono" placeholder="TELÉFONO CASA (10 DÍGITOS)" maxlength="10" class="form-control" onblur="validaformulario(this.id);" />
                            <div class="error light" id="telefonoError"></div>
                        </div>
                    </div>
                    <%--Celular --%>
                    <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                        <div class="field" style="height: 60px">
                            <input type="text" name="celular" id="celular" placeholder="CELULAR (10 DÍGITOS)" maxlength="10" class="form-control" onblur="validaformulario(this.id);" />
                            <div class="error light" id="celularError"></div>
                        </div>

                    </div>
                    <%--Direccion--%>
                    <%--Calle--%>
                    <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                        <div class="field">
                            <input type="text" style="text-transform: uppercase;" name="calle" id="calle" placeholder="CALLE" class="form-control" maxlength="100" onblur="validaformulario(this.id);" />
                        </div>
                        <div class="error light" id="calleaError"></div>
                    </div>
                    <%--No Ext / Int / CP--%>
                    <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                        <div class="field">
                            <input type="text" name="noExt" id="noExt" placeholder="NO. EXT" class="form-control" maxlength="10" onkeypress="return validaLetraNumeroEscrito(event)" onblur="validaformulario(this.id);" />
                            <div class="error light" id="noExtaError"></div>
                        </div>
                    </div>
                    <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                        <input type="text" name="noInt" id="noInt" placeholder="NO. INT" class="form-control" maxlength="10" onkeypress="return validaLetraNumeroEscrito(event)" onblur="validaformulario(this.id);" />
                        <div class="error light" id="noIntaError"></div>
                    </div>
                    <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                        <asp:TextBox runat="server" type="text" name="CPostal" ID="CPostal" placeholder="CÓDIGO POSTAL" class="form-control" MaxLength="5" onblur="CargaCP(); Cp();"> </asp:TextBox>
                        <div class="error light" id="CPostalaerror" style="height: 30px; width: 50%; margin-left: auto; margin-right: auto;"></div>
                    </div>

                    <!--Colonia-->
                    <div class="col-md-6 offset-md-3 col-sm-6">
                        <div class="field">
                            <select name="colonia" id="colonia" class="form-control">
                                <option value='select'>Selecciona Colonia</option>
                            </select>
                        </div>
                        <div class="error light" id="coloniaaError" style="height: 30px; width: 50%; margin-left: auto; margin-right: auto;"></div>
                    </div>
                </div>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                    <input type="hidden" name="municipio2" id="municipio2" />
                    <input type="text" value="MUNICIPIO" name="municipio" id="municipio" class="form-control" style="margin-left: initial; text-transform: uppercase;" />
                    <div class="error light" id="municipioaError"></div>
                </div>
                <%--Estado--%>
                <div class="col-md-6 offset-md-3 col-sm-3 col-xs-12">
                    <input type="hidden" name="estado2" id="estado2" />
                    <input type="text" value="ESTADO" name="estado" id="estado" class="form-control" />
                    <div class="error light" id="estadoError" style="height: 30px; width: 50%; margin-left: auto; margin-right: auto;"></div>
                </div>
            </div>
            <div class="col-md-8 offset-md-2  col-xs-12 col-sm-8 offset-sm-2 offset-xs-0 form-group pointer-event">
                <h4 style="color: #092740c4; text-align: center; font-size: 30px;">Datos Iglesia</h4>
                <%--<div class="col-md-6 col-xs-12 form-group">--%>
                <div class="col-md-6 offset-md-3 col-xs-12">
                    <input type="text" style="text-transform: uppercase;" class="form-control" name="nombreigle" id="nombreigle" placeholder="NOMBRE IGLESIA" maxlength="100" onblur="validaformulario(this.id);" />
                    <div class="error" id="igleError"></div>
                </div>
                <%--</div>--%>
                <%--<div class="col-md-6 offset-3 col-xs-12 form-group">--%>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                    <input type="text" style="text-transform: uppercase;" name="NomPas" id="NomPas" placeholder="NOMBRE PASTOR" class="form-control" maxlength="100" />
                    <div class="error light" id="nompasError"></div>
                </div>
                <%--</div>--%>
                <%--<div class="field col-md-4 col-xs-4 ">--%>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                    <asp:DropDownList ID="movi" name="movi" runat="server" CssClass="form-control">
                        <asp:ListItem Value='select'>MOVIMIENTO</asp:ListItem>
                        <asp:ListItem Value='ICIAR'>ICIAR</asp:ListItem>
                        <asp:ListItem Value='APOSTOLICO'>APOSTOLICO</asp:ListItem>
                        <asp:ListItem Value='PENTECOSTAL'>PENTECOSTAL</asp:ListItem>
                        <asp:ListItem Value='PRESBITERIANO'>PRESBITERIANO</asp:ListItem>
                        <asp:ListItem Value='METODISTA'>METODISTA</asp:ListItem>
                        <asp:ListItem Value='INDEPENDIENTE'>INDEPENDIENTE</asp:ListItem>
                    </asp:DropDownList>
                    <div class="error light" id="moviError"></div>
                </div>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12 col-sm-6">
                    <div class="field">
                        <input type="text" name="TelPastor" id="TelPastor" placeholder="TELÉFONO PASTOR (10 DÍGITOS)" maxlength="10" class="form-control" />
                    </div>
                    <div class="error light" id="telefonoPasError"></div>
                </div>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12 col-sm-6">
                    <div class="field">
                        <input type="text" name="telIgle" id="telIgle" placeholder="TELÉFONO IGLESIA (10 DÍGITOS)" maxlength="10" class="form-control" />
                    </div>
                    <div class="error light" id="telefonoIError"></div>
                </div>

                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                    <input type="text" name="calcalleIglele" id="calleIgle" placeholder="CALLE IGLESIA" class="form-control" maxlength="100" />
                    <div class="error light" id="calleIError"></div>
                </div>
                <%--No Ext / Int / CP--%>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                    <input type="text" name="noExtIgle" id="noExtIgle" placeholder="NO. EXT IGLESIA" class="form-control" maxlength="10" />
                    <div class="error light" id="noExtIError"></div>
                </div>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                    <input type="text" name="noIntIgle" id="noIntIgle" placeholder="NO. INT" class="form-control" maxlength="10" />
                    <div class="error light" id="noIntError"></div>
                </div>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                    <asp:TextBox runat="server" type="text" name="CPostalI" ID="CPostalI" placeholder="CÓDIGO POSTAL" class="form-control" MaxLength="5" onblur="CpIglesia(); ColoniasIgle();"> </asp:TextBox>
                    <div class="error light" id="CPostalerror"></div>
                </div>

                <!--Colonia-->
                <%--<div class="col-xs-12 form-group">--%>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                    <select name="coloniaIgle" id="coloniaIgle" class="form-control">
                        <option value='select'>Selecciona Colonia</option>
                    </select>
                    <div class="error light" id="colonia2IgleError" style="height: 30px; width: 50%; margin-left: auto; margin-right: auto;"></div>
                </div>
                    <%--Municipio--%>
                        <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                            <input type="hidden" name="municipio2Igle" id="municipio2Igle" />
                            <input type="text" value="MUNICIPIO" name="municipioIgle" id="municipioIgle" class="form-control" style="margin-left: initial; text-transform: uppercase;" />
                            <div class="error light" id="municipioIgleError"></div>
                        </div>
                    <%--Estado--%>
                    <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                        <input type="hidden" name="estado2Igle" id="estado2Igle" />
                        <input type="text" value="ESTADO" name="estadoIgle" id="estadoIgle" class="form-control" style="margin-left: initial;" />
                        <div class="error light" id="estadoIgleError" style="height: 30px; width: 50%; margin-left: auto; margin-right: auto;"></div>
                    </div>
                <div class="col-md-6 offset-md-3 col-sm-6 col-xs-12">
                    <div class="file1" style="width: 87%; margin-left: auto; margin-right: auto;">
                        <input type="file" id="DocumentoRecot" name="DocumentoRecot" onblur="validacion(this.id,'vacio','Documento',0);" class="width:100px;color:#446655;display: inline;" runat="server" style="width: 293px; opacity: 0; height: 89px;" />
                        <div style="display: none;" class="error light" id="DocumentoRecotError"></div>
                    </div>
                    <div class="col-md-12" style="margin-top: 50px;">
                        <asp:Button runat="server" type="button" ID="crearUser" class="crearUser" value="CrearAlumno" OnClick="CargaDatosEstudiante" Onblur="" Text="Crear Alumno"></asp:Button>
                    </div>
                </div>
            </div>
            </form>
    </div>
    <script async="async">
        function Cp() {
            var CodPos = document.getElementById("CPostal").value;
            $.ajax({
                type: "POST", // Tipo de llamada
                url: "CrearPerfiles.aspx/cargaCp",
                //Dirección del WebMethod, o sea, Página.aspx/Método *NOTA: La función debe estar declarada como <WebMethod>
                data: "{CPostal: '" + CodPos + "'}",   //Parámetros para pasarle al método
                contentType: "application/json; charset=utf-8",
                async: false,
                cache: false,//Tipo de contenido
                dataType: "json",
                success: function resultado(Respuesta) {
                    var mensaje = Respuesta.d[0];
                    var mun = Respuesta.d[1];
                    var estd = Respuesta.d[2];
                    document.getElementById("municipio").value = Respuesta.d[1];
                    document.getElementById("estado").value = Respuesta.d[2];

                },
            });
        }

    </script>
    <script async="async">
        function CargaCP() {
            var CodPos = document.getElementById("CPostal").value;
            $.ajax({
                type: "POST", // Tipo de llamada
                url: "CrearPerfiles.aspx/ConsultaColonias",
                //Dirección del WebMethod, o sea, Página.aspx/Método *NOTA: La función debe estar declarada como <WebMethod>
                data: "{CPostal: '" + CodPos + "'}",   //Parámetros para pasarle al método
                contentType: "application/json; charset=utf-8",
                async: false,
                cache: false,//Tipo de contenido
                dataType: "json",
                success: resultado,

            });
            function resultado(msg) {
                var html = msg.d;
                $('#colonia').html("<option value='select'>Selecciona Colonia</option>")
                $('#colonia').append(html)

            }
        }
        //Carga direcciones Iglesia
    </script>
    <script async="async">
        function CpIglesia() {
            var CodPosI = document.getElementById("CPostalI").value;
            $.ajax({
                type: "POST", // Tipo de llamada
                url: "CrearPerfiles.aspx/CargaDireccionesI",
                //Dirección del WebMethod, o sea, Página.aspx/Método *NOTA: La función debe estar declarada como <WebMethod>
                data: "{CPostalI: '" + CodPosI + "'}",   //Parámetros para pasarle al método
                contentType: "application/json; charset=utf-8",
                async: false,
                cache: false,//Tipo de contenido
                dataType: "json",
                success: function resultado(Respuesta) {
                    var mensaje = Respuesta.d[0];
                    var mun = Respuesta.d[1];
                    var estd = Respuesta.d[2];
                    document.getElementById("municipioIgle").value = Respuesta.d[1];
                    document.getElementById("estadoIgle").value = Respuesta.d[2];

                },
            });
        }

    </script>
    <script async="async">
        function ColoniasIgle() {
            var CodPosI = document.getElementById("CPostalI").value;
            $.ajax({
                type: "POST", // Tipo de llamada
                url: "CrearPerfiles.aspx/ConsultaColoniasIgle",
                //Dirección del WebMethod, o sea, Página.aspx/Método *NOTA: La función debe estar declarada como <WebMethod>
                data: "{CPostalI: '" + CodPosI + "'}",   //Parámetros para pasarle al método
                contentType: "application/json; charset=utf-8",
                async: false,
                cache: false,//Tipo de contenido
                dataType: "json",
                success: resultado,

            });
            function resultado(msg) {
                var html = msg.d;
                $('#coloniaIgle').html("<option value='select'>Selecciona Colonia</option>")
                $('#coloniaIgle').append(html)

            }
        }
    </script>
    <script>
        function ComboAno() {
            var n = (new Date()).getFullYear()
            var select = document.getElementById("anio");
            for (var i = n; i >= 1900; i--)select.options.add(new Option(i, i));
        };
        window.onload = ComboAno;
    </script>
</body>
</html>
