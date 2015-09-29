package potorro;

import java.io.Serializable;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class ImAHier extends UnicastRemoteObject implements Hier,Serializable {
	
	protected ImAHier() throws RemoteException{
		super();
	}
	private static final long serialVersionUID = 1L;

	public String hier() throws RemoteException{
		return "Jail";
	}
	
	
}
