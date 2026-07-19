import 'package:flutter/material.dart';
import 'package:e_commerce_app/screens/product_details.dart';
import '../data/wishlist_data.dart';
import '../models/wishlist_item.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  final String rating;

  const ProductCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              name: widget.name,
              image: widget.image,
              price: widget.price,
              rating: widget.rating,
            ),
          ),
        );
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Product Image with Discount Badge
              Stack(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 5,
                    left: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        "30% OFF",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "₹${widget.price}",
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const Text(
                          "₹3999",
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Text(widget.rating),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      if (isFavourite) {
                        wishlistItems.removeWhere(
                          (item) => item.name == widget.name,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Removed from Wishlist"),
                          ),
                        );
                      } else {
                        wishlistItems.add(
                          WishlistItem(
                            name: widget.name,
                            image: widget.image,
                            price: widget.price,
                            rating: widget.rating,
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Added to Wishlist ❤️"),
                          ),
                        );
                      }

                      isFavourite = !isFavourite;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}