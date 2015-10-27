/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginUsers;

import java.rmi.AccessException;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Eugenio
 */
public class cliente {

    public static void main(String[] args) {

        Registry registro;
        try {
            registro = LocateRegistry.getRegistry(1099);
            loginMethods remote = (loginMethods) registro.lookup("Login");
            remote.insert("Eugenio", "Gonzalo");
            remote.insert("Ashida", "Roberto");
            remote.insert("Santiago", "Yago");
            
            System.out.println(remote.check("Eugenio", "Gonzalo"));
            
        } catch (RemoteException | NotBoundException e) {
            Logger.getLogger(cliente.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
