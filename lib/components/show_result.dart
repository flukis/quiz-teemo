import 'package:flutter/material.dart';
import 'package:quizwr/viewmodel/quiz_model.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.answer,
  });

  final AnswerQuizQuestion answer;

  @override
  Widget build(BuildContext context) {
    final correct = "Correct answer: ${answer.answer}";
    final givenAnswer = "Your answer: ${answer.givenAnswer}";
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${answer.answer == answer.givenAnswer ? "✅" : "❌"} ${answer.text}",
              style: const TextStyle(
                color: Color.fromARGB(255, 59, 60, 61),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              correct,
              style: const TextStyle(
                color: Color.fromARGB(160, 10, 22, 37),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              givenAnswer,
              style: const TextStyle(
                color: Color.fromARGB(160, 10, 22, 37),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
