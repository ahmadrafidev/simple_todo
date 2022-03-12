import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTodo extends StatefulWidget {
  final Function addTodo;

  const NewTodo(this.addTodo);

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final _titleController = TextEditingController();
  DateTime? _selectedDate;

  void _submitDataHandler() {
    if (_titleController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty || _selectedDate == null) {
      return;
    }
    widget.addTodo(enteredTitle, _selectedDate);
    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: 'What would you like to do?',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color:Theme.of(context).primaryColor, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(15.0))
                    )
                  ),
                  controller: _titleController,
                  onSubmitted: (_) => _submitDataHandler()
                ),
                SizedBox(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(_selectedDate == null
                            ? "No Date Chosen!"
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(113, 93, 204, 1),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: _datePicker,
                        child: const Text(
                          'Choose Date',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(113, 93, 204, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    child: Text(
                      'Add Task',
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                    style: TextButton.styleFrom(
                      fixedSize: Size(105, 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                      primary: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: _submitDataHandler
                    ),
              ],
            ),
          ),
        )
    );
  }
}