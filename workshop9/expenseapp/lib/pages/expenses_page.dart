import 'dart:math';

import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/chart.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage(this.expenses, this.onRemove, this.onUndo, {Key? key})
      : super(key: key);
  final List<Expense> expenses;
  final void Function(Expense expense, int index) onRemove;
  final void Function() onUndo;

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 150,
          child: Chart(allExpenses: widget.expenses),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(widget.expenses[index]),
                  child: ExpenseItem(widget.expenses[index]),
                  onDismissed: (direction) {
                    widget.onRemove(widget.expenses[index], index);
                    final snackBar = SnackBar(
                      content: const Text('Harcama Başarıyla silindi!'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          widget.onUndo();
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                );
              }),
        ),
      ]),
    );
  }
}
