import 'package:flutter/material.dart';
import 'package:projetomoderno/models/product_model.dart';

class StatesCart with ChangeNotifier {
  final Map<String, ProductModel> _cart = {};

  Map<String, ProductModel> get cart => _cart;

  List<ProductModel> get cartItems => _cart.values.toList();

  void addCart(ProductModel cart) async {
    try {
      final cartExists = _cart.containsKey(cart.id);

      if (cartExists) {
        _cart.update(cart.id as String, (existingCart) {
          return ProductModel(
            id: existingCart.id,
            codigodeBarras: existingCart.codigodeBarras,
            description: existingCart.description,
            price: existingCart.price,
            quantity: existingCart.quantity + cart.quantity,
            imageUrl: existingCart.imageUrl,
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
