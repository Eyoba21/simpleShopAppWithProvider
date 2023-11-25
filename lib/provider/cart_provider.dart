import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List _shopItem = [
    ["Avocado", 40.0, "assets/avocado.png", Colors.green.shade100,Colors.green],
    ["Banana", 40.0, "assets/banana.png", Colors.yellow.shade100,Colors.yellow],
    ["Chicken", 40.0, "assets/chicken.png", Colors.brown.shade100, Colors.brown],
    ["Water", 40.0, "assets/water.png", Colors.blue.shade100, Colors.blue]
  ];

  get shopItem => _shopItem;

  final List _cartItem = [];
  get cartItem => _cartItem;

  void addToCart(int index) {
    _cartItem.add(_shopItem[index]);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItem.removeAt(index);
    notifyListeners();
  }

  double calculatePrice() {
    double totalPrice = 0;
    for (int i = 0; i < cartItem.length; i++) {
      totalPrice = totalPrice + _cartItem[i][1];
    }
    return totalPrice;
  }
}
