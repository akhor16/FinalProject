package JavaClasses;

/**
 * Object of this class is given to session
 * 
 * @author Avtandil Khorbaladze
 *
 */

public class Account {
	public static final String SESSION_ATTRIBUTE_NAME = "userId";
	private int userId;
	
	public Account(int userId) {
		this.userId = userId;
	}
	
	/**
	 * @return user id of the account
	 */
	public int getUserId() {
		return userId;
	}
}
