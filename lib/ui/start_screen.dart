import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/teemo-scouting.png",
            width: 280,
          ),
          const SizedBox(
            height: 18,
          ),
          const Text(
            "Quiz time by Captain Teemo",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 1.75,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 20, 30, 55),
            ),
          ),
          TextButton.icon(
            onPressed: startQuiz,
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 20, 30, 55),
            ),
            label: const Text(
              "Start quiz",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            icon: const Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
