/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author Shado
 */
public class NumberHelper {

    public static int getId(String strNumber) {
        int number = -1;
        try {
            number = Integer.parseInt(strNumber);
        }catch(NumberFormatException e){
            e.printStackTrace(System.out);
        }
        return number;
    }
}
