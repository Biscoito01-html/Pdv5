enum Category {
  cereais,
  legumes,
  frutas,
  verduras,
  carnes,
  bebidas,
  doces,
  outros,
}

class CategoryModel {
  final String? id;
  final Category name;

  CategoryModel(
    this.id, {
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name.toString().split('.').last,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map, {required String}) {
    return CategoryModel(
      map['id'] ?? '',
      name: Category.values.firstWhere(
        (category) => category.toString().split('.').last == map['name'],
        orElse: () => Category.outros,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name.toString().split('.').last,
    };
  }

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name)';
  }
}
