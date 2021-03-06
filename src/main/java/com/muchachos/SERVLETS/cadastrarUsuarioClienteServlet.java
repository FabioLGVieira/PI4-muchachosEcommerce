package com.muchachos.SERVLETS;

import com.muchachos.DAO.UsuarioDAO;
import com.muchachos.MODELS.Senha;
import com.muchachos.MODELS.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Valter
 */
@WebServlet(name = "cadastrarUsuarioClienteServlet", urlPatterns = {"/cadastrarUsuarioClienteServlet"})
public class cadastrarUsuarioClienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String Nome = request.getParameter("nome");
        String Status = "A";
        String Email = request.getParameter("EMAIL");
        String DataNasc = request.getParameter("DATA");
        String Usuario = request.getParameter("usuario");
        String Senha = request.getParameter("senha1");
        String Tipo = "cliente";
        String Celular = request.getParameter("CELULAR");
        String CPF = request.getParameter("CPF");
        Senha crypto = new Senha();
        
        Usuario user = new Usuario(Status, Nome, Usuario, crypto.hashSenha(Senha), Email, Tipo, DataNasc, Celular, CPF);
        
        
        try {
            if (UsuarioDAO.inserir(user)) {
                request.setAttribute("msgResposta", "Cadastrado com sucesso!");
                
            } else {
                request.setAttribute("msgResposta", "Não Foi possível efetuar o cadastro!");
                
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        }
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

}
