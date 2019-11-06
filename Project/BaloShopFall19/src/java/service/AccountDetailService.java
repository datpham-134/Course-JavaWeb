/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.AccountDetailDao;
import dao.MethodDao;
import entity.AccountDetail;
import java.util.List;

/**
 *
 * @author Shado
 */
public class AccountDetailService implements MethodService<AccountDetail> {

    MethodDao<AccountDetail> md = new AccountDetailDao();

    @Override
    public List<AccountDetail> getAll() {
        return md.getAll();
    }

    @Override
    public AccountDetail getOne(int id) {
        return md.getOne(id);
    }

    @Override
    public boolean add(AccountDetail object) {
        return md.add(object);
    }

    @Override
    public boolean update(AccountDetail object, int id) {
        return md.update(object, id);
    }

    @Override
    public boolean remove(int id) {
        return md.remove(id);
    }

}
