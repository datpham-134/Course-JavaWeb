/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jdbc.SQLServerConnection;

/**
 *
 * @author anhdt45
 */
public class ProductDao implements MethodDao<Product> {

    @Override
    public List<Product> getAll() {
        String query = "SELECT * FROM product";
        List<Product> list = new ArrayList<>();
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            while (rs != null && rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .categoryId(rs.getInt(2))
                        .code(rs.getString(3))
                        .name(rs.getString(4))
                        .quantity(rs.getInt(5))
                        .price(rs.getDouble(6))
                        .description(rs.getString(7))
                        .image(rs.getString(8))
                        .createDate(rs.getString(9))
                        .status(rs.getInt(10))
                        .build();
                list.add(product);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public Product getOne(int id) {
        String query = "SELECT * FROM product WHERE id = ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Product product = Product.builder()
                            .id(rs.getInt(1))
                            .categoryId(rs.getInt(2))
                            .code(rs.getString(3))
                            .name(rs.getString(4))
                            .quantity(rs.getInt(5))
                            .price(rs.getDouble(6))
                            .description(rs.getString(7))
                            .image(rs.getString(8))
                            .createDate(rs.getString(9))
                            .status(rs.getInt(10))
                            .build();
                    return product;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(Product obj) {
        String query = "INSERT INTO product(category_id, code, name, quantity, price,"
                + " description, image, status)"
                + " VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, obj.getCategoryId());
                ps.setObject(2, obj.getCode());
                ps.setObject(3, obj.getName());
                ps.setObject(4, obj.getQuantity());
                ps.setObject(5, obj.getPrice());
                ps.setObject(6, obj.getDescription());
                ps.setObject(7, obj.getImage());
                ps.setObject(8, obj.getStatus());
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean update(Product obj, int id) {
        String query = "UPDATE product SET category_id = ?, code = ?, name = ?,"
                + "quantity = ?, price = ?, description = ?, image = ?,"
                + "status = ? WHERE id = ?";
        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, obj.getCategoryId());
                ps.setObject(2, obj.getCode());
                ps.setObject(3, obj.getName());
                ps.setObject(4, obj.getQuantity());
                ps.setObject(5, obj.getPrice());
                ps.setObject(6, obj.getDescription());
                ps.setObject(7, obj.getImage());
                ps.setObject(8, obj.getStatus());
                ps.setObject(9, id);
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean remove(int id) {
        String query = "DELETE FROM product WHERE id = ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                return ps.execute();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return false;
    }

}
