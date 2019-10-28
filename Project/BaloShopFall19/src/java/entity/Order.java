/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Shado
 */
@Builder
@Getter
@Setter
@ToString
public class Order {
    
    private int id;
    private int shipingInfoId;
    private String createDate;
    private double totalPrice;
    private String note;
    private int status;
}
