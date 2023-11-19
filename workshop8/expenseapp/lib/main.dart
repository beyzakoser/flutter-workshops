import 'package:expenseapp/pages/main_page.dart';
import 'package:flutter/material.dart';

///Workshop 16.11.2023
//Expense ekleme dialog'unda kaydet butonunun form valid olduğu durumda veriler arasına yeni veriyi ekleme işlemini handle ediniz.

void main() {
  runApp(MaterialApp(
      theme: ThemeData(useMaterial3: true), home: const MainPage()));
}
