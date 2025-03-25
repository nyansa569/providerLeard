# learning_provider

A new Flutter project.

## Getting Started

- create a cart page
- create a products page
- create the consts.dart to hold all the PRODUCTS and the Product class

- Create the providers folder
## create the cart_provider.dart

- let CartProvider extend ChangeNotifier
- create list of items
- create the get list 
- create funcitons for the CartProvider 
    - Always remember to add the ***notifyListeners();***
        - this is what notifies the whole CartProvider about the changes 
import 'package:flutter/material.dart';
import 'package:learning_provider/consts.dart';

class CartProvider extends ChangeNotifier {
  // this is a mechanism to which a class can update its
  //listeners on the  changes that happen within this class
  // A class that extends ChangeNotifier and holds the application state.

  final List<Product> _items = [];

  List<Product> get items => _items;

  void add(Product item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(Product item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  double getCartTotal() {
    return _items.fold(0, (previousValue, item) => previousValue + item.price);
  }
}
## wrap the MyApp with ChangeNotifierProvider
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

## write code for the UI
### Product Page
- make a list builder to display all the PRODUCTS
- create a check box to add the product 
    - then the value would be true or false if the item is actually added inside the items in the cart provider
    - this uses the add inside the cart provider 

import 'package:flutter/material.dart';
import 'package:learning_provider/consts.dart';
import 'package:learning_provider/pages/cart_page.dart';
import 'package:learning_provider/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(
            onPressed:
                () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => CartPage())),
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: PRODUCTS.length,
        itemBuilder: (context, index) {
          Product product = PRODUCTS[index];
          return ListTile(
            leading: Container(width: 25, height: 25, color: product.color),
            title: Text(product.name),
            trailing: Checkbox(
              value: cartProvider.items.contains(product),
              onChanged: (value) {
                if (value == true) {
                  cartProvider.add(product);
                } else {
                  cartProvider.remove(product);
                }
              },
            ),
          );
        },
      ),
    );
  }
}


### Cart Page

- this is used to view the items inside the cart provider 
- then a long press is used to remove the item from the cart provider
- then a get cart total used to calculate the total amount in the items in the cart provider 