import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:trumed/core/database/models/favorite_database_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'favorites.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE favorites(
           id INTEGER PRIMARY KEY AUTOINCREMENT,
           character_id INTEGER NOT NULL,
           name TEXT,
           image TEXT
         )''',
    );
  }

  // Insertar un nuevo favorito
  Future<void> insertFavorite(int id, String name, String image) async {
    final db = await database;
    await db.insert(
      'favorites',
      {
        'character_id': id,
        'name': name,
        'image': image,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<FavoriteDatabaseEntity>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');

    return List.generate(maps.length, (i) {
      return FavoriteDatabaseEntity.fromJson(maps[i]);
    });
  }

  Future<FavoriteDatabaseEntity?> getFavoriteById(int id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db.query(
      'favorites',
      where: 'character_id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (results.isNotEmpty) {
      return FavoriteDatabaseEntity.fromJson(results.first);
    } else {
      return null;
    }
  }

  Future<void> deleteFavorite(int id) async {
    final db = await database;
    await db.delete(
      'favorites',
      where: 'character_id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteDb() async {
    String path = join(await getDatabasesPath(), 'favorites.db');

    await deleteDatabase(path);
    print("Base de datos eliminada");
  }
}
