/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.ShipingInfoDao;
import entity.ShipingInfo;

/**
 *
 * @author Shado
 */
public class ShipingInfoService {
    
    public int addShipingInfoReturnId(ShipingInfo shipingInfo) {
        return new ShipingInfoDao().addShipingInfoReturnId(shipingInfo);
    }
}
