import 'package:flutter/material.dart';
import 'package:projetomoderno/models/cart_model.dart';

class StatesCart with ChangeNotifier {
  Map<String, CartModel> _cart = {};

  Map<String, CartModel> get cart => _cart;

  void addCart(CartModel cart) {
    _cart[cart.id as String] = cart;
    notifyListeners();
  }
}
