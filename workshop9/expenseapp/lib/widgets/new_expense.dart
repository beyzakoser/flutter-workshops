import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense(this.callbackFunction, {Key? key}) : super(key: key);
  final void Function(Expense expense) callbackFunction;
  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseNameController = TextEditingController();
  var _expensePriceController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;

  void _openDatePicker() async {
    DateTime today = DateTime.now(); // 16.11.2023

    DateTime oneYearAgo = DateTime(today.year - 1, today.month, today.day);

    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate == null ? today : _selectedDate!,
        firstDate: oneYearAgo,
        lastDate: today);
    setState(() {
      _selectedDate = selectedDate;
    });
    print("Merhaba");

    // sync => bir satır çalışmasını bitirmeden alt satıra geçemez.
    // async => async olan satır sadece tetiklenir kod aşağıya doğru çalışmaya devam eder
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          TextField(
            controller: _expenseNameController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: "Harcama Adı"),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _expensePriceController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter
                        .digitsOnly, //sadece sayı girişi yapılabilecek
                  ],
                  decoration: const InputDecoration(
                      labelText: "Harcama Miktarı", prefixText: "₺"),
                ),
              ),
              IconButton(
                  onPressed: () => _openDatePicker(),
                  icon: const Icon(Icons.calendar_month)),
              // ternary operator
              Text(_selectedDate == null
                  ? "Tarih Seçiniz"
                  : DateFormat.yMd().format(_selectedDate!)),
            ],
            // String?  a
            // String => a!
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                        value: category, child: Text(category.name));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) _selectedCategory = value;
                    });
                  })
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Kapat")),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_selectedDate == null ||
                        _expenseNameController.text.isEmpty ||
                        _expensePriceController.text.isEmpty) {
                      //boş alan bırakıldıysa alert göster
                      AlertDialog alert = AlertDialog(
                        title: const Text("UYARI"),
                        content: const Text("Lütfen boş alan bırakmayınız."),
                        actions: [
                          TextButton(
                            child: const Text("Tamam"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    } else {
                      setState(() {
                        //yeni harcamayı ekledim
                        Expense expense = Expense(
                            name: _expenseNameController.text,
                            price: double.parse(_expensePriceController.text),
                            date: _selectedDate!,
                            category: _selectedCategory);
                        widget.callbackFunction(expense);
                        Navigator.pop(context);
                        //Her ekle butonuna basıldığında alanları boşalttım
                        _expenseNameController.text = "";
                        _expensePriceController.text = "";
                        _selectedDate = DateTime.now();
                      });
                    }
                  },
                  child: const Text("Ekle")),
            ],
          ),
        ]),
      ),
    );
  }
}
