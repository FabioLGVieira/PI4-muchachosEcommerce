package com.muchachos.SERVLETS;

import com.muchachos.DAO.CarrinhoDAO;
import com.muchachos.MODELS.Pedido;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diego Queiroz
 */
@WebServlet(name = "editarStatusPedidoServlet", urlPatterns = {"/editarStatusPedidoServlet"})
public class editarStatusPedidoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sessao = request.getSession();
        request.setCharacterEncoding("UTF-8");
        
        int IDPedido = Integer.parseInt(request.getParameter("ID"));
        
        Pedido P = null;
        try {
            P = CarrinhoDAO.getPedidoByID(IDPedido);
            P.setStatus(request.getParameter("Status"));
            CarrinhoDAO.atualizarStatusPedido(P.getStatus(), P.getID());
        } catch (Exception ex) {
            Logger.getLogger(detalhesPedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        request.getRequestDispatcher("consultaPedidosSistemaServlet").forward(request, response);
    }

}