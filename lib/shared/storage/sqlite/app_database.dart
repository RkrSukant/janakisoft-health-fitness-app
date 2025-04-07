import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:janakisoft_health_fitness_app/shared/storage/sqlite/dao/example_dao.dart';
import 'package:janakisoft_health_fitness_app/shared/storage/sqlite/db_constants.dart';
import 'package:janakisoft_health_fitness_app/shared/storage/sqlite/entity/example_entity.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [
  ExampleEntity,
])
abstract class AppDatabase extends FloorDatabase {
  static AppDatabase? _database;

  static Future<AppDatabase> getInstance() async {
    if (_database == null) {
      Future<AppDatabase> temp = $FloorAppDatabase
          .databaseBuilder(DatabaseConstants.databaseName)
          .build();
      _database = await temp;
    }
    return _database!;
  }
  
  Future<void> clearAllTables() async {
    final db = database;
    final tableNames = await db
        .rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');

    for (var table in tableNames) {
      final tableName = table['name'];
      /* if (tableName != 'sqlite_sequence' && tableName != 'android_metadata') {
        await db.execute('DELETE FROM $tableName');
      }*/
      if (tableName != 'android_metadata') {
        await db.execute('DELETE FROM $tableName');
      }
    }
  }

  ExampleDao get exampleDao;
}
