package com.muchachos.SERVLETS;

import com.muchachos.DAO.CarrinhoDAO;
import com.muchachos.DAO.PerfumeDAO;
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
@WebServlet(name = "adicionarNoCarrinhoServlet", urlPatterns = {"/adicionarNoCarrinhoServlet"})
public class adicionarNoCarrinhoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();

        /* ------------------- USUARIO DESLOGADO ---------------- */
        if (sessao.getAttribute("loginStatus").equals("deslogado")) {
            int IDProduto = Integer.parseInt(request.getParameter("ID"));
            String status = "A";
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            int IDCarrinho = 0;

            Carrinho carrinho = new Carrinho(IDCarrinho, IDProduto, quantidade, status);
            Perfume P = null;
            try {
                P = PerfumeDAO.getByID(IDProduto);
                P.setQuantidade(quantidade);
            } catch (Exception ex) {
                Logger.getLogger(adicionarNoCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (sessao.getAttribute("listaCarrinho") == null) {
                List<Perfume> listaPerfumeCarrinho = new ArrayList<Perfume>();
                listaPerfumeCarrinho.add(P);
                int quantidadeDeItens = 0;
                if (listaPerfumeCarrinho != null) {
                    for (Perfume forPerfume : listaPerfumeCarrinho) {
                        quantidadeDeItens = quantidadeDeItens + P.getQuantidade();
                    }
                }

                sessao.setAttribute("listaCarrinho", listaPerfumeCarrinho);
                sessao.setAttribute("quantidadeDeItens", quantidadeDeItens);
            } else {
                List<Perfume> listaPerfumeCarrinho = (ArrayList) sessao.getAttribute("listaCarrinho");
                boolean exist = false;
                for(Perfume forPerfume : listaPerfumeCarrinho){
                    if(forPerfume.getID() == IDProduto){
                        listaPerfumeCarrinho.remove(forPerfume);
                        forPerfume.setQuantidade(forPerfume.getQuantidade() + quantidade);
                        listaPerfumeCarrinho.add(forPerfume);
                        exist = true;
                        break;
                    }
                }
                
                if(exist == false){
                    listaPerfumeCarrinho.add(P);
                } 
                
                int quantidadeDeItens = 0;
                if (listaPerfumeCarrinho != null) {
                    for (Perfume forLivro : listaPerfumeCarrinho) {
                        quantidadeDeItens = quantidadeDeItens + forLivro.getQuantidade();
                    }
                }
                sessao.setAttribute("listaCarrinho", listaPerfumeCarrinho);
                sessao.setAttribute("quantidadeDeItens", quantidadeDeItens);
            }

            request.getRequestDispatcher("home.jsp").forward(request, response);

            /* ------------------- FIM USUARIO DESLOGADO ---------------- */
            /* ------------------- USUARIO LOGADO ---------------- */
        } else {
            int IDProduto = Integer.parseInt(request.getParameter("ID"));
            String status = "A";
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            int IDCarrinho = (int) sessao.getAttribute("IDUsuario");

            Carrinho carrinho = new Carrinho(IDCarrinho, IDProduto, quantidade, status);
            try {
                Carrinho itemNoCarrinho = CarrinhoDAO.getByID(IDCarrinho, IDProduto);
                if (itemNoCarrinho == null) {
                    if (CarrinhoDAO.inserir(carrinho)) {
                        request.setAttribute("msgResposta", "Adicionado com sucesso!");
                    } else {
                        request.setAttribute("msgResposta", "Não Foi possível adicionar!");
                    }
                } else {
                    itemNoCarrinho.setQuantidade(itemNoCarrinho.getQuantidade() + 1);
                    if (CarrinhoDAO.atualizarQuantidade(itemNoCarrinho)) {
                        request.setAttribute("msgResposta", "Adicionado com sucesso!");
                    } else {
                        request.setAttribute("msgResposta", "Não Foi possível adicionar!");
                    }
                }
            } catch (Exception e) {
                e.getLocalizedMessage();
                System.out.println(e);
            }
            /* -------------DISPLAY DE ITENS DO CARRINHO-------------------- */
            List<Perfume> listaPerfumeCarrinho = null;
            try {
                listaPerfumeCarrinho = CarrinhoDAO.listarProdutos((int) sessao.getAttribute("IDUsuario"));
            } catch (Exception ex) {
                Logger.getLogger(consultaCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            int quantidadeDeItens = 0;
            if (listaPerfumeCarrinho != null) {
                for (Perfume P : listaPerfumeCarrinho) {
                    quantidadeDeItens = quantidadeDeItens + P.getQuantidade();
                }
            }
            sessao.setAttribute("quantidadeDeItens", quantidadeDeItens);
            /* -------------FIM DISPLAY DE ITENS DO CARRINHO-------------------- */
            request.getRequestDispatcher("home.jsp").forward(request, response);

        }

    }

}