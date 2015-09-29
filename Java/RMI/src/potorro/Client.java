package potorro;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

public class Client implements Hier{

	@Override
	public String hier() throws RemoteException {
		// TODO Auto-generated method stub
		return null;
	}
	public static void main (String[] args){
		Hier remote;
		try {
			remote = (Hier)Naming.lookup("//" + args[0] + ":" + args[1] + "/Jai");
			remote.hier();
		} catch (RemoteException | MalformedURLException | NotBoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
