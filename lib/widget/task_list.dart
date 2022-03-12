import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';

class TaskList extends StatelessWidget {

  final List<Task> task;
  final Function deleteTask;

  const TaskList(this.task, this.deleteTask);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: 550,
                child: task.isEmpty ? Column(
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
                ) : ListView.builder(
                  shrinkWrap: true,
                  itemCount: task.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      elevation: 10,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 5,
                      ),
                      child: ListTile(
                        title: Text(
                          task[index].name!,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 24
                          ),
                        ),
                        subtitle: Text(
                          DateFormat.yMMMd().format(task[index].date!,),
                          style: TextStyle(
                            color: Colors.black87
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_rounded),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteTask(task[index].id),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
