package JavaClasses;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import JavaClasses.MyDBInfo;

public class QuizDatabase {
	
	public static final String ATTRIBUTE_NAME = "base";
	
	private MysqlDataSource dataSource;
	
	public QuizDatabase() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			dataSource = new MysqlDataSource();
			connectToBase();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
		
	}
	
	private void connectToBase() {
		
		dataSource.setUser(MyDBInfo.MYSQL_USERNAME);
		dataSource.setPassword(MyDBInfo.MYSQL_PASSWORD);
		dataSource.setUrl(MyDBInfo.MYSQL_DATABASE_SERVER + MyDBInfo.MYSQL_DATABASE_NAME + "?useSSL=false");
		
	}
	
	private Connection getConnection() throws SQLException {
		
		return dataSource.getConnection();
		
	}
	
	public void addToBase(String name, String description, int authorId) {
		
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			statement.executeUpdate("insert into quizzes(quiz_name,description,author_id) "
					+ "values('" + name + "','" + description + "'," + authorId + ")");
			
			connection.close();
			
		} catch (SQLException e) {
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
		
		String quizId = "(select quiz_id from quizzes where quiz_name = \"" + quizName + "\")";
		String sql = "insert into questions(quiz_id,description,ind,question_type) values("
				+ quizId + "," + "'" + description + "'," + index + ", " + Quiz.OPEN_ENDED_NUM + ")";
		
		try {
			
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			statement.executeUpdate(sql);
			for(int i=0;i<answers.size();i++) {
				String questionId = "(select id from questions where ind = "
						+index+" and quiz_id = "+quizId+")";
				String ansSql = "insert into open_ended_answers(question_id,answer) values("
						+ questionId + ",'" + answers.get(i) +"')";
				
				statement.executeUpdate(ansSql);
				
				
			}
			connection.close();
			
		} catch (SQLException e) {
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
		
		String quizId = "(select quiz_id from quizzes where quiz_name = \"" + quizName + "\")";
		String sql = "insert into questions(quiz_id,description,ind,question_type) values("
				+ quizId + "," + "'" + description + "'," + index + "," + Quiz.MULTI_CHOICE_NUM + ")";
		try {
			
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
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
			
			connection.close();
			
		} catch (SQLException e) {
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
		
		String quizId = "(select quiz_id from quizzes where quiz_name = \"" + quizName + "\")";
		String sql = "insert into questions(quiz_id,description,ind,question_type) values("
				+ quizId + "," + "'" + description + "'," + index + ", " + Quiz.FILL_IN_NUM + ")";
		
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			statement.executeUpdate(sql);
			
			connection.close();
		} catch (SQLException e) {
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
		
		String quizId = "(select quiz_id from quizzes where quiz_name = \"" + quizName + "\")";
		String sql = "insert into questions(quiz_id,description,ind,question_type) values("
				+ quizId + "," + "'" + description + "'," + index + ", " + Quiz.MATCHING_NUM + ")";
		
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			statement.executeUpdate(sql);
			
			for(int i=0;i<keys.size();i++) {
				String questionId = "(select id from questions where ind = "
						+index+" and quiz_id = "+quizId+")";
				String ansSql = "insert into matching_answers(question_id,match_key,match_value) values("
						+ questionId + ",'" + keys.get(i) +"', '"+values.get(i)+"')";
				statement.executeUpdate(ansSql);
				
				
			}
			connection.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public Quiz getQuiz(int id) {
		
		String name = getQuizNamebyId(id);
		return getQuiz(name);
		
	}
	
	/*
	 * 
	 * 
	 */
	public Quiz getQuiz(String quizName) {
		String desc = "";
		String query = "select * from quizzes where quiz_name = \"" + quizName + "\"";
		
		int id = 0;
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			ResultSet set = statement.executeQuery(query);
			set.next();
			desc = set.getString(4);
			id = set.getInt(1);
			String author = getUserNameById(set.getInt(3));
			Quiz quiz = new Quiz(quizName,desc);
			quiz.setAuthor(author);
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
			
			connection.close();
			
			return quiz;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	/*
	 * 
	 */
	private ArrayList<String> getOpenAnswers(ResultSet set) throws SQLException{
		ArrayList<String> result = new ArrayList<>();
		while(set.next()) {
			result.add(set.getString(3));
		}
		
		return result;
	}
	
	/*
	 * 
	 */
	private ArrayList<String> getMultipleChoiceAnswers(ResultSet set) throws SQLException{
		
		ArrayList<String> result = new ArrayList<>();
		while(set.next()) {
			result.add(set.getString(3));
		}
		
		return result;
	}
	
	/*
	 * 
	 */
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
	
	/*
	 * 
	 */
	private ArrayList<StrPair> getMatchingPairs(ResultSet set) throws SQLException{
		
		ArrayList<StrPair> matches = new ArrayList<>();
		while(set.next()) {
			String first = set.getString(3);
			String second = set.getString(4);
			matches.add(new StrPair(first, second));
		}
		
		return matches;
		
	}
	
	/**
	 * 
	 * @return ArrayList of all quiz names
	 */
	public ArrayList<String> getQuizNames(){
		
		ArrayList<String> result = new ArrayList<>();
		String sql = "select quiz_name from quizzes order by quiz_id desc";
		ResultSet set;
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			set = statement.executeQuery(sql);
			while(set.next()) {
				result.add(set.getString(1));
			}
			
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
		
	}
	
	/**
	 * 
	 * @param name - quiz name
	 * @return quiz id for the given quiz name
	 */
	public int getQuizIdByName(String name) {
		
		String sql = "select quiz_id from quizzes where quiz_name = '" + name + "'";
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			ResultSet set = statement.executeQuery(sql);
			boolean isNull= !set.next();
			int result;
			if(isNull) {
				result = -1;
			}else {
				result = set.getInt(1);
			}
			
			
			connection.close();
			
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	/*
	 * 
	 */
	private String getQuizNamebyId(int id) {
		
		String sql = "select quiz_name from quizzes where quiz_id = " + id;
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			ResultSet set = statement.executeQuery(sql);
			set.next();
			
			String result = set.getString(1);
			
			connection.close();
			
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "";
	}
	
	/**
	 * Adds given user to database
	 * @param name - name of user
	 * @param lastName - last name of user
	 * @param userName - user name
	 * @param password - password
	 */
	public void addUser(String name, String lastName, String userName, String password) {
		String hashPass = PasswordHash.getHashCode(password);
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			statement.executeUpdate("insert into users(first_name, last_name, user_name, hash_password) " + "values('" + name
					+ "','" + lastName + "','" + userName + "','" + hashPass + "')");
			
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @param userName
	 * @return ID of the user with given user name
	 */
	public int getUserIdByName(String userName) {
		String sql = "(select id from users where user_name = \"" + userName + "\")";
		int result = 0;
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			ResultSet set = statement.executeQuery(sql);
			set.next();
			result = set.getInt(1);
			
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * Adds given participation activity to database
	 * @param quizName - quiz name
	 * @param userName - user name
	 * @param score - taken score
	 */
	public void addParticipation(String quizName, String userName, int score) {
		int quizId = getQuizIdByName(quizName);
		int userId = getUserIdByName(userName);
		addParticipation(quizId, userId, score);
	}
	
	/**
	 * Adds given participation activity to database
	 * @param quizId - quiz ID
	 * @param userId - user ID
	 * @param score - taken score
	 */
	public void addParticipation(int quizId, int userId, int score) {
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			statement.executeUpdate("insert into participations(quiz_id, user_id, score) " + "values("
					+ quizId + "," + userId + "," + score + ")");
			
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param userName
	 * @return new Account class object with userId of given userName
	 */
	public Account getAccount(String userName) {
		int userId = getUserIdByName(userName);
		return new Account(userId);
	}

	/**
	 * 
	 * @param userId
	 * @return ArrayList of Quiz IDs which the given user created
	 */
	public ArrayList<String> getCreatedQuizzesIDs(int userId) {
		ArrayList<String> createdQuizzes = new ArrayList<String>();
		// Created quizzes
		String createdQuizzesQuery = "select quiz_id from quizzes where author_id = " + userId;
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			ResultSet rs = statement.executeQuery(createdQuizzesQuery);
			while (rs.next()) {
				createdQuizzes.add(rs.getString(1));
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return createdQuizzes;
	}

	/**
	 * 
	 * @param userId user ID
	 * @return number of created quizzes
	 */
	public int getCreatedQuizzesNum(int userId) {
		return getCreatedQuizzesIDs(userId).size();
	}
	
	/**
	 * 
	 * @param userId
	 * @return ArrayList of StrPairs of quiz IDs and scores which the given user has taken
	 */
	public ArrayList<StrPair> getTakenQuizzesIDs(int userId) {
		ArrayList<StrPair> takenQuizzes = new ArrayList<>();
		// Taken quizzes
		String takenQuizzesQuery = "select quiz_id, score from participations where user_id = "
				+ userId;
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			ResultSet rs = statement.executeQuery(takenQuizzesQuery);
			while (rs.next()) {
				takenQuizzes.add(new StrPair(rs.getString(1), rs.getString(2)));
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return takenQuizzes;
	}
	
	/**
	 * 
	 * @param userId user id
	 * @return number of taken quizzes
	 */
	public int getTakenQuizzesNum(int userId) {
		return getTakenQuizzesIDs(userId).size();
	}
	
	/**
	 * 
	 * @param userName - name of the user
	 * @return true if the user with given user name is already registered, else false
	 */
	public boolean containsUser(String userName) {
		String sql = "select id from users where user_name = '" + userName + "'";
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			ResultSet rs = statement.executeQuery(sql);
			
			if(rs.next()) {
				connection.close();
				return true;
			} else {
				connection.close();
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * Takes user name and password, returns true if the login is correct
	 * @param userName - user name
	 * @param password - password
	 * @return true if the login is correct, else false
	 */
	public boolean correctLogin(String userName, String password) {
		if(!containsUser(userName)) {
			return false;
		}
		String hashPass = PasswordHash.getHashCode(password);
		int userId = getUserIdByName(userName);
		String sql = "select hash_password from users where id = " + userId;
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			ResultSet rs = statement.executeQuery(sql);
			
			
			rs.next();
			String hashPassInBase = rs.getString(1);
			connection.close();
			if(hashPass.equals(hashPassInBase)) {
				return true;
			} else return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * 
	 * @param userId - user ID
	 * @return User name
	 */
	public String getUserNameById(int userId) {
		String sql = "select user_name from users where id = " + userId;
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			ResultSet set = statement.executeQuery(sql);
			
			
			set.next();
			String result = set.getString(1);
			set.close();
			connection.close();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("NO USER WITH GIVEN ID");
			return null;
		}
	}
	
	public void updateQuizAttributes(int quizId, String newName,String newDesc) {
		
		String sql = "update quizzes set quiz_name = '" + newName + "',description = '"+newDesc+"' where quiz_id = " + quizId;
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			statement.executeUpdate(sql);
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public void updateFillQuestion(int quizId, int ind, String newDesc) {
		
		updateQuestion(quizId,ind,newDesc);
		
	}
	
	private String questionId(int quizId,int ind) {
		
		String questionId = "(select id from questions where quiz_id = " 
				+ quizId + " and ind = " + ind + ")";
		
		return questionId;
	}
	
	private String generateDeleteSql(int quizId, int ind,String table) {
		
		
		String deleteSql = "delete from " + table + " where question_id = " + questionId(quizId,ind);
		
		return deleteSql;
		
	}
	
	public void updateOpenEndedQuestion(int quizId, int ind, String newDesc, ArrayList<String> answers) {
		
		updateQuestion(quizId,ind,newDesc);
		
		
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			statement.executeUpdate(generateDeleteSql(quizId,ind,"open_ended_answers"));
			
			for(int i=0;i<answers.size();i++) {
				String addSql = "insert into open_ended_answers(question_id,answer) values("
							+ questionId(quizId,ind) + "," + "'" + answers.get(i) + "')";
				statement.executeUpdate(addSql);
			}
			
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
	public void updateMultipleChoiceQuestion(int quizId, int ind, String newDesc, ArrayList<String> answers, int correctIndex) {
		
		updateQuestion(quizId,ind,newDesc);
		
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			statement.executeUpdate(generateDeleteSql(quizId, ind,"multiple_choice_answers"));
			int correct = 0;
			for(int i=0;i<answers.size();i++) {
				if(correctIndex == i) {
					correct = 1;
				}
				String addSql = "insert into multiple_choice_answers(question_id,choice,correct) values("
							+ questionId(quizId,ind) + "," + "'" + answers.get(i) + "', " + correct + ")";
				statement.executeUpdate(addSql);
			}
			
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void updateMatchingQuestion(int quizId, int ind, String newDesc, ArrayList<String> newKeys, ArrayList<String> newValues) {
		
		updateQuestion(quizId,ind,newDesc);
		
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			statement.executeUpdate(generateDeleteSql(quizId, ind,"matching_answers"));
			
			for(int i=0;i<newKeys.size();i++) {
				
				String ansSql = "insert into matching_answers(question_id,match_key,match_value) values("
						+ questionId(quizId,ind) + ",'" + newKeys.get(i) +"', '"+newValues.get(i)+"')";
				statement.executeUpdate(ansSql);
			}
			
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
	private void updateQuestion(int quizId, int ind, String newDesc) {
		
		String sql = "update questions set description = '" + newDesc +"' where quiz_id = " 
					+ quizId + " and ind = " + ind;
		
		Connection connection;
		try {
			connection = getConnection();
			Statement statement = connection.createStatement();
			
			statement.executeUpdate(sql);
			
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
	
	public ArrayList<StrPair> getParticipations(int quizId, int userId,boolean all){
		
		String sql = "select score, participation_date from participations where quiz_id = " + quizId 
				+ " and user_id = " + userId + " order by id desc";
		
		if(all) {
			sql = "select user_id, score from participations order by id desc";
		}
		
		ArrayList<StrPair> list = new ArrayList<>();
		
		Connection connection;
		try {
			connection = getConnection();
			Statement statement = connection.createStatement();
			
			ResultSet set = statement.executeQuery(sql);
			
			while(set.next()) {
				String score = set.getString(1);
				String date = set.getString(2);
				
				list.add(new StrPair(score,date));
			}
			connection.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public double getQuizAvgScore(int quizId) {
		
		String sql = "select score from participations where quiz_id = " + quizId;
		double result = 0;
		double n = 0;
		
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			ResultSet set = statement.executeQuery(sql);
			
			while(set.next()) {
				n++;
				result = result + set.getInt(1) * 10;
			}
			connection.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(n>0) {
			result = result / n;
		}
		
		return result;
		
	}
	
	public ArrayList<StrPair> topScorers(int quizId){
		
		String sql = "select user_id, score from participations where quiz_id = " + quizId + " order by score desc";
		ArrayList<StrPair> list = new ArrayList<>();
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			
			ResultSet set = statement.executeQuery(sql);
			
			while(set.next()) {
				int userId = set.getInt(1);
				String userName = getUserNameById(userId);
				list.add(new StrPair(userName,set.getString(2)));
			}
			
			connection.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
}
