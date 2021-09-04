import 'package:first_flutter_project/widgets/adaptive_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _pickedDate;

  void _submitData() {
    var inputTitle = _titleController.text;
    var inputAmount = double.parse(_amountController.text);

    if (inputTitle.isEmpty || inputAmount <= 0 || _pickedDate == null) {
      return;
    }

    widget.addNewTransaction(inputTitle, inputAmount, _pickedDate);

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    ).then((pickedDate) => {
          setState(() {
            _pickedDate = pickedDate;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              // onChanged: (value) => {titleInput = value},
              decoration: InputDecoration(labelText: "Title"),
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              // onChanged: (value) => {amountInput = value},
              decoration: InputDecoration(labelText: "Amount"),
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _pickedDate == null
                          ? "No Date Picked"
                          : "Picked date: ${DateFormat.yMd().format(_pickedDate!)}",
                    ),
                  ),
                  AdaptiveButton("Pick date", _showDatePicker)
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
    ));
  }
}
