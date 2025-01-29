import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lugha_sample/ui/pages/dashboard/quiz_page.dart';
import 'package:lugha_sample/ui/views/not_done.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import 'export_pages.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  final List _pages = [
    const Homescreen(email: 'Brie'),
    // const ExampleDragAndDrop(),
    const NotDone(),
    const QuizPage()
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedSwitcher(
        switchInCurve: Curves.easeInCubic,
        switchOutCurve: Curves.easeOutCubic,
        duration: const Duration(milliseconds: 250),
        transitionBuilder: (Widget child, Animation<double> animation) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        child: Container(
          key: ValueKey<int>(_selectedIndex),
          child: _pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: WaterDropNavBar(
          bottomPadding: size.height * 0.02,
          backgroundColor: const Color(0xFF83006A),
          waterDropColor: const Color(0xFFFEC26C),
          inactiveIconColor: Colors.white,
          barItems: <BarItem>[
            BarItem(
                filledIcon: FontAwesomeIcons.bookOpen,
                outlinedIcon: FontAwesomeIcons.book),
            BarItem(
                filledIcon: FontAwesomeIcons.tabletAlt,
                outlinedIcon: FontAwesomeIcons.tablet),
            BarItem(
                filledIcon: FontAwesomeIcons.layerGroup,
                outlinedIcon: FontAwesomeIcons.stackExchange),
            // BarItem(
            //     filledIcon: FontAwesomeIcons.solidUserCircle,
            //     outlinedIcon: FontAwesomeIcons.userCircle),
          ],
          selectedIndex: _selectedIndex,
          onItemSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
