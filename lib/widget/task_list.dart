import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';

class TaskList extends StatefulWidget {

  final List<Task> task;
  final Function deleteTask;

  const TaskList(this.task, this.deleteTask);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            height: 580,
            child: widget.task.isEmpty ? Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    'Empty Here.\n Maybe add one?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mavenPro(
                      color:  Theme.of(context).secondaryHeaderColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ) :
            ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.task.length,
              itemBuilder: (ctx, index) {
                return Dismissible(
                  key: Key(widget.task[index].id!),
                  background: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    color: Colors.red,
                    child: Align(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            Text(
                              "Delete",
                              style: GoogleFonts.mavenPro(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            SizedBox(width: 20.0,)
                          ]
                        ),
                    ),
                  ),
                  onDismissed: (direction) {
                    setState((){
                      var deletedItem = widget.task.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            dismissDirection: DismissDirection.down,
                            duration: Duration(milliseconds: 1500),
                            backgroundColor: Theme.of(context).primaryColor,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17.0)
                            ),
                            content: Text(
                                'Deleted ${deletedItem.name}!',
                                  style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: Colors.white
                                )
                            ),
                            action: SnackBarAction(
                                label: "UNDO",
                                onPressed: () => setState(() => widget.task.insert(index, deletedItem),) // this is what you needed
                            ),)
                          );
                        });
                  },
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (DismissDirection direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)
                          ),
                          title: Text(
                              "Confirm",
                            style: GoogleFonts.mavenPro(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 24
                            ),
                          ),
                          content: Text("Are you sure to delete this task?",
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                child: const Text("DELETE"),
                                style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)
                                    )
                                ),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("CANCEL"),
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                                )
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      elevation: 10,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 5,
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.red
                        ),
                        child: CheckboxListTile(
                          activeColor: Colors.grey,
                          controlAffinity: ListTileControlAffinity.leading,
                          value: widget.task[index].isDone,
                          onChanged: (bool? val){
                            setState(() {
                             widget.task[index].isDone = val;
                            });
                          },
                          title: Text(
                            widget.task[index].name!,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 24
                            ),
                          ),
                          subtitle: Text(
                            DateFormat.yMMMd().format(widget.task[index].date!,),
                            style: TextStyle(
                              color: Colors.black87
                            ),
                          ),
                        ),
                      ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
