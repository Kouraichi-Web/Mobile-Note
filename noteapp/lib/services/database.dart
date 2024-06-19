import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseService{
static Database? _db;
static final DatabaseService instance = DatabaseService._constructor();

final String _noteTable = "note";
final String _settingTable = "setting";

DatabaseService._constructor();

Future<Database> get database async{
  if (_db != null) return _db!;
  _db = await getDatabase();
  return _db!;
}

Future<Database> getDatabase() async {
  final databaseDirPath = await getDatabasesPath(); 
  final databasePath = join(databaseDirPath, "master_db.db");
  final database = await openDatabase(
    
    databasePath,
    onCreate: (db, version) async{
      await db.execute('''
      CREATE TABLE IF NOT EXIST $_noteTable(
      id_note INTEGER PRIMARY KEY,
      title TEXT NOT NULL,
      content TEXT NOT NULL,
      createdDate TEXT NOT NULL,
      status INTEGER DEFAULT 0 NOT NULL,
      )
      ''');
      await db.execute('''
      CREATE TABLE IF NOT EXIST $_settingTable(
      id INTEGER PRIMARY KEY,
      motDePasse TEXT NOT NULL,
      )
      ''');
    },
    
  );
  return database;
}

void addNote(
  String content, String title, String createdDate
)  async{
  final db = await database;
  await db.insert(_noteTable, {
    'title': title,
    'content': content,
    'createdDate' : createdDate,
  },
  );
}

}