import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_media/models/task.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'tasks.db';
      _db =
          await openDatabase(_path, version: _version, onCreate: (db, version) {
        print('Creating a new db');
        return db.execute(
          "CREATE TABLE $_tableName("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "title STRING, note TEXT, date STRING, "
          "startTime STRING, endTiem String, "
          "remind STRING, repeat STRING, "
          "color INTEGER, "
          "isCompleted INTEGER",
        );
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    print('Insert function called');
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print('query fuction called');
    return await _db!.query(_tableName);
  }
}
