<%-- 
    Document   : Mojito_Registrarse
    Created on : 4/10/2021, 12:37:50 p. m.
    Author     : PERSONAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Mojito_Registro</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=0.5">
        <link rel="stylesheet" type="text/css" href="static/Estilos/Estilos.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                margin: 0;
                background: url(imagenes/Fondo.jpg);
                background-size: cover;
                background-attachment: fixed;
            }

            * {
                box-sizing: border-box;
            }

            .container {
                width: 100%;
                padding: 15px;
            }

            .formulario {
                background: white;
                margin-top: 150px;
                padding: 20px;
            }

            h1 {
                text-align: center;
                color: #1a2537;
                font-size: 40px;
                padding-bottom: 5px;
            }

            input[type="text"],
            input[type="password"] {
                font-size: 20px;
                width: 80%;
                padding: 10px;
                border: none;
            }

            .input-contenedor {
                margin-bottom: 8px;
                border: 1px solid #1a2537;
                border-radius: 5px;
            }

            .icon {
                min-width: 50px;
                text-align: center;
                color: #999;
            }

            .button {
                border: none;
                width: 100%;
                color: white;
                font-size: 20px;
                background: #1a2537;
                padding: 15px 20px;
                border-radius: 5px;
                cursor: pointer;
            }

            .button:hover {
                background: slategray;
            }

            p {
                text-align: center;
            }

            .link {
                text-decoration: none;
                color: #1a2537;
                font-weight: 600;
            }

            .link:hover {
                color: cadetblue;
            }

            @media(min-width:768px) {
                .formulario {
                    margin: auto;
                    width: 500px;
                    margin-top: 150px;
                    border-radius: 2%;
                }
            }
        </style>
    </head>

    <body>

        <form class="formulario">

            <h1>Registrarte</h1>
            <div class="contenedor">

                <div class="input-contenedor">
                    <i class="fas fa-user icon"></i>
                    <input type="text" placeholder="Nombre">

                </div>

                <div class="input-contenedor">
                    <i class="fas fa-envelope icon"></i>
                    <input type="text" placeholder="Correo Electronico">

                </div>

                <div class="input-contenedor">
                    <i class="fas fa-key icon"></i>
                    <input type="password" placeholder="Contraseña">

                </div>

                <div>
                    <input type="submit" value="Registrate" class="button">
                    <p>Al registrarte, aceptas nuestras Condiciones de uso y Politica de Privacidad</p>
                    <p>¿Ya tienes una cuenta? <a class="link" href="Mojito_iniSesion.jsp">Iniciar Sesion</a></p>
                </div>
            </div>
        </form>

    </body>

</html>
