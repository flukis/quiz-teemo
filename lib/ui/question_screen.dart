import 'package:flutter/material.dart';
import 'package:quizwr/components/answer_button.dart';
import 'package:quizwr/helpers/question_shuffled.dart';
import 'package:quizwr/viewmodel/quiz_model.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectedAnswer,
    required this.finishAnswering,
    required this.questions,
  });

  final void Function(String answer) onSelectedAnswer;
  final void Function() finishAnswering;
  final List<QuizQuestion> questions;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void increamentQuestionIndex(String selectedAnswer) {
    if (currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        widget.onSelectedAnswer(selectedAnswer);
        currentQuestionIndex += 1;
      });
    } else {
      widget.finishAnswering();
    }
  }

  @override
  Widget build(context) {
    final currentQuestion = widget.questions[currentQuestionIndex];
    final question = Question(currentQuestion.text, currentQuestion.answer);
    final indexPlusOne = currentQuestionIndex + 1;
    final title = "Question Number $indexPlusOne";

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              // ignore: prefer_interpolation_to_compose_strings
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                letterSpacing: 1.75,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(200, 20, 30, 55),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                letterSpacing: 1.75,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 20, 30, 55),
              ),
            ),
            const SizedBox(height: 24),
            ...question.getShuffledAnswers().map((item) {
              return AnswerButton(
                answerText: item,
                onTap: increamentQuestionIndex,
              );
            })
          ],
        ),
      ),
    );
  }
}
