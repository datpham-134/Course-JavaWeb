/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.OrderDao;
import entity.Order;

/**
 *
 * @author Shado
 */
public class OrderService {
    
    public int addOrderReturnId(Order order) {
        return new OrderDao().addOrderReturnId(order);
    }
}
