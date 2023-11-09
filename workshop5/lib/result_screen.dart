import 'package:flutter/material.dart';

class resultScreen extends StatelessWidget {
  resultScreen(this.answers, this.correctAnswers, this.correctAnswerNumber,
      {super.key});
  late List<String> answers;
  late List<String> correctAnswers;
  late int correctAnswerNumber;

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
              'Correct Answers : $correctAnswerNumber', //doğru cevap sayısı
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),

            ...answers.map((e) {
              if (correctAnswers.contains(e)) {
                return Text(
                  //doğru cevaplar yeşil olarak ekrana yazıldı
                  e,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                );
              } else {
                return Text(
                  //yanlış cevaplar kırmızı ve üzeri çizik olarak ekrana yazıldı
                  e,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      decoration: TextDecoration.lineThrough),
                );
              }
              //return Text("ffv");
            }),
          ],
        ),
      ),
    );
  }
}
