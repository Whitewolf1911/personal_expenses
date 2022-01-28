// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    'No transactions added yet ! ',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover))
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.purple)),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            transactions[index].amount.toStringAsFixed(2) +
                                " \$",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              transactions[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(DateFormat.yMMMMd()
                                .format(transactions[index].date))
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        //delete button
                        Expanded(
                          child: IconButton(alignment: Alignment.centerRight,
                              onPressed: () => deleteTx(transactions[index].id), //TODO add method to delete transaction
                              icon: Icon(Icons.delete),
                              color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
