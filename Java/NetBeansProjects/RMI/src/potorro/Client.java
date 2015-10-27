package potorro;

import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.Registry;
import java.rmi.registry.LocateRegistry;

public class Client{

	public static void main (String[] args){
		try {
			Registry registro = LocateRegistry.getRegistry(1099);
			
			Hier remote = (Hier)registro.lookup("Jai");
			Hier remote2 = (Hier)registro.lookup("Jai2");
			
			System.out.println("[ImAHier] "+remote.hier());
			System.out.println("[ImAnotherHier] "+remote2.hier());
		} catch (RemoteException | NotBoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
