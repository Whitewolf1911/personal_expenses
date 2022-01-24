// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:personal_expenses/transaction.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', date: DateTime.now(), title: 'New Shoes', amount: 23.99),
    Transaction(
        id: 't2', date: DateTime.now(), title: 'New Tshirt', amount: 7.99)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Container(color: Colors.amber, child: Text('CHART')),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        tx.amount.toString() + " \$",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(tx.date.toString())
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
