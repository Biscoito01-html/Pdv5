import 'package:projetomoderno/models/cart_model.dart';
import 'package:projetomoderno/models/product_model.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DatabaseHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'products.db'),
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE products(
            id TEXT PRIMARY KEY, 
            description TEXT, 
            price REAL, 
            codigodeBarras TEXT, 
            quantity REAL,
            imageUrl TEXT
            )''',
        );
      },
      version: 1,
    );
  }

  static insertProduct(ProductModel product) async {
    try {
      final db = await DatabaseHelper.database();
      await db.insert(
        'products',
        product.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<List<ProductModel>> products() async {
    final db = await DatabaseHelper.database();
    final List<Map<String, dynamic>> products = await db.query('products');
    return List.generate(products.length, (i) {
      return ProductModel(
        id: products[i]['id'],
        codigodeBarras: products[i]['codigodeBarras'],
        description: products[i]['description'],
        price: products[i]['price'],
        imageUrl: products[i]['imageUrl'],
        quantity: products[i]['quantity'],
      );
    });
  }

  static Future<void> updateProduct(ProductModel product) async {
    final db = await DatabaseHelper.database();
    await db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  static Future<void> updateProducts(List<ProductModel> products) async {
    final db = await DatabaseHelper.database();
    for (var product in products) {
      final existingProduct = await db.query(
        'products',
        where: 'id = ?',
        whereArgs: [product.id],
      );
      final currentQuantity = existingProduct[0]['quantity'];
      final newQuantity = (currentQuantity as double) - product.quantity;
      await db.update(
        'products',
        {'quantity': newQuantity},
        where: 'id = ?',
        whereArgs: [product.id],
      );
    }
  }

  static Future<void> deleteProduct(String id) async {
    final db = await DatabaseHelper.database();
    await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
