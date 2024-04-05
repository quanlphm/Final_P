import 'package:flutter_application_1/model/cart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // Singleton pattern
  static final DatabaseHelper _databaseService = DatabaseHelper._internal();
  factory DatabaseHelper() => _databaseService;
  DatabaseHelper._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, 'db_product.db');
    print(
        "Đường dẫn database: $databasePath"); // in đường dẫn chứa file database
    return await openDatabase(path, onCreate: _onCreate, version: 1
        // ,
        // onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
        );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE cart(id_product INTEGER, quantity INTEGER)',
    );
  }

  Future<void> insertCart(Cart cartModel) async {
    final db = await _databaseService.database;
    Cart? cart = await this.cart(cartModel.id_product);

    if (cart == null) {
      await db.insert(
        'cart',
        cartModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      cart.increaseQuan();
      await this.updateCart(cart);
    }
  }

  Future<List<Cart>> carts() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('cart');
    return List.generate(maps.length, (index) => Cart.fromMap(maps[index]));
  }

  Future<Cart?> cart(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query('cart', where: 'id_product = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Cart.fromMap(maps[0]);
    } else {
      return null;
    }
  }

  Future<void> updateCart(Cart cart) async {
    final db = await _databaseService.database;
    await db.update(
      'cart',
      cart.toMap(),
      where: 'id_product = ?',
      whereArgs: [cart.id_product],
    );
  }

  Future<void> deleteCart(int id) async {
    final db = await _databaseService.database;
    await db.delete(
      'cart',
      where: 'id_product = ?',
      whereArgs: [id],
    );
  }
}
