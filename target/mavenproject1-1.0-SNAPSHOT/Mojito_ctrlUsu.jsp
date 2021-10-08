<%-- 
    Document   : Mojito_ctrlUsu
    Created on : 7/10/2021, 10:45:12 p. m.
    Author     : PERSONAL
--%>

<%@page import="Logica.ColeccionUsuario"%>
<%@page import="Logica.Usuario"%>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset-UTF-8"
              <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>

    <body>
        <%
            int id = Integer.parseInt(request.getParameter("textIdUsuario"));
            String usuario = request.getParameter("textUsuario");
            String nombre = request.getParameter("textNombre");
            String password = request.getParameter("textClave");
            String rol = request.getParameter("textRol");
            String email = request.getParameter("txtEmail");
            String accion = "nuevo";
            Usuario j = null;
            if (accion.equals("nuevo")) {
                j = new Usuario(nombre, usuario, password, rol, email);

            } else if (accion.equals("editar")) {
                j = new Usuario(id, nombre, usuario, password, rol, email);
            }
            
            ColeccionUsuario coleccion = new ColeccionUsuario();
            boolean guardado = coleccion.guardarUsuario(j);
            if (guardado) {
                out.println("Producto guardado exitosamente");
            } else {
                out.println("No se guardo el juguete");
            }
            
        %>
        <a href="Mojito_PgPrincipal.jsp"><button type="sumit" class="btn btn-danger" id="btnSummit">Volver a la lista</button></a>
    </body>

</html>