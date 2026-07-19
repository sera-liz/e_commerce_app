import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'wishlist_screen.dart';
import 'orders_screen.dart';
import 'profile_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const WishlistScreen(),
    const OrdersScreen(),
    const ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Wishlist",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Orders",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}


































