<%@page import="br.uninove.imc.Imc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculadora IMC</title>
    </head>
    <body>
        <%
            float altura, peso;
            altura = Float.parseFloat(request.getParameter("altura"));
            peso = Float.parseFloat(request.getParameter("peso"));
                
            Imc imc = new Imc();
            
            imc.setAltura(altura);
            imc.setPeso(peso);
        %>
        <h1>Calculadora IMC</h1>
        <hr>
        <h2>Dados informados:</h2>
        <p><strong>Altura: </strong><%= altura %></p>
        <p><strong>Peso: </strong><%= peso %></p>
        <h2>Seu IMC: </h2>
        <p><strong>IMC: </strong><%= String.format("%.02f", imc.calculaIMC()) %></p>
        <p><strong>Classificação: </strong><%= imc.getClassificacao()%></p>
        <br>
        <a href="index.html">Calcular Novamente</a>
        <br>
        <br>
        <a href="https://github.com/traue/2021-1_segunda_manha/tree/main/CalculadoraIMC">Projeto no Git</a>
    </body>
</html>
