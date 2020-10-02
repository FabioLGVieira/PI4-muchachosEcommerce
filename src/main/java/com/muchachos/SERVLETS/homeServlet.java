package com.muchachos.SERVLETS;

import com.muchachos.DAO.PerfumeDAO;
import com.muchachos.MODELS.Perfume;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Valter Lafuente Junior
 */
@WebServlet(name = "homeServlet", urlPatterns = {"/homeServlet"})
public class homeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sessao = request.getSession();

        if (sessao.getAttribute("loginStatus") == null) {
            sessao.setAttribute("loginStatus", "deslogado");
        }

        request.setCharacterEncoding("UTF-8");
        try {
            List<Perfume> listaMaisVendidos = PerfumeDAO.listarMaisVendidos();
            List<Perfume> listaNovos = PerfumeDAO.listarNovos();
            List<Perfume> listaMenorPreco = PerfumeDAO.listarMenorPreco();

            request.setAttribute("listaMaisVendidos", listaMaisVendidos);
            request.setAttribute("listaNovos", listaNovos);
            request.setAttribute("listaMenorPreco", listaMenorPreco);

            sessao.setAttribute("listaMaisVendidos", listaMaisVendidos);
            sessao.setAttribute("listaNovos", listaNovos);
            sessao.setAttribute("listaMenorPreco", listaMenorPreco);

            if (sessao.getAttribute("loginText") == null) {
                request.setAttribute("loginText", "Inscrever-se/Login");
                sessao.setAttribute("loginText", "Inscrever-se/Login");
            } 
        
            if (sessao.getAttribute("tipo") == null) {
                request.setAttribute("tipo", "cliente");
                sessao.setAttribute("tipo", "cliente");
                sessao.setAttribute("datatarget", "#exampleModalCenter");

            } if (sessao.getAttribute("tipo").equals("administrador")) {
                    request.setAttribute("tipo", "administrador");
                    sessao.setAttribute("tipo", "administrador");
                    sessao.setAttribute("datatarget", "#exampleModalCenter3");
                    
                } else if (sessao.getAttribute("tipo").equals("estoquista")) {
                    request.setAttribute("tipo", "estoquista");
                    sessao.setAttribute("tipo", "estoquista");
                    sessao.setAttribute("datatarget", "#exampleModalCenter3");
                    
                } else if (sessao.getAttribute("tipo").equals("cliente") && sessao.getAttribute("loginStatus").equals("logado")) {
                    request.setAttribute("tipo", "cliente");
                    sessao.setAttribute("tipo", "cliente");
                    sessao.setAttribute("datatarget", "#exampleModalCenter3");
                } else {
                    request.setAttribute("tipo", "cliente");
                    sessao.setAttribute("tipo", "cliente");
                    
                }

        } catch (Exception e) {
            System.out.println(e);
        }

        request.getRequestDispatcher("home.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
