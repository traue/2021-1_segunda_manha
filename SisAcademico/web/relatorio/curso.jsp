<%@page import="java.util.Map"%>
<%@page import="br.sisacademico.model.Curso"%>
<%@page import="br.sisacademico.dao.CursoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    CursoDAO cDAO = new CursoDAO();
    Map<Curso, Integer> cursos = cDAO.getTodosCursosCountAlunos();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SisAcademico</title>
    </head>
    <body>
        <jsp:include page="../menu.jsp"></jsp:include>
            <div class="container mt-4">
                <div class="table-responsive-md" style="width: 90%; margin: 0 auto !important;">
                    <table class="table justify-content-center">
                        <thead class="thead-dark">
                        <th scope="col">Curso</th>
                        <th scope="col">Tipo de Curso</th>
                        <th scope="col">Qtd. de Alunos</th>
                        <th scope="col">Ver alunos</th>
                        <th scope="col">Editar</th>
                        <th scope="col">Excluir</th>
                        </thead>
                        <tbody>
                        <% for (Map.Entry<Curso, Integer> c : cursos.entrySet()) { %>
                        <tr>
                            <td><%=c.getKey().getNomeCurso()%></td>
                            <td><%=c.getKey().getTipoCurso()%></td>
                            <td><%=c.getValue()%></td>
                            <td>BT VER ALUNOS</td>
                            <td>BT EDITAR</td>
                            <td>BT EXCLUIR</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>