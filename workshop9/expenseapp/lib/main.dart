import 'package:expenseapp/pages/main_page.dart';
import 'package:flutter/material.dart';

ColorScheme colorScheme1 = ColorScheme.fromSeed(seedColor: Colors.teal);
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme1,
          appBarTheme: AppBarTheme(
            color: colorScheme1.primary,
            foregroundColor: colorScheme1.onPrimary,
          ),
          scaffoldBackgroundColor: colorScheme1.onPrimary,
          cardTheme: CardTheme(
            color: colorScheme1.primaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: const TextStyle(fontWeight: FontWeight.bold),
                titleMedium: TextStyle(color: colorScheme1.primary),
                bodyMedium: TextStyle(
                    color: colorScheme1.primary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
          snackBarTheme: ThemeData().snackBarTheme.copyWith(
                actionTextColor: colorScheme1.onPrimary,
                backgroundColor: colorScheme1.primary,
              ),
          iconTheme: IconThemeData(color: colorScheme1.primary),
          bottomSheetTheme:
              BottomSheetThemeData(dragHandleColor: colorScheme1.error),
          drawerTheme: DrawerThemeData(backgroundColor: colorScheme1.primary)),
      home: const MainPage(),
    ),
  );
}
