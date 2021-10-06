
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <style>
            #encabezado {
                background-color: rgb(235, 230, 245);
            }

            .cover {
                height: 400px;
                background-color: red;
                background: url(imagenes/Principal.jpg);
                color: aliceblue;
                background-size: cover;
                background-position: center;
                background-color: rgba(0, 0, 0, 0.3);
                background-blend-mode: darken;
            }

            #logo {
                margin-left: 15px;
            }

            .caver-small {
                height: 200px;
            }

            .card {
                border: 0 !important;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.3), 0 2px 4px -1px rgba(0, 0, 0, 0.03);
            }

            .card-title {
                min-height: 2rem;
            }

            .card-text {
                min-height: 10rem;
            }
            
            .dropbtn {
            background-color: #4CAF50;
            color: white;
            padding: 8px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            border-radius: 10px;
            margin-right: 15px;
            }
        
            .dropdown {
            position: relative;
            display: inline-block;
            }
        
            .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            right: 0;
            }
        
            .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            }
        
            .dropdown-content a:hover {
            background-color: #f1f1f1
            }
        
            .dropdown:hover .dropdown-content {
            display: block;
            }
        
            .dropdown:hover .dropbtn {
            background-color: #3e8e41;
            }
        </style>
    </head>

    <body>
       
        <header>

            <nav class="navbar" id="encabezado">
                <a class="navbar-brand" id="logo" href="Mojito_PgPrincipal.jsp"> Mojito logo</a>
                <ul class="nav d-flex justify-content-end">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Nosotros</a>
                    </li>
                    <div class="dropdown">
                        <button class="dropbtn">Menu</button>
                        <div class="dropdown-content">
                            <a href="Mojito_iniSesion.jsp">Iniciar Sesion</a>
                            <a href="Mojito_Registrarse.jsp">Registrarse</a>
                            <a href="#">Link 3</a>
                        </div>
                    </div>

                </ul>

            </nav>

            <div class="cover d-flex justify-content-center align-items-center flex-column">
                <h2>Mojito</h2>
                <p>Administracion de restaurantes</p>
                <button class="btn btn-primary">Conoce mas</button>
            </div>

        </header>

        <section>

            <div class="container mt-5 mb-5">

                <div class="row justify-content-center">

                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mt-2">
                        <div class="card">
                            <img src="imagenes/tja_1.jpg" class="card-img-top" alt="...">
                            <div class="cover-small" style="background-image: url(imagenes/tja_1.jpg);">

                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mt-2">
                        <div class="card">
                            <img src="imagenes/tja_1.jpg" class="card-img-top" alt="...">
                            <div class="cover-small" style="background-image: url(imagenes/tja_1.jpg);">

                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mt-2">
                        <div class="card">
                            <img src="imagenes/tja_1.jpg" class="card-img-top" alt="...">
                            <div class="cover-small" style="background-image: url(imagenes/tja_1.jpg);">

                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </section>

    </body>

</html>
