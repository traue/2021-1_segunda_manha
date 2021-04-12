<%@page import="br.uninove.bhaskara.Bhaskara"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int a, b, c;
            a = Integer.parseInt(request.getParameter("valorA"));
            b = Integer.parseInt(request.getParameter("valorB"));
            c = Integer.parseInt(request.getParameter("valorC"));

            Bhaskara bhaskara = new Bhaskara();
            bhaskara.setA(a);
            bhaskara.setB(b);
            bhaskara.setC(c);
        %>
        <h1>Calculadora de Bhaskara</h1>
        <hr>
        <strong>Dada a equação: </strong>
        <p><%=a%>x² + <%=b%>x + <%=c%> = 0</p>
        <%
            if (a == 0) {
        %>
        <h3>Impossível de calcular com A sendo 0!</h3>
        <%
            } else {
        %>
        <strong>Temos: </strong>
        <ul>
            <li><strong>Delta = </strong><%= bhaskara.calculaDelta() %></li>
            <li><strong>Raiz+ = </strong><%= (bhaskara.calculaDelta() <= 0) ? "Delta é negativo!" : bhaskara.getRaizPositiva() %></li>
            <li><strong>Raiz- = </strong><%= (bhaskara.calculaDelta() <= 0) ? "Delta é negativo!" : bhaskara.getRaizNegativa() %></li>
        </ul>
        <% } %>
        <br>
        <a href="index.html">Calcular novamente</a>
    </body>
</html>
