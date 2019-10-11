/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.ImageDao;
import entity.Image;
import java.util.List;

/**
 *
 * @author Shado
 */
public class ImageService {
    
    public List<Image> getAllByProductId(int productId) {
        return new ImageDao().getAllByProductId(productId);
    }
}
