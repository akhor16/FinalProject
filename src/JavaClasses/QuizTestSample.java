package JavaClasses;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;

/**
 * These are only basic tests and doesn't cover all methods or situations.
 * Needed more tests for different cases.
 * @author Avtandil
 *
 */
class QuizTestSample {

	private static final String QUESTION_TEXT = "Question text";
	private static final String Q_NAME = "quiz_name";
	private static final String Q_DESC = "quiz_description";

	// Quiz creation test
	@Test
	void test() {
		Quiz quiz = new Quiz(Q_NAME, Q_DESC);
		assertTrue(quiz.getQuizName().equals(Q_NAME));
		assertTrue(quiz.getQuizDescription().equals(Q_DESC));

	}

	// Open Ended question test
	@Test
	void openEndedTest() {
		Quiz quiz = new Quiz(Q_NAME, Q_DESC);
		ArrayList<String> correctAnswers = new ArrayList<String>();
		String firstAns = "firstAnswer";
		String secondAns = "SecondAnswer";
		correctAnswers.add(firstAns);
		correctAnswers.add(secondAns);
		quiz.addOpenEndedQuestion(QUESTION_TEXT, correctAnswers);

		assertTrue(quiz.getType(0) == Quiz.OPEN_ENDED_NUM);
		assertTrue(quiz.checkOpenEndedQuestionAnswer(0, secondAns));
		assertFalse(quiz.checkOpenEndedQuestionAnswer(0, "fwagaw"));
		assertEquals(quiz.getOpenEndedQuestionText(0), QUESTION_TEXT);

		quiz.addOpenEndedQuestion(QUESTION_TEXT, correctAnswers);

		assertTrue(quiz.getType(1) == Quiz.OPEN_ENDED_NUM);
		assertTrue(quiz.checkOpenEndedQuestionAnswer(1, secondAns));
		assertFalse(quiz.checkOpenEndedQuestionAnswer(1, "fwagaw"));
		assertEquals(quiz.getOpenEndedQuestionText(1), QUESTION_TEXT);

	}

	// Fill In question test
	@Test
	void fillInTest() {
		Quiz quiz = new Quiz(Q_NAME, Q_DESC);
		String fillInText = "me var ((avto)), am testis ((avtori))";
		String shownText = "me var _____, am testis _____";
		quiz.addFillInQuestion(fillInText);
		assertTrue(quiz.getType(0) == Quiz.FILL_IN_NUM);
		ArrayList<String> list = new ArrayList<String>();
		list.add("avto");
		list.add("avtori");
		assertTrue(quiz.checkFillInQuestionAnswer(0, list));
		assertEquals(shownText, quiz.getFillInQuestionText(0));
	}

	// Matching question test
	@Test
	void matchingTest() {
		Quiz quiz = new Quiz(Q_NAME, Q_DESC);
		ArrayList<StrPair> pairList = new ArrayList<StrPair>();
		pairList.add(new StrPair("erti", "1"));
		pairList.add(new StrPair("ori", "2"));
		pairList.add(new StrPair("sami", "3"));
		pairList.add(new StrPair("otxi", "4"));
		quiz.addMatchingQuestion(QUESTION_TEXT, pairList);
		assertEquals(quiz.getMatchingQuestionText(0), QUESTION_TEXT);

		ArrayList<StrPair> otherPairList = new ArrayList<StrPair>();
		otherPairList.add(new StrPair("erti", "1"));
		otherPairList.add(new StrPair("sami", "3"));
		otherPairList.add(new StrPair("ori", "2"));
		otherPairList.add(new StrPair("otxi", "4"));

		assertTrue(quiz.checkMatchingQuestionAnswer(0, otherPairList));

	}

	// Multi Choice question test
	@Test
	void multiChoiceTest() {
		Quiz quiz = new Quiz(Q_NAME, Q_DESC);
		ArrayList<String> answers = new ArrayList<String>();
		answers.add("erti");
		answers.add("orti");
		answers.add("sami");
		answers.add("arcerti");
		quiz.addMultiChoiceQuestion(QUESTION_TEXT, answers, 3);
		assertTrue(quiz.checkMultiChoiceQuestionAnswer(0, "arcerti"));
		assertFalse(quiz.checkMultiChoiceQuestionAnswer(0, "orti"));
		assertTrue(quiz.getQuestionText(0).equals(QUESTION_TEXT));
	}
}
