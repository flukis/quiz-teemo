import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final void Function(String selectedValue) onTap;
  final String answerText;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: () {
        onTap(answerText);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(6),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color.fromARGB(255, 20, 30, 55),
        ),
      ),
    );
  }
}
