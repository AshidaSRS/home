/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Banco;

import java.io.Serializable;

/**
 *
 * @author Ashida
 */
public class Titular implements Serializable{
    private String nombre;
    private String dni;
    private int edad;
    
    public Titular(String nombre, String dni, int edad){
        this.nombre=nombre;
        this.dni=dni;
        this.edad=edad;
    }
    
    public String getNombre(){
        return nombre;
    }
    public String getDNI(){
        return dni;
    }
    public int getEdad(){
        return edad;
    }
}
