import 'package:flutter/material.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/widgets/category_widget.dart';
import 'package:e_commerce_app/widgets/product_card.dart';
import '../data/products.dart';
import '../data/cart_data.dart';
import '../models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> filteredProducts = products;
  String selectedCategory = "All";

  void filterProducts(String category) {
    setState(() {
      selectedCategory = category;

      if (category == "All") {
        filteredProducts = products;
      } else {
        filteredProducts = products
            .where((product) => product.category == category)
            .toList();
      }
    });
  }

  void sortProducts(String option) {
    setState(() {
      if (option == "Low to High") {
        filteredProducts.sort((a, b) => a.price.compareTo(b.price));
      } else if (option == "High to Low") {
        filteredProducts.sort((a, b) => b.price.compareTo(a.price));
      } else if (option == "Rating") {
        filteredProducts.sort((a, b) => b.rating.compareTo(a.rating));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Liz Shop",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  ).then((_) {
                    setState(() {});
                  });
                },
              ),

              if (cartItems.isNotEmpty)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        cartItems.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [              TextField(
                onChanged: (value) {
                  setState(() {
                    filteredProducts = products.where((product) {
                      final matchesName = product.name
                          .toLowerCase()
                          .contains(value.toLowerCase());

                      final matchesCategory = selectedCategory == "All"
                          ? true
                          : product.category == selectedCategory;

                      return matchesName && matchesCategory;
                    }).toList();
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search products...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "🎉 SUMMER SALE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Up to 50% OFF",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Shop your favourite brands today!",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryWidget(
                      icon: Icons.apps,
                      title: "All",
                      onTap: () => filterProducts("All"),
                    ),
                    const SizedBox(width: 20),
                    CategoryWidget(
                      icon: Icons.checkroom,
                      title: "Fashion",
                      onTap: () => filterProducts("Fashion"),
                    ),
                    const SizedBox(width: 20),
                    CategoryWidget(
                      icon: Icons.phone_android,
                      title: "Electronics",
                      onTap: () => filterProducts("Electronics"),
                    ),
                    const SizedBox(width: 20),
                    CategoryWidget(
                      icon: Icons.shopping_bag,
                      title: "Bags",
                      onTap: () => filterProducts("Bags"),
                    ),
                    const SizedBox(width: 20),
                    CategoryWidget(
                      icon: Icons.face,
                      title: "Beauty",
                      onTap: () => filterProducts("Beauty"),
                    ),
                    const SizedBox(width: 20),
                    CategoryWidget(
                      icon: Icons.watch,
                      title: "Watches",
                      onTap: () => filterProducts("Watches"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Featured Products",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.sort),
                    onSelected: sortProducts,
                    itemBuilder: (context) => const [
                      PopupMenuItem(
                        value: "Low to High",
                        child: Text("Price: Low → High"),
                      ),
                      PopupMenuItem(
                        value: "High to Low",
                        child: Text("Price: High → Low"),
                      ),
                      PopupMenuItem(
                        value: "Rating",
                        child: Text("Top Rated"),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 15),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ProductCard(
                      name: product.name,
                      image: product.image,
                      price: product.price.toString(),
                      rating: product.rating.toString(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



