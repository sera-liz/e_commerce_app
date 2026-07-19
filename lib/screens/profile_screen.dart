import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              const CircleAvatar(
                radius: 55,
                backgroundColor: Colors.purple,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 60,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Sera Liz David",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "seraliz@example.com",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "+91 XXXXX XXXXX",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              buildTile(Icons.shopping_bag, "My Orders"),
              buildTile(Icons.favorite, "Wishlist"),
              buildTile(Icons.location_on, "Saved Address"),
              buildTile(Icons.payment, "Payment Methods"),
              buildTile(Icons.settings, "Settings"),
              buildTile(Icons.help_outline, "Help & Support"),
              buildTile(Icons.info_outline, "About Us"),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Liz Shop v1.0.0",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget buildTile(IconData icon, String title) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.purple.shade50,
          child: Icon(
            icon,
            color: Colors.purple,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}