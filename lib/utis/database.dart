import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBprovider{
  static final _dbName = 'filesdatabase.db';
  static final _dbVersion = 1;
  static final String _tableName = 'filesTable';
  static final String columnId = 'id';
  static final String columnName = 'name';
  static final String columnPath = 'path';
  static final String columnArtist = 'artist';
  static final String columnAlbum = 'album';
  static final String columnDuration = 'duration';
  static final String columnSize  = 'size';
  static final String columnAddedDate  = 'added_date';
  static final String columnFavorite = 'favorite';
  // static final String  columnPlaylist = 'playlist';

  //singleton class
  DBprovider._();
  static final DBprovider instance = DBprovider._();
  
  static Database _database;
  Future<Database> get database async{
    if (_database != null) return _database;

    _database = await _initDB();
    return _database;
  }

  _initDB() async{
    Directory directory= await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(
      path, 
      version: _dbVersion,
      onCreate: _onCreate
    );
  }
  //create table
  Future _onCreate(Database db, int version) async{
    await db.execute('''
    CREATE TABLE $_tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,  
      $columnName TEXT NOT NULL ,
      $columnPath TEXT NOT NULL,
      $columnArtist TEXT NOT NULL,
      $columnAlbum TEXT NOT NULL,
      $columnFavorite INT default 0,
      $columnDuration TEXT NOT NULL,
      $columnSize TEXT NOT NULL,
      $columnAddedDate TEXT NOT NULL
    )  
    '''
    );
  }

  //insert data
  Future<int> insert(Map<String, dynamic> row) async{
    Database db = await instance.database;
    return await db.rawInsert('''
      INSERT INTO $_tableName (
        $columnName, $columnPath, $columnArtist, $columnAlbum, $columnDuration, $columnSize, $columnAddedDate
        )
        VALUES (
          ?, ?, ?, ?, ?, ?, ?
        )
      ''', 
      [row[columnName], row[columnPath], row[columnArtist], row[columnAlbum], row[columnDuration], row[columnSize], row[columnAddedDate]]
    );
  }

  //Get all data
  Future<List<Map<String, dynamic>>> queryAll() async{
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  //update data
  Future<int> updatePath(String path, String id) async{
    Database db = await instance.database;
    return await db.rawUpdate('''
      UPDATE $_tableName 
      SET $columnPath = ?
      WHERE $columnId = ?
      ''', 
      [path, id]
    );
  }

  Future<int> updateFavorite(int favorite, String name) async{
    Database db = await instance.database;
    return await db.rawUpdate('''
      UPDATE $_tableName 
      SET $columnFavorite = ?
      WHERE $columnName = ?
      ''', 
      [favorite, name]
    );
  }

  //delete data
  Future<int> delete(String name) async{
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$columnName = ?',whereArgs: [name]);
  }

  //Select data
  Future<dynamic> query(int id) async{
    Database db = await instance.database;
    return await db.rawQuery('''
      SELECT * FROM $_tableName WHERE id = ?
      ''',
      [id]
    );
  }

  //Select favorite data
  Future<List<Map<String, dynamic>>> favQuery() async{
    Database db = await instance.database;
    return await db.query(_tableName, where: '$columnFavorite = ?', whereArgs: [1]);
  }
}