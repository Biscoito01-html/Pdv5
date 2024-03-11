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
  final Category name;

  CategoryModel({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name.toString().split('.').last,
    };
  }

  factory CategoryModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return CategoryModel(
      name: Category.values.firstWhere(
        (category) => category.toString().split('.').last == map['name'],
        orElse: () => Category.outros,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name.toString().split('.').last,
    };
  }

  @override
  String toString() {
    return 'CategoryModel( name: $name)';
  }
}
