import 'package:expenseapp/pages/main_page.dart';
import 'package:flutter/material.dart';

/* DatePicker icon butonuna tıklandığında bir tarih seçici açılması, 
bu tarih seçiciden seçilen sonucun ekranda tarih formatlanmış bir şekilde yazdırılması işlevlerini ele alalım.
Kullanıcı maksimum bugünün tarihini, minimum bugünden 1 yıl öncesinin tarihini seçebilmelidir. */
void main() {
  runApp(MaterialApp(
      theme: ThemeData(useMaterial3: true), home: const MainPage()));
}
