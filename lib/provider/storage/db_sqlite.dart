import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbSqlite {
  Future<Database> getDataBase() async {
    var path = join(await getDatabasesPath(), 'm-points.db');
    var database = openDatabase(
      path,
      version: 5,
      onCreate: (db, version) async {
        //await db.execute('DROP TABLE bannerSliders');
        await db.execute(
            'CREATE TABLE IF NOT EXISTS bannerSliders(id TEXT PRIMARY KEY, title TEXT, description TEXT, image TEXT, imageUrl TEXT)');
        await db.execute(
            'CREATE TABLE IF NOT EXISTS contentUrls(url TEXT PRIMARY KEY, title TEXT)');
      },
    );
    return database;
  }
}
