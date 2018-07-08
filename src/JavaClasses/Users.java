package JavaClasses;

import java.util.HashMap;
import java.util.Map;

public class Users {

	private Map<String, String> hm;
	
	public Users() {
		hm = new HashMap<String, String> ();
		
	}
	
	public void add(String name, String password) {
		
		String hashPass = PasswordHash.getHashCode(password);
		hm.put(name, hashPass);
	}
	
	public boolean check(String name, String password) {
		String hashPass = PasswordHash.getHashCode(password);
		if(hm.containsKey(name) && hm.get(name).equals(hashPass)) {
			return true;
		}
		return false;
	}
	
	
}
