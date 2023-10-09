class QuizQuestion {
  QuizQuestion(this.text, this.answer);

  final String text;
  final List<String> answer;
}

class AnswerQuizQuestion {
  AnswerQuizQuestion(this.text, this.answer, this.givenAnswer);

  final String text;
  final String answer;
  final String givenAnswer;
}
