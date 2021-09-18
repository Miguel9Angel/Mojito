<%-- 
    Document   : Mojito_form
    Created on : 16/09/2021, 1:03:33 p. m.
    Author     : PERSONAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            padding: 25px;
            border-radius: 5px;
            background-color: rgb(237, 229, 238);
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
        }
        
        #inputs {
            margin: 20px;
            width: 75%;
        }
        
        #sel {
            margin: 0px 150px;
            margin-left: 25px;
        }
        
        #tipo {
            margin-bottom: 10px;
        }
        
        
        
        @media(min-width:768px) {
            .container {
                margin: auto;
                width: 900px;
                margin-top: 80px;
                border-radius: 8px;
            }
        }
        #btnSummit{
            margin: 8px; 
        }
    </style>
</head>

<body>

    <div class="container">
        <h2 id="tl">Registro de productos</h2>
        <form method="post" action="Mojito_ctrl.jsp" class="form" id="inputs">

            <div class="form-group">
                <label for="email">Nombre del producto</label>
                <input type="text" class="form-control" placeholder="Producto" id="textPdtc" name="textPdtc">
            </div>
            <div class="form-group">
                <label for="pwd">Cantidad</label>
                <input type="text" class="form-control" placeholder="Cantidad" id="intCant" name="intCant" min="0" max="100" step="1" value="0">
            </div>
            <div id="sel">
            <select name="selTipoPdtc" id="tipo" class="custom-select">
        <option selected>Tipo de producto</option>
        <option value="1">Vegetal</option>
        <option value="2">Mineral</option>
        <option value="3">Animal</option>
    </select>
            <select name="selTipoUnid" id="tipo" class="custom-select">
        <option selected>Unidades de medida</option>
        <option value="1">Libra</option>
        <option value="2">Kilogramo</option>
    </select>
                </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="sumit" class="btn btn-primary" id="btnSummit" name="btnSummit" value="nuevo">Guardar</button>
                <button type="sumit" class="btn btn-danger" id="btnSummit" name="btnSummit" value="cancelar">Cancelar</button>
            </div>
        
            
        </form>

        

</body>

</html>