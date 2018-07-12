package JavaClasses;

import java.util.ArrayList;
import java.util.Collections;

/**
 * Quiz Java Class. Contains 4 Question type inner classes: Open Ended Question
 * Multi Choice Question Matching Question Fill In Question
 * 
 * @author Avtandil
 *
 */
public class Quiz {
	/**
	 * Open ended question type number
	 */
	public static final int OPEN_ENDED_NUM = 0;
	/**
	 * Multi choice question type number
	 */
	public static final int MULTI_CHOICE_NUM = 1;
	/**
	 * Matching question type number
	 */
	public static final int MATCHING_NUM = 2;
	/**
	 * Fill in question type number
	 */
	public static final int FILL_IN_NUM = 3;

	private String authorUserName;

	/**
	 * Creates new Quiz Object
	 * 
	 * @param name
	 * @param quizDescription
	 */
	public Quiz(String quizName, String quizDescription) {
		this.quizName = quizName;
		this.quizDescription = quizDescription;
		typeNums = new ArrayList<Integer>();
		indices = new ArrayList<Integer>();
		openEndedList = new ArrayList<OpenEndedQuestion>();
		multiChoiceList = new ArrayList<MultiChoiceQuestion>();
		matchingList = new ArrayList<MatchingQuestion>();
		fillInList = new ArrayList<FillInQuestion>();
	}

	/**
	 * 
	 * @param authorUserName sets author's user name
	 */
	public void setAuthor(String authorUserName) {
		this.authorUserName = authorUserName;
	}

	/**
	 * 
	 * @return user name of the author
	 */
	public String getAuthorUserName() {
		return authorUserName;
	}
	
	/**
	 * 
	 * @return Total number of questions in Quiz
	 */
	public int getQuestionNumber() {
		return questionNum;
	}

	/**
	 * 
	 * @return Quiz name
	 */
	public String getQuizName() {
		return quizName;
	}

	/**
	 * 
	 * @return Quiz Description
	 */
	public String getQuizDescription() {
		return quizDescription;
	}

	/**
	 * @param index
	 *            - index of the question
	 * @return Type number of the question, or -1 if there is no question on given
	 *         index
	 */
	public int getType(int index) {
		if (index < 0 || index >= typeNums.size())
			return -1;
		return typeNums.get(index);
	}

	/**
	 * Takes question index(any type) and returns question text
	 * 
	 * @param index
	 *            - question index of any type
	 * @return question text
	 */
	public String getQuestionText(int index) {
		int type = getType(index);
		switch (type) {
		case OPEN_ENDED_NUM:
			return getOpenEndedQuestionText(index);
		case MULTI_CHOICE_NUM:
			return getMultiChoiceQuestionText(index);
		case MATCHING_NUM:
			return getMatchingQuestionText(index);
		case FILL_IN_NUM:
			return getFillInQuestionText(index);
		}
		return null;

	}

	// Fill-In Question

	/**
	 * Adds new "fill in" type question
	 * 
	 * @param questionText
	 *            - Fill in question String, places where should be inserted words
	 *            by users should be in specified format: ((word))
	 */
	public void addFillInQuestion(String questionText) {
		indices.add(fillInList.size());
		updateForAdding(FILL_IN_NUM);
		fillInList.add(new FillInQuestion(questionText));
	}

	/**
	 * @param index
	 *            - index of the fill in question
	 * @return question text, there are inserted "_____" strings where should be
	 *         filled in words.
	 */
	public String getFillInQuestionText(int index) {
		FillInQuestion curQuestion = getFillInQuestion(index);
		if (curQuestion == null) {
			return null;
		}
		return curQuestion.getQuestionText();
	}

	/**
	 * @param index
	 *            - Index of the fill in question
	 * @return number of words, which should be filled in.
	 */
	public int getFillInQuestionWordNum(int index) {
		FillInQuestion curQuestion = getFillInQuestion(index);
		if (curQuestion == null) {
			return 0;
		}
		return curQuestion.getFillWordNum();
	}

