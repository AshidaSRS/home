/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Banco;

import java.io.Serializable;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author Ashida
 */
public class MyCuenta extends UnicastRemoteObject implements Cuenta, Serializable{
    private Titular titular;
    private int saldo;
    
    public MyCuenta(Titular t, int s) throws RemoteException{
        super();
        this.titular=t;
        this.saldo=s;
    }
     @Override  
    public Titular getTitular() throws RemoteException{
        return titular;
    }
     @Override
    public int getSaldo() throws RemoteException{
        return saldo;
    }
    
    @Override
    public int ingresar(int cantidad) throws RemoteException{
        saldo+=cantidad;
        return saldo;
    }
}
