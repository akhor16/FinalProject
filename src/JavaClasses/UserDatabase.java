package JavaClasses;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UserDatabase {
	private Connection connection;
	private Statement statement;

	public UserDatabase() {

		try {
			Class.forName("com.mysql.jdbc.Driver");

			connection = DriverManager.getConnection(
					MyDBInfo.MYSQL_DATABASE_SERVER + MyDBInfo.MYSQL_DATABASE_NAME + "?useSSL=false",
					MyDBInfo.MYSQL_USERNAME, MyDBInfo.MYSQL_PASSWORD);

			statement = connection.createStatement();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void addUser(String userName, String password) {
		String hashPass = PasswordHash.getHashCode(password);
		try {
			statement.executeUpdate(
					"insert into users(user_name, hash_password) " + "values('" + userName + "','" + hashPass + "')");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void addParticipation(String quizName, String userName, int score) {
		String quizId = "(select quiz_id from quizzes where quiz_name = \"" + quizName + "\")";
		String userId = "(select id from users where user_name = \"" + userName + "\")";
		try {
			statement.executeUpdate("insert into users(quiz_id, user_id, score) " + "values('" + quizId + "','" + userId
					+ "','" + score + "')");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Account getAccount(String userName) {
		String userIdSelect = "select id from users where user_name = \"" + userName + "\"";
		ResultSet rs;
		int userId;
		try {
			rs = statement.executeQuery(userIdSelect);
			rs.next();
			userId = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		ArrayList<String> createdQuizzes = new ArrayList<String>();
		ArrayList<String> takenQuizzes = new ArrayList<String>();

		// Created quizzes
		String createdQuizzesQuery = "select quiz_id from quizzes where author_id = " + userId;
		
		try {
			rs = statement.executeQuery(createdQuizzesQuery);
			while(rs.next()) {
				createdQuizzes.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
		// Taken quizzes
		String takenQuizzesQuery = "(select quiz_id from quizzes inner join participations on (participations.user_id = "
				+ userId + "AND participations.user_id = quizzes.author_id)";
		try {
			rs = statement.executeQuery(takenQuizzesQuery);
			while (rs.next()) {
				takenQuizzes.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return new Account(userName, createdQuizzes, takenQuizzes);
	}
}
