<%-- 
    Document   : Mojito
    Created on : 14/09/2021, 9:42:55 a. m.
    Author     : PERSONAL
--%>

<%@page import="Logica.ColeccionProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Logica.Productos" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <title>JSP Page</title>

        <style>
            #encabezado {
                background-color: rgb(235, 230, 245);
            }
            
            body{
                font-family: Arial, Helvetica, sans-serif;
                margin: auto;
                background-color: white;
            }

            .container{
                padding-top: 150px;
                margin: auto;
                text-align: center;
            }

            #btnAddPrdct{
                margin: 4px;
            }

            .titulo h2 {
                padding-bottom: 6px;
                border-bottom: 1px solid black;
                text-align: left;
            }

            .busqueda {
                margin-bottom: 15px;
                text-align: left;
            }

            .table {
                margin-top: 0px;
                border-top: 1px solid black;
            }

            input[type="text"] {
                margin: 4px;
                font-size: 20px;
                width: 60%;
                border-radius: 4px;
                text-align: left;
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
                        <a class="nav-link active" aria-current="page" href="Mojito_PgPrincipal.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Nosotros</a>
                    </li>
                    <div class="dropdown">
                        <button class="dropbtn">Menu</button>
                        <div class="dropdown-content">
                            <a href="#">Link 1</a>
                            <a href="#">Link 2</a>
                            <a href="#">Link 3</a>
                        </div>
                    </div>

                </ul>
        </header>

        <div class="container">
            <div class="titulo">
                <h2>Lista de Ingredientes</h2>
            </div>
            <%
                String filtro = request.getParameter("txtFiltro") == null ? "" : request.getParameter("txtFiltro");
            %>
            <div class="busqueda">
                <form method="GET" action="">
                    <input type="text" name="txtFiltro" id="txtFiltro" placeholder="Consultar">
                    <button type="submit"class="btn btn-primary"><i class="fas fa-search"></i> Buscar</button>
                    <a href="Mojito_form.jsp?accion=nuevo&id=0"> <button type="button" id="btnAddPrdct" class="btn btn-info" >Agregar producto</button></a>  
                </form>

            </div>


            <div class="table">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Nombre</th>
                            <th>Unidad de medida</th>
                            <th>Cantidad</th>
                            <th>Origen ingredientes</th>
                            <th>Acción</th>
                        </tr>
                    </thead>

                    <tbody>
                        <%
                            ColeccionProducto coleccion = new ColeccionProducto();
                            boolean hayDatos;
                            if (filtro.equals("")) {
                                hayDatos = coleccion.cargarProductos();
                            } else {
                                hayDatos = coleccion.cargarProductosFiltro(filtro);
                            }

                            if (hayDatos) {

                                for (Productos j : coleccion.getLista()) {
                        %>
                        <tr>
                            <td><%= j.getIdIngredients()%></td>
                            <td><%= j.getNombre()%></td>
                            <td><%= coleccion.getUnidadesMedida(j.getUnidadMedida())%></td>
                            <td><%= j.getCantidad()%></td>
                            <td><%= coleccion.getTipoProducto(j.getTipoMateriaPrima())%></td>
                            <td><a href="Mojito_form.jsp?accion=editar&id=<%=j.getIdIngredients()%>"><button type="button" class="btn btn-info"><i class="fas fa-edit"></i></button></a>
                                <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i></button></td>
                        </tr>
                        <%
                            }

                        } else {
                        %>
                        <tr>
                            <td colspan="5">No hay datos</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>

        </div>

    </body>
</html>
