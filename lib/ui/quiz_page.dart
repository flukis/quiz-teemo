import 'package:flutter/material.dart';
import 'package:quizwr/data/question_seeder.dart';
import 'package:quizwr/ui/result_screen.dart';
import 'package:quizwr/ui/question_screen.dart';
import 'package:quizwr/ui/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';
  final List<String> selectedAnswer = [];

  void startQuiz() {
    setState(() {
      activeScreen = 'quiz-screen';
    });
  }

  void retry() {
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  void finish() {
    setState(() {
      activeScreen = 'finish-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
  }

  @override
  Widget build(context) {
    final screen = switch (activeScreen) {
      "quiz-screen" => QuestionScreen(
          onSelectedAnswer: chooseAnswer,
          finishAnswering: finish,
          questions: questions,
        ),
      "finish-screen" => ResultScreen(
          startQuiz: retry,
          selectedAnwser: selectedAnswer,
          questions: questions,
        ),
      "start-screen" => StartScreen(startQuiz),
      String() => null,
    };
    return MaterialApp(
      title: "WR Quiz",
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 50, 200, 255),
                Color.fromARGB(255, 250, 250, 250)
              ],
            ),
          ),
          child: Stack(
            children: [
              Container(
                child: screen,
              ),
              const Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "for learning purpose",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
