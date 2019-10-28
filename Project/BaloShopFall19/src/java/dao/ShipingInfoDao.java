/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.ShipingInfo;
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
public class ShipingInfoDao {
    
    public int addShipingInfoReturnId(ShipingInfo shipingInfo) {
        String query = "INSERT INTO shiping_info(name, mobile, address)"
                + " VALUES(?, ?, ?)";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS) : null;) {
            if(ps != null) {
                ps.setObject(1, shipingInfo.getName());
                ps.setObject(2, shipingInfo.getMobile());
                ps.setObject(3, shipingInfo.getAddress());
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
