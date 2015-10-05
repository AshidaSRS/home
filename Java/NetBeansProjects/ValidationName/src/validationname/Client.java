package validationname;

import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.Registry;
import java.rmi.registry.LocateRegistry;

public class Client{

	public static void main (String[] args){
		try {
                    Registry registro = LocateRegistry.getRegistry(1099);
                    ValidationInterfaz remote = (ValidationInterfaz)registro.lookup("Almacen");
                    Impresora imprimir = new Impresora(remote);
                    
                    System.out.println("[INFO] Añadido "+ remote.insertar("Ashida", "A123"));
                    System.out.println("[INFO] Añadido "+ remote.insertar("Eu", "genio"));
                        
                    System.out.println("[INFO] Login:"+remote.login("Ashida","A123"));
                    System.out.println("[INFO] Login:"+remote.login("Kamigari","A123"));
                    
                    System.out.println("[IMPRESORA] Connected "+ imprimir.imprimirConectados());
                    //System.out.println("[INFO]" +remote.imprimir());
                        
                    System.out.println("[INFO] Existencia: "+remote.validar("Ashida", "A123"));
                    System.out.println("[INFO] Existencia: "+remote.validar("Kami", "pno"));
                        
                    System.out.println("[INFO] Borrado "+remote.borrar("Ashida", "A123"));
                    System.out.println("[INFO] Borrado "+remote.borrar("Eu", "genio"));
                    
                    //System.out.println("[INFO]" +remote.imprimir());
                        
		} catch (RemoteException | NotBoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

    private static class Impresora {

        private ValidationInterfaz remoteObj;
            public Impresora(ValidationInterfaz remote){
                remoteObj = remote;
            }
            public String imprimirConectados() throws RemoteException{
                return remoteObj.getConnected().toString();
            }
    }
}
