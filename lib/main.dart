import 'package:flutter/material.dart';
import 'package:student_management_getx/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.orange,
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 160, 122, 122))),
      home: const HomeScreen(),
    );
  }
}
