<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Calculadora</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Super Calculadora</h1>
        <hr>
        <%
            String vA = request.getParameter("a") != null ? request.getParameter("a") : "";
            String vB = request.getParameter("b") != null ? request.getParameter("b") : "";;
        %>
        <form method="POST" action="CalcController">
            <label>Valor A: </label>
            <input type="number" step="0.01" name="valorA" value="<%=vA%>">
            <br>
            <label>Valor B: </label>
            <input type="number" step="0.01" name="valorB" value="<%=vB%>">
            <br>
            <input type="submit" value="Somar" name="btCalcular">
            <input type="submit" value="Subtrair" name="btCalcular">
            <input type="submit" value="Multiplicar" name="btCalcular">
            <input type="submit" value="Dividir" name="btCalcular">
            <input type="submit" value="Potencia" name="btCalcular">
            <%
                if(request.getParameter("result") != null) {
            %>
            <hr>
            <strong>Resultado: </strong><%= request.getParameter("result") %>
            <%
                }
            %>
        </form>
    </body>
</html>

