package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaClasses.Quiz;
import JavaClasses.QuizDatabase;
import JavaClasses.StrPair;
import JavaClasses.TakeQuizConstants;

/**
 * Servlet implementation class CheckQuiz
 */
@WebServlet("/CheckQuiz")
public class CheckQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckQuiz() {
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
		// TODO Auto-generated method stub
		//doGet(request, response);
		String quizName = request.getParameter(TakeQuizConstants.QUIZ_NAME + "");
		QuizDatabase base = new QuizDatabase();
		Quiz quiz = base.getQuiz(quizName);
		PrintWriter out = response.getWriter();
		int points = 0;
		for(int i=0;i<quiz.getQuestionNumber();i++) {
			
			if(quiz.getType(i) == Quiz.FILL_IN_NUM) {
				
				ArrayList<String> answers = new ArrayList<>();
				for(int j=0;j<quiz.getFillInQuestionWordNum(i);j++) {
					String answer = request.getParameter(TakeQuizConstants.FILL_IN_ANSWER + "" + j + i);
					answers.add(answer);
				}
				points += quiz.checkFillInQuestionAnswer(i, answers)?1:0;
				
			}
			
			if(quiz.getType(i) == Quiz.MATCHING_NUM) {
				
				ArrayList<StrPair> matches = new ArrayList<>(); 
				ArrayList<String> keys = quiz.getMatchingQuestionKeys(i);
				for(int j=0;j<4;j++) {
					String value = request.getParameter(TakeQuizConstants.MATCHING_ANSWER + "" + j + i);
					StrPair pair = new StrPair(keys.get(j),value);
					matches.add(pair);
				}
				points += quiz.checkMatchingQuestionAnswer(i, matches)?1:0;
				
			}
			
			if(quiz.getType(i) == Quiz.MULTI_CHOICE_NUM) {
				String answer = request.getParameter(TakeQuizConstants.RADIO_ANSWER + "" + i);
				points += quiz.checkMultiChoiceQuestionAnswer(i, answer)?1:0;
				
			}
			
			if(quiz.getType(i) == Quiz.OPEN_ENDED_NUM) {
				String answer = request.getParameter(TakeQuizConstants.REGULAR_ANSWER + "" + i);
				points += quiz.checkOpenEndedQuestionAnswer(i, answer)?1:0;
				
			}
			
		}
		out.println(points);
		
		
		
	}

}
