// id => identifier => kimlik belirleyici

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { work, travel, food, health, shopping, other }

const categoryIcons = {
  Category.work: Icons.work,
  Category.travel: Icons.directions_car,
  Category.food: Icons.restaurant,
  Category.health: Icons.favorite,
  Category.shopping: Icons.shopping_cart,
  Category.other: Icons.more_horiz
};

class Expense {
  Expense(
      {required this.name,
      required this.price,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String name;
  final double price;
  final DateTime date;
  final Category category;
}

class CategoryExpenses {
  const CategoryExpenses({required this.category, required this.expenses});
  final Category category;
  final List<Expense> expenses;

  double get totalCategoryPrice {
    double sum = 0;

    expenses.forEach((expense) {
      sum += expense.price;
    });

    return sum;
  }
}
