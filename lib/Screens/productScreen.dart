import 'package:flutter/material.dart';
import 'package:shopping_app/product.dart';
import 'package:shopping_app/product_list.dart';

class ProductsScreen extends StatelessWidget {
  final void Function(Product) addToCheckout;

  const ProductsScreen({Key? key, required this.addToCheckout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: ProductList.products.length,
        itemBuilder: (context, index) {
          final product = ProductList.products[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
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
              onTap: () => addToCheckout(product),
            ),
          );
        },
      ),
    );
  }
}
