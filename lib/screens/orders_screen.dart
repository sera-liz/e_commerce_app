import 'package:flutter/material.dart';
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 5,
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),

              title: const Text(
                "Nike Air Max",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: const Text(
                "Delivered • ₹2999",
              ),

              trailing: TextButton(
                onPressed: () {},
                child: const Text("View"),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(
                  Icons.local_shipping,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Puma Shoes",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: const Text(
                "On the way • ₹2499",
              ),

              trailing: TextButton(
                onPressed: () {},
                child: const Text("Track"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}