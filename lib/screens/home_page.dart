import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

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
      ),
    );
  }
}
