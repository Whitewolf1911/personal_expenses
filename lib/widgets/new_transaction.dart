import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addingNewTx;

  NewTransaction(this.addingNewTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // We are using these controllers for getting user input from TextFields
  final titleController = TextEditingController();

  final amountController = TextEditingController();

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
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              
            ),
            FlatButton(
              onPressed: () {
                if (titleController.text.isEmpty || double.parse(amountController.text) <= 0){
                  return;
                }
                else{
                widget.addingNewTx(
                    titleController.text, double.parse(amountController.text));
                }
                Navigator.of(context).pop();
              },
              child: Text('Add Transaction'),
              textColor: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
