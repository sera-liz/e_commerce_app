import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../data/cart_data.dart';

class ProductDetails extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  final String rating;

  const ProductDetails({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // Product Image
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.grey.shade200,

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Image.asset(
                  widget.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),


                  const SizedBox(height: 10),


                  Text(
                    "₹${widget.price}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),


                  const SizedBox(height: 10),


                  Row(
                    children: [

                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),

                      const SizedBox(width: 5),

                      Text(widget.rating),

                    ],
                  ),


                  const SizedBox(height: 20),


                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),


                  const SizedBox(height: 10),


                  const Text(
                    "This is a premium quality product available at the best price. Comfortable, stylish and perfect for everyday use.",
                  ),


                  const SizedBox(height: 25),


                  const Text(
                    "Quantity",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),


                  const SizedBox(height: 10),


                  Row(
                    children: [

                      IconButton(
                        onPressed: () {

                          if (quantity > 1) {

                            setState(() {
                              quantity--;
                            });

                          }

                        },

                        icon: const Icon(
                          Icons.remove_circle,
                        ),
                      ),


                      Text(
                        quantity.toString(),

                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),


                      IconButton(
                        onPressed: () {

                          setState(() {
                            quantity++;
                          });

                        },

                        icon: const Icon(
                          Icons.add_circle,
                        ),
                      ),

                    ],
                  ),


                  const SizedBox(height: 30),


                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(

                      onPressed: () {

                        cartItems.add(

                          CartItem(

                            name: widget.name,

                            image: widget.image,

                            price: widget.price,

                            rating: widget.rating,

                            quantity: quantity,

                          ),

                        );


                        ScaffoldMessenger.of(context).showSnackBar(

                          SnackBar(

                            content: Text(
                              "${widget.name} added to cart",
                            ),

                          ),

                        );

                      },


                      child: const Text(
                        "Add to Cart",
                      ),

                    ),
                  ),


                  const SizedBox(height: 15),


                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(

                      onPressed: () {},


                      child: const Text(
                        "Buy Now",
                      ),

                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}