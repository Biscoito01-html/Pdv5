import 'package:flutter/material.dart';
import 'package:projetomoderno/data/date_list_product.dart';

import 'package:projetomoderno/models/product_model.dart';

class StatesProductCart with ChangeNotifier {
  final Map<String, ProductModel> _products = {};

  Map<String, ProductModel> get products => _products;

  void addProduct(ProductModel product) async {
    try {
      _products.putIfAbsent(
        product.id as String,
        () => ProductModel(
          id: product.id,
          codigodeBarras: product.codigodeBarras,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
          quantity: product.quantity,
        ),
      );
      await DatabaseHelper.insertProduct(product);

      print('passei pelo addProduct {${product.id}');

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void clearProduct() {
    _products.clear();
    notifyListeners();
  }

  void removeProduct(String productId) async {
    await DatabaseHelper.deleteProduct(productId);

    if (_products.containsKey(productId)) {
      try {
        _products.remove(productId);
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  }

  void updateProduct(String productId, ProductModel updatedProduct) async {
    await DatabaseHelper.updateProduct(updatedProduct);

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
