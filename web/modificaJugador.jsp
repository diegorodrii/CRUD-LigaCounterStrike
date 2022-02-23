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
    <body class="jugador ">
        <% request.setCharacterEncoding("UTF-8"); %>

        <div style="height:100px;"></div>
        <div class="row">
            <div class="col-md-2 col-md-offset-2">
                <a href="index.jsp" class="btn btn-success">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    Atrás
                </a>
            </div>
            <div class="col-md-7 col-md-offset-2">
                <div class="panel panel-warning">
                    <div class="panel-heading panel-warning">Modificar <%= request.getParameter("Nombre") %> <%= request.getParameter("Apellidos") %></div>
                    <div class="panel-body">
                        <form method="post" action="grabaModificaJugador.jsp">
                            <div class="row">
                                <div class="col-md-6">
                                    Codigo Jugador <input class="form-control" type="text" name="CodJugador" value="<%= request.getParameter("CodJugador") %>"><br>
                                </div>
                                <div class="col-md-6">
                                    Nombre <input class="form-control" type="text" name="Nombre" value="<%= request.getParameter("Nombre") %>"/></br>
                                </div>
                                <div class="col-md-6">
                                    Apellidos <input class="form-control" type="text" name="Apellidos" value="<%= request.getParameter("Apellidos") %>"/></br>
                                </div>
                                <div class="col-lg-6">
                                    Arma Favorita <input class="form-control" type="text" name="ArmaFavorita" value="<%= request.getParameter("ArmaFavorita") %>"/></br>
                                </div>
                                <div class="col-lg-6">
                                    Descripcion <input class="form-control" type="text" name="Descripcion" value="<%= request.getParameter("Descripcion") %>"/></br>
                                </div>
                                <div class="col-md-6">
                                    Código Equipo <select name="CodEquipo" required>
                                        <option value="1">Natus Vincere</option>
                                        <option value="2">Astralis</option>
                                        <option value="3">Faze</option>
                                        <option value="4">GODSENT</option>
                                        <option value="5">Extra Salt</option>
                                        <option value="6">Made in Brazil</option>
                                        <option value="7">Renegades</option>
                                        <option value="8">Tyloo</option>
                                        <option value="9">BIG</option>
                                        <option value="10">Origen</option>
                                        <option value="11">Fnatic</option>
                                        <option value="12">G2</option>
                                    </select>
                                    <!--<input class="form-control" type="text" name="CodEquipo" required/> --> <br>
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