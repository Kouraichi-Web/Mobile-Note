import 'package:noteapp/models/note.dart';
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
  final databasePath = join(databaseDirPath, "note.db");
  deleteDatabase(databasePath);
  final database = await openDatabase(
    
    databasePath,
    version: 1,
    onCreate: (db, version) async{
      await db.execute('''
      CREATE TABLE IF NOT EXISTS $_noteTable(
      id_note INTEGER PRIMARY KEY,
      title TEXT NOT NULL,
      content TEXT NOT NULL,
      createdDate TEXT NOT NULL,
      status INTEGER DEFAULT 0 NOT NULL
      )
      ''');
      await db.execute('''
      CREATE TABLE IF NOT EXISTS $_settingTable(
      id INTEGER PRIMARY KEY,
      motDePasse TEXT NOT NULL
      )
      ''');
    },
    
  );
  return database;
}

void addNote(
  String title,String content, String createdDate
)  async{
  final db = await database;
  await db.insert(_noteTable, {
    'title': title,
    'content': content,
    'createdDate' : createdDate,
  },
  );
}

Future<List<Notes>> getNote() async{
  final db = await database;
  final data = await db.query(_noteTable);
  List<Notes> note = data.map((e)=>Notes(id: e['id_note'] as int, title: e['title'] as String, content: e['content'] as String, createdAt: e['createdDate'] as String, status: e['status'] as int,)).toList();
  return note;
}

void deleteNote(int id) async{
  final db = await database;
  await db.delete(_noteTable, where: "id_note= ?", whereArgs: [id,]);
}

void updateNote(int id,String title, String content) async{
  final db = await database;
  await db.update(_noteTable, 
  {
    'title' : title,
    'content' : content,
  },
  where: "id_note= ?", whereArgs: [id,],);
}

}