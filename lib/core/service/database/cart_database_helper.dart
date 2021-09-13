import 'package:e_commerce_getx/constants.dart';
import 'package:e_commerce_getx/model/cart_product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database == null) _database = await initDb();
    return _database!;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'Cart.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
      CREATE TABLE $tableCartProduct (
      
        $columnName TEXT NOT NULL,
        $columnImage TEXT NOT NULL,
        $columnPrice TEXT NOT NULL,
        $columnid TEXT NOT NULL,
        $columnQuantitiy INTEGER NOT NULL
      )
      ''');
      },
    );
  }

  Future<List<CartProductModel>> getAllProducts() async {
    final dbClient = await database;
    final maps = await dbClient.query(tableCartProduct);

    List<CartProductModel> products = maps.isNotEmpty
        ? maps.map((map) => CartProductModel.fromMap(map)).toList()
        : [];

    return products;
  }

  insertProduct(CartProductModel model) async {
    final dbClient = await database;
    await dbClient.insert(tableCartProduct, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateProduct(CartProductModel model) async {
    final dbClient = await database;
    await dbClient.update(tableCartProduct, model.toMap(),
        where: '$columnid =? ',
        whereArgs: [model.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  removeProduct(CartProductModel model) async {
    final dbClient = await database;
    await dbClient.delete(
      tableCartProduct,
      where: '$columnid =? ',
      whereArgs: [model.id],
    );
  }
}
