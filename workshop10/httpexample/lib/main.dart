import 'package:flutter/material.dart';
import 'package:httpexample/screens/products_screen.dart';

//workshop 19.12.2023  Projedeki http isteğinden gelen cevabın bir dart modeline aktarılmasını kodlayınız.
ColorScheme colorScheme1 = ColorScheme.fromSeed(seedColor: Colors.lime);
void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme1,
      appBarTheme: AppBarTheme(
        color: colorScheme1.primary,
        foregroundColor: colorScheme1.onPrimary,
      ),
    ),
    home: Scaffold(
        appBar: AppBar(
          title: Text("HTTP"),
        ),
        body: ProductsScreen()),
  ));
}
