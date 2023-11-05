import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(199, 108, 158, 97),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("images/image.jpeg"),
              width: 250,
              height: 250,
            ),
            Text(
              "Beyza Koşer",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Text(
              "Tobeto - Mobil Geliştirici - 1B",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              "- 01.11.2023 -",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        )),
      ),
    ),
  );
}
