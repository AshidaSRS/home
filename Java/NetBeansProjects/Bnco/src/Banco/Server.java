/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Banco;

import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.registry.LocateRegistry;

public class Server {

    public static void main(String[] args) {
        System.setProperty("java.rmi.hostname", "10.10.2.229");
        System.setProperty("java.rmi.server.codebase", "http://10.10.2.229/titular.jar");
        System.setProperty("java.security.policy", "banco.policy");

        try {
            
            if (System.getSecurityManager()==null) {
                System.setSecurityManager(new SecurityManager());
            }
            
            Banco banco = new MyBanco();
            //Cuenta cuenta = new MyCuenta();

            Registry registro = LocateRegistry.createRegistry(1099);
            registro.rebind("Banco", banco);

            System.out.println("[INFO] Server up");
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }
}
