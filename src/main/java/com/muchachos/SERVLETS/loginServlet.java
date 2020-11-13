/*
 * Criado por: Ramses Souza
 * Data: 13/11/2020
 * 
 */
package com.muchachos.SERVLETS;

import com.muchachos.DAO.CarrinhoDAO;
import com.muchachos.DAO.LoginDAO;
import com.muchachos.MODELS.Carrinho;
import com.muchachos.MODELS.Perfume;
import com.muchachos.MODELS.Senha;
import com.muchachos.MODELS.Usuario;
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
 * @author Valter
 */
@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int IdUsuario;
        String usuario = request.getParameter("inputName");
        String senha = request.getParameter("inputSenha");
        Usuario user = null;
        try {
            user = LoginDAO.Logar(usuario);
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e + " Erro no Login!");
        }
        Senha crypto = new Senha();

        if (user != null && crypto.checkPassword(senha, user.getSenha())) {
            // Se sucesso, salva usuario na sessao e redireciona para /protegido/home
            HttpSession sessao = request.getSession();
            sessao.setAttribute("usuario", user);
            sessao.setAttribute("loginText", user.getUsuario());
            sessao.setAttribute("tipo", user.getTipo());
            sessao.setAttribute("IDUsuario", user.getID());
            sessao.setAttribute("loginStatus", "logado");

            request.setAttribute("usuario", user);
            request.setAttribute("loginText", user.getUsuario());
            request.setAttribute("tipo", user.getTipo());

            /* -------------DISPLAY DE ITENS DO CARRINHO-------------------- */
            List<Perfume> listaPerfumeCarrinho = null;
            try {
                if (sessao.getAttribute("listaCarrinho") != null) {

                    List<Perfume> listaPerfumeCarrinhoSessao = (ArrayList) sessao.getAttribute("listaCarrinho");
                    for (Perfume L : listaPerfumeCarrinhoSessao) {
                        Carrinho carrinho = new Carrinho(user.getID(), L.getID(), L.getQuantidade(), "A");
                        Carrinho itemNoCarrinho = CarrinhoDAO.getByID(user.getID(), L.getID());
                        if (itemNoCarrinho == null) {
                            if (CarrinhoDAO.inserir(carrinho)) {
                                request.setAttribute("msgResposta", "Adicionado com sucesso!");
                            } else {
                                request.setAttribute("msgResposta", "Não Foi possível adicionar!");
                            }
                        } else {
                            itemNoCarrinho.setQuantidade(itemNoCarrinho.getQuantidade() + L.getQuantidade());
                            if (CarrinhoDAO.atualizarQuantidade(itemNoCarrinho)) {
                                request.setAttribute("msgResposta", "Adicionado com sucesso!");
                            } else {
                                request.setAttribute("msgResposta", "Não Foi possível adicionar!");
                            }
                        }
                    }
                }
                listaPerfumeCarrinho = CarrinhoDAO.listarProdutos(user.getID());

            } catch (Exception ex) {
                Logger.getLogger(consultaCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            int quantidadeDeItens = 0;
            if (listaPerfumeCarrinho != null) {
                for (Perfume L : listaPerfumeCarrinho) {
                    quantidadeDeItens = quantidadeDeItens + L.getQuantidade();
                }
            }
            sessao.setAttribute("quantidadeDeItens", quantidadeDeItens);
          

            /* -------------FIM DISPLAY DE ITENS DO CARRINHO-------------------- */
            request.getRequestDispatcher("homeServlet")
                    .forward(request, response);
        } else {
            // Se erro, reapresenta tela de login com msg de erro
            request.setAttribute("msgErro", "Usuário ou senha inválidos");
            request.getRequestDispatcher("homeServlet").forward(request, response);
        }
    }

}
