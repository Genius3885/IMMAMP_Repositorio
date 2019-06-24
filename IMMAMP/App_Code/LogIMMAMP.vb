Imports Microsoft.VisualBasic
Imports System.IO

Public Class LogIMMAMP
    'LOG ERRORES
    Public Shared Sub xmlIMMAMPLog(ByVal sMsg As String)
        Dim fechaHoy As DateTime = DateTime.Today
        Dim fDia As String = fechaHoy.Day
        Dim fMes As String = fechaHoy.Month
        Dim fAnho As String = fechaHoy.Year
        Dim fHora As String = Convert.ToString(fechaHoy.TimeOfDay)
        Dim sFecha = fDia + "-" + fMes + "-" + fAnho + "-"

        'Dim Ruta As String = IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly.GetName.CodeBase).Remove(0, 6) '"E:\WEB\SI10VentasProd\Bin\logs" '
        Dim Ruta As String = "E:\IMMAMP\IMMAMPLogs"
        Dim oSW As New StreamWriter(Ruta & "\" + sFecha + "Log_IMMAMP.txt", True)
        Dim scomando As String = String.Empty
        oSW.WriteLine("* " & Now & " || Log: " & sMsg)
        oSW.Flush()
        oSW.Close()
    End Sub
End Class
