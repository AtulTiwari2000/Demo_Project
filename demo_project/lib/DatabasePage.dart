import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Model.dart';

class DatabaseHelper {
  static Database? databasee;
  static final DatabaseHelper instance = DatabaseHelper._();

  DatabaseHelper._();

  Future<Database> get database async {
    if (databasee != null) return databasee!;
    databasee = await initDatabase();
    return databasee!;
  }

  Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'posts.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );
  }

  Future onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE posts(
        id INTEGER PRIMARY KEY,
        title TEXT,
        body TEXT
      )
    ''');
  }

  Future<void> insertPost(DartModel post) async {
    final db = await database;
    await db.insert('posts', post.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<DartModel>> getPosts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('posts');
    return List.generate(maps.length, (i) {
      return DartModel.fromJson(maps[i]);
    });
  }

  Future<void> clearPosts() async {
    final db = await database;
    await db.delete('posts');
  }
}
