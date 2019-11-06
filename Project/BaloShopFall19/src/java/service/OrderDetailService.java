/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.OrderDetailDao;
import entity.Cart;
import java.util.List;

/**
 *
 * @author Shado
 */
public class OrderDetailService {
    
    public boolean addListCart(List<Cart> list, int orderId) {
        return new OrderDetailDao().addListCart(list, orderId);
    }
}
