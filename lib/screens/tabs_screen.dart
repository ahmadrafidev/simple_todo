import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:simple_todo/screens/home_page.dart';
import 'package:simple_todo/screens/about_page.dart';



class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs_screen';
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final PersistentTabController? _controller =
  PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [HomePage(), AboutPage(),];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: const Color.fromRGBO(230, 67, 75, 1),
          inactiveColorPrimary: const Color.fromRGBO(80, 56, 188, 1),
          textStyle: GoogleFonts.dmSans(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: ("About"),
          activeColorPrimary: const Color.fromRGBO(230, 67, 75, 1),
          inactiveColorPrimary: const Color.fromRGBO(80, 56, 188, 1),
          textStyle: GoogleFonts.dmSans(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      confineInSafeArea: true,
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      navBarStyle: NavBarStyle.style6,
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popActionScreens: PopActionScreensType.all,
      popAllScreensOnTapOfSelectedTab: true,
      decoration: const NavBarDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1
          )
        ]
      ),
    );
  }
}
