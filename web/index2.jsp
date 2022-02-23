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
        <link rel="stylesheet" type="text/css" href="style/index1.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="shortcut icon" href="image/favicon.png" type="image/x-icon">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->

        <title>Equipos Profesionales</title>
    </head>
    <body class="index2">
        <div class="container">
            <div id="textot">
                <h1>Equipos Profesionales Counter Strike</h1>
            </div>
        </div>
        <div class="container">
            <a class="btn btn-warning boton" href="nuevoEquipo.jsp">
                <span class="glyphicon glyphicon-plus"></span>
                Añadir Equipo
            </a>
            <a class="btn btn-secondary boton" href="index.jsp">
                <span class="glyphicon glyphicon-plus"></span>
                Tabla Jugadores
            </a>
            <div class="panel panel-warning">
                <!-- Default panel contents -->
                <div class="panel-heading panel-warning">Lista de Equipos</div>
                <!-- Table -->
                <table class="table  table-hover">
                    <thead class="thead-dark">
                        <tr class="panel-primary">
                            <th>
                                Codigo Equipo
                            </th>
                            <th>
                                Nombre
                            </th>
                            <th>
                                Descripción
                            </th>

                        </tr>
                    </thead>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conexionuno = DriverManager.getConnection("jdbc:mysql://localhost:3306/liga","root", "");
                        Statement j = conexionuno.createStatement();
                        ResultSet listadouno = j.executeQuery ("SELECT CodEquipo, NombreEquipo, DescripcionEquipo FROM equipo group by CodEquipo");
                        while (listadouno.next()) {                                                
                            out.println("<tr><td>");
                            out.println(listadouno.getInt("CodEquipo") +"</td>");
                            out.println("<td>"+ listadouno.getString("NombreEquipo") + "</td>");
                            out.println("<td>" + listadouno.getString("DescripcionEquipo") + "</td>");
                                                
                    %>
                    <td>
                        <div class="row">
                            <div class="col-md-3">
                                <form method="post" action="modificaEquipo.jsp">
                                    <input type="hidden" name="CodEquipo" value="<%=listadouno.getInt("CodEquipo") %>">
                                    <input type="hidden" name="NombreEquipo" value="<%=listadouno.getString("NombreEquipo") %>">
                                    <input type="hidden" name="DescripcionEquipo" value="<%=listadouno.getString("DescripcionEquipo") %>">
                                    <button type="submit"  class="btn btn-info">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                    </button>
                                </form>
                            </div>


                            <div class="col-md-2">
                                <form method="post" action="borrarEquipo.jsp">
                                    <input type="hidden" name="CodEquipo" value="<%=listadouno.getString("CodEquipo") %>"/>
                                    <button type="submit" class="btn btn-danger">
                                        <span class="glyphicon glyphicon-trash"></span>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </td>

                    <%
            }
            conexionuno.close();
                    %>
                </table>
            </div>
        </div>