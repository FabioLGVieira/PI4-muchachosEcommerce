package com.muchachos.SERVLETS;

import com.muchachos.DAO.PerfumeDAO;
import com.muchachos.MODELS.Perfume;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Valter Lafuente Junior
 */
@WebServlet(name = "editarProdutoServlet", urlPatterns = {"/editarProdutoServlet"})
public class editarProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        /* Pega o ID na Página */
        int ID = Integer.parseInt(request.getParameter("ID"));
        String tipoUsuario = request.getParameter("tipo");
        Perfume P = null;

        try {
            /* Pega os Dados no Banco */
            P = PerfumeDAO.getByID(ID);
        } catch (Exception e) {
            e.printStackTrace();
            e.getLocalizedMessage();
            System.out.println("erro DAO produto: " + e);
        }
        /* CRIA OS ATRIBUTOS NO REQUEST*/
        request.setAttribute("ID", ID);
        request.setAttribute("perfume", P);
        /* RETORNA PRA PÁGINA DE EDITAR PRODUTOS */
        RequestDispatcher dispatcher = request.getRequestDispatcher("CRUD-PRODUTOS/editarProdutos.jsp");
        dispatcher.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        /* Cria os Parametros a partir dos itens preenchidos */
        int ID = Integer.parseInt(request.getParameter("ID"));
        String Status = "A";
        String NomeProduto = request.getParameter("Titulo");
        String Descricao = request.getParameter("Descricao");
        float ValorVenda = Float.parseFloat(request.getParameter("ValorVenda").replaceAll("\\,", "\\."));
        float ValorCusto = Float.parseFloat(request.getParameter("ValorCusto").replaceAll("\\,", "\\."));
        String Categoria = request.getParameter("Categoria");
        int Quantidade = Integer.parseInt(request.getParameter("Quantidade"));
        String Data = request.getParameter("Data");
         String Imagem = request.getParameter("imagemB64");
        String Imagem1 = request.getParameter("imagemB641");
        String Imagem2 = request.getParameter("imagemB642");
        float Peso = Float.parseFloat(request.getParameter("Peso"));
        String Tag = request.getParameter("Tag");

        /*CRIA OBJETO PERFUME*/
        Perfume P = new Perfume(ID, Status, NomeProduto, Descricao, ValorVenda, ValorCusto, Categoria, Quantidade, Data, Imagem,Imagem1,Imagem2, Peso, Tag);

       try {
            /* ATUALIZA NO BANCO ATRAVÉS DA DAO*/
           if (PerfumeDAO.atualizar(P)) {
                request.setAttribute("alertaResposta", "sucesso");
            } else {
                request.setAttribute("alertaResposta", "falha");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        /* RETORNA PRA PÁGINA DE CONSULTA*/
        request.getRequestDispatcher("consultaProdutoServlet").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
