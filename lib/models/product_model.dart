class ProductModel {
  String? id; // ID do produto
  String? codigodeBarras; // Código de barras do produto
  String description; // Descrição do produto
  double price; // Preço do produto
  double quantity; // Quantidade disponível do produto
  String imageUrl; // URL da imagem do produto

  ProductModel({
    this.id,
    required this.codigodeBarras,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codigodeBarras': codigodeBarras,
      'description': description,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      throw ArgumentError('map cannot be null');
    }
    final requiredKeys = [
      'id',
      'codigodeBarras',
      'description',
      'quantity',
      'price'
    ];
    if (!requiredKeys.every(map.containsKey)) {
      throw ArgumentError('map does not contain all required keys');
    }
    if (map['quantity'] is! num || map['price'] is! num) {
      throw ArgumentError('quantity and price must be numbers');
    }
    return ProductModel(
      id: map['id'],
      codigodeBarras: map['codigodeBarras'],
      description: map['description'],
      price: map['price'].toDouble(),
      quantity: map['quantity'].toDouble(),
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  toJson() {
    return {
      'id': id,
      'codigodeBarras': codigodeBarras,
      'description': description,
      'quantity': quantity,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, codigodeBarras: $codigodeBarras, description: $description, price: $price, imageUrl: $imageUrl, quantity: $quantity)';
  }
}
