package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaClasses.CreateQuizConstants;
import JavaClasses.Quiz;
import JavaClasses.QuizDatabase;
import JavaClasses.StrPair;

/**
 * Servlet implementation class CreateQuiz
 * this servlet should take responsibility for takeing information from request
 * in post method and storing created quiz in the database
 */
@WebServlet("/CreateQuiz")
public class CreateQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateQuiz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		QuizDatabase base = (QuizDatabase)request.getServletContext().getAttribute(QuizDatabase.ATTRIBUTE_NAME);
		
		String quizName = request.getParameter(CreateQuizConstants.QUIZ_NAME);
		String quizDesc = request.getParameter(CreateQuizConstants.QUIZ_DESCRIPTION);
		 
		//Quiz quiz = new Quiz(quizName, quizDesc);
		
		base.addToBase(quizName, quizDesc);
		
		int numQuestions = Integer.parseInt(request.getParameter(CreateQuizConstants.QUESTION_NUM));
		
		
		for(int i=1;i<=numQuestions;i++) {
			
			String questionDesc = request.getParameter(CreateQuizConstants.QUESTION_DESCRIPTION + i);
			
			if(request.getParameter(CreateQuizConstants.QUESTION_TYPE + i).equals("#multiple-choice")) {
				
				ArrayList<String> answers = new ArrayList<>();
				answers.add(request.getParameter(CreateQuizConstants.FIRST_OPTION + i));
				answers.add(request.getParameter(CreateQuizConstants.SECOND_OPTION + i));
				answers.add(request.getParameter(CreateQuizConstants.THIRD_OPTION + i));
				answers.add(request.getParameter(CreateQuizConstants.FOURTH_OPTION + i));
				
				int correctAnswerIndex = Integer.parseInt(request.getParameter(CreateQuizConstants.QUESTION_RADIO + i));
				//quiz.addMultiChoiceQuestion(questionDesc, answers, correctAnswerIndex);
				base.addQuestion(quizName, questionDesc, i-1, answers, correctAnswerIndex);
			}
			if(request.getParameter(CreateQuizConstants.QUESTION_TYPE + i).equals("#open-ended")) {
				int answerNum = Integer.parseInt((request.getParameter(CreateQuizConstants.ANSWER_NUM + i)));
				
				ArrayList<String> answers = new ArrayList<>();
				for(int j=1;j<=answerNum;j++) {
					String ans = request.getParameter(CreateQuizConstants.ANSWER + j + i);
					answers.add(ans);
				}
				
				
				base.addQuestion(quizName, questionDesc, i-1,answers);
				
			}
			
			if(request.getParameter(CreateQuizConstants.QUESTION_TYPE + i).equals("#fill-blank")) {
				base.addQuestion(quizName, questionDesc, i-1);
				
			}
			if(request.getParameter(CreateQuizConstants.QUESTION_TYPE + i).equals("#match")) {
				
				//ArrayList<StrPair> correctMatches = new ArrayList<>();
				ArrayList<String> keys = new ArrayList<>();
				ArrayList<String> values = new ArrayList<>();
				for(int j=1;j<=4;j++) {
					String leftMatch = request.getParameter(CreateQuizConstants.LEFT_MATCHING + j + i);
					String rightMatch = request.getParameter(CreateQuizConstants.RIGHT_MATCHING + j + i);
					//StrPair match = new StrPair(leftMatch,rightMatch);
					
					//correctMatches.add(match);
					keys.add(leftMatch);
					values.add(rightMatch);
				}
				
				base.addQuestion(quizName, questionDesc, i-1, keys, values);
			}
			
		}
		int quizId = base.getQuizIdByName(quizName);
		RequestDispatcher dispatch = request.getRequestDispatcher("quiz-summary.jsp?id=" + quizId);
		dispatch.forward(request, response);
		
	}
	
	
	/**
	 * This method will later add quiz to database but for now it will add this class to a servletContext
	 * @param quiz
	 * @param context
	 */
	
}
