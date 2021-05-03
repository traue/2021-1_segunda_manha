<%@page import="br.uninove.uniclima.util.StrUtils"%>
<%@page import="br.uninove.uniclima.http.Http"%>
<%@page import="br.uninove.uniclima.tempo.Tempo"%>
<%@page contentType="text/html;charset=ISO-8859-1" language="java" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    
    Tempo clima = null;
    String cidade = "";
    
    if(request.getParameter("cidade") != null) {
        cidade = request.getParameter("cidade");
        clima = Http.getClima(cidade);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UniClima</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
        <style>
            .tempo-card {
                padding: 100px 0 0 0;
                width: 400px;
                margin: 0 auto !important;
            }
        </style>
        <link rel="icon" href="imgs/favicon.png">
    </head>
    <body>
        <!-- Barra de navegação -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a href="index.jsp" class="navbar-brand">UniClima</a>
                <form class="d-flex" method="POST">
                    <input type="search" name="cidade" value="<%=cidade%>" class="form-control me-2" placeholder="Nome da cidade">
                    <button class="btn btn-outline-info" type="submit">Buscar</button>
                </form>
            </div>
        </nav>
        
        <% if(clima != null) { %>
        <div class="container">
            <div class="row">
                <div class="tempo-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="text-center">
                                <img src="http://openweathermap.org/img/wn/<%= clima.getWeather().get(0).getIcon()%>@2x.png">
                                <p>Cidade: <%=clima.getName() + ", " + clima.getSys().getCountry()%></p>
                            </div>
                            <div>
                                <p><strong>Agora: </strong><%= StrUtils.convertToTitleCaseIteratingChars(clima.getWeather().get(0).getDescription()) %></p>
                                <p><strong>Temperatura </strong><%= StrUtils.dotToComma(clima.getMain().getTemp())%> ºC</p>
                                <p><strong>Max: </strong><%=StrUtils.dotToComma(clima.getMain().getTempMax())%> ºC</p>
                                <p><strong>Min: </strong><%=StrUtils.dotToComma(clima.getMain().getTempMin())%> ºC</p>
                                <p><strong>Umidade: </strong><%=clima.getMain().getHumidity() %>%</p>
                                <p><strong>Sensação térmica: </strong><%=clima.getMain().getFeelsLike() %> ºC</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } else { %>
        <div class="container">
            <div class="row">
                <div class="tempo-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="text-center">
                                <h4> <%= cidade.isEmpty() ? "Digite o nome da cidade" : "Cidade não encontrada" %></h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </body>
</html>
