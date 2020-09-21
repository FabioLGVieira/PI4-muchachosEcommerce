/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muchachos.DAO;

import com.muchachos.MODELS.Endereco;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Fabio
 */
public class EnderecoDAO {

    public static boolean inserir(Endereco endereco)
            throws SQLException, Exception {
        /*Monta a string de inserção de um endereco no BD,
        utilizando os dados do endereco passados como parâmetro*/
        String sql = "INSERT INTO ENDERECOS (ID,IDUSUARIO, STATUS,CEP, CIDADE,ESTADO,ENDERECO,COMPLEMENTO)"
                + "VALUES (?,?,?,?,?,?,?,?)";
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
            preparedStatement.setInt(1, endereco.getID());
            preparedStatement.setInt(2, endereco.getIDUSUARIO());
            preparedStatement.setString(3, endereco.getStatus());
            preparedStatement.setString(4, endereco.getCEP());
            preparedStatement.setString(5, endereco.getCidade());
            preparedStatement.setString(6, endereco.getEstado());
            preparedStatement.setString(7, endereco.getEndereco());
            preparedStatement.setString(8, endereco.getComplemento());

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
