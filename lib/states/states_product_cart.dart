import 'package:flutter/material.dart';
import 'package:projetomoderno/models/product_model.dart';

class StatesProductCart with ChangeNotifier {
  final Map<String, ProductModel> _products = {};

  Map<String, ProductModel> get products => _products;

  void addProduct(ProductModel product) {
    _products[product.id] = product;
    notifyListeners();
  }

  void updateProduct(String productId, ProductModel updatedProduct) {
    if (_products.containsKey(productId)) {
      _products[productId] = updatedProduct;
      notifyListeners();
    }
  }
}
