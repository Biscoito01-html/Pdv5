class CartModel {
  String? id;
  String? codigodeBarras;
  String description;
  double price;
  double quantity;

  CartModel({
    this.id,
    this.codigodeBarras,
    required this.description,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codigodeBarras': codigodeBarras,
      'description': description,
      'price': price,
      'quantity': quantity,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'],
      codigodeBarras: map['codigodeBarras'],
      description: map['description'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }

  @override
  String toString() {
    return 'CartModel(id: $id, codigodeBarras: $codigodeBarras, description: $description, price: $price, quantity: $quantity)';
  }

  toJson() {
    return {
      'id': id,
      'codigodeBarras': codigodeBarras,
      'description': description,
      'price': price,
      'quantity': quantity,
    };
  }
}
