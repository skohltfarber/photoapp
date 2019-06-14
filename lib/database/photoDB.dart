import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'dart:async';
import 'dart:io';

import 'package:photoapp/model/photo.dart';

class PhotoDatabase {
  static final PhotoDatabase _instance = PhotoDatabase._internal();

  factory PhotoDatabase() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  PhotoDatabase._internal();

  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);

    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE Photos(id STRING PRIMARY KEY, 
                     name TEXT, imagePath TEXT, 
                     createdBy TEXT, added TEXT, 
                     description TEXT)''');

    print("The Database was created!");
  }

  Future<int> addMovie(Photo photo) async {
    var dbClient = await db;
    try {
      int res = await dbClient.insert("Photos", photo.toMap());
      print("Photo added $res");
      return res;
    } catch (e) {
      int res = await updateMovie(photo);
      return res;
    }
  }

  Future<int> updateMovie(Photo photo) async {
    var dbClient = await db;
    int res = await dbClient
        .update("Photos", photo.toMap(), where: "id = ?", whereArgs: [photo.id]);
    print("Photos updated $res");
    return res;
  }

  Future<int> deleteMovie(String id) async {
    var dbClient = await db;
    var res = await dbClient.delete("Photos", where: "id = ?", whereArgs: [id]);
    print("Photos deleted $res");
    return res;
  }

  Future closeDb() async {
    var dbClient = await db;
    dbClient.close();
  }

  Future<List<Photo>> getMovies() async {
    var dbClient = await db;
    List<Map> res = await dbClient.query("Photos");
    return res.map((m) => Photo.fromDb(m)).toList();
  }

  Future<Photo> getMovie(String id) async {
    var dbClient = await db;
    var res = await dbClient.query("Photos",where: "id = ?", whereArgs: [id]);
    if (res.length == 0 ) return null;
    return Photo.fromDb(res[0]);
  }
  
}
