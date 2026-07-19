import 'package:flutter/material.dart';
import 'screens/bottom_nav_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  
      title: 'E-Commerce UI',
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      
   home: const BottomNavScreen(),
    );
  }
  
}