package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaClasses.Account;
import JavaClasses.QuizDatabase;

/**
 * Servlet implementation class LoginRegisterServlet
 */
@WebServlet("/LoginRegisterServlet")
public class LoginRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userNameLogin");
		String password = request.getParameter("passwordLogin");
		QuizDatabase db = new QuizDatabase();
		if(db.correctLogin(userName, password)) {
			request.getSession().setAttribute(Account.SESSION_ATTRIBUTE_NAME, new Account(db.getUserIdByName(userName)));
			response.getWriter().write("true");
		}else {
			response.getWriter().write("false");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuizDatabase db = (QuizDatabase)request.getServletContext().getAttribute(QuizDatabase.ATTRIBUTE_NAME);
		String name = request.getParameter("nameRegister");
		String lastName = request.getParameter("lastNameRegister");
		String userName = request.getParameter("userNameRegister");
		String password = request.getParameter("passwordRegister");
		String passwordConfirm = request.getParameter("passwordRegisterConfirm");
		if(password.equals(passwordConfirm) && !db.containsUser(userName)) {
			db.addUser(name, lastName, userName, password);
			request.getSession().setAttribute(Account.SESSION_ATTRIBUTE_NAME, new Account(db.getUserIdByName(userName)));
			response.getWriter().write("true");
		}else {
			response.getWriter().write("false");
		}
	}

}
