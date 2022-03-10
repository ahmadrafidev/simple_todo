import 'package:flutter/material.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:simple_todo/components/profile_card.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile_page';
  const ProfilePage({Key? key}) : super(key: key);

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
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        toolbarHeight: 70.0,
        shape: ShapeBorder.lerp(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), null, 0),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                CustomCard(),
              ],
            ),
          )
        ],
      )
    );
  }
}
