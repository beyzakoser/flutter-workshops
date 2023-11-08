import 'package:flutter/material.dart';

class resultScreen extends StatelessWidget {
  const resultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // asset
            Image.asset(
              "assets/images/quiz-logo.png",
              width: 240,
            ),
            const Text("Congratulations You Finished!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5)),
          ],
        ),
      ),
    );
  }
}
