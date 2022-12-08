import 'package:flutter/material.dart';

import './new_transactions.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        amount: 12897.2112,
        date: DateTime.now(),
        id: '1st transaction',
        title: 'Alright new title'),
    Transaction(
        amount: 123456,
        date: DateTime.now(),
        id: '2nd transaction',
        title: 'Alright new new title')
  ];
  void _addNewTransactions(String title, double amount) {
    final newTrans = Transaction(
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
        title: title);
    setState(() {
      _userTransactions.add(newTrans);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTrans: _addNewTransactions),
        TransactionList(
          transactions: _userTransactions,
        )
      ],
    );
  }
}
