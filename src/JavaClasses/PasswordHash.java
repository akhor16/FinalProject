package JavaClasses;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/*
 * This code is taken from my(Avtandil Khorbaladze) homework 4 Cracker.
 */

public abstract class PasswordHash {
	
	private static final String HASH_ALGO = "SHA";
	// Array of chars used to produce strings
	public static final char[] CHARS = "abcdefghijklmnopqrstuvwxyz0123456789.,-!".toCharArray();	
	
	
	/*
	 * Generation mode
	 */
	public static String getHashCode(String pass) {
		try {
			MessageDigest md = MessageDigest.getInstance(HASH_ALGO);
			md.update(pass.getBytes());
			String hashCode = hexToString(md.digest());
			return hashCode;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	/*
	 Given a byte[] array, produces a hex String,
	 such as "234a6f". with 2 chars for each byte in the array.
	 (provided code)
	*/
	private static String hexToString(byte[] bytes) {
		StringBuffer buff = new StringBuffer();
		for (int i=0; i<bytes.length; i++) {
			int val = bytes[i];
			val = val & 0xff;  // remove higher bits, sign
			if (val<16) buff.append('0'); // leading 0
			buff.append(Integer.toString(val, 16));
		}
		return buff.toString();
	}
	
}