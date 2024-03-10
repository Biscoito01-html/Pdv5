/*import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static late Database _database;

  DatabaseHelper.internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'your_database.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // Criação da tabela ProductModel
      await db.execute('''
        CREATE TABLE products(
          id TEXT PRIMARY KEY,
          codigodeBarras TEXT,
          description TEXT,
          price REAL,
          imageUrl TEXT,
          lote TEXT,
          validadeString TEXT,
          createdAt TEXT,
          stockProductId TEXT
        )
      ''');

      // Criação da tabela CartModel
      await db.execute('''
        CREATE TABLE carts(
          id INTEGER PRIMARY KEY,
          codigodeBarras TEXT,
          description TEXT,
          price REAL,
          lote TEXT,
          createdAt TEXT,
          quantity INTEGER
        )
      ''');
    });
  }

  // Métodos para manipulação da tabela ProductModel

  Future<int> insertProduct(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('products', row);
  }

  Future<List<Map<String, dynamic>>> queryAllProducts() async {
    Database db = await database;
    return await db.query('products');
  }

  Future<int> updateProduct(Map<String, dynamic> row) async {
    Database db = await database;
    String id = row['id'];
    return await db.update('products', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteProduct(String id) async {
    Database db = await database;
    return await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

   // Métodos para manipulação da tabela CartModel
  Future<int> insertCart(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('carts', row);
  }

  Future<List<Map<String, dynamic>>> queryAllCarts() async {
    Database db = await database;
    return await db.query('carts');
  }
}*/