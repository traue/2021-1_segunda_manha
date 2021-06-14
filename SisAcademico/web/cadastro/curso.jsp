<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    String acao = "cadastro";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>SisAcadêmico</title>
    </head>
    <body>
        <jsp:include page="../menu.jsp"></jsp:include>
            <div class="container mt-4">
                <div style="width: 30%; margin: 0 auto !important;">
                    <form method="post" action="../CursoController">
                        <div class="form-group">
                            <label>Nome do curso:</label>
                            <input type="text" class="form-control" name="nomeCurso" placeholder="Insira o nome do curso">
                        </div>
                        <div class="form-group mt-4">
                            <label>Tipo de curso:</label>
                            <input type="text" class="form-control" name="tipoCurso" placeholder="Insira o tipo do curso">
                        </div>
                        <div class="mt-4">
                            <input type="submit" class="btn btn-primary btn-md w-100" value="Cadastrar">
                        </div>
                        <input type="hidden" name="acao" value="<%=acao%>">
                </form>
            </div>
        </div>
    </body>
</html>
