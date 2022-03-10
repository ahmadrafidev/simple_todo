 import 'package:flutter/material.dart';
 import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:simple_todo/screens/tabs_screen.dart';
import 'package:simple_todo/screens/home_page.dart';
import 'package:simple_todo/screens/profile_page.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
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
        ProfilePage.routeName: (ctx) => const ProfilePage(),
      },
    );
  }
}

