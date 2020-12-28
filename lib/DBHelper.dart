import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'StringScoresDB.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var dbFolder = await getDatabasesPath();
    String path = join(dbFolder, "Puanlar.db");

    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE Puanlar(puan TEXT)");
  }

  Future<List<Map<String, dynamic>>> getPuanlar() async {
    var dbclient = await db;
    var result = dbclient.query("Puanlar");

    return result;
  }

  Future<List<StringScores>> getPuanList() async {
    var map = await getPuanlar();
    var scoreList = List<StringScores>();

    for (Map m in map) {
      scoreList.add(StringScores.fromMap(m));
    }
    return scoreList;
  }

  Future<String> insertPuanlar(StringScores s) async {
    var dbclient = await db;
    var result = dbclient.insert("Puanlar", s.toMap());

    return result.toString();
  }
}
