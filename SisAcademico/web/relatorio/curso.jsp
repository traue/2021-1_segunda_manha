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
        <script src="../js/modalExclusao.js"></script>
        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>
            <div class="container mt-4">
                <div class="table-responsive-md" style="width: 90%; margin: 0 auto !important;">
                    <table class="table justify-content-center">
                        <thead class="thead-dark">
                        <th scope="col">Curso</th>
                        <th scope="col" class="text-center">Tipo de Curso</th>
                        <th scope="col" class="text-center">Qtd. de Alunos</th>
                        <th scope="col" class="text-center">Ver alunos</th>
                        <th scope="col" class="text-center">Editar</th>
                        <th scope="col" class="text-center">Excluir</th>
                        </thead>
                        <tbody>
                        <% for (Map.Entry<Curso, Integer> c : cursos.entrySet()) { %>
                        <tr>
                            <td><%=c.getKey().getNomeCurso()%></td>
                            <td class="text-center"><%=c.getKey().getTipoCurso()%></td>
                            <td class="text-center"><%=c.getValue()%></td>
                            <% if(c.getValue() == 0) { %>
                            <td class="text-center">
                                <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Sem alunos">
                                    <button class="btn btn-secondary" disabled style="pointer-events: none;" type="button">Alunos Matriculados</button>
                                </span>
                            </td>
                            <% } else { %>
                            <td class="text-center">
                                <a class="btn btn-info" href="./aluno.jsp?idCurso=<%=c.getKey().getIdCurso()%>">Alunos Matriculados</a>
                            </td>
                            <% } %>
                            <td class="text-center"><a class="btn btn-success" href="../cadastro/curso.jsp?idCurso=<%=c.getKey().getIdCurso()%>">Editar</a></td>
                            <% if(c.getValue() != 0) { %>
                            <td class="text-center">
                                <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Não é possível excluir um curso com alunos">
                                    <button class="btn btn-secondary" disabled style="pointer-events: none;" type="button">Excluir</button>
                                </span>
                            </td>
                            <% } else { %>
                            <td class="text-center">
                                <a class="btn btn-danger" href="../CursoController?acao=delete&idCurso=<%=c.getKey().getIdCurso()%>" id="deleteCurso">Excluir</a></td>
                            </td>
                            <% } %>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>