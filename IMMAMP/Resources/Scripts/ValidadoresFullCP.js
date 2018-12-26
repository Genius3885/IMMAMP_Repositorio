function LlenaCamposCP(campo) {
    var valida = true;
    var campoCP = document.getElementById(campo);
    var campoError = document.getElementById(campo + "Error");
    var valorCP = campoCP.value;
    var campoEstado = document.getElementById('estado');
    var campoMunicipio = document.getElementById('municipio');
    var valorEstado;
    var valorMunicipio;
    var validaCPMaxima = false;
    var i = 0;

    Cuenta(valorCP, campo);
    //Limpiando selecciones anteriores estados/municipios/Colonias

    var select2 = document.getElementById("municipio");
    var length = select2.options.length;
    for (i = select2.options.length - 1; i >= 0; i--) {

        //Limpiando selecciones anteriores estados/municipios/Colonias

        var select2 = document.getElementById("municipio");
        var length = select2.options.length;
        for (i = select2.options.length - 1; i >= 0; i--) {
            select2.remove(i);
        }
        var select3 = document.getElementById("colonia");
        var length = select3.options.length;
        for (i = select3.options.length - 1; i >= 0; i--) {
            select3.remove(i);
        }


        //Llenado de colonias
        for (i = 0; i < cpExistentes.length; i++) {
            if (valorCP == cpExistentes[i][0]) {
                validaCPMaxima = true;
                var myColonias = document.getElementById("colonia");
                var opt = document.createElement('option');
                opt.innerHTML = cpExistentes[i][3];
                opt.value = cpExistentes[i][3];
                myColonias.appendChild(opt);
                valorEstado = cpExistentes[i][1];
                valorMunicipio = cpExistentes[i][2];
            }
        }
        if (validaCPMaxima) {
            campoError.style.display = "none";
            campoEstado.value = valorEstado;
            document.getElementById("estado2").value = valorEstado;
            document.getElementById("municipio2").value = valorMunicipio;
            var myColonias = document.getElementById("colonia");
            var opt = document.createElement('option');
            opt.innerHTML = valorMunicipio;
            opt.value = valorMunicipio;
            campoMunicipio.appendChild(opt);
        }
        else {
            campoError.style.display = "block";
            campoError.innerHTML = "No existe el código postal";
            //Default de colonias
            var opt1 = document.createElement('option');
            opt1.innerHTML = "Colonia";
            opt1.value = "select";
            document.getElementById("colonia").appendChild(opt1);
            //Default de municipio
            var opt = document.createElement('option');
            opt.innerHTML = "Municipio";
            opt.value = "select";
            campoMunicipio.appendChild(opt);
        }
        return validaCPMaxima;
    }
}
var arr;
function Cuenta(CPostal,campo) {
    actualizacuenta()
    function actualizacuenta() {
        var myURL;
        myURL = "/AjaxCPostal.aspx?Cpostal=" + CPostal;
        $.ajax({
            url: myURL,
            dataType: "html",
            success: function (result) {
                cpExistentes = JSON.parse(result);
                var valida = true;
                var campoCP = document.getElementById(campo);
                var campoError = document.getElementById(campo + "Error");
                var valorCP = campoCP.value;
                var campoEstado = document.getElementById('estado');
                var campoMunicipio = document.getElementById('municipio');
                var valorEstado;
                var valorMunicipio;
                var validaCPMaxima = false;
                var i = 0;
                //Limpiando selecciones anteriores estados/municipios/Colonias

                var select2 = document.getElementById("municipio");
                var length = select2.options.length;
                for (i = select2.options.length - 1; i >= 0; i--) {
                    select2.remove(i);
                }
                var select3 = document.getElementById("colonia");
                var length = select3.options.length;
                for (i = select3.options.length - 1; i >= 0; i--) {
                    select3.remove(i);
                }
                var select4 = document.getElementById("estado");
                var length = select4.options.length;
                for (i = select4.options.length - 1; i >= 0; i--) {
                    select4.remove(i);
                }



                //Llenado de colonias
                for (i = 0; i < cpExistentes.length; i++) {
                    if (valorCP == cpExistentes[i].CPostal) {
                        validaCPMaxima = true;
                        var myColonias = document.getElementById("colonia");
                        var opt = document.createElement('option');
                        opt.innerHTML = cpExistentes[i].Colonia;
                        opt.value = cpExistentes[i].Colonia;
                        myColonias.appendChild(opt);
                        valorEstado = cpExistentes[i].Estado;
                        valorMunicipio = cpExistentes[i].Municipio;
                    }
                }
                if (validaCPMaxima) {
                    campoError.style.display = "none";
                    //campoEstado.value = valorEstado;
                    document.getElementById("estado2").value = valorEstado;
                    document.getElementById("municipio2").value = valorMunicipio;
                    var myColonias = document.getElementById("colonia");
                    var opt = document.createElement('option');
                    opt.innerHTML = valorMunicipio;
                    opt.value = valorMunicipio;
                    campoMunicipio.appendChild(opt);
                    var opt2 = document.createElement('option');
                    opt2.innerHTML = valorEstado;
                    opt2.value = valorEstado;
                    campoEstado.appendChild(opt2);
                }
                else {
                    campoError.style.display = "block";
                    campoError.innerHTML = "No existe el código postal";
                    //Default de colonias
                    var opt1 = document.createElement('option');
                    opt1.innerHTML = "Colonia";
                    opt1.value = "select";
                    document.getElementById("colonia").appendChild(opt1);
                    //Default de municipio
                    var opt = document.createElement('option');
                    opt.innerHTML = "Municipio";
                    opt.value = "select";
                    campoMunicipio.appendChild(opt);
                }
                return validaCPMaxima;
                console.log(cpExistentes);
            }
        });
    }
}

//Cp con datos completos
cpExistentes = '';