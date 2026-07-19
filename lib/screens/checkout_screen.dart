import 'package:flutter/material.dart';
import '../data/cart_data.dart';
import 'order_success_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  double getTotal() {
    double total = 0;

    for (var item in cartItems) {
      double price = double.parse(item.price.replaceAll("₹", ""));
      total += price * item.quantity;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.purple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Order Summary",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,

                itemBuilder: (context, index) {
                  final item = cartItems[index];

                  return Card(
                    child: ListTile(
                      leading: Image.asset(
                        item.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),

                      title: Text(item.name),

                      subtitle: Text("Quantity: ${item.quantity}"),

                      trailing: Text(
                        "₹${int.parse(item.price) * item.quantity}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                Text(
                  "₹${getTotal().toStringAsFixed(0)}",

                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Delivery Address",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                hintText: "Enter your address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  cartItems.clear();

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderSuccessScreen(),
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),

                child: const Text(
                  "Place Order",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
