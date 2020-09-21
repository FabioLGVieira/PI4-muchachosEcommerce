package com.muchachos.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Fabio
 */
public class ConnectionDB {
    
         public static Connection getConnection()
            throws ClassNotFoundException, SQLException {
        Connection conn = null;

        // Passo 1: Registrar driver JDBC
        Class.forName("com.mysql.jdbc.Driver");
        // Passo 2: Obter a conexao
        conn = DriverManager.getConnection(
                "jdbc:mysql://127.0.0.1:3306/ECOMMERCE_PERFUMARIA",
                "root",
                "");
        return conn;
         }
    
}
