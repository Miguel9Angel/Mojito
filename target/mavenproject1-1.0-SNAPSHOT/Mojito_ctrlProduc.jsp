<%-- 
    Document   : Mojito_ctrl
    Created on : 17/09/2021, 11:49:48 a. m.
    Author     : PERSONAL
--%>

<%@page import="Logica.ColeccionProducto"%>
<%@page import="Logica.Productos"%>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset-UTF-8"
              <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>

    <body>
        <%
            int id = Integer.parseInt(request.getParameter("textId"));
            String nombre = request.getParameter("textPdtc");
            int cantidad = Integer.parseInt(request.getParameter("intCant"));
            int tipoProducto = Integer.parseInt(request.getParameter("selTipoPdtc"));
            int tipoUnidad = Integer.parseInt(request.getParameter("selTipoUnid"));
            String accion = request.getParameter("btnSummit");
            Productos j = null;
            if (accion.equals("nuevo")) {
                j = new Productos(nombre, tipoUnidad, cantidad, tipoProducto);

            } else if (accion.equals("editar")) {
                j = new Productos(id, nombre, tipoUnidad, cantidad, tipoProducto);
            }
            
            ColeccionProducto coleccion = new ColeccionProducto();
            boolean guardado = coleccion.guardarProducto(j);
            if (guardado) {
                out.println("Producto guardado exitosamente");
            } else {
                out.println("No se guardo el juguete");
            }
            
        %>
        <a href="MojitoList.jsp"><button type="sumit" class="btn btn-danger" id="btnSummit">Volver a la lista</button></a>
    </body>

</html>