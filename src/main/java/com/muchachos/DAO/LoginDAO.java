package com.muchachos.DAO;

import com.muchachos.MODELS.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Valter Lafuente Junior
 */
public class LoginDAO {

    public static Usuario Logar(String usuario) throws Exception {
        String sql = "SELECT * FROM USUARIO WHERE USUARIO=?";
        Usuario user = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = ConnectionDB.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, usuario);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                user = new Usuario();
                user.setID(rs.getInt("ID"));
                user.setNome(rs.getString("NOME"));
                user.setUsuario(rs.getString("USUARIO"));
                user.setSenha(rs.getString("SENHA"));
                user.setEmail(rs.getString("EMAIL"));
                user.setTipo(rs.getString("TIPO"));
                user.setDataNascimento(rs.getString("DATANASC"));
                user.setCelular(rs.getString("CELULAR"));
                user.setCPF(rs.getString("CPF"));
            }
        } finally {
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }

            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
        return user;
    }

}
