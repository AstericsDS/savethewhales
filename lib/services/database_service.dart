import 'package:path/path.dart';
import 'package:savethewhales/models/bill.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  final String _tableName = 'bills';
  final String _idColumnName = 'id';
  final String _nameColumnName = 'name';
  final String _phoneColumnName = 'phone';
  final String _emailColumnName = 'email';
  final String _paymentColumnName = 'payment';

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'master_db.db');

    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''CREATE TABLE $_tableName (
          $_idColumnName INTEGER PRIMARY KEY AUTOINCREMENT,  -- Correct PRIMARY KEY with AUTOINCREMENT
          $_nameColumnName TEXT NOT NULL,
          $_phoneColumnName TEXT NOT NULL,
          $_emailColumnName TEXT NOT NULL,
          $_paymentColumnName TEXT NOT NULL
        )''');
      },
    );
    return database;
  }

  void addBill(String name, String phone, String email, String payment) async {
    final db = await database;
    await db.insert(_tableName, {
      _nameColumnName: name,
      _phoneColumnName: phone,
      _emailColumnName: email,
      _paymentColumnName: payment,
    });
  }

  Future<List<Bill>> getBill() async {
    final db = await database; // Assume 'database' is your initialized database
    final data = await db
        .query(_tableName); // _tableName should be the name of your bills table
    List<Bill> bills = data
        .map((e) => Bill(
              id: e['id'] as int,
              name: e['name'] as String,
              phone: e['phone'] as String,
              email: e['email'] as String, // Correct field name
              payment: e['payment'] as String,
            ))
        .toList();
    return bills;
  }
}

