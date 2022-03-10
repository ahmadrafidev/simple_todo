import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskList extends StatelessWidget {

  final List<Task> task;
  final Function deleteTask;

  const TaskList(this.task, this.deleteTask);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
