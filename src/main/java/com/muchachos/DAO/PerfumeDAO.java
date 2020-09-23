package com.muchachos.DAO;

import com.muchachos.MODELS.Perfume;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Valter Lafuente Junior
 */
public class PerfumeDAO {

    public static boolean inserir(Perfume perfume)
            throws SQLException, Exception {
        /*Monta a string de inserção de um cliente no BD,
        utilizando os dados do clientes passados como parâmetro*/
        String sql = "INSERT INTO PRODUTOS (STATUS,TITULO,DESCRICAO,VALORVENDA,VALORCUSTO,CATEGORIA,QUANTIDADE,DATACADASTRO,IMAGEM,IMAGEM1,IMAGEM2,PESO,TAG) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = ConnectionDB.getConnection();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);
            //Configura os parâmetros do "PreparedStatement"
            preparedStatement.setString(1, perfume.getStatus());
            preparedStatement.setString(2, perfume.getTitulo());
            preparedStatement.setString(3, perfume.getDescricao());
            preparedStatement.setFloat(4, perfume.getValorVenda());
            preparedStatement.setFloat(5, perfume.getValorCusto());
            preparedStatement.setString(6, perfume.getCategoria());
            preparedStatement.setInt(7, perfume.getQuantidade());
            preparedStatement.setString(8, perfume.getData());
            preparedStatement.setString(9, perfume.getImagem());
            preparedStatement.setString(10, perfume.getImagem1());
            preparedStatement.setString(11, perfume.getImagem2());
            preparedStatement.setFloat(12, perfume.getPeso());
             preparedStatement.setString(13, perfume.getTag());
            //Executa o comando no banco de dados
            preparedStatement.execute();
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
            return false;
        } finally {
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
        return true;
    }

