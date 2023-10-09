import 'package:flutter/material.dart';
import 'package:quizwr/components/show_result.dart';
import 'package:quizwr/helpers/get_corrected_answer.dart';
import 'package:quizwr/viewmodel/quiz_model.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.startQuiz,
    required this.selectedAnwser,
    required this.questions,
  });

  final void Function() startQuiz;
  final List<String> selectedAnwser;
  final List<QuizQuestion> questions;

  @override
  Widget build(context) {
    final result = Result(questions, selectedAnwser);
    final resulScore = result.getResult();
    final answerLists = result.constructResult();
    final score = "🥳 Yay, your score is $resulScore from ${questions.length}";
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            score,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              letterSpacing: 1.75,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 20, 30, 55),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 400,
            child: ListView(
              children: [
                ...answerLists.map((item) {
                  return ResultCard(answer: item);
                })
              ],
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          TextButton.icon(
            onPressed: startQuiz,
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 20, 30, 55),
            ),
            label: const Text(
              "Try again",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            icon: const Icon(Icons.loop_outlined),
          )
        ],
      ),
    );
  }
}
