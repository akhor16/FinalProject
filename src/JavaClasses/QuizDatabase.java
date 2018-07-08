package JavaClasses;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import JavaClasses.MyDBInfo;

public class QuizDatabase {
	
	private Connection connection;
	private Statement statement;
	
	public QuizDatabase() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			connection = DriverManager.getConnection(MyDBInfo.MYSQL_DATABASE_SERVER + 
					MyDBInfo.MYSQL_DATABASE_NAME + "?useSSL=false",
					MyDBInfo.MYSQL_USERNAME, MyDBInfo.MYSQL_PASSWORD);
			
			statement = connection.createStatement();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void addToBase(String name, String description) {
		
		
		try {
			statement.executeUpdate("insert into quizzes(quizname,description,author) "
					+ "values('" + name + "','" + description + "','dato')");
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * Adding open ended answer in the database
	 * @param quizName name of the quiz
	 * @param description description of the question
	 * @param index index of the question i nthe quiz
	 * @param answers arraylist of correct answers
	 */
	public void addQuestion(String quizName, String description, int index, ArrayList<String> answers) {
		
		String quizId = "(select quiz_id from quizzes where quizname = \"" + quizName + "\")";
		String sql = "insert into questions(quiz_id,description,ind,question_type) values("
				+ quizId + "," + "'" + description + "'," + index + ", " + Quiz.OPEN_ENDED_NUM + ")";
		
		try {
			statement.executeUpdate(sql);
			for(int i=0;i<answers.size();i++) {
				String questionId = "(select id from questions where ind = "
						+index+" and quiz_id = "+quizId+")";
				String ansSql = "insert into open_ended_answers(question_id,answer) values("
						+ questionId + ",'" + answers.get(i) +"')";
				
				statement.executeUpdate(ansSql);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/**
	 * multiple choice
	 * @param quizName
	 * @param description
	 * @param index
	 * @param choices
	 * @param correct
	 */
	public void addQuestion(String quizName, String description, int index,ArrayList<String> choices,int correctIndex) {
		
		String quizId = "(select quiz_id from quizzes where quizname = \"" + quizName + "\")";
		String sql = "insert into questions(quiz_id,description,ind,question_type) values("
				+ quizId + "," + "'" + description + "'," + index + "," + Quiz.MULTI_CHOICE_NUM + ")";
		try {
			statement.executeUpdate(sql);
			
			for(int i=0;i<choices.size();i++) {
				int correct = 0;
				if(i == correctIndex) {
					correct++;
				}
				String questionId = "(select id from questions where ind = "
						+index+" and quiz_id = "+quizId+")";
				String ansSql = "insert into multiple_choice_answers(question_id,choice,correct) values("
						+ questionId + ",'" + choices.get(i) +"'," + correct + ")";
				statement.executeUpdate(ansSql);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

	/**
	 * fill in question
	 * @param quizName
	 * @param description
	 * @param index
	 */
	public void addQuestion(String quizName, String description, int index) {
		
		String quizId = "(select quiz_id from quizzes where quizname = \"" + quizName + "\")";
		String sql = "insert into questions(quiz_id,description,ind,question_type) values("
				+ quizId + "," + "'" + description + "'," + index + ", " + Quiz.FILL_IN_NUM + ")";
		
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * matching question
	 * @param quizName
	 * @param description
	 * @param index
	 * @param keys
	 * @param values
	 */
	public void addQuestion(String quizName, String description, int index, ArrayList<String> keys, ArrayList<String> values) {
		
		String quizId = "(select quiz_id from quizzes where quizname = \"" + quizName + "\")";
		String sql = "insert into questions(quiz_id,description,ind,question_type) values("
				+ quizId + "," + "'" + description + "'," + index + ", " + Quiz.MATCHING_NUM + ")";
		
		try {
			statement.executeUpdate(sql);
			
			for(int i=0;i<keys.size();i++) {
				String questionId = "(select id from questions where ind = "
						+index+" and quiz_id = "+quizId+")";
				String ansSql = "insert into matching_answers(question_id,match_key,match_value) values("
						+ questionId + ",'" + keys.get(i) +"', '"+values.get(i)+"')";
				statement.executeUpdate(ansSql);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/*
	 * this method isn't fully implemented yet man
	 * 
	 */
	public Quiz getQuiz(String quizName) {
		
		Quiz quiz;
		String desc = "";
		String query = "select * from quizzes where quizname = \"" + quizName + "\"";
		int id = 0;
		try {
			ResultSet set = statement.executeQuery(query);
			set.next();
			desc = set.getString(4);
			id = set.getInt(1);
			
			String questionsSql = "select * from questions where quiz_id = " + id;
			set = statement.executeQuery(questionsSql);
			while(set.next()) {
				System.out.println(set.getString(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		quiz = new Quiz(quizName,desc);
		return quiz;
	}
	
}
