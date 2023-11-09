import 'dart:math';

import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  List<Expense> expenses = [
    Expense(name: "Yemek", price: 500, date: DateTime.now()),
    Expense(name: "Udemy Kursu", price: 200, date: DateTime.now()),
    Expense(name: "Yol", price: 50, date: DateTime.now()),
    Expense(name: "Faturalar", price: 1000, date: DateTime.now()),
  ];

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
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.info),
                        onPressed: () {
                          //Bilgilendirme iconuna basıldığında tarih bilgisini yazdırdım
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Information'),
                                content: Text(
                                  '- ${expenses[index].date}',
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }),
                    Text(
                      '- ${expenses[index].name} ${expenses[index].price} ₺',
                      style: const TextStyle(fontSize: 20),
                    ),
                    IconButton(
                        //silme iconuna basıldığında ekrandan eksilttim
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            expenses.removeAt(index);
                            print(expenses.map((e) => e.name));
                          });
                        }),
                  ],
                );
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
