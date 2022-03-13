import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:simple_todo/screens/home_page.dart';
import 'package:simple_todo/screens/profile_page.dart';



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
    return [HomePage(), ProfilePage(),];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home, size: 35),
          title: ("Home"),
          activeColorPrimary: Theme.of(context).primaryColor,
          inactiveColorPrimary: Colors.white,
          textStyle: GoogleFonts.dmSans(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.person,size: 35,),
          title: ("Profile"),
          activeColorPrimary: Theme.of(context).primaryColor,
          inactiveColorPrimary: Colors.white,
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
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      navBarStyle: NavBarStyle.style12,
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
