<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
        <link rel="shortcut icon" href="image/favicon.png" type="image/x-icon">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
   <title>Crear Equipo</title>
  </head>
  <body >
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/liga","root", "");
      Statement s = conexion.createStatement();
      request.setCharacterEncoding("UTF-8");
      
      String insercion = "INSERT INTO equipo (CodEquipo,NombreEquipo,DescripcionEquipo) VALUES (" 
                           + Integer.valueOf(request.getParameter("CodEquipo"))
                           + ", '" + request.getParameter("NombreEquipo")
                           + "', '" + request.getParameter("DescripcionEquipo")
                           + "')";
        s.execute(insercion);
      
      conexion.close();
    %>
    <br>
    <form action="index.jsp" method="post">
        <input type ="submit" name="Aceptar">
    </form>
    <script>
        alert("Equipo Añadido!");
        document.location = "index2.jsp"
    </script>
  </body>
</html>
