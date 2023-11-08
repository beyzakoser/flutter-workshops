import 'package:flutter/material.dart';
import 'package:introapp/data/questions.dart';
import 'package:introapp/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizState();
  }
}

// navigator
class _QuizState extends State<QuizScreen> {
  int selectedQuestionIndex = 0;
  int correctAnswer = 0;
  String playerAnswer = "";
  List<String> answers = [];

  void changeQuestion(String playerAnswer) {
    setState(() {
      answers.add(playerAnswer); //kullanıcı cevaplarını listeye ekledim
      if (questions[selectedQuestionIndex].correctAnswer == playerAnswer) {
        //kullanıcı cevaplarıyla doğru cevabı karşılaştırıp doğruysa artırdım
        correctAnswer++;
      }
      if (questions.length - 1 > selectedQuestionIndex) {
        selectedQuestionIndex++;
      } else {
        //Son soruya gelindiyse Result ekranına yönlendirdim
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => resultScreen(answers, correctAnswer)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(questions[selectedQuestionIndex].question),
              ...questions[selectedQuestionIndex].answers.map((answer) {
                return ElevatedButton(
                    onPressed: () {
                      changeQuestion(answer);
                    },
                    child: Text(answer));
              })
            ],
          ),
        ),
      ),
    );
  }
}
