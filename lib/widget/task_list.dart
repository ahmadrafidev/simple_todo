import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';

class TaskList extends StatelessWidget {

  final List<Task> task;
  final Function deleteTask;

  const TaskList(this.task, this.deleteTask);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: 550,
              child: task.isEmpty
                  ? Column(
                children: const <Widget>[
                  Text(
                    'Empty Here.\n Maybe add one?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
                  : ListView.builder(
                shrinkWrap: true,
                itemCount: task.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      title: Text(
                        task[index].name!,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(task[index].date!),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_sharp),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deleteTask(task[index].id),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height:10),
        ],
      ),
    );
  }
}
