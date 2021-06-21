<%@page import="br.sisacademico.model.Curso"%>
<%@page import="br.sisacademico.dao.CursoDAO"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    
    String acao = "cadastro";
    String labelBotao = "Cadastrar";
    Curso c = new Curso();
    c.setNomeCurso("");
    c.setTipoCurso("");
    
    if(request.getParameter("idCurso") != null) {
        CursoDAO cDAO = new CursoDAO();
        int idCurso = Integer.parseInt(request.getParameter("idCurso"));
        acao = "edicao";
        labelBotao = "Salvar";
        c = cDAO.getCursos(idCurso).get(0);
    }
    
    
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
                            <input type="text" class="form-control" value="<%=c.getNomeCurso()%>" name="nomeCurso" placeholder="Insira o nome do curso">
                        </div>
                        <div class="form-group mt-4">
                            <label>Tipo de curso:</label>
                            <input type="text" class="form-control" value="<%=c.getTipoCurso()%>" name="tipoCurso" placeholder="Insira o tipo do curso">
                        </div>
                        <div class="mt-4">
                            <input type="submit" class="btn btn-primary btn-md w-100" value="<%=labelBotao%>">
                        </div>
                        <input type="hidden" name="acao" value="<%=acao%>">
                        <input type="hidden" name="idCurso" value="<%=c.getIdCurso()%>">
                </form>
            </div>
        </div>
    </body>
</html>
