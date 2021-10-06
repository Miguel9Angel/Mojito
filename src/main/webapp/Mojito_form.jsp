<%-- 
    Document   : Mojito_form
    Created on : 16/09/2021, 1:03:33 p. m.
    Author     : PERSONAL
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="Logica.Productos"%>
<%@page import="Logica.ColeccionProducto"%>
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
                border: 2px solid black;
                /*padding: 25px 35px 5px;*/
                border-radius: 5px;
                height: 100%;
                background-color: rgb(237, 229, 238);
            }

            body {
                font-family: Arial, Helvetica, sans-serif;
                margin: auto;
                background: url(imagenes/form.jpg);
                background-size: cover;
                background-attachment: fixed;
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
                    width: 800px;
                    margin-top: 200px;
                    border-radius: 8px;
                }
            }
            #btnSummit{
                margin-top: 6px;
                margin-right: 10px;
            }
        </style>
    </head>

    <body>

        <div class="container">
            <h2 id="tl">Registro de productos</h2>
            <%
                String accion = request.getParameter("accion");
                int id;
                String nombre="";
                int idTipo =0;
                int Cantidad = 0;
                int idEstado = 0;
                int TipoMateriaPrima = 0;
                int UnidadMedida = 0;

                if (accion.equals("editar")){
                    id = Integer.parseInt(request.getParameter("id"));
                    ColeccionProducto coleccion = new ColeccionProducto();
                    Productos j = coleccion.cargarUnProducto(id);
                    nombre = j.getNombre();
                    Cantidad = j.getCantidad();
                    TipoMateriaPrima = j.getTipoMateriaPrima();
                    UnidadMedida = j.getUnidadMedida();
                }
                else{
                    id = 0;
                }
            %>
            <form method="post" action="Mojito_ctrl.jsp" class="form" id="inputs">
                <div class="form-group">
                    <label for="id">id del producto</label>
                    <input type="text" class="form-control" placeholder="id" id="textId" name="textId" value="<%= id %>" readonly>
                </div>
                <div class="form-group">
                    <label for="email">Nombre del producto</label>
                    <input type="text" class="form-control" placeholder="Producto" id="textPdtc" name="textPdtc" value="<%= nombre %>">
                </div>
                <div class="form-group">
                    <label for="pwd">Cantidad</label>
                    <input type="text" class="form-control" placeholder="Cantidad" id="intCant" name="intCant" min="0" max="100" step="1" value="<%= Cantidad %>">
                </div>
                <div id="sel">
                    <% 
                    ColeccionProducto coleccion = new ColeccionProducto();
                    TreeMap<Integer, String> tiposProducto = coleccion.getTipoProducto();
                    %>
                    <select name="selTipoPdtc" id="selTipoPdtc" class="custom-select" required>
                        <option selected value="">Tipo de producto</option>
                        <% for (Map.Entry<Integer, String> entrada : tiposProducto.entrySet() ) {%>
                        <option <%= entrada.getKey() == TipoMateriaPrima ? "selected" : "" %> value="<%= entrada.getKey() %>"><%= entrada.getValue()+tiposProducto.size()+""+TipoMateriaPrima %></option>
                        <%}%>
                    </select>
                    <% 
                    TreeMap<Integer, String> tiposUnid = coleccion.getUnidadesMedida();
                    %>
                    <select name="selTipoUnid" id="selTipoUnid" class="custom-select" required>
                        <option selected value="">Unidades de medida</option>
                        <% for (Map.Entry<Integer, String> entrada : tiposUnid.entrySet() ) {%>
                        <option <%= entrada.getKey() == UnidadMedida ? "selected" : "" %> value="<%= entrada.getKey() %>"><%= entrada.getValue() %></option>
                        <%}%>
                    </select>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button type="sumit" class="btn btn-primary" id="btnSummit" name="btnSummit" value="<%= accion %>">Guardar</button>
                    <button type="sumit" class="btn btn-danger" id="btnSummit" name="btnSummit" value="cancelar">Cancelar</button>
                </div>
            </form>
    </body>

</html>