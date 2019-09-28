/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import dao.ProductDao;
import entity.Product;
import jdbc.SQLServerConnection;

/**
 *
 * @author anhdt45
 */
public class Test {

    public static void main(String[] args) {
        Product p = Product.builder()
                .categoryId(1)
                .code("BL-001")
                .name("Balo 001")
                .price(2000000)
                .quantity(5)
                .description("Không có gì cả...")
                .status(1)
                .build();
        System.out.println(new ProductDao().update(p, 1));
        new ProductDao().getAll().forEach(System.out::println);
    }
}
