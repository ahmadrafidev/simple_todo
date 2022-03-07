 import 'package:flutter/material.dart';

import 'package:simple_todo/screens/tabs_screen.dart';
import 'package:simple_todo/screens/home_page.dart';
import 'package:simple_todo/screens/about_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TabsScreen(),
      routes: {
        HomePage.routeName: (ctx) => const HomePage(),
        AboutPage.routeName: (ctx) => const AboutPage(),
      },
    );
  }
}

