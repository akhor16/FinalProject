package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaClasses.CreateQuizConstants;
import JavaClasses.Quiz;
import JavaClasses.QuizDatabase;

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
		
		QuizDatabase base = (QuizDatabase)request.getServletContext().getAttribute(QuizDatabase.ATTRIBUTE_NAME);
		
		String quizName = request.getParameter(CreateQuizConstants.QUIZ_NAME);
		String quizDesc = request.getParameter(CreateQuizConstants.QUIZ_DESCRIPTION);
		int numQuestions = Integer.parseInt(request.getParameter(CreateQuizConstants.QUESTION_NUM));
		
		int quizId = Integer.parseInt(request.getParameter("quiz-id"));
		base.updateQuizAttributes(quizId, quizName, quizDesc);
		
		for(int i=0;i<numQuestions;i++) {
			
			if(request.getParameter("question-type" + i).equals("" + Quiz.OPEN_ENDED_NUM)) {
				String questionDesc = request.getParameter(CreateQuizConstants.QUESTION_DESCRIPTION + i);
				
				int ansNum = Integer.parseInt(request.getParameter("ans-num" + i));
				
				ArrayList<String> answers = new ArrayList<>();
				for(int j=0;j<ansNum;j++) {
					String answer = request.getParameter(CreateQuizConstants.ANSWER + i + j);
					answers.add(answer);
				}
				base.updateOpenEndedQuestion(quizId, i, questionDesc, answers);
			}
			
			if(request.getParameter("question-type" + i).equals("" + Quiz.MULTI_CHOICE_NUM)) {
				String questionDesc = request.getParameter(CreateQuizConstants.QUESTION_DESCRIPTION + i);
				
				int ansNum = Integer.parseInt(request.getParameter("ans-num" + i));
				
				ArrayList<String> answers = new ArrayList<>();
				for(int j=0;j<ansNum;j++) {
					String answer = request.getParameter(CreateQuizConstants.FIRST_OPTION + i + j);
					answers.add(answer);
				}
				int correct = Integer.parseInt(request.getParameter(CreateQuizConstants.QUESTION_RADIO + i));
				base.updateMultipleChoiceQuestion(quizId, i, questionDesc, answers, correct);
			}
			
			if(request.getParameter("question-type" + i).equals("" + Quiz.FILL_IN_NUM)) {
				String questionDesc = request.getParameter(CreateQuizConstants.QUESTION_DESCRIPTION + i);
				base.updateFillQuestion(quizId, i, questionDesc);
			}
			
			if(request.getParameter("question-type" + i).equals("" + Quiz.MATCHING_NUM)) {
				String questionDesc = request.getParameter(CreateQuizConstants.QUESTION_DESCRIPTION + i);
				int ansNum = Integer.parseInt(request.getParameter("ans-num" + i));
				
				ArrayList<String> keys = new ArrayList<>();
				ArrayList<String> values = new ArrayList<>();
				for(int j=0;j<ansNum;j++) {
					String key = request.getParameter(CreateQuizConstants.LEFT_MATCHING + i + j);
					String value = request.getParameter(CreateQuizConstants.RIGHT_MATCHING + i + j);
					System.out.println(key);
					keys.add(key);
					values.add(value);
				}
				
				base.updateMatchingQuestion(quizId, i, questionDesc, keys, values);
			}
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("quiz-summary.jsp?id=" + quizId);
		rd.forward(request, response);
		
		
		doGet(request, response);
	}

}
