import 'dart:io';

import 'package:gob_cordoba/models/models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// import 'package:qrreader/models/scan_model.dart';
// export 'package:qrreader/models/scan_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }
  
  Future<Database> initDB() async {
    //Path de donde almaceneremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'QcansDB.db');
    // Crear base de datos
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
            CREATE TABLE scans(
              document TEXT,
              email TEXT,
              name TEXT,
              password TEXT
              )
      ''');
    });
  }

//   nuevoScanRaw(ScanModel nuevoScan) async {
//     final id = 1;
//      nuevoScan.id;
//     final tipo = nuevoScan.tipo;
//     final valor = nuevoScan.valor;

//     // Verificar la base de datos
//     final db = await database;

//     final res = await db.rawInsert('''
//     INSERT INTO Scans(id,tipo,valor) VALUES (${id},${tipo},${valor})

// ''');
//     return res;
//   }


  Future<int> nuevoScan(Usuario nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toMap());
    print(res);
    return res;
  }

  Future <Usuario> getScanById(String id) async {
    final db = await database;
    final List<Map<String, dynamic >> res = await db.query('Scans', where: 'document= ?', whereArgs: [id]);
    Usuario dato= new Usuario();
    if(res.isNotEmpty){
    Usuario dato= new Usuario();
    dato=Usuario.fromMap(res.first);
    print(dato.name);
    return  dato;
    }else{
    return dato;
    }

  }


  Future<List<Usuario>> getTodosLosScans() async {
    final db = await database;
    final res = await db.query('Scans');
    //print(res);
    return res.isNotEmpty ? res.map((s) => Usuario.fromMap(s)).toList() : [];
  }

//   Future<List<ScanModel>> getScansPorTipo(String tipo) async {
//     final db = await database;
//     final res = await db.rawQuery('''
//       SELECT * FROM Scans WHERE tipo='$tipo'
//     ''');
//     // print(res);
//     return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
//   }

//   Future<int> updateScan(ScanModel nuevoScan) async {
//     final db = await database;
//     final res = await db.update('Scans', nuevoScan.toJson(),
//         where: 'id=?', whereArgs: [nuevoScan.id]);
//     return res;
//   }

//   Future<int> deleteScan(int id) async {
//     final db = await database;
//     final res = await db.delete('Scans', where: 'id=?', whereArgs: [id]);
//     return res;
//   }

  Future<int> deleteAllScan() async {
    final db = await database;
    final res = await db.rawDelete('''
    DELETE FROM Scans
''');
    return res;
  }


}
