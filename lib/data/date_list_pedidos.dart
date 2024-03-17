import 'dart:convert';

import 'package:projetomoderno/models/pedidos_model.dart';
import 'package:projetomoderno/models/product_model.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DateListPedidos {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'pedidos.db'),
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE pedidos(
            id TEXT PRIMARY KEY, 
            produtos TEXT 
            )''',
        );
      },
      version: 1,
    );
  }

  static insertPedido(PedidosModel pedido) async {
    try {
      final db = await DateListPedidos.database();
      final produtosAsMaps =
          pedido.produtos.map((cartModel) => cartModel.toMap()).toList();
      final produtosAsString = jsonEncode(produtosAsMaps);
      await db.insert(
        'pedidos',
        {
          'id': pedido.id,
          'produtos': produtosAsString,
        },
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<List<PedidosModel>> getPedidos() async {
    try {
      final db = await DateListPedidos.database();

      final result = await db.query('pedidos');

      return result.map((pedidoMap) {
        final produtosAsMaps = jsonDecode(pedidoMap['produtos'] as String);
        final produtosAsCartModels = (produtosAsMaps as List)
            .map<ProductModel>((map) => ProductModel.fromMap(map))
            .toList();

        return PedidosModel(
          id: pedidoMap['id'] as String,
          produtos: produtosAsCartModels,
        );
      }).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
