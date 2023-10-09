import 'package:quizwr/viewmodel/quiz_model.dart';

class Result {
  const Result(this.lists, this.answered);
  final List<QuizQuestion> lists;
  final List<String> answered;

  List<String> getShuffledAnswers() {
    var answers = lists.map((value) => value.answer.first).toList();
    return answers;
  }

  int getResult() {
    int result = 0;
    var count = 0;
    for (var item in lists) {
      if (item.answer[0] == answered[count]) {
        result += 1;
      }
      count++;
    }
    return result;
  }

  List<AnswerQuizQuestion> constructResult() {
    List<AnswerQuizQuestion> result = [];

    var count = 0;
    for (var item in lists) {
      AnswerQuizQuestion buf =
          AnswerQuizQuestion(item.text, item.answer[0], answered[count]);
      result.add(buf);
      count += 1;
    }

    return result;
  }
}