    public static List<Perfume> listar()
            throws SQLException, Exception {
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.PRODUTOS WHERE STATUS != 'I'";
        //Lista de clientes de resultado
        List<Perfume> listaProduto = null;
        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        //Armazenará os resultados do banco de dados
        ResultSet result = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = ConnectionDB.getConnection();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);

            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaProduto == null) {
                    listaProduto = new ArrayList<Perfume>();
                }
                //Cria uma instância de Cliente e popula com os valores do BD

                int ID = result.getInt("ID");
                String Status = result.getString("STATUS");
                String Titulo = result.getString("TITULO");
                String Descricao = result.getString("DESCRICAO");
                float ValorVenda = result.getFloat("VALORVENDA");
                float ValorCusto = result.getFloat("VALORCUSTO");
                String Categoria = result.getString("CATEGORIA");
                int Quantidade = Integer.parseInt(result.getString("QUANTIDADE"));
                String Data = result.getString("DATACADASTRO");
                 String Imagem = result.getString("IMAGEM");
                String Imagem1 = result.getString("IMAGEM1");
                String Imagem2 = result.getString("IMAGEM2");
                float Peso = result.getFloat("PESO");
                String Tag = result.getString("TAG");
              
                Perfume P = new Perfume(Status, Titulo, Descricao, ValorVenda, ValorCusto, Categoria, Quantidade, Data, Imagem, Imagem1,Imagem2, Peso, Tag);
                //Adiciona a instância na lista
                listaProduto.add(P);
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        } finally {
            //Se o result ainda estiver aberto, realiza seu fechamento
            if (result != null && !result.isClosed()) {
                result.close();
            }
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
        //Retorna a lista de clientes do banco de dados
        return listaProduto;
    }

    public static List<Perfume> listarMaisVendidos()
            throws SQLException, Exception {
        //Monta a string de listagem de clientes no banco, considerando
        //apenas a coluna de ativação de clientes ("enabled")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.PRODUTOS WHERE STATUS != 'I' AND TAG = 'Mais Vendidos' LIMIT 20";
        //Lista de clientes de resultado
        List<Perfume> listaProduto = null;
        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        //Armazenará os resultados do banco de dados
        ResultSet result = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = ConnectionDB.getConnection();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);

            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaProduto == null) {
                    listaProduto = new ArrayList<Perfume>();
                }
                //Cria uma instância de Cliente e popula com os valores do BD

                int ID = result.getInt("ID");
                String Status = result.getString("STATUS");
                String Titulo = result.getString("TITULO");
                String Descricao = result.getString("DESCRICAO");
                float ValorVenda = result.getFloat("VALORVENDA");
                float ValorCusto = result.getFloat("VALORCUSTO");
                String Categoria = result.getString("CATEGORIA");
                int Quantidade = Integer.parseInt(result.getString("QUANTIDADE"));
                String Data = result.getString("DATACADASTRO");
                 String Imagem = result.getString("IMAGEM");
                String Imagem1 = result.getString("IMAGEM1");
                String Imagem2 = result.getString("IMAGEM2");
                float Peso = result.getFloat("PESO");
                String Tag = result.getString("TAG");
                System.out.printf(Status, Titulo, Descricao, ValorVenda, ValorCusto, Categoria, Quantidade, Data, Imagem, Imagem1,Imagem2, Peso, Tag);
                Perfume P = new Perfume(Status, Titulo, Descricao, ValorVenda, ValorCusto, Categoria, Quantidade, Data, Imagem, Imagem1,Imagem2, Peso, Tag);
                //Adiciona a instância na lista
                listaProduto.add(P);
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        } finally {
            //Se o result ainda estiver aberto, realiza seu fechamento
            if (result != null && !result.isClosed()) {
                result.close();
            }
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
        //Retorna a lista de clientes do banco de dados
        return listaProduto;
    }
    
    public static List<Perfume> listarNovos()
            throws SQLException, Exception {
        //Monta a string de listagem de clientes no banco, considerando
        //apenas a coluna de ativação de clientes ("enabled")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.PRODUTOS WHERE STATUS != 'I' AND TAG = 'Lançamento' LIMIT 20";
        //Lista de clientes de resultado
        List<Perfume> listaProduto = null;
        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        //Armazenará os resultados do banco de dados
        ResultSet result = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = ConnectionDB.getConnection();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);

            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaProduto == null) {
                    listaProduto = new ArrayList<Perfume>();
                }
                //Cria uma instância de Cliente e popula com os valores do BD

               int ID = result.getInt("ID");
                String Status = result.getString("STATUS");
                String Titulo = result.getString("TITULO");
                String Descricao = result.getString("DESCRICAO");
                float ValorVenda = result.getFloat("VALORVENDA");
                float ValorCusto = result.getFloat("VALORCUSTO");
                String Categoria = result.getString("CATEGORIA");
                int Quantidade = Integer.parseInt(result.getString("QUANTIDADE"));
                String Data = result.getString("DATACADASTRO");
                 String Imagem = result.getString("IMAGEM");
                String Imagem1 = result.getString("IMAGEM1");
                String Imagem2 = result.getString("IMAGEM2");
                float Peso = result.getFloat("PESO");
                String Tag = result.getString("TAG");
              
                Perfume P = new Perfume(Status, Titulo, Descricao, ValorVenda, ValorCusto, Categoria, Quantidade, Data, Imagem, Imagem1,Imagem2, Peso, Tag);
                //Adiciona a instância na lista
                listaProduto.add(P);
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        } finally {
            //Se o result ainda estiver aberto, realiza seu fechamento
            if (result != null && !result.isClosed()) {
                result.close();
            }
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
        //Retorna a lista de clientes do banco de dados
        return listaProduto;
    }
    
    public static List<Perfume> listarMenorPreco()
            throws SQLException, Exception {
        //Monta a string de listagem de clientes no banco, considerando
        //apenas a coluna de ativação de clientes ("enabled")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.PRODUTOS WHERE STATUS != 'I' ORDER BY VALORVENDA LIMIT 20";
        //Lista de clientes de resultado
        List<Perfume> listaProduto = null;
        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        //Armazenará os resultados do banco de dados
        ResultSet result = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = ConnectionDB.getConnection();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);

            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaProduto == null) {
                    listaProduto = new ArrayList<Perfume>();
                }
                //Cria uma instância de Cliente e popula com os valores do BD

               int ID = result.getInt("ID");
                String Status = result.getString("STATUS");
                String Titulo = result.getString("TITULO");
                String Descricao = result.getString("DESCRICAO");
                float ValorVenda = result.getFloat("VALORVENDA");
                float ValorCusto = result.getFloat("VALORCUSTO");
                String Categoria = result.getString("CATEGORIA");
                int Quantidade = Integer.parseInt(result.getString("QUANTIDADE"));
                String Data = result.getString("DATACADASTRO");
                 String Imagem = result.getString("IMAGEM");
                String Imagem1 = result.getString("IMAGEM1");
                String Imagem2 = result.getString("IMAGEM2");
                float Peso = result.getFloat("PESO");
                String Tag = result.getString("TAG");
              
                Perfume P = new Perfume(Status, Titulo, Descricao, ValorVenda, ValorCusto, Categoria, Quantidade, Data, Imagem, Imagem1,Imagem2, Peso, Tag);
                //Adiciona a instância na lista
                listaProduto.add(P);
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        } finally {
            //Se o result ainda estiver aberto, realiza seu fechamento
            if (result != null && !result.isClosed()) {
                result.close();
            }
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
        //Retorna a lista de clientes do banco de dados
        return listaProduto;
    }

    public static List<Perfume> buscar(String busca)
            throws SQLException, Exception {
        //Monta a string de listagem de produtos no banco
        String sql = "SELECT * FROM PRODUTOS WHERE (STATUS != 'I' AND TITULO  LIKE  ?) or (STATUS != 'I' AND STATUS LIKE ?)"
                + " or (STATUS != 'I' AND VALORVENDA  LIKE  ?) or (STATUS != 'I' AND CATEGORIA LIKE ?)"
                + " or (STATUS != 'I' AND DATACADASTRO LIKE ?) or (STATUS != 'I' AND TAG LIKE ?)";
        busca = '%' + busca + '%';
        //Lista de livros de resultado
        List<Perfume> listaProduto = null;
        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        //Armazenará os resultados do banco de dados
        ResultSet result = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = ConnectionDB.getConnection();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, busca);
            preparedStatement.setString(2, busca);
            preparedStatement.setString(3, busca);
            preparedStatement.setString(4, busca);
            preparedStatement.setString(5, busca);
            preparedStatement.setString(6, busca);
            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaProduto == null) {
                    listaProduto = new ArrayList<Perfume>();
                }
                //Cria uma instância de Livros e popula com os valores do BD

              int ID = result.getInt("ID");
                String Status = result.getString("STATUS");
                String Titulo = result.getString("TITULO");
                String Descricao = result.getString("DESCRICAO");
                float ValorVenda = result.getFloat("VALORVENDA");
                float ValorCusto = result.getFloat("VALORCUSTO");
                String Categoria = result.getString("CATEGORIA");
                int Quantidade = Integer.parseInt(result.getString("QUANTIDADE"));
                String Data = result.getString("DATACADASTRO");
                 String Imagem = result.getString("IMAGEM");
                String Imagem1 = result.getString("IMAGEM1");
                String Imagem2 = result.getString("IMAGEM2");
                float Peso = result.getFloat("PESO");
                String Tag = result.getString("TAG");
              
                Perfume P = new Perfume(ID,Status, Titulo, Descricao, ValorVenda, ValorCusto, Categoria, Quantidade, Data, Imagem, Imagem1,Imagem2, Peso, Tag);
                //Adiciona a instância na lista
                listaProduto.add(P);
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        } finally {
            //Se o result ainda estiver aberto, realiza seu fechamento
            if (result != null && !result.isClosed()) {
                result.close();
            }
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
        //Retorna a lista de livros do banco de dados
        return listaProduto;
    }

    public static Perfume getByID(int ID)
            throws SQLException, Exception {
        //Monta a string de listagem de livros no banco, considerando
        //apenas a coluna de ativação de livros ("enabled")
        String sql = "SELECT * FROM ECOMMERCE_PROJECT.PRODUTOS WHERE ID =? ";
        //Lista de clientes de resultado
        Perfume perfume = null;
        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        //Armazenará os resultados do banco de dados
        ResultSet result = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = ConnectionDB.getConnection();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);
            //Configura os parâmetros do "PreparedStatement"
            preparedStatement.setInt(1, ID);

            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (perfume == null) {
                    perfume = new Perfume();
                }
                //Cria uma instância de Cliente e popula com os valores do BD

                int IDperfume = result.getInt("ID");
                String Status = result.getString("STATUS");
                String Titulo = result.getString("TITULO");
                String Descricao = result.getString("DESCRICAO");
                float ValorVenda = result.getFloat("VALORVENDA");
                float ValorCusto = result.getFloat("VALORCUSTO");
                String Categoria = result.getString("CATEGORIA");
                int Quantidade = Integer.parseInt(result.getString("QUANTIDADE"));
                String Data = result.getString("DATACADASTRO");
                String Imagem = result.getString("IMAGEM");
                String Imagem1 = result.getString("IMAGEM1");
                String Imagem2 = result.getString("IMAGEM2");
                float Peso = result.getFloat("PESO");
                String Tag = result.getString("TAG");
                System.out.println(IDperfume + Status + Titulo + Descricao + ValorVenda + ValorCusto + Categoria + Quantidade + Data + Imagem + Imagem1 + Imagem2 + Peso + Tag);
                Perfume P = new Perfume(IDperfume,Status, Titulo, Descricao, ValorVenda, ValorCusto, Categoria, Quantidade, Data, Imagem, Imagem1,Imagem2, Peso, Tag);
                
                //Adiciona a instância na lista
                perfume = P;
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        } finally {
            //Se o result ainda estiver aberto, realiza seu fechamento
            if (result != null && !result.isClosed()) {
                result.close();
            }
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
        //Retorna a lista de clientes do banco de dados
        return perfume;
    }
    
    public static List<Perfume> buscarPorTitulo(String titulo, int ID)
            throws SQLException, Exception {
        //Monta a string de listagem de produtos no banco
        String sql = "SELECT * FROM PRODUTOS WHERE (STATUS != 'I' AND TITULO LIKE ? AND ID != ?)";
        titulo = '%' + titulo + '%';
        
        //Lista de produtos de resultado
        List<Perfume> listaProduto = null;
        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        //Armazenará os resultados do banco de dados
        ResultSet result = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = ConnectionDB.getConnection();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, titulo);
            preparedStatement.setInt(2, ID);
            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaProduto == null) {
                    listaProduto = new ArrayList<Perfume>();
                }
                //Cria uma instância de Produtos e popula com os valores do BD

                int IDs = result.getInt("ID");
                String Status = result.getString("STATUS");
                String Titulo = result.getString("TITULO");
                String Descricao = result.getString("DESCRICAO");
                String Imagem = result.getString("IMAGEM");
                String Imagem1 = result.getString("IMAGEM1");
                String Imagem2 = result.getString("IMAGEM2");
                float ValorVenda = result.getFloat("VALORVENDA");
                float ValorCusto = result.getFloat("VALORCUSTO");
                String Categoria = result.getString("CATEGORIA");
                int Quantidade = Integer.parseInt(result.getString("QUANTIDADE"));
                String Data = result.getString("DATACADASTRO");
                float Peso = result.getFloat("PESO");
                String Tag = result.getString("TAG");
                //Crio o Objeto livro com os valores
                Perfume P = new Perfume(IDs, Status, Titulo, Descricao, ValorVenda, ValorCusto, Categoria, Quantidade, Data, Imagem, Imagem1, Imagem2, Peso, Tag);
                //Adiciona a instância na lista
                listaProduto.add(P);
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        } finally {
            //Se o result ainda estiver aberto, realiza seu fechamento
            if (result != null && !result.isClosed()) {
                result.close();
            }
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
        //Retorna a lista de clientes do banco de dados
        return listaProduto;
    }
    
    public static List<Perfume> buscarPorTag(String tag)
            throws SQLException, Exception {
        //Monta a string de listagem de produtos no banco
        String sql = "SELECT * FROM PRODUTOS WHERE (STATUS != 'I' AND TAG LIKE ?)";
        tag = '%' + tag + '%';
        //Lista de produtos de resultado
        List<Perfume> listaProduto = null;
        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        //Armazenará os resultados do banco de dados
        ResultSet result = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = ConnectionDB.getConnection();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, tag);
            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //Itera por cada item do resultado
            while (result.next()) {
                //Se a lista não foi inicializada, a inicializa
                if (listaProduto == null) {
                    listaProduto = new ArrayList<Perfume>();
                }
                //Cria uma instância de Produtos e popula com os valores do BD

                int ID = result.getInt("ID");
                String Status = result.getString("STATUS");
                String Titulo = result.getString("TITULO");
                String Descricao = result.getString("DESCRICAO");
                float ValorVenda = result.getFloat("VALORVENDA");
                float ValorCusto = result.getFloat("VALORCUSTO");
                String Categoria = result.getString("CATEGORIA");
                int Quantidade = Integer.parseInt(result.getString("QUANTIDADE"));
                String Data = result.getString("DATACADASTRO");
                 String Imagem = result.getString("IMAGEM");
                String Imagem1 = result.getString("IMAGEM1");
                String Imagem2 = result.getString("IMAGEM2");
                float Peso = result.getFloat("PESO");
                String Tag = result.getString("TAG");
              
                Perfume P = new Perfume(ID,Status, Titulo, Descricao, ValorVenda, ValorCusto, Categoria, Quantidade, Data, Imagem, Imagem1,Imagem2, Peso, Tag);
                //Adiciona a instância na lista
                listaProduto.add(P);
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
        } finally {
            //Se o result ainda estiver aberto, realiza seu fechamento
            if (result != null && !result.isClosed()) {
                result.close();
            }
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
        //Retorna a lista de clientes do banco de dados
        return listaProduto;
    }
    
    

    public static boolean atualizar(Perfume perfume)
            throws SQLException, Exception {
        /*Monta a string de inserção de um cliente no BD,
        utilizando os dados do clientes passados como parâmetro*/
        String sql = "UPDATE PRODUTOS SET STATUS=?, TITULO=?, DESCRICAO=?, VALORVENDA=?, VALORCUSTO=?, CATEGORIA=?, QUANTIDADE=?, DATACADASTRO=?, IMAGEM=?, PESO=?,TAG=? WHERE ID=?";
        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = ConnectionDB.getConnection();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);
            //Configura os parâmetros do "PreparedStatement"
            preparedStatement.setString(1, perfume.getStatus());
            preparedStatement.setString(2, perfume.getTitulo());
            preparedStatement.setString(3, perfume.getDescricao());
            preparedStatement.setFloat(4, perfume.getValorVenda());
            preparedStatement.setFloat(5, perfume.getValorCusto());
            preparedStatement.setString(6, perfume.getCategoria());
            preparedStatement.setInt(7, perfume.getQuantidade());
            preparedStatement.setString(8, perfume.getData());
            preparedStatement.setString(9, perfume.getImagem());
            preparedStatement.setFloat(10, perfume.getPeso());
            preparedStatement.setString(11, perfume.getTag());
            preparedStatement.setInt(12, perfume.getID());
            //Executa o comando no banco de dados
            preparedStatement.execute();
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
            return false;
        } finally {
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
        return true;
    }

    public static boolean atualizarStatus(Perfume perfume)
            throws SQLException, Exception {
        /*Monta a string de inserção de um cliente no BD,
        utilizando os dados do clientes passados como parâmetro*/
        String sql = "UPDATE PRODUTOS SET STATUS = ? WHERE ID=?";
        //Conexão para abertura e fechamento
        Connection connection = null;
        //Statement para obtenção através da conexão, execução de
        //comandos SQL e fechamentos
        PreparedStatement preparedStatement = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = ConnectionDB.getConnection();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);
            //Configura os parâmetros do "PreparedStatement"
            preparedStatement.setString(1, perfume.getStatus());
            preparedStatement.setInt(2, perfume.getID());
            //Executa o comando no banco de dados
            preparedStatement.execute();
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println(e);
            return false;
        } finally {
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
        return true;
    }

  
    
}
