/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.AccountDao;
import entity.Account;

/**
 *
 * @author Shado
 */
public class AccountService {
    
    public Account login(String email, String password) {
        return new AccountDao().login(email, password);
    }
}
