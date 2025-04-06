

import 'package:sukant_flutter_boilerplate/shared/storage/sqlite/app_database.dart';
import 'package:sukant_flutter_boilerplate/shared/storage/sqlite/dao/example_dao.dart';

class DatabaseManager{
  static DatabaseManager? _databaseManager;
  static AppDatabase? _dbInstance;

  static Future<DatabaseManager> getDbInstance() async {
    _databaseManager ??= DatabaseManager();
    _dbInstance ??= await AppDatabase.getInstance();
    return _databaseManager!;
  }

  Future<void> runInTransaction(Future<void> Function() action) async {
    final db = _dbInstance!.database;

    db.database.transaction((txn) async {
      action();
    });
  }

  Future<void> clearAllTables() async {
    await _dbInstance!.clearAllTables();
  }

  ExampleDao getExampleDao() => _dbInstance!.exampleDao;
}