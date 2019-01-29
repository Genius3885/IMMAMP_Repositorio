<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CrearPerfiles.aspx.vb" Inherits="Admintrador_CrearPerfiles" %>

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

                <div class="col-md-8 offset-2  col-xs-12 form-group">

                    <div class="col-md-6 offset-3 col-xs-12 form-group">
                        <div class="field">
                            <input type="text" style="text-transform: uppercase;" name="nombre" id="nombre" placeholder="NOMBRE" class="form-control" maxlength="100" onblur="validaformulario(this.id);" />
                        </div>
                        <div class="error" id="nombreError"></div>
                    </div>
                    <div class="col-md-6 offset-3 col-xs-12 form-group">
                        <div class="field">
                            <input type="text" style="text-transform: uppercase;" name="apellidoP" id="apellidoP" placeholder="APELLIDO PATERNO" class="form-control" maxlength="100" onblur="validaformulario(this.id);" />
                        </div>
                        <div class="error" id="apellidoPError"></div>
                    </div>
                    <div class="col-md-6 offset-3 col-xs-12 form-group">
                        <div class="field">
                            <input type="text" style="text-transform: uppercase;" name="apellidoM" id="apellidoM" placeholder="APELLIDO MATERNO" class="form-control" maxlength="100" onblur="validaformulario(this.id); " />
                        </div>
                        <div class="error" id="apellidoMError"></div>
                    </div>
                    <div class="col-md-6 offset-3 col-xs-12 form-group">
                        <input type="text" name="email" id="email" placeholder="CORREO ELECTRÓNICO" class="form-control" maxlength="100" onblur="validaformulario(this.id);" />
                        <div>
                            <div class="error light" id="emailError"></div>
                        </div>
                    </div>
                    <div class="col-md-6 offset-3">
                        <div class="field col-md-6" style="padding-left: initial;">
                            <asp:DropDownList ID="genero" name="generoUser" runat="server" class="form-control">
                                <asp:ListItem Value='select'>GÉNERO</asp:ListItem>
                                <asp:ListItem Value='M'>MASCULINO</asp:ListItem>
                                <asp:ListItem Value='F'>FEMENINO</asp:ListItem>
                            </asp:DropDownList>
                            <div class="error light" id="generoUserError"></div>
                        </div>
                        <div class="field col-md-6" style="padding-right: initial;">
                            <input type="hidden" name="instrumento" id="instru" />
                            <asp:DropDownList runat="server" name="instrumento" ID="instrum" class="form-control" onchange="ShowLabel(this.id);validacion(this.id, 'lista', 'instrumento',1, 0)" Style="display: block;">
                                <asp:ListItem Value='INSTRUMENTO'>INSTRUMENTO</asp:ListItem>
                                <asp:ListItem Value='PIANO'>PIANO</asp:ListItem>
                                <asp:ListItem Value='VIOLIN'>VIOLIN</asp:ListItem>
                                <asp:ListItem Value='CELLO'>CELLO</asp:ListItem>
                                <asp:ListItem Value='GUITARRA'>GUITARRA</asp:ListItem>
                                <asp:ListItem Value='BAJO'>BAJO</asp:ListItem>
                                <asp:ListItem Value='FLAUTA'>FLAUTA TRANSVERSAL</asp:ListItem>
                                <asp:ListItem Value='SAXOFO'>SAXOFON</asp:ListItem>
                            </asp:DropDownList>
                            <div class="error light" id="instrumento"></div>
                        </div>
                    </div>
                    <div style="width: 100%;">
                        <div class="col-md-6 offset-3 col-xs-12">
                            <h2 style="color: #092740c4; text-align: center; font-size: 30px;">Fecha Nacimiento</h2>
                            <div class="col-md-4">
                                <div class="field">
                                    <select name="dia" id="dia" class="form-control" runat="server">
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
                                </div>
                                <div class="error light" id="diaError"></div>
                            </div>
                            <div class="col-md-4">
                                <div class="field">
                                    <select name="mes" id="mes" class="form-control" runat="server">
                                        <option value="select">Mes</option>
                                        <option value="01">Ene</option>
                                        <option value="02">Feb</option>
                                        <option value="03">Mar</option>
                                        <option value="04">Abr</option>
                                        <option value="05">May</option>
                                        <option value="06">Jun</option>
                                        <option value="07">Jul</option>
                                        <option value="08">Ago</option>
                                        <option value="09">Sep</option>
                                        <option value="10">Oct</option>
                                        <option value="11">Nov</option>
                                        <option value="12">Dic</option>
                                    </select>
                                    <div class="error light" id="mesError"></div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="field">
                                    <select name="anio" id="anio" class="form-control" runat="server" onblur="CalculaEdad(this.id);">
                                        <option value="select">Año</option>
                                        <option value="1936">1936</option>
                                        <option value="1937">1937</option>
                                        <option value="1938">1938</option>
                                        <option value="1939">1939</option>
                                        <option value="1940">1940</option>
                                        <option value="1941">1941</option>
                                        <option value="1942">1942</option>
                                        <option value="1943">1943</option>
                                        <option value="1944">1944</option>
                                        <option value="1945">1945</option>
                                        <option value="1946">1946</option>
                                        <option value="1947">1947</option>
                                        <option value="1948">1948</option>
                                        <option value="1949">1949</option>
                                        <option value="1950">1950</option>
                                        <option value="1951">1951</option>
                                        <option value="1952">1952</option>
                                        <option value="1953">1953</option>
                                        <option value="1954">1954</option>
                                        <option value="1955">1955</option>
                                        <option value="1956">1956</option>
                                        <option value="1957">1957</option>
                                        <option value="1958">1958</option>
                                        <option value="1959">1959</option>
                                        <option value="1960">1960</option>
                                        <option value="1961">1961</option>
                                        <option value="1962">1962</option>
                                        <option value="1963">1963</option>
                                        <option value="1964">1964</option>
                                        <option value="1965">1965</option>
                                        <option value="1966">1966</option>
                                        <option value="1967">1967</option>
                                        <option value="1968">1968</option>
                                        <option value="1969">1969</option>
                                        <option value="1970">1970</option>
                                        <option value="1971">1971</option>
                                        <option value="1972">1972</option>
                                        <option value="1973">1973</option>
                                        <option value="1974">1974</option>
                                        <option value="1975">1975</option>
                                        <option value="1976">1976</option>
                                        <option value="1977">1977</option>
                                        <option value="1978">1978</option>
                                        <option value="1979">1979</option>
                                        <option value="1980">1980</option>
                                        <option value="1981">1981</option>
                                        <option value="1982">1982</option>
                                        <option value="1983">1983</option>
                                        <option value="1984">1984</option>
                                        <option value="1985">1985</option>
                                        <option value="1986">1986</option>
                                        <option value="1987">1987</option>
                                        <option value="1988">1988</option>
                                        <option value="1989">1989</option>
                                        <option value="1990">1990</option>
                                        <option value="1991">1991</option>
                                        <option value="1992">1992</option>
                                        <option value="1993">1993</option>
                                        <option value="1994">1994</option>
                                        <option value="1995">1995</option>
                                        <option value="1996">1996</option>
                                        <option value="1996">1997</option>
                                        <option value="1996">1998</option>
                                        <option value="1996">1999</option>
                                        <option value="1996">2000</option>
                                        <option value="1996">2001</option>
                                        <option value="1996">2002</option>
                                        <option value="1996">2003</option>
                                        <option value="1996">2004</option>
                                        <option value="1996">2005</option>
                                        <option value="1996">2006</option>
                                        <option value="1996">2007</option>
                                        <option value="1996">2008</option>
                                        <option value="1996">2009</option>
                                        <option value="1996">2010</option>
                                        <option value="1996">2011</option>
                                        <option value="1996">2012</option>
                                        <option value="1996">2013</option>
                                        <option value="1996">2014</option>
                                    </select>
                                </div>
                                <div class="error light" id="anioError"></div>
                            </div>
                        </div>
                        <div class="col-md-4 offset-4 col-xs-12">
                            <input type="text" name="edad" id="edad" placeholder="Edad" maxlength="3" class="form-control" onblur="validaformulario(this.id);" />
                            
                            <div class="error light" id="edadError"></div>
                            
                        </div>
                    </div>
                    
                    <div class="col-md-12 col-xs-12">
                        <h2 style="color: #092740c4; text-align: center; font-size: 30px;">Datos Contacto</h2>
                        <%--Telefono y Celular--%>
                        <div class="col-md-6 offset-3 col-xs-12">
                            <div class="field" style="height: 60px">
                            <input type="text" name="telefono" id="telefono" placeholder="TELÉFONO CASA (10 DÍGITOS)" maxlength="10" class="form-control" onblur="validaformulario(this.id);" />
                            <div class="error light" id="telefonoError"></div>

                            </div>
                        </div>
                        <%--Celular --%>
                        <div class="col-md-6 offset-3 col-xs-12">
                            <div class="field" style="height: 60px">
                                <input type="text" name="celular" id="celular" placeholder="CELULAR (10 DÍGITOS)" maxlength="10" class="form-control" onblur="validaformulario(this.id);" />
                            <div class="error light" id="celularError"></div>
                            </div>
                            
                        </div>
                        <%--Direccion--%>
                        <%--Calle--%>
                        <div class="col-md-6 offset-3 col-xs-12">

                            <div class="field">
                                <input type="text" style="text-transform: uppercase;" name="calle" id="calle" placeholder="CALLE" class="form-control" maxlength="100" onblur="validaformulario(this.id);" />
                            </div>
                            <div class="error light" id="calleaError"></div>
                        </div>
                        <%--No Ext / Int / CP--%>
                        <div class="col-md-6 offset-3 col-xs-12">
                            <div class="field">
                                <input type="text" name="noExt" id="noExt" placeholder="NO. EXT" class="form-control" maxlength="10" onkeypress="return validaLetraNumeroEscrito(event)" onblur="validaformulario(this.id);" />
                                <div class="error light" id="noExtaError"></div>
                            </div>
                        </div>
                        <div class="col-md-6 offset-3 col-xs-12">
                            <input type="text" name="noInt" id="noInt" placeholder="NO. INT" class="form-control" maxlength="10" onkeypress="return validaLetraNumeroEscrito(event)" onblur="validaformulario(this.id);" />
                            <div class="error light" id="noIntaError"></div>
                        </div>
                        <div class="col-md-6 offset-3 col-xs-12">
                            <asp:TextBox runat="server" type="text" name="CPostal" ID="CPostal" placeholder="CÓDIGO POSTAL" class="form-control" MaxLength="5" onblur="CargaCP(); Cp();"> </asp:TextBox>
                            <div class="error light" id="CPostalaerror" style="height: 30px; width: 50%; margin-left: auto; margin-right: auto;"></div>
                        </div>

                        <!--Colonia-->
                        <div class="col-md-6 offset-3">
                            <div class="field">
                                <select name="colonia" id="colonia" class="form-control">
                                    <option value='select'>Selecciona Colonia</option>
                                </select>
                            </div>
                            <div class="error light" id="coloniaaError" style="height: 30px; width: 50%; margin-left: auto; margin-right: auto;"></div>
                        </div>
                        <%--</div>--%>
                        <!--Municipio y estado-->
                        <%--<div class="col-md-6 offset-3"  style="text-transform: uppercase;">--%>
                        <%--Municipio--%>
                        <div class="col-md-6 offset-3 col-xs-12">
                            <input type="hidden" name="municipio2" id="municipio2" />
                            <input type="text" value="MUNICIPIO" name="municipio" id="municipio" class="form-control" style="margin-left: initial; text-transform: uppercase;" />
                            <div class="error light" id="municipioaError"></div>
                        </div>
                        <%--Estado--%>
                        <div class="col-md-6 offset-3 col-xs-12">
                            <input type="hidden" name="estado2" id="estado2" />
                            <input type="text" value="ESTADO" name="estado" id="estado" class="form-control" style="margin-left: initial;" />
                            <div class="error light" id="estadoError" style="height: 30px; width: 50%; margin-left: auto; margin-right: auto;"></div>
                        </div>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--< div datos Iglesia>--%>
                        <div class="col-md-6 offset-3 col-xs-12">
                            <h4 style="color: #092740c4; text-align: center; font-size: 30px;">Datos Iglesia</h4>
                            <%--<div class="col-md-6 col-xs-12 form-group">--%>
                            <div class="field">
                                <input type="text" style="text-transform: uppercase;" class="form-control" name="nombreigle" id="nombreigle" placeholder="NOMBRE IGLESIA" maxlength="100" onblur="validaformulario(this.id);" />
                                <div class="error" id="igleError"></div>
                            </div>
                            <%--</div>--%>
                            <%--<div class="col-md-6 offset-3 col-xs-12 form-group">--%>
                            <div class="field">
                                <input type="text" style="text-transform: uppercase;" name="NomPas" id="NomPas" placeholder="NOMBRE PASTOR" class="form-control" maxlength="100" />
                                <div class="error light" id="nompasError"></div>
                            </div>
                            <%--</div>--%>
                            <%--<div class="field col-md-4 col-xs-4 ">--%>
                            <div class="field">
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
                             <div class="field">
                                <div class="field">
                                    <input type="text" name="TelPastor" id="TelPastor" placeholder="TELÉFONO PASTOR (10 DÍGITOS)" maxlength="10" class="form-control" />
                                </div>
                                <div class="error light" id="telefonoPasError"></div>
                            </div>
                            <div class="field">
                                <div class="field">
                                    <input type="text" name="telIgle" id="telIgle" placeholder="TELÉFONO IGLESIA (10 DÍGITOS)" maxlength="10" class="form-control" />
                                </div>
                                <div class="error light" id="telefonoIError"></div>
                            </div>

                            <div class="field">
                                <input type="text" name="calcalleIglele" id="calleIgle" placeholder="CALLE IGLESIA" class="form-control" maxlength="100" />
                                <div class="error light" id="calleIError"></div>
                            </div>
                            <%--No Ext / Int / CP--%>
                            <div style="width: 100%;">
                                <div class="col-md-4">
                                    <div class="field">
                                        <input type="text" name="noExtIgle" id="noExtIgle" placeholder="NO. EXT IGLESIA" class="form-control" maxlength="10" />
                                    </div>
                                    <div class="error light" id="noExtIError"></div>
                                </div>
                                <div class="col-md-4 form-group">

                                    <div class="field">
                                        <input type="text" name="noIntIgle" id="noIntIgle" placeholder="NO. INT" class="form-control" maxlength="10" />
                                    </div>
                                    <div class="error light" id="noIntError"></div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="field">
                                        <asp:TextBox runat="server" type="text" name="CPostalI" ID="CPostalI" placeholder="CÓDIGO POSTAL" class="form-control" MaxLength="5" onblur="CpIglesia(); ColoniasIgle();"> </asp:TextBox>
                                    </div>
                                    <div class="error light" id="CPostalerror"></div>
                                </div>
                            </div>
                            <!--Colonia-->
                            <%--<div class="col-xs-12 form-group">--%>
                            <div class="col-md-10 offset-1">
                                <div class="field">
                                    <select name="coloniaIgle" id="coloniaIgle" class="form-control">
                                        <option value='select'>Selecciona Colonia</option>
                                    </select>
                                </div>
                                <div class="error light" id="colonia2IgleError" style="height: 30px; width: 50%; margin-left: auto; margin-right: auto;"></div>
                            </div>
                            <%--</div>--%>
                            <!--Municipio y estado-->
                            <div class="col-md-12 col-xs-4 form-group">
                                <%--Municipio--%>
                                <div class="col-md-6 form-group">
                                    <div class="field">
                                        <input type="hidden" name="municipio2Igle" id="municipio2Igle" />
                                        <input type="text" value="MUNICIPIO" name="municipioIgle" id="municipioIgle" class="form-control" style="margin-left: initial; text-transform: uppercase;" />
                                        <div class="error light" id="municipioIgleError"></div>
                                    </div>
                                </div>
                                <%--Estado--%>
                                <div class="field col-md-6 col-xs-12">
                                    <input type="hidden" name="estado2Igle" id="estado2Igle" />
                                    <input type="text" value="ESTADO" name="estado" id="estadoIgle" class="form-control" style="margin-left: initial;" />
                                    <div class="error light" id="estadoIgleError" style="height: 30px; width: 50%; margin-left: auto; margin-right: auto;"></div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="file1" style="width: 87%; margin-left: auto; margin-right: auto;">
                                    <input type="file" id="DocumentoRecot" name="DocumentoRecot" onblur="validacion(this.id,'vacio','Documento',0);" class="width:100px;color:#446655;display: inline;" runat="server" style="width: 293px; opacity: 0; height: 89px;" />
                                    <div style="display: none;" class="error light" id="DocumentoRecotError"></div>
                                </div>
                                <div class="col-md-12" style="margin-top: 50px;">
                                    <asp:Button runat="server" type="button" ID="crearUser" class="crearUser" value="CrearAlumno" OnClick="CargaDatosEstudiante" Text="Crear Alumno"></asp:Button>
                                </div>
                            </div>

                            <%--</div>--%>
                        </div>
                    </div>
                </div>
                </div>
        </form>
    </div>
    <%--Script para la carga de dias y años de diferentes campos--%>

    <!-- #include file ="/Globales/footer.aspx" -->
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
                $('#colonia2Igle').html("<option value='select'>Selecciona Colonia</option>")
                $('#colonia2Igle').append(html)

            }
        }
    </script>    
</body>
</html>
