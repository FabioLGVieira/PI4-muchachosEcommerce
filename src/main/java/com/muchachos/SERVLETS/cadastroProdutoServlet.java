package com.muchachos.SERVLETS;

import com.muchachos.DAO.PerfumeDAO;
import com.muchachos.MODELS.Perfume;
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
@WebServlet(name = "cadastroProdutoServlet", urlPatterns = {"/cadastroProdutoServlet"})
public class cadastroProdutoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String Status = "A";
        String NomeProduto = request.getParameter("Titulo");
        String Descricao = request.getParameter("Descricao");
        float ValorVenda = Float.parseFloat(request.getParameter("ValorVenda").replaceAll("\\,", "\\."));
        float ValorCusto = Float.parseFloat(request.getParameter("ValorCusto").replaceAll("\\,", "\\."));
        String Categoria = request.getParameter("Categoria");
        int Quantidade = Integer.parseInt(request.getParameter("Quantidade"));
        String Data = request.getParameter("DataCadastro");
        String Imagem = request.getParameter("imagemB64");
        String Imagem1 = request.getParameter("imagemB641");
        String Imagem2 = request.getParameter("imagemB642");
        float Peso = Float.parseFloat(request.getParameter("Peso"));
        String Tag = request.getParameter("Tag");
        System.out.printf(Status, NomeProduto, Descricao, ValorVenda, ValorCusto, Categoria, Quantidade, Data, Imagem,Imagem1,Imagem2, Peso, Tag);
       Perfume P = new Perfume(Status, NomeProduto, Descricao, ValorVenda, ValorCusto, Categoria, Quantidade, Data, Imagem,Imagem1,Imagem2, Peso, Tag);

        try {
            if (PerfumeDAO.inserir(P)) {
                request.setAttribute("alertaResposta", "sucesso");
            } else {
                request.setAttribute("alertaResposta", "falha");
            }
        } catch (Exception ex) {
            Logger.getLogger(cadastroProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("JSP-PAGES/CRUD-PRODUTOS/cadastrarProdutos.jsp").forward(request, response);
    }

}