	/**
	 * Checks answer of the given fill in question.
	 * 
	 * @param index
	 *            - Index of the question
	 * @param answers
	 *            - User input Strings which should be added into the question
	 *            string
	 * @return true if the answer is correct, false if the answer is incorrect
	 */
	public boolean checkFillInQuestionAnswer(int index, ArrayList<String> answers) {
		FillInQuestion curQuestion = getFillInQuestion(index);
		if (curQuestion == null) {
			return false;
		}
		return curQuestion.checkAnswer(answers);
	}

	/**
	 * 
	 * @param index
	 *            - Index of the question
	 * @return Question text with correct answers
	 */
	public String getFullFillInQuestionText(int index) {
		FillInQuestion curQuestion = getFillInQuestion(index);
		if (curQuestion == null) {
			return null;
		}
		return curQuestion.getFullQuestionText();
	}

	// Matching Question

	/**
	 * Adds new "matching" type question to Quiz
	 * 
	 * @param questionText
	 *            - Question text String
	 * @param correctMatches
	 *            - ArrayList of correct matches pairs
	 */
	public void addMatchingQuestion(String questionText, ArrayList<StrPair> correctMatches) {
		indices.add(matchingList.size());
		updateForAdding(MATCHING_NUM);
		matchingList.add(new MatchingQuestion(questionText, correctMatches));
	}

	/**
	 * @param index
	 *            - Index of the "matching" type question
	 * @return Question text
	 */
	public String getMatchingQuestionText(int index) {
		MatchingQuestion curQuestion = getMatchingQuestion(index);
		if (curQuestion == null) {
			return null;
		}
		return curQuestion.getQuestionText();
	}

	/**
	 * Checks the answer of the given matching question. Pairs in ArrayList can be
	 * in any order.
	 * 
	 * @param index
	 *            - Index of the "matching" type question
	 * @param matches
	 *            - ArrayList of String pairs. The first String is key and the
	 *            second one is value.
	 * @return true if the answer is correct.
	 */
	public boolean checkMatchingQuestionAnswer(int index, ArrayList<StrPair> matches) {
		MatchingQuestion curQuestion = getMatchingQuestion(index);
		if (curQuestion == null) {
			return false;
		}
		return curQuestion.checkAnswer(matches);
	}

	/**
	 * @param index
	 *            - Index of the "matching" type question
	 * @return ArrayList of matching pair keys.
	 */
	public ArrayList<String> getMatchingQuestionKeys(int index) {
		MatchingQuestion curQuestion = getMatchingQuestion(index);
		if (curQuestion == null) {
			return null;
		}
		return curQuestion.getKeys();
	}

	/**
	 * 
	 * @param index
	 *            - Index of the "matching" type question
	 * @return ArrayList of matching pair values.
	 */
	public ArrayList<String> getMatchingQuestionValues(int index) {
		MatchingQuestion curQuestion = getMatchingQuestion(index);
		if (curQuestion == null) {
			return null;
		}
		return curQuestion.getValues();
	}

	// Open-Ended Question
	/**
	 * Adds new "open ended" type question to Quiz
	 * 
	 * @param questionText
	 *            - Question Text String
	 * @param correctAnswers
	 *            - ArrayList of correct answers
	 */
	public void addOpenEndedQuestion(String questionText, ArrayList<String> correctAnswers) {
		indices.add(openEndedList.size());
		updateForAdding(OPEN_ENDED_NUM);
		openEndedList.add(new OpenEndedQuestion(questionText, correctAnswers));
	}

	/**
	 * Given index of question. Returns question text.
	 * 
	 * @param index
	 *            - Index of the "open ended" type question
	 * @return "open ended" type question text
	 */
	public String getOpenEndedQuestionText(int index) {
		OpenEndedQuestion curQuestion = getOpenEndedQuestion(index);
		if (curQuestion == null) {
			return null;
		}
		return curQuestion.getQuestionText();
	}

	/**
	 * 
	 * @param index - Index of the question
	 * @return ArrayList of correct answers for given question
	 */
	public ArrayList<String> getOpenEndedAnswers(int index) {
		OpenEndedQuestion curQuestion = getOpenEndedQuestion(index);
		if (curQuestion == null) {
			return null;
		}
		return curQuestion.getCorrectAnswers();
	}

