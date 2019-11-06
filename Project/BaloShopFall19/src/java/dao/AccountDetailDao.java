/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.AccountDetail;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import jdbc.SQLServerConnection;

/**
 *
 * @author Shado
 */
public class AccountDetailDao implements MethodDao<AccountDetail> {

    @Override
    public List<AccountDetail> getAll() {
        return null;
    }

    @Override
    public AccountDetail getOne(int id) {
        String query = "SELECT * FROM account_detail WHERE id = ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    AccountDetail accountDetail = AccountDetail.builder()
                            .id(rs.getInt(1))
                            .name(rs.getString(2))
                            .mobile(rs.getString(3))
                            .gender(rs.getInt(4))
                            .address(rs.getString(5))
                            .build();
                    return accountDetail;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(AccountDetail object) {
        return false;
    }

    @Override
    public boolean update(AccountDetail object, int id) {
        return false;
    }

    @Override
    public boolean remove(int id) {
        return false;
    }

}
