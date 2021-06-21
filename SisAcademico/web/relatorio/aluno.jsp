<%@page import="br.sisacademico.dao.AlunoDAO"%>
<%@page import="br.sisacademico.model.Aluno"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AlunoDAO aDAO = new AlunoDAO();
    ArrayList<Aluno> alunos;
    String returnPg;
    boolean mostraPainelFiltro = false;
    if (request.getParameter("idCurso") == null) {
        alunos = aDAO.gettodosAlunos();
        returnPg = "&returnFilter=false";
    } else {
        int idCurso = Integer.parseInt(request.getParameter("idCurso"));
        alunos = aDAO.gettodosAlunos(idCurso);
        mostraPainelFiltro = true;
        returnPg = "&returnFilter=true&idCurso=" + idCurso;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SisAcadêmico</title>
    </head>
    <body>
        <jsp:include page="../menu.jsp"></jsp:include>
            <script src="../js/modalExclusao.js"></script>
        <% if (mostraPainelFiltro && alunos.size() > 0) {%>
        <div class="container mt-4">
            <div class="card" style="width: 90%; margin: 0 auto !important;">
                <div class="card-header bg-dark">
                    <p class="text-white">Filtro aplicado</p>
                </div>
                <div class="card-body">
                    <h6 class="cart-title">
                        Mostrando apenas alunos do curso:
                        <strong>
                            <%=alunos.get(0).getCurso().getNomeCurso()%>
                        </strong>
                    </h6>
                    <a href="aluno.jsp" class="btn btn-primary">Limpar filtro</a>
                </div>
            </div>
        </div>
        <% } %>
        <div class="container mt-4">
            <div class="table-responsive-md" style="width: 90%; margin: 0 auto !important;">
                <table class="table justify-content-center">
                    <thead class="thead-dark">
                    <th scope="col">RA</th>
                    <th scope="col">Nome do aluno</th>
                    <th scope="col">Curso</th>
                    <th scope="col">Tipo de Curso</th>
                    <th scope="col" class="text-center">Editar</th>
                    <th scope="col" class="text-center">Excluir</th>
                    </thead>
                    <tbody>
                        <% for (Aluno a : alunos) {%>
                        <tr>
                            <td><%=a.getRa()%></td>
                            <td><%=a.getNomeAluno()%></td>
                            <td><%=a.getCurso().getNomeCurso()%></td>
                            <td><%=a.getCurso().getTipoCurso()%></td>
                            <td class="text-center"><a href="../cadastro/aluno.jsp?idAluno=<%=a.getIdAluno()%>" class="btn btn-primary">Editar</a></td>
                            <td class="text-center"><a href="../AlunoController?acao=delete&idAluno=<%=a.getIdAluno()%><%=returnPg%>" id="deleteAluno" class="btn btn-danger">Excluir</a></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
                <a href="../cadastro/aluno.jsp" class="btn btn-info">Novo aluno</a>
            </div>
        </div>
    </body>
</html>
