/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginUsers;
import java.rmi.Remote;
import java.rmi.RemoteException;
/**
 *
 * @author Eugenio
 */
public interface loginMethods extends Remote{
    
    public void insert(String name,String password) throws RemoteException;
    
    public boolean check(String name, String password) throws RemoteException;
    
    public void delete(String name, String password) throws RemoteException;
    
}
