package com.muchachos.SERVLETS;

import com.muchachos.DAO.LoginDAO;
import com.muchachos.DAO.UsuarioDAO;
import com.muchachos.MODELS.Senha;
import com.muchachos.MODELS.Usuario;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Valter
 */
@WebServlet(name = "editarUsuarioClienteServlet", urlPatterns = {"/editarUsuarioClienteServlet"})
public class editarUsuarioClienteServlet extends HttpServlet {




    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int ID = Integer.parseInt(request.getParameter("IDUpdate"));
        String Nome = request.getParameter("nomeUpdate");
        String Email = request.getParameter("EMAILUpdate");
        String DataNasc = request.getParameter("DATAUpdate");
        String Usuario = request.getParameter("usuarioUpdate");
        String Senha = request.getParameter("senha1Update");
        String Celular = request.getParameter("CELULARUpdate");
        String CPF = request.getParameter("CPFUpdate");
        Senha crypto = new Senha();
        Usuario U;
        
        if (Senha.equals("")) {
            try {
                U = UsuarioDAO.getByID(ID);
                Senha = U.getSenha();
            } catch (Exception ex) {
                Logger.getLogger(editarUsuarioSistemaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            Senha = crypto.hashSenha(Senha);
        }
        
        Usuario user = new Usuario(ID, Nome, Usuario, Senha, Email, DataNasc, Celular, CPF);
        
        Usuario usuario = null;
        try {
            if (UsuarioDAO.atualizarCliente(user)) {
                 request.setAttribute("alertaResposta", "sucesso");
                 /* Loga o usuario novamente com as informações atualizados */
                 usuario = LoginDAO.Logar(user.getUsuario());
                 request.setAttribute("usuario", usuario);
            } else {
                request.setAttribute("alertaResposta", "falha");
                
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        }
        request.getRequestDispatcher("homeServlet").forward(request, response);

    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
