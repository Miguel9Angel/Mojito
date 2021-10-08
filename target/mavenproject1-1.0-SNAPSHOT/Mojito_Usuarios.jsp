<%-- 
    Document   : Mojito_Usuarios
    Created on : 7/10/2021, 9:40:15 p. m.
    Author     : PERSONAL
--%>

<!DOCTYPE html>
<html>

    <head>
        <title>Registrar Producto</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .container {
                margin: auto;
                border: 1px solid black;
                padding: 40px;
                border-radius: 5px;
                background-color: rgb(237, 290, 238);
            }

            body {
                font-family: Arial, Helvetica, sans-serif;
                margin: auto;
                margin: 100px 100px;
                padding-top: 100px;
            }

            #tl {
                border-bottom: 2px solid black;
                padding-bottom: 8px;
                margin-bottom: 30px; 
            }

            #inputs {
                margin: 20px;
                width: 80%;
            }

            #sel {
                margin: 0px 150px;
                margin-left: 25px;
            }

            #tipo {
                margin-bottom: 10px;
            }

            #btnSummit {
                margin-left: 80%;
                font-size: 18px;
                display: inline-block;
            }

            .btnFinal {
                text-align: right;
                margin-right: 15px;
            }

            @media(min-width:768px) {
                .container {
                    margin: auto;
                    width: 900px;
                    margin-top: 80px;
                    border-radius: 8px;
                }
            }
        </style>
    </head>

    <body>

        <div class="container">
            <h2 id="tl">Registro de productos</h2>
            <form method="post" action="Mojito_ctrlUsu.jsp" class="form" id="inputs">
                
                <div class="mb-3 row">
                    <label for="user" class="col-sm-2 col-form-label">idUsuario</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="textIdUsuario" name="textIdUsuario" value="0" readonly>
                    </div>
                </div>
                
                <div class="mb-3 row">
                    <label for="user" class="col-sm-2 col-form-label">Usuario</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="textUsuario" name="textUsuario" value="">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="Name" class="col-sm-2 col-form-label">Nombre</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="textNombre" name="textNombre" value="">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-10">
                        <input type="Password" class="form-control" id="textClave" name="textClave" value="">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="" class="col-sm-2 col-form-label">Rol</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="textRol" name="textRol" value="">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="textEmail" name="textEmail" value="">
                    </div>
                </div>
                
                <div class="btnFinal">
                    <button type="sumit" class="btn btn-primary" id="btnSummit" value="nuevo">Guardar</button>
                    <button type="sumit" class="btn btn-danger" id="btnSummit" value="cancelar">Cancelar</button>
                </div>

            </form>
            
    </body>

</html>
