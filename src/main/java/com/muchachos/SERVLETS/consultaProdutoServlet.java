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
@WebServlet(name = "consultaProdutoServlet", urlPatterns = {"/consultaProdutoServlet"})
public class consultaProdutoServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessao = request.getSession();
        request.setCharacterEncoding("UTF-8");

        try {
            List<Perfume> listaProduto = PerfumeDAO.buscar(request.getParameter("Busca"));
            String tipo = (String) sessao.getAttribute("tipo");
            request.setAttribute("listaProduto", listaProduto);
            sessao.setAttribute("listaProduto", listaProduto);
        } catch (Exception e) {
            System.out.println(e);
        }
        

        request.getRequestDispatcher("CRUD-PRODUTOS/consultaProdutos.jsp").forward(request, response);

    }

}