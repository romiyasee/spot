import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._();

  DatabaseHelper._();

  late Database db;

  factory DatabaseHelper() {
    return _databaseHelper;
  }
  Future<int> insertUser(User user) async {
    int result = await db.insert('users', user.toMap());
    return result;
  }

  Future<int> updateUser(User user) async {
    int result = await db.update(
      'users',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );
    return result;
  }

  Future<List<User>> retrieveUsers() async {
    final List<Map<String, Object?>> queryResult = await db.query('users');
    return queryResult.map((e) => User.fromMap(e)).toList();
  }

  Future<void> deleteUser(int id) async {
    await db.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }
  Future<void> initDB() async {
    String path = await getDatabasesPath();
    db = await openDatabase(
      join(path, 'users_demo.db'),
      onCreate: (database, version) async {
        await database.execute(
          """
            CREATE TABLE users (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL,
              age INTEGER NOT NULL,
              email TEXT NOT NULL
            )
          """,
        );
      },
      version: 1,
    );
  }
}

class User {
  int? id;
  String name;
  int age;
  String email;

  User({this.id, required this.name, required this.age, required this.email});

  User.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        age = res["age"],
        email = res["email"];

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'age': age, 'email': email};
  }
}

