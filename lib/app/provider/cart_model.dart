import 'package:flutter/material.dart';

import '../models/cart_item.dart';

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    final index = _items.indexWhere((i) => i.name == item.name);
    if (index >= 0) {
      _items[index].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void updateQuantity(int index, int newQuantity) {
    if (newQuantity > 0) {
      _items[index].quantity = newQuantity;
    } else {
      _items.removeAt(index);
    }
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
