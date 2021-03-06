package br.sisacademico.controllers;

import br.sisacademico.dao.AlunoDAO;
import br.sisacademico.model.Aluno;
import br.sisacademico.model.Curso;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AlunoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String acao = request.getParameter("acao");

            if (acao.equalsIgnoreCase("delete")) {
                AlunoDAO aDAO = new AlunoDAO();
                int idAluno = Integer.parseInt(request.getParameter("idAluno"));
                if (aDAO.deleteAluno(idAluno)) {
                    if (Boolean.parseBoolean(request.getParameter("returnFilter"))) {
                        int idCurso = Integer.parseInt(request.getParameter("idCurso"));
                        response.sendRedirect("./relatorio/aluno.jsp?idCurso=" + idCurso);
                    } else {
                        response.sendRedirect("./relatorio/aluno.jsp");
                    }

                }
            } else if (acao.equalsIgnoreCase("cadastro")) {
                AlunoDAO aDAO = new AlunoDAO();
                Aluno aluno = new Aluno(
                        0,
                        Integer.parseInt(request.getParameter("raAluno")),
                        request.getParameter("nomeAluno"),
                        new Curso(Integer.parseInt(request.getParameter("idcurso")), null, null));
                if(aDAO.insereAluno(aluno)) {
                    response.sendRedirect("./relatorio/aluno.jsp");
                }
            } else if(acao.equalsIgnoreCase("edicao")) {
                AlunoDAO aDAO = new AlunoDAO();
                Aluno aluno = new Aluno(
                        Integer.parseInt(request.getParameter("idAluno")),
                        Integer.parseInt(request.getParameter("raAluno")),
                        request.getParameter("nomeAluno"),
                        new Curso(Integer.parseInt(request.getParameter("idcurso")), null, null));
                if(aDAO.editaAluno(aluno)) {
                    response.sendRedirect("./relatorio/aluno.jsp");
                }
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
