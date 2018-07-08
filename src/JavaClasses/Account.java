package JavaClasses;

import java.util.ArrayList;

/**
 * Object of this class is given to session
 * 
 * @author Avtandil Khorbaladze
 *
 */

public class Account {
	private String userName;
	private ArrayList<String> createdQuizzes;
	private ArrayList<String> takenQuizzes;
	
	public Account(String userName, ArrayList<String> createdQuizzes, ArrayList<String> takenQuizzes) {
		this.userName = userName;
		if(createdQuizzes == null) {
			this.createdQuizzes = new ArrayList<String> ();
		} else {
			this.createdQuizzes = createdQuizzes;
		}
		
		if(takenQuizzes == null) {
			this.takenQuizzes = new ArrayList<String> ();
		} else {
			this.takenQuizzes = takenQuizzes;
		}
	}
	
	public String getUserName() {
		return userName;
	}
	
	public ArrayList<String> getCreatedQuizzes() {
		return new ArrayList<>(createdQuizzes);
	}
	
	public ArrayList<String> getTakenQuizzes() {
		return new ArrayList<>(takenQuizzes);
	}
	
	public void addCreatedQuiz(String name) {
		createdQuizzes.add(name);
	}
	
	public void addTakenQuiz(String name) {
		takenQuizzes.add(name);
	}
}
