/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uninove.controllers;

import br.uninove.matematica.Operacoes;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thiagograzianitraue
 */
public class CalcController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            double a = Double.parseDouble(request.getParameter("valorA"));
            double b = Double.parseDouble(request.getParameter("valorB"));

            String operacao = request.getParameter("btCalcular");

            double resultado = 0;

            switch (operacao) {
                case "Somar":
                    resultado = Operacoes.somar(a, b);
                    break;
                case "Subtrair":
                    resultado = Operacoes.subtrair(a, b);
                    break;
                case "Multiplicar":
                    resultado = Operacoes.multiplicar(a, b);
                    break;
                case "Dividir":
//                    if(b == 0) 
//                        out.println("<h1>Não se pode realizar divisão por zero!</h1>");
//                     else 
                        resultado = Operacoes.dividir(a, b);
                    break;
                case "Potencia":
                    resultado = Operacoes.potencia(a, b);
                    break;
            }
            
            response.sendRedirect("calculadora.jsp?result=" + resultado + "&a=" + a + "&b=" + b);
            
            //falta tratar erros!s
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
