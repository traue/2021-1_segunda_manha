<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sessão</title>
    </head>
    <body>
        <h2>Trabalhando com Sessões...</h2>
        <hr>
        <strong>Valor que está na sessão:</strong><%= session.getAttribute("nomeUsuario")%>
        <br>

        <%
            if (session.getAttribute("autenticado") != null) {
                if (Boolean.parseBoolean(session.getAttribute("autenticado").toString())) {
                    out.print("Você está logado! =)");
                } else {
                    out.print("Você não está logado! =)");
                }
            }

        %>

        <br>
        <a href="index.html">Gerar novamente a chave</a>
        <br>
        <a href="../">Voltar para a página inicial</a>
    </body>
</html>
