<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="normal.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="general.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->

        <title>Jugadores eSport</title>
    </head>
    <body class="index">
        <header class="cabecera">

        </header>
        <!-- container -->
        <div class="container">
            <div id="textot">
                <h1>Jugadores - Base de datos</h1>
            </div>
        </div>
        <div class="container">
            <a class="btn btn-warning" href="nuevoJugador.jsp">
                <span class="glyphicon glyphicon-plus"></span>
                Añadir Jugador
            </a>
            <div class="panel panel-warning">
                <!-- Default panel contents -->
                <div class="panel-heading panel-warning">Lista de jugadores</div>
                <!-- Table -->
                <table class="table table-light table-hover ">
                    <tr class="panel-primary">
                        <th>
                            Codigo Jugador
                        </th>
                        <th>
                            Nombre
                        </th>
                        <th>
                            Apellidos
                        </th>
                        <th>
                            Arma Favorita
                        </th>
                        <th>
                            Descripción
                        </th>
                        <th>
                            Codigo Equipo
                        </th>
                        <th>
                            Equipo
                        </th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/liga","root", "");
                        Statement s = conexion.createStatement();
                        ResultSet listado = s.executeQuery ("SELECT CodJugador, Nombre, Apellidos, Descripcion, ArmaFavorita, equipo.CodEquipo,equipo.NombreEquipo, equipo.DescripcionEquipo FROM jugador INNER JOIN equipo ON jugador.CodEquipo = equipo.CodEquipo group by CodJugador");
                        while (listado.next()) {                                                
                            out.println("<tr><td>");
                            out.println(listado.getInt("CodJugador") +"</td>");
                            out.println("<td>"+ listado.getString("Nombre") + "</td>");
                            out.println("<td>" + listado.getString("Apellidos") + "</td>");
                            out.println("<td>" + listado.getString("ArmaFavorita") + "</td>");
                            out.println("<td>" + listado.getString("Descripcion") + "</td>");
                            out.println("<td>" + listado.getInt("CodEquipo") +"</td>");
                            out.println("<td>" + listado.getString("NombreEquipo") +"</td><td>");
                                                    
                    %>
                    <div class="row">
                        <div class="col-md-3">
                            <form method="post" action="modificaJugador.jsp">
                                <input type="hidden" name="CodJug" value="<%=listado.getInt("CodJugador") %>">
                                <input type="hidden" name="NomJug" value="<%=listado.getString("Nombre") %>">
                                <input type="hidden" name="Rol" value="<%=listado.getString("Apellidos") %>">
                                <input type="hidden" name="Telefono" value="<%=listado.getString("Descripcion") %>">
                                <input type="hidden" name="AnoNac" value="<%=listado.getString("ArmaFavorita") %>">
                                <button type="submit"  class="btn btn-info">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                </button>
                            </form>
                        </div>
                        <div class="col-md-2">
                            <form method="post" action="borrarJugador.jsp">
                                <input type="hidden" name="CodJugador" value="<%=listado.getString("CodJugador") %>"/> 
                                <button type="submit" class="btn btn-danger">
                                    <span class="glyphicon glyphicon-trash"></span>
                                </button>
                            </form>
                        </div>
                    </div>
                    </td></tr>
                    <%
                       }
                       conexion.close();
                    %>
                </table>
            </div>
        </div>
       