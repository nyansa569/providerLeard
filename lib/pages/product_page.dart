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
