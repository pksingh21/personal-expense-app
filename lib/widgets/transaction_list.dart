import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList({required this.transactions});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemBuilder: ((context, index) {
          return Card(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  padding: EdgeInsets.all(15),
                  width: 124,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 2,
                          style: BorderStyle.solid)),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "\$${transactions[index].amount}",
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                      child: Text(
                        "${transactions[index].title}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      elevation: 0),
                  Card(
                      child: Text(
                        DateFormat.yMMMMd().format(transactions[index].date),
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                      elevation: 0)
                ],
              )
            ],
          ));
        }),
        itemCount: transactions.length,
      ),
    );
  }
}
