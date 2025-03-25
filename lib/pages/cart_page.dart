import 'package:flutter/material.dart';
import 'package:learning_provider/consts.dart';
import 'package:learning_provider/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Consumer<CartProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.8,
                child: ListView.builder(
                  itemCount: provider.items.length,
                  itemBuilder: (context, index) {
                    Product product = provider.items[index];
                    return ListTile(
                      title: Text(product.name),
                      onLongPress: () {
                        provider.remove(product);
                      },
                    );
                  },
                ),
              ),
              Text("Cart Total: \$${provider.getCartTotal()}"),
            ],
          );
        },
      ),
    );
  }
}
