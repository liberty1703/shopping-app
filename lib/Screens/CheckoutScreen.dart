import 'package:flutter/material.dart';
import 'package:shopping_app/product.dart';

class CheckoutScreen extends StatefulWidget {
  final List<Product> checkoutItems;
  final Function(Product) removeFromCheckout;

  const CheckoutScreen({Key? key, required this.checkoutItems, required this.removeFromCheckout}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  double getTotalPrice() {
    double total = 0;
    for (var item in widget.checkoutItems) {
      total += item.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Color.fromARGB(255, 8, 92, 161),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.checkoutItems.length,
                itemBuilder: (context, index) {
                  final product = widget.checkoutItems[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: Image.asset(product.image, width: 50, height: 50),
                      title: Text(
                        product.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        product.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 8, 92, 161),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      onTap: () {
                        // Add a dialog to confirm removal, or directly remove item
                        widget.removeFromCheckout(product);
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Total: \$${getTotalPrice()}',
                style: const TextStyle(
                  color: Color.fromARGB(255, 8, 92, 161),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
