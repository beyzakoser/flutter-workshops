import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/pages/expenses_page.dart';
import 'package:flutter/material.dart';

//Uygulamanıza bir adet + iconu ve ExpenseApp title'ı içeren Topbar ekleyiniz.
void main() {
  runApp(
    MaterialApp(
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.add_circle_outlined)),
              ],
            ),
            title: const Text('Expense App'),
          ),
          body: ExpensesPage(),
        ),
      ),
    ),
  );
}
