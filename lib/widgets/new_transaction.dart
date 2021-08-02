import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitData() {
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

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    ).then((pickedDate) => {if (pickedDate != null) {}});
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
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              // onChanged: (value) => {amountInput = value},
              decoration: InputDecoration(labelText: "Amount"),
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text("No Date Picked"),
                  TextButton(
                    onPressed: _showDatePicker,
                    child: Text("Pick Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        )),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                  textStyle: MaterialStateProperty.all(TextStyle(
                    color: Theme.of(context).textTheme.button!.color,
                  ))),
              child: Text(
                "Add Transaction",
              ),
            )
          ],
        ),
      ),
    );
  }
}
