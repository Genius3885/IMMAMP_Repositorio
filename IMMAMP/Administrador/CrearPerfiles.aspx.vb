Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services


Partial Class Admintrador_CrearPerfiles
    Inherits System.Web.UI.Page
    Public errorr As String = ""
    Public count As String
    Public CONEXION As String = "Data Source = DAVE-PC; Initial Catalog = IMMAMP; Integrated Security = True"
    Public nombre As String
    Public apeP As String
    Public apellidoM As String
    Public email As String
    Public status As String
    Public gen As String
    Public instrumento As String
    Public fechanac As String
    Public edad As String
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
        nombre = Nothing
        apeP = Nothing
        nombre = Nothing
        apeP = Nothing
        apellidoM = Nothing
        email = Nothing
        status = Nothing
        gen = Nothing
        instrumento = Nothing
        fechanac = Nothing
        edad = Nothing
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
        nombre = Request.Form("nombre")
        apeP = Request.Form("apellidoP")
        apellidoM = Request.Form("apellidoM")
        email = Request.Form("email")
        status = "activo"
        gen = Request.Form("genero") 'M = masculino - F = femenino
        instrumento = Request.Form("instrum")
        fechanac = Request.Form("dia") & "/" & Request.Form("mes") & "/" & Request.Form("anio")
        edad = Request.Form("edad")
        telefono = Request.Form("telefono")
        celular = Request.Form("celular")
        calle = Request.Form("calle")
        noExt = Request.Form("noExt")
        noInt = Request.Form("noInt")
        CodPostal = Request.Form("CPostal")
        colonia = Request.Form("colonia")
        municipio = Request.Form("municipio")
        estado = Request.Form("estado")

        'DATOS IGLESIA Y PASTOR
        nomigle = Request.Form("nombreigle")
        nompas = Request.Form("nompas")
        movimiento = Request.Form("movi")
        telpastor = Request.Form("TelPastor")
        telIgle = Request.Form("telIgle")
        calleIgle = Request.Form("calleIgle") & "|" & Request.Form("noExtIgle") & "|" & Request.Form("noIntIgle")
        CodPostalI = Request.Form("CPostalI")
        colonia2Igle = Request.Form("coloniaIgle")
        municipioIgle = Request.Form("municipioIgle")
        estadoIgle = Request.Form("estadoIgle")
        Docurecot = Request.Form("DocumentoRecot")
        'VALIDACION CP AMBOS

        'Conexion a la base de datos de IMMAMP haciendo un insert a la tabla de estudiantes
        Dim sql As String
        Using connection As New SqlConnection(CONEXION)
            sql = "Insert Into ALUMNO (NOMBRE,APELLIDO_PATERNO,APELLIDO_MATERNO,GENERO,ESTATUS,FECHA_NACIMIENTO,EDAD,FIJO,CELULAR,CALLE,COLONIA,MUNICIPIO,CP,INSTRUMENTO) values (@Nombre,@Apellido_Paterno,@Apellido_Materno,@Genero,@STATUS,@Fecha_Nacimiento,@Edad,@Fijo,@Celular,@Calle,@Colonia,@Municipio,@CP,@Intrumento)"
            Dim command As New SqlCommand(sql, connection)
            command.Parameters.Add("@Nombre", SqlDbType.VarChar)
            command.Parameters("@Nombre").Value = nombre
            command.Parameters.Add("@Apellido_Paterno", SqlDbType.VarChar)
            command.Parameters("@Apellido_Paterno").Value = apeP
            command.Parameters.Add("@Apellido_Materno", SqlDbType.VarChar)
            command.Parameters("@Apellido_Materno").Value = apellidoM
            command.Parameters.Add("@Genero", SqlDbType.VarChar)
            command.Parameters("@Genero").Value = gen
            command.Parameters.Add("@Status", SqlDbType.VarChar)
            command.Parameters("@Status").Value = status
            command.Parameters.Add("@Fecha_Nacimiento", SqlDbType.Date)
            command.Parameters("@Fecha_Nacimiento").Value = fechanac
            command.Parameters.Add("@Edad", SqlDbType.VarChar)
            command.Parameters("@Edad").Value = edad
            command.Parameters.Add("@Fijo", SqlDbType.VarChar)
            command.Parameters("@Fijo").Value = telefono
            command.Parameters.Add("@Celular", SqlDbType.VarChar)
            command.Parameters("@Celular").Value = celular
            command.Parameters.Add("@Calle", SqlDbType.VarChar)
            command.Parameters("@Calle").Value = calle
            command.Parameters.Add("@Colonia", SqlDbType.VarChar)
            command.Parameters("@Colonia").Value = colonia
            command.Parameters.Add("@Municipio", SqlDbType.VarChar)
            command.Parameters("@Municipio").Value = municipio
            command.Parameters.Add("@Cp", SqlDbType.VarChar)
            command.Parameters("@Cp").Value = CodPostal
            command.Parameters.Add("@Intrumento", SqlDbType.VarChar)
            command.Parameters("@Intrumento").Value = instrumento
            Try
                connection.Open()
                command.ExecuteNonQuery()
                connection.Close()
            Catch ex As Exception
                errorr = ex.Message
            End Try

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
                command2.Parameters("@Municipio").Value = CodPostalI
                command2.Parameters.Add("@Cp", SqlDbType.VarChar)
                command2.Parameters("@Cp").Value = municipioIgle
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
                command3.Parameters.Add("@Fijo", SqlDbType.VarChar)
                command3.Parameters("@Fijo").Value = telIgle
                command3.Parameters.Add("@Celular", SqlDbType.VarChar)
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


