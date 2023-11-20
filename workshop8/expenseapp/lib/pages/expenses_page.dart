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
//<<<<<<< HEAD
  List<Expense> expenses = [
    Expense(
        name: "Yemek",
        price: 500.529,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        name: "Udemy Kursu",
        price: 200,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        name: "Faturalar",
        price: 200,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        name: "Giyim",
        price: 400,
        date: DateTime.now(),
        category: Category.dress),
  ];
//=======
//>>>>>>> main

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
