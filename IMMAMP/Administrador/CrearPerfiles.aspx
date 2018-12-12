<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CrearPerfiles.aspx.vb" Inherits="Admintrador_CrearPerfiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%--<link href="../Resources/Styles/css/bootstrap.min.css" rel="stylesheet" />--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <link rel="shotcut icon" href="../Resources/images/imammpsico.png" />
    <link href="../Resources/Styles/Admin.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<script src="../Resources/Scripts/ValidaCrearPerfiles.js"></script>
<script>
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
        else if (variable == "2") { //Admin            
            document.getElementById("apellidoM").style.display = "block";
            document.getElementById("instrum").style.display = "none";
            document.getElementById("btnAlum").className = " btn btn-circle";
            document.getElementById("btnProf").className = "btn btn-circle";
            document.getElementById("btnAdmin").className = "btn btn-circulo";
        }
    }
</script>
<body>

    <!-- #include file ="/Globales/Header.aspx" -->
    <div class="main">
        <form runat="server">
            <div style="padding-top: 200px;">
                <h1 style="color: #092740c4; text-align: center">Crear Usuarios</h1>
                <div id="opcionMultiple" style="aling-center: -63; margin-left: auto; margin-right: auto; display: block; width: 482px; margin-bottom: 20px;">
                    <input type="hidden" runat="server" name="validaTipoPerfil" id="validaTipoPerfil" value="0" />
                    <a id="btnAlum" ng-click="hasPerfil1 = true; hasPerfil2 = false ; hasPerfil3 = false; hasPerfil4 = false; hasPerfil5 = false; hasPerfil6 = false;" ng-class="{'active':hasPerfil1}" class="btn btn-circle" onclick="validaTipoPerfil(0);document.getElementById('validaTipoPerfil').value='0'"></a><span>Alumno</span>
                    <a id="btnProf" ng-click="hasPerfil1 = false; hasPerfil2 = true ; hasPerfil3 = false ; hasPerfil4 = false ; hasPerfil5 = false ;  hasPerfil6 = false ;" ng-class="{'active':hasPerfil2}" class="btn btn-circle" onclick="validaTipoPerfil(1);document.getElementById('validaTipoPerfil').value='1'"></a><span>Profesor</span>
                    <a id="btnAdmin" ng-click="hasPerfil1 = false; hasPerfil2 = false ; hasPerfil3 = true ; hasPerfil4 = false ; hasPerfil5 = false ; hasPerfil6 = false ;" ng-class="{'active':hasPerfil3}" class="btn btn-circle" onclick="validaTipoPerfil(2);document.getElementById('validaTipoPerfil').value='2'"></a><span>Administrador</span>
                </div>
                <div class="col-md-12 col-xs-12 form-group">

                    <div class="field">
                        <input type="text" name="nombre" id="nombre" placeholder="NOMBRE" class="form-control" maxlength="100" onblur="validaformulario(this.id);" />
                    </div>
                    <div style="height: 30px; width: 50%; margin-left: auto; margin-right: auto;">
                        <div class="error" id="nombreError"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 form-group">

                        <div class="field">
                            <input type="text" name="apellidoP" id="apellidoP" placeholder="APELLIDO PATERNO" class="form-control" maxlength="100" onblur="validaformulario(this.id);" />
                        </div>
                        <div style="height: 30px; width: 50%; margin-left: auto; margin-right: auto;">
                            <div class="error" id="apellidoPError"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 form-group">

                        <div class="field">
                            <input type="text" name="apellidoM" id="apellidoM" placeholder="APELLIDO MATERNO" class="form-control" maxlength="100" onblur="validaformulario(this.id); " />
                        </div>
                        <div style="height: 30px; width: 50%; margin-left: auto; margin-right: auto;">
                            <div class="error" id="apellidoMError"></div>
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-xs-12 form-group">
                        <div class="emailLabel">
                            <input type="text" name="email" id="email" placeholder="CORREO ELECTRÓNICO" class="form-control" maxlength="100" onblur="validaformulario(this.id);" />
                        </div>
                        <div style="height: 30px; width: 50%; margin-left: auto; margin-right: auto;">
                            <div class="error light" id="emailError"></div>
                        </div>
                    </div>
                    <div class="genins">
                        <div class="field col-md-2" style="width: 176px;">
                            <asp:DropDownList ID="genero" name="generoUser" runat="server" onchange="ShowLabel(this.id);validacion(this.id,'lista','género',0)" class="form-control">
                                <asp:ListItem Value='select'>GÉNERO</asp:ListItem>
                                <asp:ListItem Value='0'>MASCULINO</asp:ListItem>
                                <asp:ListItem Value='1'>FEMENINO</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="error light" id="generoUserError"></div>
                        <div class="field col-md-2" style="width: 200px; margin-left: 395px">
                            <input type="hidden" name="instrumento" id="instru" />
                            <asp:DropDownList runat="server" name="instrumento" ID="instrum" class="form-control" onchange="ShowLabel(this.id);validacion(this.id, 'lista', 'instrumento',1, 0)" Style="display: block; margin-left: 29px;">
                                <asp:ListItem Value='INSTRUMENTO'>INSTRUMENTO</asp:ListItem>
                                <asp:ListItem Value='PIANO'>PIANO</asp:ListItem>
                                <asp:ListItem Value='VIOLIN'>VIOLIN</asp:ListItem>
                                <asp:ListItem Value='CELLO'>CELLO</asp:ListItem>
                                <asp:ListItem Value='GUITARRA'>GUITARRA</asp:ListItem>
                                <asp:ListItem Value='BAJO'>BAJO</asp:ListItem>
                                <asp:ListItem Value='FLAUTA'>FLAUTA TRANSVERSAL</asp:ListItem>
                                <asp:ListItem Value='SAXOFO'>SAXOFON</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="error light" id="instrumento"></div>
                    </div>

                    <!-- Div para ocultar datos personales (Solo en el caso de generar Administrador)-->
                    <div class="col-md-12 col-xs-12">
                        <div class="col-md-12 form-group field" style="padding-top: 27px; text-align: center;">
                            <h3 style="color: #092740c4; text-align: center; font-size: 30px;">Fecha de Nacimiento</h3>
                            <div>
                                <input type="date" name="fecha" class="form-group" style="border-radius: 5px; width: 157px; height: 38px;" />
                            </div>
                        </div>
                    </div>
                    <%--Datos de Contacto--%>
                    <div class="col-md-12 col-xs-12">
                        <h2 style="color: #092740c4; text-align: center; font-size: 30px;">Datos Contacto</h2>
                        <%--Telefono y Celular--%>
                        <div class="col-md-12 col-xs-12 form-group">
                            <div class="col-xs-6 form-group">

                                <div class="field">
                                    <div class="field">
                                        <input type="text" name="telefono" id="telefono" placeholder="TELÉFONO CASA (10 DÍGITOS)" maxlength="10" class="form-control" onblur="ShowLabel2(this.id);validacion(this.id,'telefono','teléfono',1,10)" onkeypress="return validaNumeroEscrito(event);" />
                                    </div>
                                    <div class="error light" id="telefonoError"></div>
                                </div>
                                <%--Celular --%>
                                <div class="col-md-12 form-group">

                                    <div class="field">
                                        <input type="text" name="celular" id="celular" placeholder="CELULAR (10 DÍGITOS)" maxlength="10" class="form-control" onblur="ShowLabel2(this.id);validacion(this.id,'telefono','celular',1,10)" onkeypress="return validaNumeroEscrito(event);" />
                                    </div>
                                    <div class="error light" id="celularError"></div>
                                </div>
                            </div>

                            <%--Direccion--%>
                            <%--Calle--%>
                            <div class="row">
                                <div class="col-md-12 col-xs-12 form-group">

                                    <div class="field">
                                        <input type="text" name="calle" id="calle" placeholder="CALLE" class="form-control" maxlength="100" onblur="ShowLabel2(this.id);validacion(this.id,'direccion','calle',1,10)" />
                                    </div>
                                    <div class="error light" id="calleError"></div>
                                </div>
                            </div>
                            <%--No Ext / Int / CP--%>
                            <div class="col-md-12 col-xs-12 form-group">
                                <div class="col-xs-3 form-group">

                                    <div class="field">
                                        <input type="text" name="noExt" id="noExt" placeholder="NO. EXT" class="form-control" maxlength="10" onkeypress="return validaLetraNumeroEscrito(event)" onblur="ShowLabel2(this.id);validacion(this.id, 'letraNumero', 'no. ext', 1);" />
                                    </div>
                                    <div class="error light" id="noExtError"></div>
                                </div>
                                <div class="col-xs-3 form-group">

                                    <div class="field">
                                        <input type="text" name="noInt" id="noInt" placeholder="NO. INT" class="form-control" maxlength="10" onkeypress="return validaLetraNumeroEscrito(event)" onblur="ShowLabel2(this.id);" />
                                    </div>
                                    <div class="error light" id="noIntError"></div>
                                </div>
                                <div class="col-xs-6 form-group">

                                    <div class="field">
                                        <asp:TextBox runat="server" type="text" name="CPostal" ID="CPostal" placeholder="CÓDIGO POSTAL" class="form-control" MaxLength="5" onblur="ShowLabel2(this.id);LlenaCamposCP('CPostalCli');llenaColonia2();validaExisteCP(this.id,'código postal')" onkeypress="return validaNumeroEscrito(event)"> </asp:TextBox>
                                    </div>
                                    <div class="error light" id="CPostalerror"></div>
                                </div>
                            </div>
                            <!--Colonia-->
                            <div class="row">
                                <div class="col-xs-12 form-group">

                                    <div class="field">
                                        <input type="hidden" name="colonia2" id="colonia2" />
                                        <select name="colonia" id="colonia" class="form-control" onchange="ShowLabel(this.id);validacion(this.id, 'lista', 'colonia', 0);llenaColonia2();" style="width: 227px;">
                                            <option value="select">COLONIA</option>
                                        </select>
                                    </div>
                                    <div class="error light" id="coloniaError"></div>
                                </div>
                            </div>
                            <!--Municipio y estado-->
                            <div class="row">
                                <%--Municipio--%>
                                <div class="col-xs-6 form-group">

                                    <div class="field">
                                        <input type="hidden" name="municipio2" id="municipio2" />
                                        <select name="municipio" id="municipio" class="form-control" onchange="ShowLabel(this.id);validacion(this.id, 'lista', 'municipio', 0)" style="width: 227px;">
                                            <option value="select">MUNICIPIO</option>
                                        </select>
                                    </div>
                                    <div class="error light" id="municipioError"></div>
                                </div>
                                <%--Estado--%>
                                <div class="col-xs-6 form-group">

                                    <div class="field">
                                        <input type="hidden" name="estado2" id="estado2" />
                                        <select name="estado" id="estado" class="form-control" onchange="ShowLabel(this.id);validacion(this.id, 'lista', 'estado', 0)">
                                            <option value="select">ESTADO</option>
                                            <option value="AGUASCALIENTES">AGUASCALIENTES</option>
                                            <option value="BAJA CALIFORNIA">BAJA CALIFORNIA</option>
                                            <option value="BAJA CALIFORNIA SUR">BAJA CALIFORNIA SUR</option>
                                            <option value="CAMPECHE">CAMPECHE</option>
                                            <option value="CHIAPAS">CHIAPAS</option>
                                            <option value="CHIHUAHUA">CHIHUAHUA</option>
                                            <option value="COAHUILA">COAHUILA</option>
                                            <option value="COLIMA">COLIMA</option>
                                            <option value="CDMX">CDMX</option>
                                            <option value="DURANGO">DURANGO</option>
                                            <option value="MEXICO">ESTADO DE MÉXICO</option>
                                            <option value="GUANAJUATO">GUANAJUATO</option>
                                            <option value="GUERRERO">GUERRERO</option>
                                            <option value="HIDALGO">HIDALGO</option>
                                            <option value="JALISCO">JALISCO</option>
                                            <option value="MICHOACAN">MICHOACÁN</option>
                                            <option value="MORELOS">MORELOS</option>
                                            <option value="NAYARIT">NAYARIT</option>
                                            <option value="NUEVO LEON">NUEVO LEÓN</option>
                                            <option value="OAXACA">OAXACA</option>
                                            <option value="PUEBLA">PUEBLA</option>
                                            <option value="QUERETARO">QUERÉTARO</option>
                                            <option value="QUINTANA ROO">QUINTANA ROO</option>
                                            <option value="SAN LUIS POTOSI">SAN LUIS POTOSÍ</option>
                                            <option value="SINALOA">SINALOA</option>
                                            <option value="SONORA">SONORA</option>
                                            <option value="TABASCO">TABASCO</option>
                                            <option value="TAMAULIPAS">TAMAULIPAS</option>
                                            <option value="TLAXCALA">TLAXCALA</option>
                                            <option value="VERACRUZ">VERACRUZ</option>
                                            <option value="YUCATAN">YUCATÁN</option>
                                            <option value="ZACATECAS">ZACATECAS</option>
                                        </select>
                                    </div>
                                    <div class="error light" id="estadoError"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--< div datos Iglesia>--%>
                    <div class="col-md-12 col-xs-12 form-group">
                        <div class="col-md-12 col-xs-12 form-group">
                            <h4 style="color: #092740c4; text-align: center; font-size: 30px;">Datos Iglesia</h4>
                            <div class="col-xs-12 form-group">
                                <div class="field">
                                    <input type="text" name="NomIgle" id="nomigle" placeholder="NOMBRE IGLESIA" class="form-control" maxlength="100" onblur="ShowLabel2(this.id);validacion(this.id,'letra','nombre de la iglesia',1,0)" onkeypress="return validaLetraEscrito(event);" />
                                </div>
                                <div class="error light" id="NomIgle"></div>
                            </div>
                            <div class="col-xs-12 form-group">

                                <div class="field">
                                    <input type="text" name="NomPas" id="nompas" placeholder="NOMBRE PASTOR" class="form-control" maxlength="100" onblur="ShowLabel2(this.id);validacion(this.id,'letra','nombre del pastor',1,0)" onkeypress="return validaLetraEscrito(event);" />
                                </div>
                                <div class="error light" id="nompas"></div>
                            </div>
                            <div class="field col-md-4 col-xs-4 ">
                                <asp:DropDownList ID="movi" name="MOV" runat="server" onchange="ShowLabel(this.id);validacion(this.id,'lista','movimiento',0)" class="form-control col-md-12" style="width: 215px;">
                                    <asp:ListItem Value='select'>MOVIMIENTO</asp:ListItem>
                                    <asp:ListItem Value='0'>ICIAR</asp:ListItem>
                                    <asp:ListItem Value='1'>APOSTOLICO</asp:ListItem>
                                    <asp:ListItem Value='1'>PENTECOSTAL</asp:ListItem>
                                    <asp:ListItem Value='1'>PRESBITERIANO</asp:ListItem>
                                    <asp:ListItem Value='1'>METODISTA</asp:ListItem>
                                    <asp:ListItem Value='1'>INDEPENDIENTE</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-12 form-group">
                                <div class="col-md-12 form-group">
                                    <div class="field">
                                        <div class="field">
                                            <input type="text" name="telefono" id="telIgle" placeholder="TELÉFONO IGLESIA (10 DÍGITOS)" maxlength="10" class="form-control" onblur="ShowLabel2(this.id);validacion(this.id,'telefono','teléfono',1,10)" onkeypress="return validaNumeroEscrito(event);" />
                                        </div>
                                        <div class="error light" id="telefonoError"></div>
                                    </div>
                                </div>

                                <%--Direccion--%>
                                <%--Calle--%>
                                <div class="col-md-12 col-xs-12 form-group">
                                    <div class="col-xs-12 form-group">

                                        <div class="field">
                                            <input type="text" name="calle" id="calleIgle" placeholder="CALLE" class="form-control" maxlength="100" onblur="ShowLabel2(this.id);validacion(this.id,'direccion','calle',1,10)" />
                                        </div>
                                        <div class="error light" id="calleError"></div>
                                    </div>
                                </div>
                                <%--No Ext / Int / CP--%>
                                <div class="col-md-4 col-xs-2">
                                    <div class="form-group">

                                        <div class="field">
                                            <input type="text" name="noExt" id="noExtIgle" placeholder="NO. EXT" class="form-control" maxlength="10" onkeypress="return validaLetraNumeroEscrito(event)" onblur="ShowLabel2(this.id);validacion(this.id, 'letraNumero', 'no. ext', 1);" />
                                        </div>
                                        <div class="error light" id="noExtError"></div>
                                    </div>
                                    <div class="col-xs-3 form-group">

                                        <div class="field">
                                            <input type="text" name="noInt" id="noIntIgle" placeholder="NO. INT" class="form-control" maxlength="10" onkeypress="return validaLetraNumeroEscrito(event)" onblur="ShowLabel2(this.id);" />
                                        </div>
                                        <div class="error light" id="noIntError"></div>
                                    </div>
                                    <div class="col-xs-6 form-group">

                                        <div class="field">
                                            <input type="text" name="CPostal" id="CPostalIgle" placeholder="CÓDIGO POSTAL" class="form-control" maxlength="5" onblur="ShowLabel2(this.id);LlenaCamposCP('CPostalCli');llenaColonia2();" onkeypress="return validaNumeroEscrito(event)" />
                                        </div>
                                        <div class="error light" id="CPostalerror"></div>
                                    </div>
                                </div>
                                <!--Colonia-->
                                <div class="col-md-12 col-xs-12 form-group">
                                    <div class="col-xs-12 form-group">

                                        <div class="field">
                                            <input type="hidden" name="colonia2" id="colonia2Igle" />
                                            <select name="colonia" id="coloniaIgle" class="form-control" onchange="ShowLabel(this.id);validacion(this.id, 'lista', 'colonia', 0);llenaColonia2();" style="width: 227px;">
                                                <option value="select">COLONIA</option>
                                            </select>
                                        </div>
                                        <div class="error light" id="coloniaError"></div>
                                    </div>
                                </div>
                                <!--Municipio y estado-->
                                <div class="col-md-4 col-xs-4 form-group">
                                    <%--Municipio--%>
                                    <div class="col-xs-6 form-group">

                                        <div class="field">
                                            <input type="hidden" name="municipio2" id="municipio2Igle1" />
                                            <select name="municipio" id="municipio2Igle" class="form-control" onchange="ShowLabel(this.id);validacion(this.id, 'lista', 'municipio', 0)" style="width: 227px;">
                                                <option value="select">MUNICIPIO</option>
                                            </select>
                                        </div>
                                        <div class="error light" id="municipioError"></div>
                                    </div>
                                    <%--Estado--%>
                                    <div class="col-md-12 col-xs-12 form-group">

                                        <div class="field col-md-12 col-xs-12">
                                            <input type="hidden" name="estado2" id="estado2Igle" />
                                            <select name="estado" id="estadoIgle" class="form-control" onchange="ShowLabel(this.id);validacion(this.id, 'lista', 'estado', 0)">
                                                <option value="select">ESTADO</option>
                                                <option value="AGUASCALIENTES">AGUASCALIENTES</option>
                                                <option value="BAJA CALIFORNIA">BAJA CALIFORNIA</option>
                                                <option value="BAJA CALIFORNIA SUR">BAJA CALIFORNIA SUR</option>
                                                <option value="CAMPECHE">CAMPECHE</option>
                                                <option value="CHIAPAS">CHIAPAS</option>
                                                <option value="CHIHUAHUA">CHIHUAHUA</option>
                                                <option value="COAHUILA">COAHUILA</option>
                                                <option value="COLIMA">COLIMA</option>
                                                <option value="CDMX">CDMX</option>
                                                <option value="DURANGO">DURANGO</option>
                                                <option value="MEXICO">ESTADO DE MÉXICO</option>
                                                <option value="GUANAJUATO">GUANAJUATO</option>
                                                <option value="GUERRERO">GUERRERO</option>
                                                <option value="HIDALGO">HIDALGO</option>
                                                <option value="JALISCO">JALISCO</option>
                                                <option value="MICHOACAN">MICHOACÁN</option>
                                                <option value="MORELOS">MORELOS</option>
                                                <option value="NAYARIT">NAYARIT</option>
                                                <option value="NUEVO LEON">NUEVO LEÓN</option>
                                                <option value="OAXACA">OAXACA</option>
                                                <option value="PUEBLA">PUEBLA</option>
                                                <option value="QUERETARO">QUERÉTARO</option>
                                                <option value="QUINTANA ROO">QUINTANA ROO</option>
                                                <option value="SAN LUIS POTOSI">SAN LUIS POTOSÍ</option>
                                                <option value="SINALOA">SINALOA</option>
                                                <option value="SONORA">SONORA</option>
                                                <option value="TABASCO">TABASCO</option>
                                                <option value="TAMAULIPAS">TAMAULIPAS</option>
                                                <option value="TLAXCALA">TLAXCALA</option>
                                                <option value="VERACRUZ">VERACRUZ</option>
                                                <option value="YUCATAN">YUCATÁN</option>
                                                <option value="ZACATECAS">ZACATECAS</option>
                                            </select>
                                        </div>
                                        <div class="error light" id="estadoError"></div>
                                        <div class="file1 col-md-12">
                                            <input type="file" id="DocumentoRecot" name="DocumentoRecot" onblur="validacion(this.id,'vacio','Documento',0);" class="width:100px;color:#446655;display: inline;" runat="server" style="width: 293px; opacity: 0; height: 89px;" />
                                            <div style="display: none;" class="error light" id="DocumentoRecotError"></div>
                                        </div>
                                        <div>
                                            <asp:Button runat="server" type="button" ID="crearUser" class="crearUser" value="CrearAlumno" OnClick="CargaDatosEstudiante" Text="Crear Alumno"></asp:Button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
        </form>
    </div>
    <%--Script para la carga de dias y años de diferentes campos--%>

    <!-- #include file ="/Globales/footer.aspx" -->
</body>
</html>
