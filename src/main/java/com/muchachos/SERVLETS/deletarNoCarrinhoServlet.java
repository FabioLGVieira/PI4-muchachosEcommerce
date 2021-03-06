/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muchachos.SERVLETS;

import com.muchachos.DAO.CarrinhoDAO;
import com.muchachos.MODELS.Carrinho;
import com.muchachos.MODELS.Perfume;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * Criado por: Ramesses Souza
 * Data: 13/11/2020
 */
@WebServlet(name = "deletarNoCarrinhoServlet", urlPatterns = {"/deletarNoCarrinhoServlet"})
public class deletarNoCarrinhoServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();
        int IDProduto = Integer.parseInt(request.getParameter("ID"));

        /*--------------- USUARIO DESLOGADO------------------- */
        if (sessao.getAttribute("loginStatus").equals("deslogado")) {
            List<Perfume> listaPerfumeCarrinho = (ArrayList) sessao.getAttribute("listaCarrinho");
            for (Perfume forPerfume : listaPerfumeCarrinho) {
                if (forPerfume.getID() == IDProduto) {
                    listaPerfumeCarrinho.remove(forPerfume);
                    break;
                }
            }
            
            int quantidadeDeItens = 0;
            if (listaPerfumeCarrinho != null) {
                for (Perfume L : listaPerfumeCarrinho) {
                    quantidadeDeItens = quantidadeDeItens + L.getQuantidade();
                }
            }
            request.setAttribute("alertaResposta", "sucesso");
            sessao.setAttribute("msgResposta", "Produto Removido");
            sessao.setAttribute("quantidadeDeItens", quantidadeDeItens);
            sessao.setAttribute("listaCarrinho", listaPerfumeCarrinho);
            RequestDispatcher dispatcher
                    = request.getRequestDispatcher("consultaCarrinho.jsp");
            dispatcher.forward(request, response);
        } else {
            /*--------------- USUARIO LOGADO------------------- */
            int IDCarrinho = (int) sessao.getAttribute("IDUsuario");
            Carrinho C = null;
            try {
                C = CarrinhoDAO.getByID(IDCarrinho, IDProduto);
                C.setStatus("I");
                if (CarrinhoDAO.atualizarStatus(C)) {
                    request.setAttribute("alertaResposta", "sucesso");
                    sessao.setAttribute("msgResposta", "Produto Removido");
                } else {
                    request.setAttribute("alertaResposta", "falha");
                    sessao.setAttribute("msgResposta", "Ocorreu um erro ao remover o Produto");
                }
                List<Perfume> listaProduto = CarrinhoDAO.listarProdutos(IDCarrinho);
                int quantidadeDeItens = 0;
                if (listaProduto != null) {
                    for (Perfume L : listaProduto) {
                        quantidadeDeItens = quantidadeDeItens + L.getQuantidade();
                    }
                }
                sessao.setAttribute("quantidadeDeItens", quantidadeDeItens);
                sessao.setAttribute("listaCarrinho", listaProduto);
                request.setAttribute("listaCarrinho", listaProduto);
            } catch (Exception e) {
                e.printStackTrace();
                e.getLocalizedMessage();
                System.out.println("erro DAO produto: " + e);
            }

            RequestDispatcher dispatcher
                    = request.getRequestDispatcher("consultaCarrinho.jsp");
            dispatcher.forward(request, response);
        }
    }
}
