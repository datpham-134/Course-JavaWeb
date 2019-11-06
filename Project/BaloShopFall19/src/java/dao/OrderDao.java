/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import jdbc.SQLServerConnection;

/**
 *
 * @author Shado
 */
public class OrderDao {
    
    public int addOrderReturnId(Order order) {
        String query = "INSERT INTO [order](account_id, shiping_info_id, total_price, note, status)"
                + " VALUES(?, ?, ?, ?, ?)";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS) : null;) {
            if(ps != null) {
                ps.setObject(1, order.getAccountId());
                ps.setObject(2, order.getShipingInfoId());
                ps.setObject(3, order.getTotalPrice());
                ps.setObject(4, order.getNote());
                ps.setObject(5, order.getStatus());
                int isCheck = ps.executeUpdate();
                if(isCheck > 0) {
                    ResultSet rs = ps.getGeneratedKeys();
                    rs.next();
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }
}
