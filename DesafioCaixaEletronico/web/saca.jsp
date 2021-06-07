<%@page import="br.uninove.CaixaEletronico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int valorSacado = Integer.parseInt(request.getParameter("valorSacado"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Caixa Eletrônico</title>
    </head>
    <body>
        <h1>Caixa Eletrônico</h1>
        <hr>
        <p><strong>Valor sacado: </strong>R$ <%=valorSacado%></p>
        <p>Você receberá as seguintes notas:</p>
        <p><%= CaixaEletronico.sacar(valorSacado) %></p>
    </body>
</html>
