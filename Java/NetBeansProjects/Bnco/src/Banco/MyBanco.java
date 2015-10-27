/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Banco;

import java.io.Serializable;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Ashida
 */
public class MyBanco extends UnicastRemoteObject implements Banco, Serializable{
    private MyCuenta cuenta;
    private Titular titular;
    private Map<String,Cuenta> almacen;
    private static int serie;
    
    public MyBanco() throws RemoteException{
        super();
        almacen=new HashMap<String,Cuenta>() {};
    }
    
    @Override
    public Cuenta crearCuenta(Titular t, int a) throws RemoteException{
        cuenta=new MyCuenta(t, a);
        almacen.put(cuenta.getTitular().getNombre(), cuenta);
        return cuenta;
    }
    @Override
    public Map<String, Cuenta> getCuentas() throws RemoteException{
        return almacen;
    }
    @Override
    public Titular crearTitular(String nombre, String dni, int edad) throws RemoteException{
        titular=new Titular(nombre, dni, edad);
        return titular;
    }

}
