package com.muchachos.SERVLETS;

import com.muchachos.DAO.PerfumeDAO;
import com.muchachos.MODELS.Perfume;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "deletarProdutoServlet", urlPatterns = {"/deletarProdutoServlet"})
public class deletarProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int ID = Integer.parseInt(request.getParameter("ID"));
        HttpSession sessao = request.getSession();
        Perfume P = null;

        try {
            P = PerfumeDAO.getByID(ID);
            P.setStatus("I");
            PerfumeDAO.atualizarStatus(P);
            List<Perfume> listaProduto = PerfumeDAO.listar();

            request.setAttribute("listaProduto", listaProduto);
        } catch (Exception e) {
            e.printStackTrace();
            e.getLocalizedMessage();
            System.out.println("erro DAO produto: " + e);
        }

        RequestDispatcher dispatcher
                = request.getRequestDispatcher("CRUD-PRODUTOS/consultaProdutos.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
