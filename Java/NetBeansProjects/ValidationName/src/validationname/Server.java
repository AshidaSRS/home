package validationname;

import java.rmi.RemoteException;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.rmi.registry.LocateRegistry;

public class Server {

	public static void main(String[] args){
		try{
                    ValidationInterfaz val = new almacen();
                    Registry registro = LocateRegistry.createRegistry(1099);
                    registro.rebind("Almacen",val);
			
                    System.out.println("[INFO] Server up");
		}catch(RemoteException e){
			e.printStackTrace();
		}
	}
}
