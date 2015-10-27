/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginUsers;

import java.io.Serializable;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.HashMap;

/**
 *
 * @author Eugenio
 */
public class loginClass extends UnicastRemoteObject implements loginMethods{

    private static HashMap<String, String> usuarios;

    protected loginClass() throws RemoteException{
        super();
        if (usuarios== null){
            usuarios = new HashMap<>();
        }
    }
    @Override
    public void insert(String name, String password) throws RemoteException {
        if (name == null || password == null || name.length() == 0 || password.length() == 0){
            throw new RemoteException("Valores incorrectos: Tanto el usuario"
                    + " como la contraseña han de existir y ser válidos");
        }else{
            usuarios.put(name, password);
        }
    }

    @Override
    public boolean check(String name, String password) throws RemoteException {
        return usuarios.containsKey(name) && usuarios.get(name).equals(password);
    }

    @Override
    public void delete(String name, String password) throws RemoteException {
        if (!usuarios.remove(name, password)) {
            throw new RemoteException("User doesnt exists");
        }
    }
    
}