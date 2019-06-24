Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services
Imports System.Threading
Partial Class Admintrador_CrearPerfiles
    Inherits System.Web.UI.Page
    Public errorr As String = ""
    Public count As String
    Public CONEXION As String = "Data Source = DAVE-PC; Initial Catalog = IMMAMP; Integrated Security = True"
    'DATOS ALUMNO
    Public nombre As String
    Public apellidop As String
    Public apellidoM As String
    Public email As String
    Public Sem As String
    Public EstadoCivil As String
    Public ocup As String
    Public gen As String
    Public BautH2o As String
    Public BautES As String
    Public tcont As String
    Public AniosCongreg As String
    Public instrumento As String
    Public fechanac As String
    Public edad As String
    Public status As String
    'DATOS CONTACTO
    Public EstuTutor As String
    Public telefono As String
    Public celular As String
    Public calle As String
    Public noExt As String
    Public noInt As String
    Public CodPostal As String
    Public colonia As String
    Public municipio As String
    Public estado As String
    'DATOS IGLESIA
    Public nomigle As String
    Public nompas As String
    Public movimiento As String
    Public telpastor As String
    Public telIgle As String
    Public calleIgle As String
    Public noExtIgle As String
    Public noIntIgle As String
    Public CodPostalI As String
    Public colonia2Igle As String
    Public municipioIgle As String
    Public estadoIgle As String
    Public Docurecot As String
    'FECHA CREACION
    Public FCreacion As DateFormat
    Public HoraCeacion As DateFormat
    Public IDIglesia As String
    Public IDPastor1 As String
    Public IDaLUMNO As String
    Public direecionIglesia As String
    Public direccionContacto As String
    Public nombreTutor0 As String
    Public apellidoPTutor0 As String
    Public apellidoMTutor0 As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'DATOS DEL ALUMNO
        nombre = Nothing
        apellidop = Nothing
        apellidoM = Nothing
        email = Nothing
        EstadoCivil = Nothing
        Sem = Nothing
        ocup = Nothing
        gen = Nothing
        BautH2o = Nothing
        BautES = Nothing
        tcont = Nothing
        AniosCongreg = Nothing
        instrumento = Nothing
        fechanac = Nothing
        edad = Nothing
        status = Nothing
        'DATOS CONTACTO
        EstuTutor = Nothing
        telefono = Nothing
        celular = Nothing
        calle = Nothing
        noExt = Nothing
        noInt = Nothing
        CodPostal = Nothing
        colonia = Nothing
        municipio = Nothing
        estado = Nothing
        'DATOS IGLESIA
        nomigle = Nothing
        nompas = Nothing
        movimiento = Nothing
        telpastor = Nothing
        telIgle = Nothing
        calleIgle = Nothing
        CodPostalI = Nothing
        colonia2Igle = Nothing
        municipioIgle = Nothing
        estadoIgle = Nothing
        Docurecot = Nothing
        'FECHA CREACION
        FCreacion = DateTime.Now.ToString("yyyyMMdd")
        'HoraCeacion = DateTime.Now.ToString("HHmms")
        'FCreacion = FCreacion & HoraCeacion
        HoraCeacion = Nothing
        IDIglesia = Nothing
        IDPastor1 = Nothing
        IDaLUMNO = Nothing
        direecionIglesia = Nothing
        direccionContacto = Nothing
        nombreTutor0 = Nothing
        apellidoPTutor0 = Nothing
        apellidoMTutor0 = Nothing

    End Sub


    Sub CargaDatosEstudiante()
        'DATOS ESTUDIANTE
        nombre = Request.Form("nombre").ToUpper
        apellidop = Request.Form("apellidoP").ToUpper
        apellidoM = Request.Form("apellidoM").ToUpper
        gen = Request.Form("genero").ToUpper 'M = masculino - F = femenino
        ocup = Request.Form("ocupacion").ToUpper
        BautH2o = Request.Form("BautAgua").ToUpper
        BautES = Request.Form("BautES").ToUpper
        'tcont = Request.Form("tipocont").ToUpper
        status = "1"
        fechanac = Request.Form("dia") & "/" & Request.Form("mes") & "/" & Request.Form("anio")
        edad = Request.Form("edad")
        instrumento = Request.Form("instrum").ToUpper
        instrumento = Request.Form("instrum").ToUpper
        Sem = Request.Form("Semestre")
        AniosCongreg = Request.Form("tiempocongregante")
        'DATOS DE CONTACTO
        email = Request.Form("email")
        gen = Request.Form("genero").ToUpper
        EstadoCivil = Request.Form("edoCivil").ToUpper
        telefono = Request.Form("telefono")
        celular = Request.Form("celular")
        calle = Request.Form("calle").ToUpper
        colonia = Request.Form("colonia").ToUpper
        municipio = Request.Form("municipio").ToUpper
        CodPostal = Request.Form("CPostal")
        noExt = Request.Form("noExt")
        noInt = Request.Form("noInt")
        estado = Request.Form("estado").ToUpper
        nombreTutor0 = Request.Form("nombreTutor").ToUpper
        apellidoPTutor0 = Request.Form("apellidoPTutor").ToUpper
        apellidoMTutor0 = Request.Form("apellidoMTutor").ToUpper

        'DATOS IGLESIA Y PASTOR
        nomigle = Request.Form("nombreigle").ToUpper
        nompas = Request.Form("nompas").ToUpper
        movimiento = Request.Form("movi").ToUpper
        telpastor = Request.Form("TelPastor")
        telIgle = Request.Form("telIgle")
        calleIgle = Request.Form("calleIgle").ToUpper
        noExtIgle = Request.Form("noExtIgle")
        noIntIgle = Request.Form("noIntIgle")
        CodPostalI = Request.Form("CPostalI")
        colonia2Igle = Request.Form("coloniaIgle").ToUpper
        municipioIgle = Request.Form("municipioIgle").ToUpper
        estadoIgle = Request.Form("estadoIgle").ToUpper
        Docurecot = Request.Form("DocumentoRecot")
        'direecionIglesia = calleIgle & noExtIgle & noIntIgle
        
        'VLIDACION No INTERIOR
        If noInt = Nothing Then
            noInt = "0"
        End If
        'VALIDACION FECHA h2o
        If BautH2o = Nothing Or BautH2o = "" Then
            BautH2o = "SIN INFORMACION"
        End If
        If BautES = Nothing Or BautES = "" Then
            BautES = "SIN INFORMACION"
        End If
        '"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"'
        ObtenerIDEstudiante()


    End Sub
    Sub ObtenerIDEstudiante()
        'OBTENER ID ALUMNO
        Dim NomCompleto = nombre + apellidop + apellidoM
        Dim commandText2 As String = "SELECT  ID_ALUMNO FROM ALUMNO WHERE  NOMBRE + APELLIDO_PATERNO + APELLIDO_MATERNO ='" & NomCompleto & "' "
        Using connectioncommandIDaLUMNO As New SqlConnection(CONEXION)
            Dim commandIDAlumno As New SqlCommand(commandText2, connectioncommandIDaLUMNO)
            commandIDAlumno.Parameters.Add("@Nombre", SqlDbType.VarChar)
            commandIDAlumno.Parameters("@Nombre").Value = NomCompleto
            Try
                Dim reader As SqlDataReader
                connectioncommandIDaLUMNO.Open()
                reader = commandIDAlumno.ExecuteReader(CommandBehavior.CloseConnection)
                While (reader.Read())
                    IDaLUMNO = reader("ID_ALUMNO")
                End While
                If IDaLUMNO = Nothing Or IDaLUMNO = "" Then
                    CrearAlumno()
                End If
                InsertaContacto(IDaLUMNO)
                connectioncommandIDaLUMNO.Close()
            Catch ex As Exception
                LogIMMAMP.xmlIMMAMPLog("Error al Seleccionar Pastor: " + ex.Message + "||" + "Detalle: " + ex.StackTrace)
            End Try
        End Using

    End Sub
    Sub ObtenerIDEstudianteTUTOR()
        'OBTENER ID ALUMNO
        Dim NomCompleto = nombre + apellidop + apellidoM
        Dim commandText2 As String = "SELECT  ID_ALUMNO FROM ALUMNO WHERE  NOMBRE + APELLIDO_PATERNO + APELLIDO_MATERNO ='" & NomCompleto & "' "
        Using connectioncommandIDaLUMNO As New SqlConnection(CONEXION)
            Dim commandIDAlumno As New SqlCommand(commandText2, connectioncommandIDaLUMNO)
            commandIDAlumno.Parameters.Add("@Nombre", SqlDbType.VarChar)
            commandIDAlumno.Parameters("@Nombre").Value = NomCompleto
            Try
                Dim reader As SqlDataReader
                connectioncommandIDaLUMNO.Open()
                reader = commandIDAlumno.ExecuteReader(CommandBehavior.CloseConnection)
                While (reader.Read())
                    IDaLUMNO = reader("ID_ALUMNO")
                End While
                If IDaLUMNO = Nothing Or IDaLUMNO = "" Then
                    CrearAlumno()
                End If
                InsertaContactoTutor(IDaLUMNO)
                connectioncommandIDaLUMNO.Close()
            Catch ex As Exception
                LogIMMAMP.xmlIMMAMPLog("Error al Seleccionar Pastor: " + ex.Message + "||" + "Detalle: " + ex.StackTrace)
            End Try
        End Using

    End Sub
    Sub InsertaContacto(IDaLUMNO)
        'CONDICION PARA SABER SI ES ESTUDIANTE Y TUTOR
        If edad > 18 Then
            tcont = "ESTUDIANTE"
        Else
            tcont = "TUTOR"
            InsertaContactoTutor(IDaLUMNO)
        End If
        'INSERTA CONTACTO ESTUDIANTE
        Dim sql2 As String
        Using connection1 As New SqlConnection(CONEXION)
            sql2 = "INSERT INTO CONTACTO (NOMBRE,APELLIDO_PATERNO,APELLIDO_MATERNO,CORREO,GENERO,EDOCIVIL,OCUPACION," &
                       "TIPOCONTACTO,FECHA_NACIMIENTO,EDAD,FIJO,CELULAR,DIRECCION,NoExt,NoInt,COLONIA,MUNICIPIO,CP,ID_ALUMNO,FECHACREACION)" &
                    "VALUES(@Nombre, @Apellido_Paterno, @Apellido_Materno, @Correo, @Genero ,@EdoCivil, @Ocupacion,@TipoContacto," &
                       "@FechaNacimiento,@Edad,@Fijo,@Celular,@DIRECCION_CONT,@No_Ext,@No_Int,@Colonia,@Municipio,@Cp,@IdAlumno,@FECHA_CREACION)"
            Dim command1 As New SqlCommand(sql2, connection1)
            command1.Parameters.Add("@Nombre", SqlDbType.VarChar)
            command1.Parameters("@Nombre").Value = nombre
            command1.Parameters.Add("@Apellido_Paterno", SqlDbType.VarChar)
            command1.Parameters("@Apellido_Paterno").Value = apellidop
            command1.Parameters.Add("@Apellido_Materno", SqlDbType.VarChar)
            command1.Parameters("@Apellido_Materno").Value = apellidoM
            command1.Parameters.Add("@Correo", SqlDbType.VarChar)
            command1.Parameters("@Correo").Value = email
            command1.Parameters.Add("@Genero", SqlDbType.VarChar)
            command1.Parameters("@Genero").Value = gen
            command1.Parameters.Add("@EdoCivil", SqlDbType.VarChar)
            command1.Parameters("@EdoCivil").Value = EstadoCivil
            command1.Parameters.Add("@Ocupacion", SqlDbType.VarChar)
            command1.Parameters("@Ocupacion").Value = ocup
            command1.Parameters.Add("@TipoContacto", SqlDbType.VarChar)
            command1.Parameters("@TipoContacto").Value = tcont
            command1.Parameters.Add("@FechaNacimiento", SqlDbType.VarChar)
            command1.Parameters("@FechaNacimiento").Value = fechanac
            command1.Parameters.Add("@Edad", SqlDbType.VarChar)
            command1.Parameters("@Edad").Value = edad
            command1.Parameters.Add("@Fijo", SqlDbType.VarChar)
            command1.Parameters("@Fijo").Value = telefono
            command1.Parameters.Add("@Celular", SqlDbType.VarChar)
            command1.Parameters("@Celular").Value = celular
            command1.Parameters.Add("@DIRECCION_CONT", SqlDbType.VarChar)
            command1.Parameters("@DIRECCION_CONT").Value = calle
            command1.Parameters.Add("@No_Ext", SqlDbType.VarChar)
            command1.Parameters("@No_Ext").Value = noExt
            command1.Parameters.Add("@No_Int", SqlDbType.VarChar)
            command1.Parameters("@No_Int").Value = noInt
            command1.Parameters.Add("@Colonia", SqlDbType.VarChar)
            command1.Parameters("@Colonia").Value = colonia
            command1.Parameters.Add("@Municipio", SqlDbType.VarChar)
            command1.Parameters("@Municipio").Value = municipio
            command1.Parameters.Add("@Cp", SqlDbType.VarChar)
            command1.Parameters("@Cp").Value = CodPostal
            command1.Parameters.Add("@IdAlumno", SqlDbType.VarChar)
            command1.Parameters("@IdAlumno").Value = IDaLUMNO
            command1.Parameters.Add("@FECHA_CREACION", SqlDbType.VarChar)
            command1.Parameters("@FECHA_CREACION").Value = FCreacion
            If IDaLUMNO = Nothing Then
                ObtenerIDEstudiante()
            End If

            Try
                connection1.Open()
                command1.ExecuteNonQuery()
                connection1.Close()
            Catch ex As Exception
                LogIMMAMP.xmlIMMAMPLog("Error al INSERTAR Contacto: " + ex.Message + "||" + "Detalle: " + ex.StackTrace)
            End Try
        End Using
        Thread.Sleep(10000)
        Response.Redirect("../Administrador/AlumnosCreado.aspx")
    End Sub
    Sub InsertaContactoTutor(IDaLUMNO)
        'INSERTA CONTACTO ESTUDIANTE
        Dim sql2 As String
        Using connection1 As New SqlConnection(CONEXION)
            sql2 = "INSERT INTO CONTACTO (NOMBRE,APELLIDO_PATERNO,APELLIDO_MATERNO,CORREO,GENERO,EDOCIVIL,OCUPACION," &
                       "TIPOCONTACTO,FECHA_NACIMIENTO,EDAD,FIJO,CELULAR,DIRECCION,NoExt,NoInt,COLONIA,MUNICIPIO,CP,ID_ALUMNO,FECHACREACION)" &
                    "VALUES(@Nombre, @Apellido_Paterno, @Apellido_Materno, @Correo, @Genero ,@EdoCivil, @Ocupacion,@TipoContacto," &
                       "@FechaNacimiento,@Edad,@Fijo,@Celular,@DIRECCION_CONT,@No_Ext,@No_Int,@Colonia,@Municipio,@Cp,@IdAlumno,@FECHA_CREACION)"
            Dim command1 As New SqlCommand(sql2, connection1)
            command1.Parameters.Add("@Nombre", SqlDbType.VarChar)
            command1.Parameters("@Nombre").Value = nombreTutor0
            command1.Parameters.Add("@Apellido_Paterno", SqlDbType.VarChar)
            command1.Parameters("@Apellido_Paterno").Value = apellidoPTutor0
            command1.Parameters.Add("@Apellido_Materno", SqlDbType.VarChar)
            command1.Parameters("@Apellido_Materno").Value = apellidoMTutor0
            command1.Parameters.Add("@Correo", SqlDbType.VarChar)
            command1.Parameters("@Correo").Value = email
            command1.Parameters.Add("@Genero", SqlDbType.VarChar)
            command1.Parameters("@Genero").Value = gen
            command1.Parameters.Add("@EdoCivil", SqlDbType.VarChar)
            command1.Parameters("@EdoCivil").Value = EstadoCivil
            command1.Parameters.Add("@Ocupacion", SqlDbType.VarChar)
            command1.Parameters("@Ocupacion").Value = ocup
            command1.Parameters.Add("@TipoContacto", SqlDbType.VarChar)
            command1.Parameters("@TipoContacto").Value = tcont
            command1.Parameters.Add("@FechaNacimiento", SqlDbType.VarChar)
            command1.Parameters("@FechaNacimiento").Value = fechanac
            command1.Parameters.Add("@Edad", SqlDbType.VarChar)
            command1.Parameters("@Edad").Value = edad
            command1.Parameters.Add("@Fijo", SqlDbType.VarChar)
            command1.Parameters("@Fijo").Value = telefono
            command1.Parameters.Add("@Celular", SqlDbType.VarChar)
            command1.Parameters("@Celular").Value = celular
            command1.Parameters.Add("@DIRECCION_CONT", SqlDbType.VarChar)
            command1.Parameters("@DIRECCION_CONT").Value = calle
            command1.Parameters.Add("@No_Ext", SqlDbType.VarChar)
            command1.Parameters("@No_Ext").Value = noExt
            command1.Parameters.Add("@No_Int", SqlDbType.VarChar)
            command1.Parameters("@No_Int").Value = noInt
            command1.Parameters.Add("@Colonia", SqlDbType.VarChar)
            command1.Parameters("@Colonia").Value = colonia
            command1.Parameters.Add("@Municipio", SqlDbType.VarChar)
            command1.Parameters("@Municipio").Value = municipio
            command1.Parameters.Add("@Cp", SqlDbType.VarChar)
            command1.Parameters("@Cp").Value = CodPostal
            command1.Parameters.Add("@IdAlumno", SqlDbType.VarChar)
            command1.Parameters("@IdAlumno").Value = IDaLUMNO
            command1.Parameters.Add("@FECHA_CREACION", SqlDbType.VarChar)
            command1.Parameters("@FECHA_CREACION").Value = FCreacion
            If IDaLUMNO = Nothing Then
                ObtenerIDEstudianteTUTOR()
            End If
            Try
                connection1.Open()
                command1.ExecuteNonQuery()
                connection1.Close()
            Catch ex As Exception
                LogIMMAMP.xmlIMMAMPLog("Error al INSERTAR Contacto: " + ex.Message + "||" + "Detalle: " + ex.StackTrace)
            End Try
        End Using
        Thread.Sleep(10000)
        Response.Redirect("../Administrador/AlumnosCreado.aspx")
    End Sub

    'Function ObtenerPastor(IDPastor1)
    '    'OBTENER ID PASTOR
    '    'Session("IDPastor") = IDPastor1
    '    Dim commandTextT As String = "Select ID_Pastor From PASTOR Where Nombre_Pastor = '" & nompas & "' AND MOVIMIENTO = '" & movimiento & "' AND Nombre_Iglesia = '" & nomigle & "'"
    '    Using connectionPast As New SqlConnection(CONEXION)
    '        Dim commandIDPas As New SqlCommand(commandTextT, connectionPast)
    '        commandIDPas.Parameters.Add("@Nombre", SqlDbType.VarChar)
    '        commandIDPas.Parameters("@Nombre").Value = nompas
    '        Try
    '            Dim reader As SqlDataReader
    '            connectionPast.Open()
    '            reader = commandIDPas.ExecuteReader(CommandBehavior.CloseConnection)
    '            While (reader.Read())
    '                IDPastor1 = reader("ID_Pastor")
    '            End While
    '            If IDPastor1 = Nothing Then
    '                CrearPastor(nompas, telIgle, telpastor, nomigle, movimiento, calleIgle, colonia2Igle, municipioIgle, CodPostalI, FCreacion)
    '            End If
    '            connectionPast.Close()
    '        Catch ex As Exception
    '            LogIMMAMP.xmlIMMAMPLog("Error al Seleccionar Pastor: " + ex.Message + "||" + "Detalle: " + ex.StackTrace)
    '        End Try
    '    End Using
    '    Return IDPastor1
    'End Function
    Sub BuscarPastor()
        Dim commandTextT As String = "Select ID_Pastor From PASTOR Where Nombre_Pastor = '" & nompas & "' AND MOVIMIENTO = '" & movimiento & "' AND Nombre_Iglesia = '" & nomigle & "'"
        Using connectionPast As New SqlConnection(CONEXION)
            Dim commandIDPas As New SqlCommand(commandTextT, connectionPast)
            commandIDPas.Parameters.Add("@Nombre", SqlDbType.VarChar)
            commandIDPas.Parameters("@Nombre").Value = nompas
            Try
                Dim reader As SqlDataReader
                connectionPast.Open()
                reader = commandIDPas.ExecuteReader(CommandBehavior.CloseConnection)
                While (reader.Read())
                    IDPastor1 = reader("ID_Pastor")
                End While
                If IDPastor1 = Nothing Then
                    CrearPastor(nompas, telIgle, telpastor, nomigle, movimiento, calleIgle, colonia2Igle, municipioIgle, CodPostalI, FCreacion)
                End If
                CrearAlumno()
                connectionPast.Close()
            Catch ex As Exception
                LogIMMAMP.xmlIMMAMPLog("Error al Seleccionar Pastor: " + ex.Message + "||" + "Detalle: " + ex.StackTrace)
            End Try
        End Using
    End Sub
    Sub CrearAlumno()
        'INSERTA ALUMNOS
        Dim sql1 As String
        Using connection As New SqlConnection(CONEXION)
            sql1 = "INSERT INTO ALUMNO (NOMBRE,APELLIDO_PATERNO,APELLIDO_MATERNO,GENERO,OCUPACION,BAUTISMOH2o,BAUTISMOES,ANIOSCONGREG,ESTATUS,FECHA_NACIMIENTO,EDAD," &
                       "INSTRUMENTO,SEMESTRE,ID_PASTOR,FECHACREACION)" &
                       "VALUES(@Nombre,@Apellido_Paterno,@Apellido_Materno,@Genero,@Ocupacion," &
                       "@BautismoH2O,@BautismoES,@AniosCongreg,@Estatus,@Fecha_Nacimiento,@Edad,@Intrumento,@Semestre,@IDPASTOR,@FECHA_CREACION)"
            Dim command As New SqlCommand(sql1, connection)
            command.Parameters.Add("@Nombre", SqlDbType.VarChar)
            command.Parameters("@Nombre").Value = nombre
            command.Parameters.Add("@Apellido_Paterno", SqlDbType.VarChar)
            command.Parameters("@Apellido_Paterno").Value = apellidop
            command.Parameters.Add("@Apellido_Materno", SqlDbType.VarChar)
            command.Parameters("@Apellido_Materno").Value = apellidoM
            command.Parameters.Add("@Genero", SqlDbType.VarChar)
            command.Parameters("@Genero").Value = gen
            command.Parameters.Add("@Ocupacion", SqlDbType.VarChar)
            command.Parameters("@Ocupacion").Value = ocup
            command.Parameters.Add("@BautismoH2O", SqlDbType.VarChar)
            command.Parameters("@BautismoH2O").Value = BautH2o
            command.Parameters.Add("@BautismoES", SqlDbType.VarChar)
            command.Parameters("@BautismoES").Value = BautES
            command.Parameters.Add("@AniosCongreg", SqlDbType.VarChar)
            command.Parameters("@AniosCongreg").Value = AniosCongreg
            command.Parameters.Add("@EStatus", SqlDbType.VarChar)
            command.Parameters("@EStatus").Value = status
            command.Parameters.Add("@Fecha_Nacimiento", SqlDbType.VarChar)
            command.Parameters("@Fecha_Nacimiento").Value = fechanac
            command.Parameters.Add("@Edad", SqlDbType.Int)
            command.Parameters("@Edad").Value = edad
            command.Parameters.Add("@Intrumento", SqlDbType.VarChar)
            command.Parameters("@Intrumento").Value = instrumento
            command.Parameters.Add("@Semestre", SqlDbType.VarChar)
            command.Parameters("@Semestre").Value = Sem
            command.Parameters.Add("@IDPASTOR", SqlDbType.VarChar)
            command.Parameters("@IDPASTOR").Value = IDPastor1
            command.Parameters.Add("@FECHA_CREACION", SqlDbType.VarChar)
            command.Parameters("@FECHA_CREACION").Value = FCreacion
            If IDPastor1 = Nothing Then
                BuscarPastor()
            End If
            Try
                connection.Open()
                command.ExecuteNonQuery()
                connection.Close()
            Catch ex As Exception
                LogIMMAMP.xmlIMMAMPLog("Error al INSERTAR ALUMNO: " + ex.Message + "||" + "Detalle: " + ex.StackTrace)
                errorr = ex.Message
            End Try
        End Using
    End Sub
    Function CrearPastor(nompas As String, telIgle As String, telpastor As String, nomigle As String, movimiento As String, calleIgle As String, colonia2Igle As String, municipioIgle As String, CodPostalI As String, FCreacion As String) As String
        'CREACION PASTOR
        Dim sql4 As String
        Using connection3 As New SqlConnection(CONEXION)
            sql4 = "INSERT INTO PASTOR (NOMBRE_PASTOR,TELEFONO_PASTOR,NOMBRE_IGLESIA,MOVIMIENTO,TELEFONO_IGLESIA,DIRECCION_IGLESIA,NoExt,NoInt,COLONIA,MUNICIPIO,CP,FechaCreacion) " &
                              "VALUES (@NombrePastor,@TelefonoPastor,@NombreIglesia,@Movimiento,@TelefonoIglesia,@DIRECCIONIGLESIA,@No_Ext,@No_Int,@Colonia,@Municipio,@Cp,@FECHACREACION)"
            Dim command3 As New SqlCommand(sql4, connection3)
            command3.Parameters.Add("@NombrePastor", SqlDbType.VarChar)
            command3.Parameters("@NombrePastor").Value = nompas
            command3.Parameters.Add("@TelefonoPastor", SqlDbType.VarChar)
            command3.Parameters("@TelefonoPastor").Value = telpastor
            command3.Parameters.Add("@NombreIglesia", SqlDbType.VarChar)
            command3.Parameters("@NombreIglesia").Value = nomigle
            command3.Parameters.Add("@Movimiento", SqlDbType.VarChar)
            command3.Parameters("@Movimiento").Value = movimiento
            command3.Parameters.Add("@TelefonoIglesia", SqlDbType.VarChar)
            command3.Parameters("@TelefonoIglesia").Value = telIgle
            command3.Parameters.Add("@DIRECCIONIGLESIA", SqlDbType.VarChar)
            command3.Parameters("@DIRECCIONIGLESIA").Value = calleIgle
            command3.Parameters.Add("@No_Ext", SqlDbType.VarChar)
            command3.Parameters("@No_Ext").Value = noExtIgle
            command3.Parameters.Add("@No_Int", SqlDbType.VarChar)
            command3.Parameters("@No_Int").Value = noIntIgle
            command3.Parameters.Add("@Colonia", SqlDbType.VarChar)
            command3.Parameters("@Colonia").Value = colonia2Igle
            command3.Parameters.Add("@Municipio", SqlDbType.VarChar)
            command3.Parameters("@Municipio").Value = municipioIgle
            command3.Parameters.Add("@Cp", SqlDbType.VarChar)
            command3.Parameters("@Cp").Value = CodPostalI
            command3.Parameters.Add("@FECHACREACION", SqlDbType.VarChar)
            command3.Parameters("@FECHACREACION").Value = FCreacion
            If telIgle = Nothing Then
                telIgle = "'SIN NUMERO'"
            End If
            If telpastor = Nothing Then
                telpastor = "'SIN NUMERO'"
            End If
            Try
                connection3.Open()
                command3.ExecuteNonQuery()
                connection3.Close()
            Catch ex As Exception
                LogIMMAMP.xmlIMMAMPLog("Error al INSERTAR Pastor: " + ex.Message + "||" + "Detalle: " + ex.StackTrace)
                errorr = ex.Message
            End Try
        End Using
        Return nompas
    End Function
    <WebMethod>
    Public Shared Function cargaCp(ByVal CPostal As String) As String()
        Dim CodPos As String = ""
        Dim mun As String = ""
        Dim edo As String = ""
        Dim sql As String
        Dim Respuesta(2) As String
        Dim errorr As String
        Dim connectionString = "Data Source = DAVE-PC; Initial Catalog = IMMAMP; Integrated Security = True"
        Using connection As New SqlConnection(connectionString)
            sql = "Select * From CAT_DIRECCIONES where CODIGO_POSTAL = @CPostal"
            Dim command As New SqlCommand(sql, connection)
            command.Parameters.Add("@CPostal", SqlDbType.Int)
            command.Parameters("@CPostal").Value = CPostal
            Try
                connection.Open()
                Dim reader As SqlDataReader
                reader = command.ExecuteReader(CommandBehavior.CloseConnection)
                If reader.HasRows Then
                    reader.Read()
                    CodPos = reader("CODIGO_POSTAL")
                    mun = reader("MUNICIPIO")
                    edo = reader("ESTADO")
                End If
                connection.Close()
            Catch ex As Exception
                LogIMMAMP.xmlIMMAMPLog("Error al Buscar CATDIRECCIONES: " + ex.Message + "||" + "Detalle: " + ex.StackTrace)
                errorr = "Error CP Inexistente:("
            End Try
        End Using
        Respuesta(0) = CodPos
        Respuesta(1) = mun
        Respuesta(2) = edo
        Return Respuesta
    End Function
    <WebMethod>
    Public Shared Function ConsultaColonias(ByVal CPostal As String) As String
        Dim OptionCol = ""
        Dim errorr1 As String = "ingresa cp valido"
        Dim connectionString = "Data Source = DAVE-PC; Initial Catalog = IMMAMP; Integrated Security = True"
        Using connection As New SqlConnection(connectionString)
            Dim sql = "Select CODIGO_POSTAL,COLONIA From CAT_DIRECCIONES where CODIGO_POSTAL = " & CPostal
            Dim command As New SqlCommand(sql, connection)
            command.Parameters.Add("@CPostal", SqlDbType.Int)
            command.Parameters("@CPostal").Value = CPostal
            Try
                connection.Open()
                Dim reader As SqlDataReader
                reader = command.ExecuteReader(CommandBehavior.CloseConnection)

                While (reader.Read())
                    'resCol = reader("COLONIA")
                    OptionCol &= "<Option value='" & reader("COLONIA") & "'>" & reader("COLONIA") & "</option>"
                End While
            Catch ex As Exception
                LogIMMAMP.xmlIMMAMPLog("Error al Buscar Colonias: " + ex.Message + "||" + "Detalle: " + ex.StackTrace)
                errorr1 = ex.Message
            End Try
        End Using

        Return OptionCol
    End Function

    'DATOS DE LA IGLESIA
    <WebMethod>
    Public Shared Function CargaDireccionesI(ByVal CPostalI As String) As String()
        If CPostalI = "@CPostal" Then

        End If
        Dim CodPos As String = ""
        Dim mun As String = ""
        Dim edo As String = ""
        Dim sql As String
        Dim Respuesta(2) As String
        Dim errorr As String
        Dim connectionString = "Data Source = DAVE-PC; Initial Catalog = IMMAMP; Integrated Security = True"
        Using connection As New SqlConnection(connectionString)
            sql = "Select * From CAT_DIRECCIONES where CODIGO_POSTAL = @CPostal"
            Dim command As New SqlCommand(sql, connection)
            command.Parameters.Add("@CPostal", SqlDbType.Int)
            command.Parameters("@CPostal").Value = CPostalI
            Try
                connection.Open()
                Dim reader As SqlDataReader
                reader = command.ExecuteReader(CommandBehavior.CloseConnection)

                If reader.HasRows Then
                    reader.Read()
                    CodPos = reader("CODIGO_POSTAL")
                    mun = reader("MUNICIPIO")
                    edo = reader("ESTADO")
                End If
                connection.Close()
            Catch ex As Exception
                LogIMMAMP.xmlIMMAMPLog("Error al Buscar CP: " + ex.Message + "||" + "Detalle: " + ex.StackTrace)
                errorr = ex.Message
            End Try
        End Using
        Respuesta(0) = CodPos
        Respuesta(1) = mun
        Respuesta(2) = edo
        Return Respuesta
    End Function
    <WebMethod>
    Public Shared Function ConsultaColoniasIgle(ByVal CPostalI As String) As String
        Dim OptionCol = ""
        Dim errorr1 As String = ""
        Dim connectionString = "Data Source = DAVE-PC; Initial Catalog = IMMAMP; Integrated Security = True"
        Using connection As New SqlConnection(connectionString)
            Dim sql = "Select CODIGO_POSTAL,COLONIA From CAT_DIRECCIONES where CODIGO_POSTAL = @CPostal"
            Dim command As New SqlCommand(sql, connection)
            command.Parameters.Add("@CPostal", SqlDbType.Int)
            command.Parameters("@CPostal").Value = CPostalI
            Try
                connection.Open()
                Dim reader As SqlDataReader
                reader = command.ExecuteReader(CommandBehavior.CloseConnection)

                While (reader.Read())
                    'resCol = reader("COLONIA")
                    OptionCol &= "<Option value='" & reader("COLONIA") & "'>" & reader("COLONIA") & "</option>"
                End While
            Catch ex As Exception
                LogIMMAMP.xmlIMMAMPLog("Error al Buscar Colonias Iglesia: " + ex.Message + "||" + "Detalle: " + ex.StackTrace)
                errorr1 = ex.Message
            End Try
        End Using
        Return OptionCol
    End Function

End Class


