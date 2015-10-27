/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginUsers;

import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.util.HashMap;
/**
 *
 * @author Eugenio
 */
public class servidor {


    public static void main(String[] args) {
        try {
            loginMethods metodos = new loginClass();
            Registry registro = LocateRegistry.createRegistry(1099);
            registro.rebind("Login", metodos);
            System.out.println("[INFO] Server up");
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }

}
