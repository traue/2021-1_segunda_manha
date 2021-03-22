<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meu primeiro JSP</title>
    </head>
    <body>
        <h1>Minha primeira página Web. Que top!</h1>
        <hr>
        <%
           String nome = "Thiago G. Traue"; 
           int idade = 33;
           boolean fumante = false;
        %>
        
        <h2>Dados informados: </h2>
        <strong>Nome: </strong><%= nome %><br>
        <strong>Idade: </strong><%= idade %><br>
        <strong>Fuma: </strong><%= (fumante ? "Sim" : "Não") %><br>
        <hr>
        <a href="index2.jsp">Mesma página, mas COM Orientação à Objetos</a>
    </body>
</html>
