package com.muchachos.SERVLETS;

import com.muchachos.DAO.CarrinhoDAO;
import com.muchachos.MODELS.Perfume;
import java.io.IOException;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
 * @author Diego Queiroz
 */

@WebServlet(name = "consultaCarrinhoServlet", urlPatterns = {"/consultaCarrinhoServlet"})
public class consultaCarrinhoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();
        String loginStatus = (String) sessao.getAttribute("loginStatus");

        if (loginStatus == null || loginStatus.equals("deslogado")) {
            List<Perfume> listaLivroCarrinho = (ArrayList) sessao.getAttribute("listaCarrinho");

            //----------------------VALOR/QUANTIDADE/DATA---------------------------
            float valorTotal = 0;
            int quantidadeDeItens = 0;
            if (listaLivroCarrinho != null) {

                for (Perfume P : listaLivroCarrinho) {
                    valorTotal = valorTotal + (P.getValorVenda() * P.getQuantidade());
                    quantidadeDeItens = quantidadeDeItens + P.getQuantidade();
                }
            }
            //Formatando Valores para PTBR
            Locale ptBr = new Locale("pt", "BR");
            String valorString = NumberFormat.getCurrencyInstance(ptBr).format(valorTotal);
            LocalDate myObj = LocalDate.now();
            DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String formattedDate = myObj.format(myFormatObj);
            //----------------------VALOR/QUANTIDADE/DATA---------------------------

            request.setAttribute("dataAtual", formattedDate);
            request.setAttribute("valorTotalNoCarrinho", valorString);
            request.setAttribute("quantidadeDeItens", quantidadeDeItens);
            sessao.setAttribute("quantidadeDeItens", quantidadeDeItens);
            request.setAttribute("listaCarrinho", listaLivroCarrinho);

            request.getRequestDispatcher("consultaCarrinho.jsp").forward(request, response);

        } /*************** USUARIO LOGADO ******************/ else {

        int IDUsuario = (int) sessao.getAttribute("IDUsuario");

        List<Perfume> listaLivroCarrinho = null;
        try {
            listaLivroCarrinho = CarrinhoDAO.listarProdutos(IDUsuario);
        } catch (Exception ex) {
            Logger.getLogger(consultaCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        //----------------------VALOR/QUANTIDADE/DATA---------------------------
        float valorTotal = 0;
        int quantidadeDeItens = 0;
        if (listaLivroCarrinho != null) {

            for (Perfume P : listaLivroCarrinho) {
                valorTotal = valorTotal + (P.getValorVenda() * P.getQuantidade());
                quantidadeDeItens = quantidadeDeItens + P.getQuantidade();
            }
        }
        //Formatando Valores para PTBR
        Locale ptBr = new Locale("pt", "BR");
        String valorString = NumberFormat.getCurrencyInstance(ptBr).format(valorTotal);
        LocalDate myObj = LocalDate.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String formattedDate = myObj.format(myFormatObj);
        //----------------------VALOR/QUANTIDADE/DATA---------------------------

        request.setAttribute("dataAtual", formattedDate);
        sessao.setAttribute("dataAtual", formattedDate);
        request.setAttribute("valorTotalNoCarrinho", valorString);
        sessao.setAttribute("valorTotalNoCarrinho", valorString);
        request.setAttribute("quantidadeDeItens", quantidadeDeItens);
        sessao.setAttribute("quantidadeDeItens", quantidadeDeItens);
        request.setAttribute("listaCarrinho", listaLivroCarrinho);
        sessao.setAttribute("listaCarrinho", listaLivroCarrinho);

        request.getRequestDispatcher("consultaCarrinho.jsp").forward(request, response);
        }
    }
}
