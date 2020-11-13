/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muchachos.SERVLETS;

import com.muchachos.DAO.CarrinhoDAO;
import com.muchachos.DAO.EnderecoDAO;
import com.muchachos.MODELS.Endereco;
import com.muchachos.MODELS.Perfume;
import com.muchachos.MODELS.Pedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
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
 * @author Ramesses
 */
@WebServlet(name = "detalhesPedidoServlet", urlPatterns = {"/detalhesPedidoServlet"})
public class detalhesPedidoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();

        int IDPedido = Integer.parseInt(request.getParameter("ID"));
        List<Perfume> listaProdutoPedido = null;
        try {
            listaProdutoPedido = CarrinhoDAO.listarProdutosPedido(IDPedido);
        } catch (Exception ex) {
            Logger.getLogger(detalhesPedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        float valorTotal = 0;
        int quantidadeDeItens = 0;
        if (listaProdutoPedido != null) {

            for (Perfume L : listaProdutoPedido) {
                valorTotal = valorTotal + (L.getValorVenda() * L.getQuantidade());
                quantidadeDeItens = quantidadeDeItens + L.getQuantidade();
            }
        }
        Locale ptBr = new Locale("pt", "BR");
        String valorString = NumberFormat.getCurrencyInstance(ptBr).format(valorTotal);

        sessao.setAttribute("valorTotal", valorString);
        sessao.setAttribute("quantidade", quantidadeDeItens);
        sessao.setAttribute("listaProdutoPedido", listaProdutoPedido);

        int IDEndereco = Integer.parseInt(request.getParameter("IDEndereco"));

        Endereco E = null;
        try {
            E = EnderecoDAO.getByID(IDEndereco);
        } catch (Exception ex) {
            Logger.getLogger(detalhesPedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        sessao.setAttribute("EnderecoEntregaPedido", E);

        Pedido P = null;

        try {
            P = CarrinhoDAO.getPedidoByID(IDPedido);
        } catch (Exception ex) {
            Logger.getLogger(detalhesPedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        sessao.setAttribute("Pedido", P);
        if (P != null) {
            sessao.setAttribute("dataAtual", P.formatarData(P.getDataPedido()));
        }
        request.getRequestDispatcher("detalhesPedido.jsp").forward(request, response);
    }

}
