<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Index.aspx.vb" Inherits="Index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Resources/Styles/css/footer.css" rel="stylesheet" />
    <link href="Resources/Styles/css/Index.css" rel="stylesheet" />
    <link href="Resources/Styles/HeaderIndex.css" rel="stylesheet" />
    <link rel="shotcut icon" href="../Resources/images/immamp.png" />
    <link href="Resources/Styles/Header.css" rel="stylesheet" />
    <link href="../Resources/Styles/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="../Resources/scripts/jquery-2.1.1.min.js" async="async"></script>
    <script src="../Resources/scripts/General/jquery-ui-1.10.2.custom.js" async="async"></script>
    <meta name="IMMAMP" content="IMMAMP,immamp, instituto de musica aquiles mireles perales, aquiles mireles perales, instituto de musica portales, instituto de musica plantel central" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>IMMAMP</title>
</head>
<!-- #include file ="/Globales/HeaderIndex.aspx" -->
<%--<body class="imgFondo" style="background-color: #004060;">--%>
<body class="imgNota">
        <div class="col-md-12">
            <p><a name="Inicio" id="Inicio"></a></p>
            <p><a href="#fin" style="border-bottom-color: azure; height: 10px; width: 10px;">Ir al Final</a></p>
            <div class="col-md-12">
                <div class="container" style="background-color: #a1e8ea94; border-radius: 6px;">
                    <div class="row">
                        <div style="text-align: center; margin-left: auto; margin-right: auto;" class="col-md-4">

                            <h3>NOSOTROS</h3>
                            <p>Materias que nos forman ministerialmente y tienen por lo tanto, 
                            el objeto de darle la mayor gloria a Dios.</p>
                        </div>
                        <div style="text-align: center; margin-left: auto; margin-right: auto;" class="col-md-4">
                            <h3>HISTORIA</h3>
                            <p>IMMAMP surge en el año de 1983 
                            Llenar un vacío pues no había ministros de música
                            el ministerio musical no existía en toda la ICIAR
                            sólo en la iglesia de Portales</p>
                            <a href="../IMMAMP/HIstoria.aspx" target="_blank" style="color: white">MAS...</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <h2 style="color: #000000; text-align: center;">IMMAMP</h2>
        <div id="myCarousel" class="carousel slide row justify-content-center pointer-event col-md-8 offset-md-2" data-ride="carousel" style="border-radius: 15px; margin: auto;">
            <!-- INDICADORES -->
            <ul class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
                <li data-target="#myCarousel" data-slide-to="5"></li>
                <li data-target="#myCarousel" data-slide-to="6"></li>
                <li data-target="#myCarousel" data-slide-to="7"></li>
                <li data-target="#myCarousel" data-slide-to="8"></li>
                <li data-target="#myCarousel" data-slide-to="9"></li>
            </ul>
            <!-- IMAGENES CARRUSEL -->
            <div class="col-md-12 col-xs-12 col-sm-8 carousel-inner ">
                <div class="carousel-item active">
                    <img src="Resources/images/Carrusel/1.PNG" style="border-radius: 15px;" />
                </div>
                <div class="carousel-item">
                    <img src="Resources/images/Carrusel/2.PNG" style="border-radius: 15px;" />
                </div>
                <div class="carousel-item">
                    <img src="Resources/images/Carrusel/3.PNG" style="border-radius: 15px;" />
                </div>
                <div class="carousel-item">
                    <img src="Resources/images/Carrusel/4.PNG" style="border-radius: 15px;" />
                </div>
                <div class="carousel-item">
                    <img src="Resources/images/Carrusel/6.PNG" style="border-radius: 15px;" />
                </div>
                <div class="carousel-item">
                    <img src="Resources/images/Carrusel/7.PNG" style="border-radius: 15px;" />
                </div>
                <div class="carousel-item">
                    <img src="Resources/images/Carrusel/8.jpeg" style="border-radius: 15px;" />
                </div>
                <div class="carousel-item">
                    <img src="Resources/images/Carrusel/9.PNG" style="border-radius: 15px;" />
                </div>
                <div class="carousel-item">
                    <img src="Resources/images/Carrusel/10.PNG" style="border-radius: 15px;" />
                </div>
                <div class="carousel-item">
                    <img src="Resources/images/Carrusel/11.PNG" style="border-radius: 15px;" />
                </div>
            </div>
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#myCarousel" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
        <p><a name="fin" id="fin"></a></p>
        <p><a href="#Inicio">Ir al Inicio</a></p>
        <div class="col-md-12">
        </div>
    <!-- #include file ="/Globales/footer.aspx" -->
</body>
</html>
