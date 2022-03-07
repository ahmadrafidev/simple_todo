import 'package:flutter/cupertino.dart';

import 'package:simple_todo/screens/home_page.dart';
import 'package:simple_todo/screens/about_page.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

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
          icon: const Icon(CupertinoIcons.home),
          title: ("Home"),
          activeColorPrimary: CupertinoColors.white,
          inactiveColorPrimary: CupertinoColors.white,
          textStyle:
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.sparkles),
          title: ("About"),
          activeColorPrimary: CupertinoColors.white,
          inactiveColorPrimary: CupertinoColors.white,
          textStyle:
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      confineInSafeArea: true,
      backgroundColor: const Color.fromRGBO(80, 56, 188, 1),
      navBarStyle: NavBarStyle.style6,
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popActionScreens: PopActionScreensType.all,
      popAllScreensOnTapOfSelectedTab: true,
    );
  }
}
