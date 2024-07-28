import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:student_management_getx/screens/add_details.dart';
import 'package:student_management_getx/screens/gridview.dart';
import 'package:student_management_getx/screens/home_screen.dart';

class BottomTabBarss extends StatefulWidget {
  const BottomTabBarss({super.key});

  @override
  State<BottomTabBarss> createState() => _BottomTabBarssState();
}

class _BottomTabBarssState extends State<BottomTabBarss> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    AddStudentsData(),
    GridviewScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _pageIndex,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.grid_view, size: 30),
        ],
        color: const Color.fromARGB(255, 160, 122, 122),
        buttonBackgroundColor: const Color.fromARGB(255, 160, 122, 122),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _pages[_pageIndex],
    );
  }
}
