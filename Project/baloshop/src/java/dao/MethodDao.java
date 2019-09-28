/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;

/**
 *
 * @author anhdt45
 * @param <T>
 */
public interface MethodDao<T> {
    
    List<T> getAll();
    T getOne(int id);
    boolean add(T obj);
    boolean update(T obj, int id);
    boolean remove(int id);
}
