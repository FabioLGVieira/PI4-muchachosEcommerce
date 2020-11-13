/*
 *Criado por Ramses Souza
 *Data 12/11/2020
 *
 */
package com.muchachos.SERVLETS;

import com.muchachos.DAO.CarrinhoDAO;
import com.muchachos.MODELS.Carrinho;
import com.muchachos.MODELS.Perfume;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "editarNoCarrinhoServlet", urlPatterns = {"/editarNoCarrinhoServlet"})
public class editarNoCarrinhoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();
        /* ------------- USUARIO DESLOGADO ------------------- */
        if (sessao.getAttribute("loginStatus").equals("deslogado")) {
            int IDProduto = Integer.parseInt(request.getParameter("ID"));
            int quantidade;
            List<Perfume> listaPerfumeCarrinho = (ArrayList) sessao.getAttribute("listaCarrinho");
            if (request.getParameter("quantidade").equals("") || Integer.parseInt(request.getParameter("quantidade")) == 0) {
                for (Perfume forPerfume : listaPerfumeCarrinho) {
                    if (forPerfume.getID() == IDProduto) {
                        listaPerfumeCarrinho.remove(forPerfume);
                        break;
                    }
                }
                request.setAttribute("alertaResposta", "sucesso");
                sessao.setAttribute("msgResposta", "Produto Removido");
            } else {
                quantidade = Integer.parseInt(request.getParameter("quantidade"));

                for (Perfume forPerfume : listaPerfumeCarrinho) {
                    if (forPerfume.getID() == IDProduto) {
                        listaPerfumeCarrinho.remove(forPerfume);
                        forPerfume.setQuantidade(quantidade);
                        listaPerfumeCarrinho.add(forPerfume);
                        break;
                    }
                }
                request.setAttribute("alertaResposta", "sucesso");
                sessao.setAttribute("msgResposta", "Produto Atualizado");
            }

            sessao.setAttribute("listaCarrinho", listaPerfumeCarrinho);
            request.getRequestDispatcher("consultaCarrinhoServlet").forward(request, response);

        } /* ------------- USUARIO LOGADO ------------------- */ else {
            int IDProduto = Integer.parseInt(request.getParameter("ID"));
            String status = "A";
            int quantidade;

            if (request.getParameter("quantidade").equals("") || Integer.parseInt(request.getParameter("quantidade")) == 0) {
                quantidade = 0;
                status = "I";
            } else {
                quantidade = Integer.parseInt(request.getParameter("quantidade"));
            }
            int IDUsuario = (int) sessao.getAttribute("IDUsuario");

            // ----------------------TESTE DE CLICK--------------------------------------
            // Testa se o Usuario clicou apenas no Adicionar sem adicionar uma nova quantidade
            Carrinho itemNoCarrinho = null;
            try {
                itemNoCarrinho = CarrinhoDAO.getByID(IDUsuario, IDProduto);
                if (quantidade == itemNoCarrinho.getQuantidade()) {
                    quantidade = quantidade + 1;
                }
            } catch (Exception ex) {
                Logger.getLogger(editarNoCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            // ----------------------FIM DO TESTE--------------------------------------
            Carrinho carrinho = new Carrinho(IDUsuario, IDProduto, quantidade, status);

            try {
                if (CarrinhoDAO.atualizarQuantidade(carrinho)) {
                    if (carrinho.getStatus().equals("A")) {
                        sessao.setAttribute("msgResposta", "Produto Atualizado");
                    } else {
                        sessao.setAttribute("msgResposta", "Não foi possível atualizar produto");
                    }
                } else {
                    sessao.setAttribute("msgResposta", "Não foi possível atualizar produto");
                }
            } catch (Exception e) {
                e.getLocalizedMessage();
                System.out.println(e);
            }
            request.getRequestDispatcher("consultaCarrinhoServlet").forward(request, response);

        }
    }
}
