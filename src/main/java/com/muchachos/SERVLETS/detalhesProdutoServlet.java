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
@WebServlet(name = "detalhesProdutoServlet", urlPatterns = {"/detalhesProdutoServlet"})
public class detalhesProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();
        /* INSTANCIA O ID */
        int ID = Integer.parseInt(request.getParameter("ID"));
        /* INSTANCIA OS OBJETOS */
        Perfume P = null;
        List<Perfume> listaTitulo = null;
        List<Perfume> listaTag = null;

        try {
            P = PerfumeDAO.getByID(ID);
            listaTitulo = PerfumeDAO.buscarPorTitulo(request.getParameter("titulo"), ID);

            request.setAttribute("listaTitulo", listaTitulo);
           

            sessao.setAttribute("listaTitulo", listaTitulo);

            if (listaTitulo == null) {
                listaTag = PerfumeDAO.buscarPorTag(request.getParameter("tag"));
                request.setAttribute("textoHeader", "Semelhantes:");
                request.setAttribute("listaTitulo", listaTag);

                sessao.setAttribute("listaTitulo", listaTag);

            } 

        } catch (Exception e) {
            e.printStackTrace();
            e.getLocalizedMessage();
            System.out.println("erro DAO produto: " + e);
        }
        request.setAttribute("ID", ID);
        request.setAttribute("detalhePerfume", P);

        sessao.setAttribute("listaTitulo", listaTitulo);

        RequestDispatcher dispatcher
                = request.getRequestDispatcher("JSP-PAGES/detalhesProduto.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
