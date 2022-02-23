<%-- 
    Document   : grabaModificaJugador
    Created on : 22-feb-2022, 12:50:36
    Author     : Beep Informatica
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
    <title>Jugadores eSport</title>
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/liga","root", "");
      Statement s = conexion.createStatement();
      request.setCharacterEncoding("UTF-8");
      
      String actualizacion = "UPDATE equipo SET "
                           + " NombreEquipo='" + request.getParameter("NombreEquipo")
                           + "', DescripcionEquipo='" + request.getParameter("DescripcionEquipo")
                           + " ' WHERE CodEquipo=" + Integer.valueOf(request.getParameter("CodEquipo"));
      s.execute(actualizacion);
      
      conexion.close();
    %>
    <br>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        alert("Equipo Modificado Correctamente!");
        document.location = "index2.jsp"
    </script>
  </body>
</html>