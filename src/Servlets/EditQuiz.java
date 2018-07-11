package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaClasses.CreateQuizConstants;

/**
 * Servlet implementation class EditQuiz
 */
@WebServlet("/EditQuiz")
public class EditQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditQuiz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String quizName = request.getParameter(CreateQuizConstants.QUIZ_NAME);
		String quizDesc = request.getParameter(CreateQuizConstants.QUIZ_DESCRIPTION);
		int numQuestions = Integer.parseInt(request.getParameter(CreateQuizConstants.QUESTION_NUM));
		
		PrintWriter out = response.getWriter();
		out.println(quizName + "<br>");
		out.println(quizDesc + "<br>");
		out.println(numQuestions + "<br>");
		
		for(int i=0;i<numQuestions;i++) {
			
			String questionDesc = request.getParameter(CreateQuizConstants.QUESTION_DESCRIPTION + i);
			out.println(questionDesc + "<br>");
		}
		
		
		doGet(request, response);
	}

}
