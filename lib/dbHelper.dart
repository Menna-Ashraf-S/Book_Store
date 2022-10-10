import 'package:flutter_pro/book.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
static final DbHelper _instance = DbHelper.internal();
  factory DbHelper () => _instance ;
  DbHelper.internal();
  static  Database ? _db ;

  Future createDatabase () async {
    if(_db != null ){
      return _db ;
    }
    String path = join (await getDatabasesPath() , 'BookStore.db') ;
     _db = await openDatabase( path , version: 1 , onCreate: (Database db,  int version)async {

      await db.execute('''create table books (
        id integer primary key autoincrement,
        name text not null,
        author text not null ,
        url text not null
  )
      ''');
    },
    
     );
     return _db ;
     }
    Future <int> createBook (Book book) async{
      Database db = await createDatabase() ;
      return db.insert('books', book.toMap() );
     }

     Future <List> allTasks ()async{
      Database db = await createDatabase() ;
      return await db.query('books');
     }

     Future <int> delete (int id) async{
      Database db = await createDatabase() ;
      return db.delete('books' , where: 'id = ?', whereArgs: [id]);
     }
}