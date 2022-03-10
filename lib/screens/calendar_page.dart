import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarPage extends StatelessWidget {
  static const routeName = '/calendar_page';
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Calendar',
          style: GoogleFonts.mavenPro(
              fontSize: 32, fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        toolbarHeight: 70.0,
        shape: ShapeBorder.lerp(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), null, 0),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('Test'),
          ],
        ),
      ),
    );
  }
}
