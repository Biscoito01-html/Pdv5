import 'package:flutter/material.dart';
import 'package:projetomoderno/models/product_model.dart';

class StatesProductCart with ChangeNotifier {
  final Map<String, ProductModel> _products = {};

  Map<String, ProductModel> get products => _products;

  void addProduct(ProductModel product) {
    try {
      _products[product.id as String] = product;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void clearProduct() {
    _products.clear();
    notifyListeners();
  }

  void removeProduct(String productId) {
    if (_products.containsKey(productId)) {
      try {
        _products.remove(productId);
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  }

  void updateProduct(String productId, ProductModel updatedProduct) {
    if (_products.containsKey(productId)) {
      try {
        _products.update(productId, (product) => updatedProduct);
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  }
}
