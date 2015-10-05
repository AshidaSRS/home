/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validationname;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.HashMap;

/**
 *
 * @author Ashida
 */
public interface ValidationInterfaz extends Remote
{
    public String login(String name, String passwd) throws RemoteException;
    public String insertar(String name, String passwd)throws RemoteException;
    public boolean validar(String name, String passwd)throws RemoteException;
    public String borrar (String name, String passwd)throws RemoteException;
    public HashMap getConnected() throws RemoteException;
    public HashMap getRegistered() throws RemoteException;
}
