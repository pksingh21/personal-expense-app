import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  late final Function(String title, double amount) addTrans;
  NewTransaction({required this.addTrans});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  // onChanged: (value) => {titleInput = value},
                  controller: titleController,
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                  decoration: InputDecoration(labelText: 'Amount'),
                  // onChanged: (value) => {amountInput = value},
                  controller: amountController,
                ),
                TextButton(
                    onPressed: () => {
                          if (!titleController.text.isEmpty &&
                              double.parse(amountController.text) > 0)
                            addTrans(titleController.text,
                                double.parse(amountController.text))
                        },
                    child: Text('Add Transaction'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)))
              ]),
        ),
      ),
    );
  }
}
