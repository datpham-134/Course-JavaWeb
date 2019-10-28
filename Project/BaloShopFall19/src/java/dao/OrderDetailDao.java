/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import jdbc.SQLServerConnection;

/**
 *
 * @author Shado
 */
public class OrderDetailDao {
    
    public boolean addListCart(List<Cart> list, int orderId) {
        String query = "INSERT INTO order_detail(order_id, product_id, product_name, product_price, quantity)"
                + " VALUES(?, ?, ?, ?, ?)";
        int[] arr = {};
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if(ps != null) {
                for(Cart c : list) {
                    ps.setObject(1, orderId);
                    ps.setObject(2, c.getProductId());
                    ps.setObject(3, c.getProductName());
                    ps.setObject(4, c.getProductPrice());
                    ps.setObject(5, c.getQuantity());
                    ps.addBatch();
                }
                arr = ps.executeBatch();
            }          
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return arr.length > 0;
    }
}
