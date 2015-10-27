package potorro;

import java.rmi.RemoteException;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.rmi.registry.LocateRegistry;

public class Server {

	public static void main(String[] args){
		try{
			Hier objHier = new ImAHier();
			Hier objHier2 = (Hier) UnicastRemoteObject.exportObject(new ImAnotherHier(),47666);
			
			Registry registro = LocateRegistry.createRegistry(1099);
			registro.rebind("Jai", objHier);
			registro.rebind("Jai2", objHier2 );
			
			System.out.println("[INFO] Server up");
		}catch(RemoteException e){
			e.printStackTrace();
		}
	}
}
