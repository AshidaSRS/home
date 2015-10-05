/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validationname;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.HashMap;

/**
 *
 * @author Ashida
 */
public class almacen extends UnicastRemoteObject implements ValidationInterfaz {

    private HashMap<String, String> almacen;
    private HashMap<String, String> connected;
    

    public almacen() throws RemoteException {
        super();
        almacen = new HashMap<>();
        connected = new HashMap<>();
    }

    public String login(String name, String passwd) throws RemoteException {
        if (validar(name, passwd)==true){
            connected.put(name, passwd);
            return name;
        }
        else
            return "Fail";
    }
    
    @Override
    public String insertar(String name, String passwd) throws RemoteException {
        if(!almacen.containsKey(name)){
        almacen.put(name, passwd);
            return name; 
        }
        else return "Fail, name alrready exists";
    }

    @Override
    public boolean validar(String name, String passwd) throws RemoteException {
        return (almacen.containsValue(passwd) && almacen.containsKey(name));
    }

    @Override
    public String borrar(String name, String passwd) throws RemoteException {
        if(connected.containsKey(name)){
        if (almacen.get(name).equals(passwd)) {
            almacen.remove(name);
            return name;
        } else {
            return "Fail";
        }
        }
        else
            return "Fail";
    }
    public HashMap getConnected() throws RemoteException{
        return connected;
    }
    public HashMap getRegistered() throws RemoteException{
        return almacen;
    }
}
