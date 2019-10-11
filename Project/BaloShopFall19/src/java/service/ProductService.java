/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.MethodDao;
import dao.ProductDao;
import entity.Product;
import java.util.List;

/**
 *
 * @author Shado
 */
public class ProductService implements MethodService<Product> {

    MethodDao<Product> md = new ProductDao();
    
    /**
     * {@inheritDoc}
     */
    @Override
    public List<Product> getAll() {
        return md.getAll();
    }
    
    public List<Product> getAllByCategoryId(int categoryId) {
        return new ProductDao().getAllByCategoryId(categoryId);
    }
    
    public List<Product> search(String text) {
        return new ProductDao().search(text);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Product getOne(int id) {
        return md.getOne(id);
    }

    @Override
    public boolean add(Product object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Product object, int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean remove(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
