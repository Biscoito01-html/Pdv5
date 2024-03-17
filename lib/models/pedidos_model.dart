import 'package:projetomoderno/models/cart_model.dart';
import 'package:projetomoderno/models/product_model.dart';

class PedidosModel {
  String? id;
  List<ProductModel> produtos;

  PedidosModel({
    this.id,
    required this.produtos,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'produtos': produtos.map((x) => x.toMap()).toList(),
    };
  }

  factory PedidosModel.fromMap(Map<String, dynamic> map) {
    return PedidosModel(
      id: map['id'],
      produtos: List<ProductModel>.from(
          map['produtos']?.map((x) => CartModel.fromMap(x))),
    );
  }

  @override
  String toString() => 'PedidosModel(id: $id, produtos: $produtos)';

  toJson() {
    return {
      'id': id,
      'produtos': produtos.map((x) => x.toJson()).toList(),
    };
  }
}
