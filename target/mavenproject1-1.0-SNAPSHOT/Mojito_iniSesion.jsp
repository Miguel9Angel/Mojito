<%-- 
    Document   : Mojito_form
    Created on : 16/09/2021, 12:33:33 p. m.
    Author     : PERSONAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <title>JSP Page</title>

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
                background: #fff;
                margin-top: 200px;
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

            <h1>Iniciar sesión</h1>
            <div class="contenedor">

                <div class="input-contenedor">
                    <i class="fas fa-envelope icon"></i>
                    <input type="text" placeholder="Correo Electronico">
                </div>

                <div class="input-contenedor">
                    <i class="fas fa-key icon"></i>
                    <input type="password" placeholder="Contraseña">

                </div>

                <div>
                    <input type="submit" value="Iniciar sesión" class="button">
                    <p>¿No tienes cuenta? <a class="link" href="Mojito_Registrarse.jsp">Registrate</a></p>
                </div>
            </div>
        </form>
    </body>
</html>
