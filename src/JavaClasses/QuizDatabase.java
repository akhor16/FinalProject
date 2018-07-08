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
	
	public Quiz getQuiz(int id) {
		
		String name = getQuizNamebyId(id);
		return getQuiz(name);
		
	}
	
	/*
	 * this method isn't fully implemented yet man
	 * 
	 */
	public Quiz getQuiz(String quizName) {
		
		
		String desc = "";
		String query = "select * from quizzes where quizname = \"" + quizName + "\"";
		int id = 0;
		try {
			ResultSet set = statement.executeQuery(query);
			set.next();
			desc = set.getString(4);
			id = set.getInt(1);
			Quiz quiz = new Quiz(quizName,desc);
			set.close();

			String questionsSql = "select * from questions where quiz_id = " + id;
			ResultSet questionSet = statement.executeQuery(questionsSql);
			while(questionSet.next()) {
				int type = questionSet.getInt(5);
				int questionId = questionSet.getInt(1);
				String questionText = questionSet.getString(3);
				Statement st = connection.createStatement();
				if(type == Quiz.OPEN_ENDED_NUM) {
					String answerQuery = "select * from open_ended_answers where question_id = " + questionId;
					ResultSet answerSet = st.executeQuery(answerQuery);
					quiz.addOpenEndedQuestion(questionText, getOpenAnswers(answerSet));
				}
				
				if(type == Quiz.MULTI_CHOICE_NUM) {
					String answerQuery = "select * from multiple_choice_answers where question_id = " + questionId;
					ArrayList<String> choices = getMultipleChoiceAnswers(st.executeQuery(answerQuery));
					int correctIndex = getCorrectIndex(st.executeQuery(answerQuery));
					quiz.addMultiChoiceQuestion(questionText, choices, correctIndex);
				}
				
				if(type == Quiz.MATCHING_NUM) {
					String answerQuery = "select * from matching_answers where question_id = " + questionId;
					ResultSet answerSet = st.executeQuery(answerQuery);
					quiz.addMatchingQuestion(questionText,getMatchingPairs(answerSet));
				}
				
				if(type == Quiz.FILL_IN_NUM) {
					quiz.addFillInQuestion(questionText);
				}
			}
			return quiz;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	private ArrayList<String> getOpenAnswers(ResultSet set) throws SQLException{
		ArrayList<String> result = new ArrayList<>();
		while(set.next()) {
			result.add(set.getString(3));
		}
		
		return result;
	}
	
	private ArrayList<String> getMultipleChoiceAnswers(ResultSet set) throws SQLException{
		
		ArrayList<String> result = new ArrayList<>();
		while(set.next()) {
			result.add(set.getString(3));
		}
		
		return result;
	}
	
	private int getCorrectIndex(ResultSet set) throws SQLException {
		int index = 0;
		while(set.next()) {
			if(set.getInt(4) == 1) {
				return index;
			}
			index++;
		}
		
		return -1;
	}
	
	private ArrayList<StrPair> getMatchingPairs(ResultSet set) throws SQLException{
		
		ArrayList<StrPair> matches = new ArrayList<>();
		while(set.next()) {
			String first = set.getString(3);
			String second = set.getString(4);
			matches.add(new StrPair(first, second));
		}
		
		return matches;
		
	}
	
	public ArrayList<String> getQuizNames(){
		
		ArrayList<String> result = new ArrayList<>();
		String sql = "select quizname from quizzes";
		ResultSet set;
		try {
			set = statement.executeQuery(sql);
			while(set.next()) {
				result.add(set.getString(1));
			}
			set.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
		
	}
	
	public int getQuizIdByName(String name) {
		
		String sql = "select quiz_id from quizzes where quizname = '" + name + "'";
		try {
			ResultSet set = statement.executeQuery(sql);
			set.next();
			int result = set.getInt(1);
			set.close();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	
	private String getQuizNamebyId(int id) {
		
		String sql = "select quizname from quizzes where quiz_id = " + id;
		try {
			ResultSet set = statement.executeQuery(sql);
			set.next();
			String result = set.getString(1);
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
	}
	
}
