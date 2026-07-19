import 'package:flutter/material.dart';
import '../data/wishlist_data.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
        backgroundColor: Colors.purple,
      ),

      body: wishlistItems.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Your Wishlist is Empty",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Save your favourite products here ❤️",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final item = wishlistItems[index];

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 15),

                  child: ListTile(
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          item.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    title: Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      "₹${item.price}",
                    ),

                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          wishlistItems.removeAt(index);
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Removed from Wishlist"),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}