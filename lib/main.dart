 import 'package:flutter/material.dart';

import 'package:simple_todo/screens/calendar_page.dart';
import 'package:simple_todo/screens/tabs_screen.dart';
import 'package:simple_todo/screens/home_page.dart';
import 'package:simple_todo/screens/profile_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TabsScreen(),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(113, 93, 204, 1),
        secondaryHeaderColor: Color.fromRGBO(57, 57, 60, 1),
      ),
      routes: {
        HomePage.routeName: (ctx) => const HomePage(),
        ProfilePage.routeName: (ctx) => const ProfilePage(),
        CalendarPage.routeName: (ctx) => const CalendarPage(),
      },
    );
  }
}

