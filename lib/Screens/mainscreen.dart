import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/CheckoutScreen.dart';
import 'package:shopping_app/Screens/productScreen.dart';
import 'package:shopping_app/product.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Product> _checkoutItems = [];

  void _addToCheckout(Product product) {
    setState(() {
      _checkoutItems.add(product);
    });
  }

  void _removeFromCheckout(Product product) {
    setState(() {
      _checkoutItems.remove(product);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shopping App',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              shadows: [
                Shadow(
                  color: Colors.white,
                  blurRadius: 1.0,
                  offset: Offset(1.0, 1.0),
                )
              ],
              color: Color.fromARGB(255, 8, 92, 161),
            ),
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            ProductsScreen(
              addToCheckout: _addToCheckout,
            ),
            CheckoutScreen(
              checkoutItems: _checkoutItems,
              removeFromCheckout: _removeFromCheckout,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Checkout',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 8, 92, 161),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
