import 'package:flutter/material.dart';
import 'package:projetomoderno/models/cart_model.dart';

class StatesCart with ChangeNotifier {
  final Map<String, CartModel> _cart = {};

  Map<String, CartModel> get cart => _cart;

  void addCart(CartModel cart) {
    try {
      final cartExists = _cart.containsKey(cart.id);

      if (cartExists) {
        _cart.update(cart.id as String, (existingCart) {
          return CartModel(
            id: existingCart.id,
            codigodeBarras: existingCart.codigodeBarras,
            description: existingCart.description,
            price: existingCart.price,
            lote: existingCart.lote,
            createdAt: existingCart.createdAt,
            quantity: existingCart.quantity + cart.quantity,
          );
        });
      } else {
        _cart.putIfAbsent(cart.id as String, () => cart);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void removeCart(String productId) {
    if (_cart.containsKey(productId)) {
      try {
        _cart.remove(productId);
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  }

  void finalizarPedido() {
    _cart.clear();
    notifyListeners();
  }
}
