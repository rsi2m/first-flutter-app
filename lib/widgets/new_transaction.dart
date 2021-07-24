import 'package:flutter/material.dart';

class NewTransaction extends  StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    var inputTitle = titleController.text;
    var inputAmount = double.parse(amountController.text);

    if (inputTitle.isEmpty || inputAmount <= 0) {
      return;
    }

    widget.addNewTransaction(
      inputTitle,
      inputAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              // onChanged: (value) => {titleInput = value},
              decoration: InputDecoration(labelText: "Title"),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              // onChanged: (value) => {amountInput = value},
              decoration: InputDecoration(labelText: "Amount"),
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: submitData,
              child: Text(
                "Add Transaction",
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
