package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaClasses.Users;

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
		String name = request.getParameter("userNameLogin");
		String password = request.getParameter("passwordLogin");
		Users us = new Users();
		us.add("admin", "123456");
		if(us.check(name, password)) {
			request.getSession().setAttribute("Account", 0);
			response.getWriter().write("true");
		}else {
			response.getWriter().write("false");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("userNameRegister");
		String password = request.getParameter("passwordRegister");
		System.out.println(name + " " + password);
		if(name.equals("admin") && password.equals("123456")) {
			request.getSession().setAttribute("user", 0);
			response.getWriter().write("true");
		}else {
			response.getWriter().write("false");
		}
	}

}
