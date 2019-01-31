Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services


Partial Class AlumnosCreado
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub
    Sub Redireccion()
        Response.Redirect("../Administrador/CrearPerfiles.aspx")
    End Sub



End Class


