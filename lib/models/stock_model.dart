class StockModel {
  final String? productId;
  double quantity;

  StockModel({
    this.productId,
    required this.quantity,
  });

  StockModel copyWith({
    String? productId,
    double? quantity,
  }) {
    return StockModel(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }

  decreaseQuantity(int amount) {
    if (amount > 0 && amount <= quantity) {
      quantity -= amount;
      print(
          'Quantidade reduzida em $amount unidades. Nova quantidade: $quantity');
    } else {
      print('Erro: Não é possível reduzir a quantidade.');
    }
  }

  increaseQuantity(int amount) {
    if (amount > 0) {
      quantity += amount;
      print(
          'Quantidade aumentada em $amount unidades. Nova quantidade: $quantity');
    } else {
      print('Erro: Não é possível aumentar a quantidade.');
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }

  toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }

  factory StockModel.fromMap(Map<String, dynamic> map) {
    return StockModel(
      productId: map['productId'] ?? '',
      quantity: map['quantity'] ?? 0,
    );
  }
}
