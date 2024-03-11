class CartModel {
  String? id;
  String? codigodeBarras;
  String description;
  double price;
  String? lote;
  DateTime createdAt;
  double quantity;

  CartModel({
    this.id,
    this.codigodeBarras,
    required this.description,
    required this.price,
    this.lote,
    required this.createdAt,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codigodeBarras': codigodeBarras,
      'description': description,
      'price': price,
      'lote': lote,
      'createdAt': createdAt.toIso8601String(),
      'quantity': quantity,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'],
      codigodeBarras: map['codigodeBarras'],
      description: map['description'],
      price: map['price'],
      lote: map['lote'],
      createdAt: DateTime.parse(map['createdAt']),
      quantity: map['quantity'],
    );
  }

  @override
  String toString() {
    return 'CartModel(id: $id, codigodeBarras: $codigodeBarras, description: $description, price: $price, lote: $lote, createdAt: $createdAt, quantity: $quantity)';
  }

  toJson() {
    return {
      'id': id,
      'codigodeBarras': codigodeBarras,
      'description': description,
      'price': price,
      'lote': lote,
      'createdAt': createdAt.toIso8601String(),
      'quantity': quantity,
    };
  }
}
