function CalculaEdad(FechaNacimiento) {  
    var hoy = new Date();
    var cumpleanos = new Date(FechaNacimiento);
    var edad = hoy.getFullYear() - document.getElementById("anio").value;
    var m = hoy.getFullYear() - cumpleanos.getFullYear();

    if (m < 0 || (m == 0 && hoy.getDate() < cumpleanos.getDate())) {
        edad--;
    }
    document.getElementById("edad").value = edad
    return edad;
}