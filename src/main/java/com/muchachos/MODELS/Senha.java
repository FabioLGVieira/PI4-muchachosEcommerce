package com.muchachos.MODELS;

import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Valter
 */
public class Senha {

    private static int workload = 12;

    public String hashSenha(String senha) {
        String salt = BCrypt.gensalt(workload);
        String hashed_senha = BCrypt.hashpw(senha, salt);

        return (hashed_senha);
    }

    public boolean checkPassword(String senha, String stored_hash) {
        boolean password_verified = false;

        if (null == stored_hash || !stored_hash.startsWith("$2a$")) {
            throw new java.lang.IllegalArgumentException("Invalid hash provided for comparison");
        }

        password_verified = BCrypt.checkpw(senha, stored_hash);

        return (password_verified);
    }
}
