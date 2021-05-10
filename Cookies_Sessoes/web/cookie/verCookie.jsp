<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cookies</title>
    </head>
    <body>
        <%
            String nomeDoCookie = "nomeDoUsuario";
            Cookie cookies[] = request.getCookies();
            Cookie cookieEncontrada = null;

            if(cookies != null) {
                for(int i = 0; i < cookies.length; i++) {
                    if(cookies[i].getName().equals(nomeDoCookie)) {
                        cookieEncontrada = cookies[i];
                        break;
                    }
                }
            }

        %>
        <h2>Trabalhando com Cookies...</h2>
        <hr>
        <%
            if(cookieEncontrada == null) {
                out.print("Não achei essa Cookie :(");
            } else {
                String valor = URLDecoder.decode(cookieEncontrada.getValue(), "UTF-8");
                out.print("<h4>Cookies encontrada!</h4>");
                out.print("<strong>Valor: </strong>" + valor);
            }
        %>
        <br>
        <a href="index.html">Voltar para a página inicial de cookies</a>
        <br>
        <a href="../index.html">Voltar para a página inicial do projeto</a>
    </body>
</html>
