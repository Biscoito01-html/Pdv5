import 'dart:io';

import 'package:projetomoderno/models/category_model.dart';
import 'package:projetomoderno/models/stock_model.dart';

class ProductModel {
  final String id;
  final String? codigodeBarras;
  final String description;
  final double price;
  final File imageUrl;
  final CategoryModel category;
  final String? lote;
  final String? validadeString;
  final DateTime? validade;
  final StockModel stock;
  DateTime createdAt;

  ProductModel({
    required this.id,
    required this.codigodeBarras,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.lote,
    this.validadeString,
    this.validade,
    required this.stock,
    required DateTime createdAt,
    // ignore: prefer_initializing_formals
  })  : createdAt = createdAt,
        super() {
    updateCreatedAt();
  }

  void updateCreatedAt() {
    createdAt = DateTime.now();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codigodeBarras': codigodeBarras,
      'description': description,
      'price': price,
      'imageUrl': imageUrl.path,
      'category': category.toMap(),
      'lote': lote,
      'validade': validadeString,
      'createdAt': createdAt.toIso8601String(),
      'stock': stock.toMap(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      codigodeBarras: map['codigodeBarras'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      imageUrl: File(
          map['imageUrl']), // Alterado para criar um File a partir do caminho
      category: CategoryModel.fromMap(map['category'] ?? {}, String: null),
      lote: map['lote'],
      validadeString: map['validade'],
      validade:
          map['validade'] != null ? DateTime.parse(map['validade']) : null,
      stock: StockModel.fromMap(map['stock'] ?? {}),
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, codigodeBarras: $codigodeBarras, description: $description, price: $price, imageUrl: $imageUrl, category: $category, lote: $lote, validade: $validadeString, stock: $stock, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductModel &&
        other.id == id &&
        other.codigodeBarras == codigodeBarras &&
        other.description == description &&
        other.price == price &&
        other.imageUrl.path == imageUrl.path && // Comparação de caminhos
        other.category == category &&
        other.lote == lote &&
        other.validadeString == validadeString &&
        other.stock == stock &&
        other.createdAt == createdAt;
  }
}
