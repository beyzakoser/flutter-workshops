import 'package:flutter/material.dart';

class resultScreen extends StatelessWidget {
  resultScreen(this.answers, this.correctAnswer, {super.key});
  late List<String> answers;
  late int correctAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "You Finished!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
            // asset
            Image.asset(
              "assets/images/quiz-logo.png",
              width: 240,
            ),
            Text(
              'Correct Answers : $correctAnswer',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),

            ...answers.map((e) => Text(
                  e,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                )),
          ],
        ),
      ),
    );
  }
}
