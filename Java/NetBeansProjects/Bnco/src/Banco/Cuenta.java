/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Banco;

import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 *
 * @author Ashida
 */
public interface Cuenta extends Remote{
    Titular getTitular() throws RemoteException;
    int getSaldo() throws RemoteException;
    int ingresar(int cantidad) throws RemoteException;
}
