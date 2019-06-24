function validaformulario(idCampo) {
    var correo = document.getElementById(idCampo).value;
    var campoError = document.getElementById(idCampo + "Error");
    var mensajeError;
    var nom = document.getElementById(idCampo).value;
    expresion = /^[_a-zA-Z0-9-ñÑ]+(\.[_a-zA-Z0-9-ñÑ\-_\+\*\&\%\#\$\!]+)*@[a-zA-Z0-9-ñÑ]+(\.[a-zA-Z0-9-ñÑ]+)*(\.[a-zA-ZñÑ]{2,3})$/;
    if (nom == "") {
        mensajeError = "El campo " + idCampo + " se encuentra Vacio"
        campoError.style.display = "block";
        campoError.innerHTML = mensajeError;
    }
    else {
        campoError.style.display = "none";
    }
    if (correo == "") {
        mensajeError = "El campo " + idCampo + " esta vacio"
        campoError.style.display = "block";
        campoError.innerHTML = mensajeError;
        
    }
}
function ValidaCombos(valor) {
    var combos = getElementById(valor).value;
    if (combos = "OCUPACION") {
        combos = alert("SELECCIONA UNA OPCION");
    }
}
function datosvacios() {
    correo = document.getElementById(idCampo).value;
    if (correo = "") {
        mensajeError = "El campo " + correo + " se encuentra Vacio"
        campoError.style.display = "block";
        campoError.innerHTML = mensajeError;
    }
}
function TutorEstudiante() {
   var  edadguarda = document.getElementById("edad");
    var edad = 18;
    if (edadguarda.value < edad) {
        mostrar = document.getElementById("field");
        mostrar.style.display = "none";
        mostrar = document.getElementById("field1");
        mostrar.style.display = "none";
        mostrardiv = document.getElementById("nombreTutor");
        mostrardiv.style.display = "block";
        mostrardiv = document.getElementById("apellidoPTutor");
        mostrardiv.style.display = "block";
        mostrardiv = document.getElementById("apellidoMTutor");
        mostrardiv.style.display = "block"; 
        mostrardiv = document.getElementById("tutor");
        mostrardiv.style.display = "block";
    } else {
        ocultadiv = document.getElementById("field");
        ocultadiv.style.display = "block";
        ocultadiv = document.getElementById("field1");
        ocultadiv.style.display = "block";
        mostrardiv = document.getElementById("nombreTutor");
        mostrardiv.style.display = "none";
        mostrardiv = document.getElementById("apellidoPTutor");
        mostrardiv.style.display = "none";
        mostrardiv = document.getElementById("apellidoMTutor");
        mostrardiv.style.display = "none";
        mostrardiv = document.getElementById("tutor");
        mostrardiv.style.display = "none";
    }
    
}

