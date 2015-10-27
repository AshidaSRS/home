/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Banco;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.Map;

/**
 *
 * @author Ashida
 */
public interface Banco extends Remote{
    Cuenta crearCuenta(Titular t, int s) throws RemoteException;
    Map<String, Cuenta> getCuentas() throws RemoteException;
    Titular crearTitular(String nombre, String dni, int edad) throws RemoteException;
}

