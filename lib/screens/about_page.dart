import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_todo/components/card.dart';
import 'package:simple_todo/components/profile.dart';

class AboutPage extends StatelessWidget {
  static const routeName = '/about_page';
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About Me',
          style: GoogleFonts.mavenPro(
            fontSize: 32, fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: const Color.fromRGBO(57, 57, 60, 1),
        toolbarHeight: 70.0,
        shape: ShapeBorder.lerp(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), null, 0),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                CustomCard(),
                Text(
                  "Test"
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
