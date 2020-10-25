package com.muchachos.SERVLETS;

import com.muchachos.DAO.EnderecoDAO;
import com.muchachos.MODELS.Endereco;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Fabio
 */
@WebServlet(name = "consultaEnderecoServlet", urlPatterns = {"/consultaEnderecoServlet"})
public class consultaEnderecoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int ID = Integer.parseInt(request.getParameter("ID"));
        String s = request.getParameter("ID");

        try {
            /* Pega os Dados no Banco */
            List<Endereco> listaEndereco = EnderecoDAO.listByID(ID);
            request.setAttribute("listaEndereco", listaEndereco);
        } catch (Exception e) {
            e.printStackTrace();
            e.getLocalizedMessage();
            System.out.println("erro DAO endereco: " + e);
        }

        String page = request.getParameter("finalizarCompra");
        if (page == null) {
            /* RETORNA PRA PÁGINA DE CONSULTAR ENDERECOS */
            RequestDispatcher dispatcher
                    = request.getRequestDispatcher("CRUD-ENDERECO/consultaEndereco.jsp");
            dispatcher.forward(request, response);
        } else if (page.equals("redirectToFinalizarCompra")) {
            RequestDispatcher dispatcher
                    = request.getRequestDispatcher("finalizarCompra.jsp");
            dispatcher.forward(request, response);
        } else if (page.equals("frontEnd")) {
            RequestDispatcher dispatcher
                    = request.getRequestDispatcher("CRUD-ENDERECO/consultaEnderecoCliente.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int ID = Integer.parseInt(request.getParameter("ID"));

        try {
            /* Pega os Dados no Banco */
            List<Endereco> listaEndereco = EnderecoDAO.listByID(ID);
            request.setAttribute("listaEndereco", listaEndereco);
        } catch (Exception e) {
            e.printStackTrace();
            e.getLocalizedMessage();
            System.out.println("erro DAO endereco: " + e);
        }

        String page = request.getParameter("finalizarCompra");
        if (page == null) {
            /* RETORNA PRA PÁGINA DE CONSULTAR ENDERECOS */
            RequestDispatcher dispatcher
                    = request.getRequestDispatcher("CRUD-ENDERECO/consultaEndereco.jsp");
            dispatcher.forward(request, response);
        } else if (page.equals("redirectToFinalizarCompra")) {
            RequestDispatcher dispatcher
                    = request.getRequestDispatcher("finalizarCompra.jsp");
            dispatcher.forward(request, response);
        } else if (page.equals("frontEnd")) {
            RequestDispatcher dispatcher
                    = request.getRequestDispatcher("CRUD-ENDERECO/consultaEnderecoCliente.jsp");
            dispatcher.forward(request, response);
        }
    }

}
