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
