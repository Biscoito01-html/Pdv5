import 'package:flutter/material.dart';
import 'package:projetomoderno/models/product_model.dart';

class StatesPedidosProdutct with ChangeNotifier {
  final Map<String, ProductModel> _pedidos = {};

  Map<String, ProductModel> get pedidos => _pedidos;

  List<ProductModel> get pedidosItems => _pedidos.values.toList();

  void addPedidos(List<ProductModel> pedidosList) async {
    try {
      for (var pedidos in pedidosList) {
        final pedidosExists = _pedidos.containsKey(pedidos.id);

        if (pedidosExists) {
          _pedidos.update(pedidos.id as String, (existingPedidos) {
            return ProductModel(
              id: existingPedidos.id,
              codigodeBarras: existingPedidos.codigodeBarras,
              description: existingPedidos.description,
              price: existingPedidos.price,
              quantity: existingPedidos.quantity + pedidos.quantity,
              imageUrl: existingPedidos.imageUrl,
            );
          });

          notifyListeners();
        } else {
          _pedidos.putIfAbsent(pedidos.id as String, () => pedidos);
        }
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
