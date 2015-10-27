package potorro;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface Hier extends Remote{
	
	public String hier() throws RemoteException;
}