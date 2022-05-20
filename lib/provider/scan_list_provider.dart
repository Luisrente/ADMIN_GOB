import 'package:flutter/material.dart';
import 'package:gob_cordoba/provider/db_provider.dart';

import '../models/models.dart';

class ScanListProvider  {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    // final id = await DBProvider.db.nuevoScan(nuevoScan);
    // nuevoScan.id = id;
    // if (this.tipoSeleccionado == nuevoScan.tipo) {
    //   this.scans.add(nuevoScan);
    // }
    return nuevoScan;
  }

  // cargarScans() async {
  //   final scans = await DBProvider.db.getTodosLosScans();
  //   this.scans = [...scans];
  // }

  cargarScansPorTipo(int tipo) async {
    final scans = await DBProvider.db.getScanById('1');
    //this.scans = [...scans];
    print( this.scans);


    
  }

 
}
