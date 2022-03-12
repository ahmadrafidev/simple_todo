import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../models/task.dart';
import '../widget/new_task.dart';
import '../widget/task_list.dart';
import 'calendar_page.dart';


class HomePage extends StatefulWidget {
  static const routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> _userTask = [];

  void _deleteTask(String id) {
    setState(() {
      _userTask.removeWhere((ctx) => ctx.id == id);
    });
  }

  void _addNewTask(String todoName, DateTime chosenDate) {
    final newTodo = Task(
      id: DateTime.now().toString(),
      name: todoName,
      date: chosenDate,
    );
    setState(() {
      _userTask.add(newTodo);
    });
  }

  void _startAddNewTask(BuildContext ctx) {
    showMaterialModalBottomSheet(
        backgroundColor: Colors.white,
        context: ctx,
        isDismissible: true,
        enableDrag: true,
        builder: (_) {
          return GestureDetector(
            child: NewTodo(_addNewTask),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tasks',
          style: GoogleFonts.mavenPro(
              fontSize: 32, fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        toolbarHeight: 90.0,
        shape: ShapeBorder.lerp(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), null, 0),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CalendarPage()));
                },
                child: const Icon(
                  CupertinoIcons.calendar,
                  size: 35.0,
                ),
              )
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              TaskList(_userTask, _deleteTask),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTask(context),
        child: const Icon(Icons.add, size: 35,),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
