import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/pages/expenses_page.dart';
import 'package:expenseapp/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
  ];
  late int temporaryIndexNo;
  late Expense temporaryExpense;

  addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  removeExpense(Expense expense, int index) {
    setState(() {
      //silinen verileri geçisi bir değişkende tuttum  undo işlemi için
      temporaryExpense = expense;
      temporaryIndexNo = index;
      expenses.remove(expense);
      print("${temporaryExpense}, ${temporaryIndexNo}");
    });
  }

  undo() {
    setState(() {
      //geçici tuttuğum indexe son expense i ekle
      expenses.insert(temporaryIndexNo, temporaryExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //foregroundColor: Colors.white,
        title: const Text("Expense App"),
        //backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return NewExpense(addExpense);
                    });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ExpensesPage(expenses, removeExpense, undo),
    );
  }
}
