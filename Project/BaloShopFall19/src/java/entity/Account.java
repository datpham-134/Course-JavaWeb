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
public class Account {
    
    private int id;
    private int accountDetailId;
    private String email;
    private String password;
    private int roleId;
    private String createDate;
    private String activeCode;
    private int status;
}