	/**
	 * Checks if the given answer of the given "open ended" type question is correct
	 * 
	 * @param index
	 *            - Index of the "open ended" type question
	 * @param answer
	 *            - answer String
	 * @return true if the answer is correct
	 */
	public boolean checkOpenEndedQuestionAnswer(int index, String answer) {
		OpenEndedQuestion curQuestion = getOpenEndedQuestion(index);
		if (curQuestion == null) {
			return false;
		}
		return curQuestion.checkAnswer(answer);
	}

	// Multi Choice Question

	/**
	 * Adds new "multi choice" type question to Quiz
	 * 
	 * @param questionText
	 *            - Question text String
	 * @param answers
	 *            - Possible answers ArrayList
	 * @param correctAnswerIndex
	 *            - Index of the correct answer
	 */
	public void addMultiChoiceQuestion(String questionText, ArrayList<String> answers, int correctAnswerIndex) {
		indices.add(multiChoiceList.size());
		updateForAdding(MULTI_CHOICE_NUM);
		multiChoiceList.add(new MultiChoiceQuestion(questionText, answers, correctAnswerIndex));
	}

	/**
	 * Given index of question. Returns question text. Question type is "multi
	 * choice"
	 * 
	 * @param index
	 *            - Index of the "multi choice" type question
	 * @return "multi choice" type question text
	 */
	public String getMultiChoiceQuestionText(int index) {
		MultiChoiceQuestion curQuestion = getMultiChoiceQuestion(index);
		if (curQuestion == null) {
			return null;
		}
		return curQuestion.getQuestionText();
	}

	/**
	 * Checks if given answer of the given "multi choice" type question is correct
	 * 
	 * @param index
	 *            - Index of the "multi choice" type question
	 * @param answer
	 *            - answer String
	 * @return true if the answer is correct
	 */
	public boolean checkMultiChoiceQuestionAnswer(int index, String answer) {
		MultiChoiceQuestion curQuestion = getMultiChoiceQuestion(index);
		if (curQuestion == null) {
			return false;
		}
		return curQuestion.checkAnswer(answer);
	}

	/**
	 * 
	 * @param index
	 *            - index of the multi choice question
	 * @return ArrayList of possible answers
	 */
	public ArrayList<String> getMultiChoiceQuestionPossibleAnswers(int index) {
		MultiChoiceQuestion curQuestion = getMultiChoiceQuestion(index);
		if (curQuestion == null) {
			return null;
		}
		return curQuestion.getPossibleAnswers();
	}

	// Private instance variables
	private int questionNum;
	private String quizName;
	private String quizDescription;
	private ArrayList<Integer> typeNums;
	private ArrayList<Integer> indices;
	private ArrayList<OpenEndedQuestion> openEndedList;
	private ArrayList<MultiChoiceQuestion> multiChoiceList;
	private ArrayList<MatchingQuestion> matchingList;
	private ArrayList<FillInQuestion> fillInList;

	// Get Objects
	private OpenEndedQuestion getOpenEndedQuestion(int index) {
		if (index < 0 || index >= typeNums.size()) {
			return null;
		}
		return openEndedList.get(indices.get(index));
	}

	private MultiChoiceQuestion getMultiChoiceQuestion(int index) {
		if (index < 0 || index >= typeNums.size()) {
			return null;
		}
		return multiChoiceList.get(indices.get(index));
	}

	private MatchingQuestion getMatchingQuestion(int index) {
		if (index < 0 || index >= typeNums.size()) {
			return null;
		}
		return matchingList.get(indices.get(index));
	}

	private FillInQuestion getFillInQuestion(int index) {
		if (index < 0 || index >= typeNums.size()) {
			return null;
		}
		return fillInList.get(indices.get(index));
	}

	/*
	 * Adds typeNum integer to typeNums ArrayList to decide in the future which type
	 * given question is. Increases the number of questions.
	 */
	private void updateForAdding(Integer typeNum) {
		typeNums.add(typeNum);
		questionNum++;
	}

	// Open ended question class
	private class OpenEndedQuestion {
		private String questionText;
		private ArrayList<String> correctAnswers;

		// Constructor
		public OpenEndedQuestion(String questionText, ArrayList<String> correctAnswers) {
			this.questionText = questionText;
			this.correctAnswers = new ArrayList<>(correctAnswers);
		}

