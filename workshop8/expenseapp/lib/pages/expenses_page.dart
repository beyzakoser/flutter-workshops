import 'dart:math';

import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  //const ExpensesPage({Key? key}) : super(key: key);
  ExpensesPage({required this.newexpenses});
  List<Expense> newexpenses;

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  // callback fonksiyon
  // setState'i unutmayalım..

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
          height: 150,
          child: Text("Grafik Bölümü"),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.newexpenses.length,
              itemBuilder: (context, index) {
                return ExpenseItem(widget.newexpenses[index]);
              }),
        ),
        const SizedBox(
          height: 150,
          child: Text("Burası bottom bar."),
        )
      ]),
    );
  }
}
