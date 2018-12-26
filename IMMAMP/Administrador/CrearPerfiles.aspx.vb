Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services

Partial Class Admintrador_CrearPerfiles
    Inherits System.Web.UI.Page
    Public errorr As String = ""


    Sub CargaDatosEstudiante()
        Dim nombre As String = Request.Form("nombre")
        Dim apellidoP As String = Request.Form("apellidoP")
        Dim apellidoM As String = Request.Form("apellidoM")
        Dim email As String = Request.Form("email")
        Dim status As String = "activo"
        Dim genero As String = Request.Form("genero") '0 = masculino - 1 = femenino
        Dim instrum As String = Request.Form("instrum")
        Dim fechanac = Request.Form("dia") & "/" & Request.Form("mes") & "/" & Request.Form("anio")
        Dim edad As Integer = Request.Form("edad")
        Dim telefono As String = Request.Form("telefono")
        Dim celular As String = Request.Form("celular")
        Dim calle As String = Request.Form("calle")
        Dim noExt As String = Request.Form("noExt")
        Dim noInt As String = Request.Form("noInt")
        Dim CPostal As String = Request.Form("CPostal")
        Dim colonia2 As String = Request.Form("colonia2")
        Dim municipio2 As String = Request.Form("municipio2")
        Dim estado2 As String = Request.Form("estado2")
        Dim nomigle As String = Request.Form("nomigle")
        Dim nompas As String = Request.Form("nompas")
        Dim movi As String = Request.Form("movi")
        Dim telIgle As String = Request.Form("telIgle")
        Dim calleIgle As String = Request.Form("calleIgle")
        Dim noExtIgle As String = Request.Form("noExtIgle")
        Dim noIntIgle As String = Request.Form("noIntIgle")
        Dim CPostalIgle As String = Request.Form("CPostalIgle")
        Dim coloniaIgle As String = Request.Form("coloniaIgle")
        Dim municipio2Igle As String = Request.Form("municipio2Igle")
        Dim estado2Igle As String = Request.Form("estadoIgle")
        Dim DocumentoRecot As String = Request.Form("DocumentoRecot")


        'Conexion a la base de datos de IMMAMP haciendo un insert a la tabla de estudiantes
        'Dim sql As String
        'Dim connectionString = "Data Source = DAVE-PC; Initial Catalog = IMMAMP; Integrated Security = True"
        'Using connection As New SqlConnection(connectionString)
        '    sql = "insert into ALUMNO (NOMBRE,APELLIDO_PATERNO,APELLIDO_MATERNO,GENERO,ESTATUS,FECHA_NACIMIENTO,EDAD,FIJO,CELULAR) values (@Nombre,@Apellido_Paterno,@Apellido_Materno,@Genero,@eSTATUS,@Fecha_Nacimiento,@Edad,@Fijo,@Celular)"
        '    Dim command As New SqlCommand(sql, connection)
        '    command.Parameters.Add("@Nombre", SqlDbType.VarChar)
        '    command.Parameters("@Nombre").Value = nombre
        '    command.Parameters.Add("@Apellido_Paterno", SqlDbType.VarChar)
        '    command.Parameters("@Apellido_Paterno").Value = apellidoP
        '    command.Parameters.Add("@Apellido_Materno", SqlDbType.VarChar)
        '    command.Parameters("@Apellido_Materno").Value = apellidoM
        '    command.Parameters.Add("@Genero", SqlDbType.VarChar)
        '    command.Parameters("@Genero").Value = genero
        '    command.Parameters.Add("@Status", SqlDbType.VarChar)
        '    command.Parameters("@Status").Value = status
        '    command.Parameters.Add("@Fecha_Nacimiento", SqlDbType.Date)
        '    command.Parameters("@Fecha_Nacimiento").Value = fechanac
        '    command.Parameters.Add("@Edad", SqlDbType.Int)
        '    command.Parameters("@Edad").Value = edad
        '    command.Parameters.Add("@Fijo", SqlDbType.Int)
        '    command.Parameters("@Fijo").Value = telefono
        '    command.Parameters.Add("@Celular", SqlDbType.Int)
        '    command.Parameters("@Celular").Value = celular
        '    Try
        '        connection.Open()
        '        Dim reader As SqlDataReader
        '        reader = command.ExecuteReader(CommandBehavior.CloseConnection)
        '    Catch ex As Exception
        '        errorr = "no hay conexion :("
        '    End Try
        'End Using

    End Sub
    <WebMethod>
    Public Shared Function cargaCp(ByVal CPostal As String) As String()
        'Dim Codp As String
        'Conexion a la base de datos de IMMAMP haciendo un insert a la tabla de estudiantes
        'Dim CPostal As String = Request.Form("CPostal")
        Dim CodPos As String = ""
        Dim col As String = ""
        Dim mun As String = ""
        Dim edo As String = ""
        Dim sql As String
        Dim Respuesta(3) As String
        Dim errorr As String
        Dim connectionString = "Data Source = DAVE-PC; Initial Catalog = IMMAMP; Integrated Security = True"
        Using connection As New SqlConnection(connectionString)
            sql = "Select * From Cat_Direcciones where CODIGO_POSTAL = @CPostal"
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
                    col = reader("COLONIA")
                    mun = reader("MUNICIPIO")
                    edo = reader("ESTADO")
                End If
                connection.Close()
            Catch ex As Exception
                errorr = "Error CP Inexistente:("
            End Try
        End Using
        Respuesta(0) = CodPos
        Respuesta(1) = col
        Respuesta(2) = mun
        Respuesta(3) = edo
        Return Respuesta
    End Function



End Class
