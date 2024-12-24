import 'package:path/path.dart';
import 'package:savethewhales/models/bill.dart';
import 'package:savethewhales/models/whale.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  final String _tableName = 'bills';
  final String _idColumnName = 'id';
  final String _nameColumnName = 'name';
  final String _phoneColumnName = 'phone';
  final String _emailColumnName = 'email';
  final String _nominalColumnName = 'nominal';
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
          $_nominalColumnName TEXT NOT NULL,
          $_paymentColumnName TEXT NOT NULL
        );
        CREATE TABLE whale (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        whaletype TEXT NOT NULL,
        desc TEXT NOT NULL,
        image TEXT NOT NULL,
        );

        INSERT INTO whale (whaletype, desc, image)
        VALUE
        (
          'Orca', 
          'Paus orca adalah hewan besar yang hidup di laut. Mereka sering disebut "paus pembunuh", 
          tapi sebenarnya mereka adalah jenis lumba-lumba terbesar. Orca punya tubuh hitam dengan bercak putih, 
          dan mereka sangat pintar. Mereka makan ikan, anjing laut, dan kadang hewan laut lain. Orca suka berenang 
          bersama keluarga mereka yang disebut "pod" dan bekerja sama saat berburu makanan. Mereka juga suka 
          melompat dan bermain di air!', 
          '/assets/svgs/orca.svg'
        ),

        (
          'Sperm Whale', 
          'Paus sperma adalah paus besar yang hidup di laut. Mereka punya kepala yang sangat besar 
          dan bentuk tubuh seperti torpedo. Paus sperma suka menyelam sangat dalam untuk mencari makanan, seperti 
          cumi-cumi raksasa. Mereka bernapas lewat lubang di atas kepala dan bisa menahan napas lama sekali. 
          Paus sperma tinggal bersama keluarga mereka dan membuat suara untuk berbicara satu sama lain di dalam air. 
          Mereka adalah penyelam hebat dan sangat kuat!', 
          '/assets/svgs/spermwhale.svg'
        ),

        (
          'Blue Whale', 
          'Paus biru adalah hewan terbesar di dunia, bahkan lebih besar dari dinosaurus! 
          Mereka hidup di laut dan punya tubuh yang panjang serta berwarna biru keabu-abuan. 
          Paus biru makan hewan kecil yang disebut krill. Mereka menelan banyak air, lalu menyaring makanannya. 
          Meski besar, paus biru sangat lembut dan suka berenang perlahan. 
          Mereka bernapas lewat lubang di atas kepala, dan semburannya bisa terlihat dari jauh!',
          '/assets/svgs/bluewhale.svg'
        ),
        ''');
      }, 
    );
    return database;
  }

  void addBill(String name, String phone, String email, String nominal, String payment) async {
    final db = await database;
    await db.insert(_tableName, {
      _nameColumnName: name,
      _phoneColumnName: phone,
      _emailColumnName: email,
      _nominalColumnName: nominal,
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
              nominal: e['nominal'] as String,
              payment: e['payment'] as String,
            ))
        .toList();
    return bills;
  }

  Future<List<Whale>> getWhale() async {
    final db = await database; // Assume 'database' is your initialized database
    final data = await db
        .query('whale'); // _tableName should be the name of your bills table
    List<Whale> whales = data
        .map((e) => Whale(
              id: e['id'] as int,
              whaletype: e['whaletype'] as String,
              desc: e['desc'] as String,
              image: e['image'] as String, // Correct field name
              ))
        .toList();
    return whales;
  }
}

