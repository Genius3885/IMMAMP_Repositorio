﻿function validaformulario(idCampo) {
    var correo = document.getElementById("email").value;
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
    if (correo.include("")) {

        mensajeError = "El campo " + idCampo + " esta vacio"
        campoError.style.display = "block";
        campoError.innerHTML = mensajeError;
    }
}
