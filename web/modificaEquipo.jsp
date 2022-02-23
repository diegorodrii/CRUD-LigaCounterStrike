<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Modifica Jugadores</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="general.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="style/index1.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
    </head>
    <body class="equipo">
        <% request.setCharacterEncoding("UTF-8"); %>

        <div style="height:100px;"></div>
        <div class="row">
            <div class="col-md-2 col-md-offset-2">
                <a href="index2.jsp" class="btn btn-success">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    Atrás
                </a>
            </div>
            <div class="col-md-7 col-md-offset-2">
                <div class="panel panel-warning">
                    <div class="panel-heading panel-warning">Modificar <%= request.getParameter("NombreEquipo") %></div>
                    <div class="panel-body">
                        <form method="post" action="grabaModificaEquipo.jsp">
                            <div class="row">
                                <div class="col-md-6">
                                    Codigo Equipo <input class="form-control" type="text" name="CodEquipo" value="<%= request.getParameter("CodEquipo") %>"><br>
                                </div>
                                <div class="col-md-6">
                                    Nombre <input class="form-control" type="text" name="NombreEquipo" value="<%= request.getParameter("NombreEquipo") %>"/></br>
                                </div>
                                <div class="col-md-6">
                                    Descripcion <input class="form-control" type="text" name="DescripcionEquipo" value="<%= request.getParameter("DescripcionEquipo") %>"/></br>
                                </div>

                            </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <input class="btn btn-primary" type="submit" value="Modificar">
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>