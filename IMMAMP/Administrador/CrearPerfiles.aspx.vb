Imports System.Data.SqlClient
Imports System.Data

Partial Class Admintrador_CrearPerfiles
    Inherits System.Web.UI.Page

    Sub conection()

    End Sub

    Sub CargaDatosEstudiante()
        Dim nombres As String = Request.Form("nombre")
        Dim aPaterno As String = Request.Form("apellidoP")
        Dim aMaterno As String = Request.Form("apellidoM")
        Dim email As String = Request.Form("email")
        Dim genero As String = Request.Form("genero")
        Dim instrum As String = Request.Form("instrum")
        Dim diaNac As String = Request.Form("diaNac")
        Dim mesNac As String = Request.Form("mesNac")
        Dim anioNac As String = Request.Form("anioNac")
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
        Dim estadoIgle As String = Request.Form("estadoIgle")
        Dim DocumentoRecot As String = Request.Form("DocumentoRecot")
    End Sub



End Class
