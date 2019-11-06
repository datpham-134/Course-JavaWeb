/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jdbc.SQLServerConnection;

/**
 *
 * @author Shado
 */
public class AccountDao {
    
    public Account login(String email, String password) {
        String query = "SELECT * FROM account WHERE email = ? AND password = ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, email);
                ps.setObject(2, password);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Account account = Account.builder()
                            .id(rs.getInt(1))
                            .accountDetailId(rs.getInt(2))
                            .email(rs.getString(3))
                            .password(rs.getString(4))
                            .roleId(rs.getInt(5))
                            .createDate(rs.getString(6))
                            .activeCode(rs.getString(7))
                            .status(rs.getInt(8))
                            .build();
                    return account;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
}
