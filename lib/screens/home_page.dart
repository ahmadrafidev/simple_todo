import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  static const routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        backgroundColor: const Color.fromRGBO(57, 57, 60, 1),
        toolbarHeight: 90.0,
        shape: ShapeBorder.lerp(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), null, 0),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  CupertinoIcons.calendar,
                  size: 35.0,
                ),
              )
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('Test')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, size: 35,),
        backgroundColor: const Color.fromRGBO(113, 93, 204, 1),
      ),
    );
  }
}
