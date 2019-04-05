Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services


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
    Public CodPostalI As String
    Public colonia2Igle As String
    Public municipioIgle As String
    Public estadoIgle As String
    Public Docurecot As String

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
        tcont = Request.Form("tipocont").ToUpper
        status = "ACTIVO"
        fechanac = Request.Form("dia") & "/" & Request.Form("mes") & "/" & Request.Form("anio")
        edad = Request.Form("edad")
        instrumento = Request.Form("instrum").ToUpper
        status = "ACTIVO"
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

        'DATOS IGLESIA Y PASTOR
        nomigle = Request.Form("nombreigle").ToUpper
        nompas = Request.Form("nompas").ToUpper
        movimiento = Request.Form("movi").ToUpper
        telpastor = Request.Form("TelPastor")
        telIgle = Request.Form("telIgle")
        calleIgle = Request.Form("calleIgle") & "|" & Request.Form("noExtIgle") & "|" & Request.Form("noIntIgle")
        CodPostalI = Request.Form("CPostalI")
        colonia2Igle = Request.Form("coloniaIgle").ToUpper
        municipioIgle = Request.Form("municipioIgle").ToUpper
        estadoIgle = Request.Form("estadoIgle").ToUpper
        Docurecot = Request.Form("DocumentoRecot")
        'VALIDACION CP AMBOS
        If edad >= 18 Then
            edad = Request.Form("edad")
        Else
            edad = Request.Form("edad")
        End If
        'Conexion a la base de datos de IMMAMP haciendo un insert a la tabla de estudiantes
        Dim sql As String
        Using connection As New SqlConnection(CONEXION)
            sql = "INSERT INTO ALUMNO (NOMBRE,APELLIDO_PATERNO,APELLIDO_MATERNO,GENERO,OCUPACION,BAUTISMOAH2o,BAUTISMOES,ANIOSCONGREG,ESTATUS,FECHA_NACIMIENTO,EDAD," &
                       "INSTRUMENTO,SEMESTRE)" &
                       "VALUES(@Nombre,@Apellido_Paterno,@Apellido_Materno,@Genero,@Ocupacion," &
                       "@BautismH2O,@BautismoES,@AniosCongreg,@Estatus,@Fecha_Nacimiento,@Edad,@Intrumento,@Semestre)"
            Dim command As New SqlCommand(sql, connection)
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
            command.Parameters.Add("@BautismH2O", SqlDbType.VarChar)
            command.Parameters("@BautismH2O").Value = BautH2o
            command.Parameters.Add("@BautismoES", SqlDbType.VarChar)
            command.Parameters("@BautismoES").Value = BautES
            command.Parameters.Add("@AniosCongreg", SqlDbType.VarChar)
            command.Parameters("@AniosCongreg").Value = AniosCongreg
            command.Parameters.Add("@EStatus", SqlDbType.VarChar)
            command.Parameters("@EStatus").Value = status
            command.Parameters.Add("@Fecha_Nacimiento", SqlDbType.Date)
            command.Parameters("@Fecha_Nacimiento").Value = fechanac
            command.Parameters.Add("@Edad", SqlDbType.VarChar)
            command.Parameters("@Edad").Value = edad
            command.Parameters.Add("@Intrumento", SqlDbType.VarChar)
            command.Parameters("@Intrumento").Value = instrumento
            command.Parameters.Add("@Semestre", SqlDbType.VarChar)
            command.Parameters("@Semestre").Value = Sem
            'command.Parameters.Add("@Fijo", SqlDbType.VarChar)
            'command.Parameters("@Fijo").Value = telefono
            'command.Parameters.Add("@Celular", SqlDbType.VarChar)
            'command.Parameters("@Celular").Value = celular
            'command.Parameters.Add("@Calle", SqlDbType.VarChar)
            'command.Parameters("@Calle").Value = calle
            'command.Parameters.Add("@Colonia", SqlDbType.VarChar)
            'command.Parameters("@Colonia").Value = colonia
            'command.Parameters.Add("@Municipio", SqlDbType.VarChar)
            'command.Parameters("@Municipio").Value = municipio
            'command.Parameters.Add("@Cp", SqlDbType.VarChar)
            'command.Parameters("@Cp").Value = CodPostal
            'command.Parameters.Add("@Intrumento", SqlDbType.VarChar)
            'command.Parameters("@Intrumento").Value = instrumento
            Try
                connection.Open()
                command.ExecuteNonQuery()
                connection.Close()
            Catch ex As Exception
                errorr = ex.Message
            End Try
            Using connection1 As New SqlConnection(CONEXION)
                sql = "INSERT INTO CONTACTO (NOMBRE,APELLIDO_PATERNO,APELLIDO_MATERNO,CORREO,GENERO,EDOCIVIL,OCUPACION,TIPOCONTACTO,FECHA_NACIMIENTO,EDAD,FIJO,CELULAR,CALLE,COLONIA,MUNICIPIO,CP)" &
                    "VALUES(@Nombre, @Apellido_Paterno, @Apellido_Materno, @Correo, @Genero ,@EdoCivil, @Ocupacion,@TipoContacto,@Fecha_Nacimiento" &
                       "@Edad,@Fijo,@Celular,@Calle,@Colonia,@Municipio,@Cp)"
                Dim command1 As New SqlCommand(sql, connection1)
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
                command1.Parameters.Add("@Fecha_Nacimiento", SqlDbType.Date)
                command1.Parameters("@Fecha_Nacimiento").Value = fechanac
                command1.Parameters.Add("@Edad", SqlDbType.VarChar)
                command1.Parameters("@Edad").Value = edad
                command1.Parameters.Add("@Fijo", SqlDbType.VarChar)
                command1.Parameters("@Fijo").Value = telefono
                command1.Parameters.Add("@Celular", SqlDbType.VarChar)
                command1.Parameters("@Celular").Value = celular
                command1.Parameters.Add("@Calle", SqlDbType.VarChar)
                command1.Parameters("@Calle").Value = calle
                command1.Parameters.Add("@Colonia", SqlDbType.VarChar)
                command1.Parameters("@Colonia").Value = colonia
                command1.Parameters.Add("@Municipio", SqlDbType.VarChar)
                command1.Parameters("@Municipio").Value = municipio
                command1.Parameters.Add("@Cp", SqlDbType.VarChar)
                command1.Parameters("@Cp").Value = CodPostal
                Try
                    connection.Open()
                    command.ExecuteNonQuery()
                    connection.Close()
                Catch ex As Exception
                    GeneradorLogsIMMAMP.xmlIMMAMPLog("Error al INSERTAR Contacto: " + ex.Message + "||" + "Detalle: " + ex.StackTrace, "")
                End Try
            End Using
            'INSERT DATOS IGLESIA
            Using connection2 As New SqlConnection(CONEXION)
                    sql = "INSERT INTO IGLESIA (NOMBRE,MOVIMIENTO,FIJO,CELULAR,CALLE,COLONIA,MUNICIPIO,CP,ESTADO) VALUES (@Nombre,@Movimiento,@Fijo,@Celular,@Calle,@Colonia,@Municipio,@Cp,@Estado)"
                    Dim command2 As New SqlCommand(sql, connection2)
                    command2.Parameters.Add("@Nombre", SqlDbType.VarChar)
                    command2.Parameters("@Nombre").Value = nomigle
                    command2.Parameters.Add("@Movimiento", SqlDbType.VarChar)
                    command2.Parameters("@Movimiento").Value = movimiento
                    command2.Parameters.Add("@Fijo", SqlDbType.VarChar)
                    command2.Parameters("@Fijo").Value = telIgle
                    command2.Parameters.Add("@Celular", SqlDbType.VarChar)
                    command2.Parameters("@Celular").Value = telpastor
                    command2.Parameters.Add("@Calle", SqlDbType.VarChar)
                    command2.Parameters("@Calle").Value = calleIgle
                    command2.Parameters.Add("@Colonia", SqlDbType.VarChar)
                    command2.Parameters("@Colonia").Value = colonia2Igle
                    command2.Parameters.Add("@Municipio", SqlDbType.VarChar)
                    command2.Parameters("@Municipio").Value = municipioIgle
                    command2.Parameters.Add("@Cp", SqlDbType.VarChar)
                    command2.Parameters("@Cp").Value = CodPostalI
                    command2.Parameters.Add("@Estado", SqlDbType.VarChar)
                    command2.Parameters("@Estado").Value = estadoIgle
                    Try
                        connection2.Open()
                        command2.ExecuteNonQuery()
                        connection.Close()
                    Catch ex As Exception
                        errorr = ex.Message
                    End Try
                End Using
                'DATOS PASTOR
                Using connection3 As New SqlConnection(CONEXION)
                    sql = "INSERT INTO PASTOR (NOMBRE,FIJO,CELULAR) VALUES (@Nombre,@Fijo,@Celular)"
                    Dim command3 As New SqlCommand(sql, connection3)
                    command3.Parameters.Add("@Nombre", SqlDbType.VarChar)
                    command3.Parameters("@Nombre").Value = nompas
                    command3.Parameters.Add("@Fijo", SqlDbType.Int)
                    command3.Parameters("@Fijo").Value = telIgle
                    command3.Parameters.Add("@Celular", SqlDbType.Int)
                    command3.Parameters("@Celular").Value = telpastor
                    If telIgle = Nothing Then
                        telIgle = "'SIN NUMERO'"
                    End If
                    If telpastor = Nothing Then
                        telpastor = "'SIN NUMERO'"
                    End If

                    Try
                        connection3.Open()
                        command3.ExecuteNonQuery()
                        connection.Close()
                    Catch ex As Exception
                        errorr = ex.Message
                    End Try
                End Using
            End Using
            Response.Redirect("../Administrador/AlumnosCreado.aspx")
    End Sub
    'LLENADO DE DATOS DEL CONTACTO Colonias
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
            sql = "Select * From CATDIRECCIONES where CODIGO_POSTAL = @CPostal"
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
            Dim sql = "Select CODIGO_POSTAL,COLONIA From CATDIRECCIONES where CODIGO_POSTAL = @CPostal"
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
            sql = "Select * From CATDIRECCIONES where CODIGO_POSTAL = @CPostal"
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
            Dim sql = "Select CODIGO_POSTAL,COLONIA From CATDIRECCIONES where CODIGO_POSTAL = @CPostal"
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
                errorr1 = ex.Message
            End Try
        End Using
        Return OptionCol
    End Function

End Class
'Carga Datos Iglesia


