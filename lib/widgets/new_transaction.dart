import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // We are using these controllers for getting user input from TextFields
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addingNewTx;

  NewTransaction(this.addingNewTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            FlatButton(
              onPressed: () {
                addingNewTx(titleController.text, double.parse(amountController.text));
              },
              child: Text('Add Transaction'),
              textColor: Colors.deepPurple,
            )
          ],
        ),
      ),
    );
  }
}