		public ArrayList<String> getCorrectAnswers() {
			return new ArrayList<>(correctAnswers);
		}

		public String getQuestionText() {
			return questionText;
		}

		public boolean checkAnswer(String answer) {
			return correctAnswers.contains(answer);
		}
	}

	// Multi choice question class
	private class MultiChoiceQuestion {
		private String questionText;
		private ArrayList<String> answers;
		private int correctAnswerIndex;

		// Constructor
		public MultiChoiceQuestion(String questionText, ArrayList<String> answers, int correctAnswerIndex) {
			this.questionText = questionText;
			this.answers = new ArrayList<>(answers);
			this.correctAnswerIndex = correctAnswerIndex;
		}

		public boolean checkAnswer(String answer) {
			if (answers.get(correctAnswerIndex).equals(answer)) {
				return true;
			}
			return false;
		}

		public String getQuestionText() {
			return questionText;
		}

		public ArrayList<String> getPossibleAnswers() {
			return new ArrayList<>(answers);
		}
	}

	// Matching question class
	private class MatchingQuestion {
		private String questionText;
		private ArrayList<StrPair> correctMatches;
		private ArrayList<String> keysArrayList;
		private ArrayList<String> valuesArrayList;

		// Matching question constructor
		public MatchingQuestion(String questionText, ArrayList<StrPair> correctMatches) {
			this.questionText = questionText;
			this.correctMatches = new ArrayList<>(correctMatches);
			Collections.sort(this.correctMatches);
			fillKeysAndValuesLists();
		}

		/*
		 * Initializes and fills keys and values lists.
		 */
		private void fillKeysAndValuesLists() {
			keysArrayList = new ArrayList<String>();
			valuesArrayList = new ArrayList<String>();
			for (int i = 0; i < correctMatches.size(); i++) {
				keysArrayList.add(correctMatches.get(i).getFirst());
				valuesArrayList.add(correctMatches.get(i).getSecond());
			}
		}

		public String getQuestionText() {
			return questionText;
		}

		/*
		 * Checks Answer. Pairs in ArrayList can be in any order.
		 */
		public boolean checkAnswer(ArrayList<StrPair> matches) {
			if (correctMatches.size() != matches.size()) {
				return false;
			}
			Collections.sort(matches);
			for (int i = 0; i < correctMatches.size(); i++) {
				if (!correctMatches.get(i).equals(matches.get(i))) {
					return false;
				}
			}
			return true;
		}

		public ArrayList<String> getKeys() {
			return new ArrayList<>(keysArrayList);
		}

		public ArrayList<String> getValues() {
			return new ArrayList<>(valuesArrayList);
		}

	}

	// Fill in question class
	private class FillInQuestion {

		private String questionText = "";
		private ArrayList<String> correctAnswers = new ArrayList<String>();
		private int wordFillNum;
		private String fullQuestionText;

		/*
		 * Fill in question constructor. Answers are in given text. It parses String,
		 * takes given answers from it and puts "_____" in those places Saves correct
		 * answers in ArrayList
		 */
		public FillInQuestion(String questionText) {
			this.fullQuestionText = questionText;
			int pos = 0;
			while (true) {
				if (pos >= questionText.length()) {
					break;
				}
				int starting = questionText.indexOf("((", pos);
				int ending = questionText.indexOf("))", starting);
				if (starting == -1 || ending == -1) {
					this.questionText = this.questionText.concat(questionText.substring(pos));
					break;
				}
				correctAnswers.add(questionText.substring(starting + 2, ending));
				this.questionText = this.questionText.concat(questionText.substring(pos, starting));
				this.questionText = this.questionText.concat("_____");
				pos = ending + 2;
			}

			wordFillNum = correctAnswers.size();
		}

		public String getFullQuestionText() {
			return fullQuestionText;
		}

		public String getQuestionText() {
			return questionText;
		}

		public int getFillWordNum() {
			return wordFillNum;
		}

		public boolean checkAnswer(ArrayList<String> answers) {
			if (answers.size() != correctAnswers.size()) {
				return false;
			}
			for (int i = 0; i < correctAnswers.size(); i++) {
				if (!correctAnswers.get(i).equals(answers.get(i))) {
					return false;
				}
			}
			return true;

		}

	}
}
