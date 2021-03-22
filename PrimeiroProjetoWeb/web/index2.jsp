<%@page import="br.uninove.pojo.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Inha segunda página JSP</title>
    </head>
    <body>
        <h1>Minha primeira página Web. Que top!</h1>
        <hr>
        <%
            Pessoa p = new Pessoa();
            p.setNome("Thiago G. Traue");
            p.setIdade(33);
            p.setFumante(false);
        %>

        <h2>Dados informados: </h2>
        <strong>Nome: </strong><%= p.getNome()%><br>
        <strong>Idade: </strong><%= p.getIdade()%><br>
        <strong>Fuma: </strong><%= (p.isFumante() ? "Sim" : "Não")%><br>
        <hr>
        <a href="index.jsp">Mesma página, mas SEM Orientação à Objetos</a>
    </body>
</html>
