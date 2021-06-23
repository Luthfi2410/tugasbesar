import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/user.dart';
import '../models/products.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database> get db async => _db ??= await initDb();

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main2.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    String description =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, email TEXT, username TEXT, password TEXT)");
    print("Table is created");

    await db.execute(
        "CREATE TABLE products(id INTEGER PRIMARY KEY, title TEXT, price INTEGER, description TEXT, picture BLOB)");
    print("Table is created");
    await db.rawInsert(
        "INSERT INTO products (id, title, price, description, picture)values (?, ?, ?, ?, ?)",
        [1, "Paket 10 Mbps", 100000, description, "assets/f20mbps.png"]);

    await db.rawInsert(
        "INSERT INTO products (id, title, price, description, picture)values (?, ?, ?, ?, ?)",
        [2, "Paket 25 Mbps", 205000, description, "assets/f20mbps.png"]);

    await db.rawInsert(
        "INSERT INTO products (id, title, price, description, picture)values (?, ?, ?, ?, ?)",
        [3, "Paket 30 Mbps", 230000, description, "assets/f30mbps.png"]);

    await db.rawInsert(
        "INSERT INTO products (id, title, price, description, picture)values (?, ?, ?, ?, ?)",
        [4, "Paket 50 Mbps", 250000, description, "assets/f50mbps.png"]);

    await db.rawInsert(
        "INSERT INTO products (id, title, price, description, picture)values (?, ?, ?, ?, ?)",
        [5, "Paket 100 Mbps", 100000, description, "assets/f50mbps.png"]);

    await db.rawInsert(
        "INSERT INTO products (id, title, price, description, picture)values (?, ?, ?, ?, ?)",
        [6, "Paket 200 Mbps", 200000, description, "assets/f20mbps.png"]);
  }

//insertion
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toMap());
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    print(list);
    return res;
  }

  Future<User?> getLogin(String user, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM User WHERE username = '$user' and password = '$password'");
    // return res.isNotEmpty ? new User.fromMapObject(res.first) : Null;
    if (res.length > 0) {
      return new User.fromMapObject(res.first);
    }
    return null;
  }

  Future<List<Product>> getProducts() async {
    // Get a reference to the database.
    var dbClient = await db;

    // Query the table for all The Recipes.
    List<Map> list = await dbClient.rawQuery("SELECT * from products");
    List<Product> products = [];

    for (int i = 0; i < list.length; i++) {
      products.add(new Product(
          id: list[i]['id'],
          title: list[i]['title'],
          price: list[i]['price'],
          description: list[i]['description'],
          image: list[i]['picture']));
    }
    return products;
  }
}
