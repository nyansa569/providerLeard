import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final int price;
  final Color color;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.color,
  });
}

final List<Product> PRODUCTS = [
  Product(id: 0, name: 'Name 0', price: 30, color: Colors.amber),
  Product(id: 1, name: 'Name 1', price: 40, color: Colors.red),
  Product(id: 2, name: 'Name 2', price: 50, color: Colors.blue),
  Product(id: 3, name: 'Name 3', price: 60, color: Colors.green),
  Product(id: 4, name: 'Name 4', price: 70, color: Colors.grey),
  Product(id: 5, name: 'Name 5', price: 80, color: Colors.brown),
  Product(id: 6, name: 'Name 6', price: 90, color: Colors.pink),
  Product(id: 7, name: 'Name 7', price: 100, color: Colors.purple),
  Product(id: 8, name: 'Name 8', price: 110, color: Colors.deepOrange),
  Product(id: 9, name: 'Name 9', price: 120, color: Colors.tealAccent),
  Product(id: 10, name: 'Name 10', price: 130, color: Colors.limeAccent),
];
