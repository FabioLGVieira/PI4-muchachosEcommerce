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
@WebServlet(name = "cadastrarEnderecoServlet", urlPatterns = {"/cadastrarEnderecoServlet"})
public class cadastrarEnderecoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        /* Pega o ID na Página */
        int ID = Integer.parseInt(request.getParameter("ID"));

        /* CRIA OS ATRIBUTOS NO REQUEST*/
        request.setAttribute("IDEndereco", ID);

        RequestDispatcher dispatcher
                = request.getRequestDispatcher("CRUD-ENDERECO/cadastrarEndereco.jsp");
        dispatcher.forward(request, response);
    
}

@Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int IDUSUARIO = Integer.parseInt(request.getParameter("ID"));
        String status = "A";
        String cep = request.getParameter("cep");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String endereco = request.getParameter("endereco");
        String complemento = request.getParameter("complemento");

        Endereco E = new Endereco(IDUSUARIO, status, cep, cidade, estado, endereco, complemento);

        try {
            if (EnderecoDAO.inserir(E)) {
                request.setAttribute("msgResposta", "Cadastrado com sucesso!");

            } else {
                request.setAttribute("msgResposta", "Não Foi possível efetuar o cadastro!");

            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        }
        if (request.getParameter("frontEnd") != null) {
            

                RequestDispatcher dispatcher
                        = request.getRequestDispatcher("CRUD-ENDERECO/consultaEnderecoCliente.jsp");
                dispatcher.forward(request, response);
        } else {
            request.getRequestDispatcher("homeServlet").forward(request, response);
        }
    }

}
