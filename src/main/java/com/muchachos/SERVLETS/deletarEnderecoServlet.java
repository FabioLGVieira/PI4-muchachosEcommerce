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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Fabio
 */
@WebServlet(name = "deletarEnderecoServlet", urlPatterns = {"/deletarEnderecoServlet"})
public class deletarEnderecoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int ID = Integer.parseInt(request.getParameter("ID"));
        Endereco E = null;
        try {
            E = EnderecoDAO.getByID(ID);
            E.setStatus("I");
            EnderecoDAO.atualizar(E);
        } catch (Exception e) {
            e.printStackTrace();
            e.getLocalizedMessage();
            System.out.println("erro DAO produto: " + e);
        }

        if (request.getParameter("frontEnd") != null) {
            if (request.getParameter("frontEnd").equals("frontEnd")) {
                HttpSession sessao = request.getSession();
                ID = (int) sessao.getAttribute("IDUsuario");
                try {
                    /* Pega os Dados no Banco */
                    List<Endereco> listaEndereco = EnderecoDAO.listByID(ID);
                    request.setAttribute("listaEndereco", listaEndereco);
                } catch (Exception e) {
                    e.printStackTrace();
                    e.getLocalizedMessage();
                    System.out.println("erro DAO endereco: " + e);
                }

                RequestDispatcher dispatcher
                        = request.getRequestDispatcher("finalizarCompra.jsp");
                dispatcher.forward(request, response);
            } else if (request.getParameter("frontEnd").equals("visualizarEnderecos")) {
                HttpSession sessao = request.getSession();
                ID = (int) sessao.getAttribute("IDUsuario");
                try {
                    /* Pega os Dados no Banco */
                    List<Endereco> listaEndereco = EnderecoDAO.listByID(ID);
                    request.setAttribute("listaEndereco", listaEndereco);
                } catch (Exception e) {
                    e.printStackTrace();
                    e.getLocalizedMessage();
                    System.out.println("erro DAO endereco: " + e);
                }

                RequestDispatcher dispatcher
                        = request.getRequestDispatcher("CRUD-ENDERECO/consultaEnderecoCliente.jsp");
                dispatcher.forward(request, response);
                
            } else {
                RequestDispatcher dispatcher
                        = request.getRequestDispatcher("CRUD-USUARIO/consultaUsuario.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            RequestDispatcher dispatcher
                    = request.getRequestDispatcher("CRUD-USUARIO/consultaUsuario.jsp");
            dispatcher.forward(request, response);
        }
    }

}
