import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gob_cordoba/models/models.dart';
import 'package:gob_cordoba/provider/db_provider.dart';
import 'package:gob_cordoba/provider/scan_list_provider.dart';
import 'package:gob_cordoba/services/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class CarnetService extends ChangeNotifier{

  final String _baseUrl = 'flutter-73f8f-default-rtdb.firebaseio.com';
  final storage = new FlutterSecureStorage();
  List<Usuario> usuarios = [];
   
   ScanListProvider base= new ScanListProvider();

  File? newPictureFile;
  bool isLoading = false;
  bool isSaving = false;

  CarnetService(){
  }

 
  // TODO: 
   Future <Usuario> loadCartUser() async {
    Usuario dato1 = Usuario();
   final firstname= await storage.read(key:'email') ?? '';
   final name= await storage.read(key:'name') ?? '';
   final document= await storage.read(key:'document') ?? '';
   final email1= await storage.read(key:'email1') ?? '';
   final password= await storage.read(key:'password') ?? '';    
    if( name != '' ){
      print('Entro por primera vez');
      final  Usuario dato = Usuario(
                  document: document,
                  email: email1 ,
                  name: name,
                  password : password,
               );
        return dato;
    }else{
    final url = Uri.https( _baseUrl, 'Usuario.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap= json.decode(resp.body);
    productsMap.forEach(( key , value){
      final tempProduct = Usuario.fromMap(value);
      this.usuarios.add(tempProduct);
    });
    print(firstname);
    for (var i = 0; i < usuarios.length-1 ; i++) { 
      String dato= usuarios[i].email!;
      //print(dato);
      if(dato == firstname){
        print('Entro ddddddd');
        //print('$usuarios[i]');
        print(usuarios[i]);
        await storage.write(key: 'document', value: usuarios[i].document);
        await storage.write(key: 'email1', value: usuarios[i].email);
        await storage.write(key: 'name', value: usuarios[i].name);
        await storage.write(key: 'password', value: usuarios[i].password);
        return  usuarios[i];
      }
    }
    }
    return dato1;
  }




  Future <Usuario> loadCarstAdmin( String documentId) async {
    isLoading = true;
    notifyListeners();
    Usuario dato2 = Usuario();
try {
  final url = Uri.https( _baseUrl, 'Usuario.json', {
      'auth': await storage.read(key: 'token') ?? '',
    });
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap= json.decode(resp.body);
    productsMap.forEach(( key , value){
      final tempProduct = Usuario.fromMap(value);
      this.usuarios.add(tempProduct);
    });
    for (var i = 0; i < usuarios.length-1 ; i++) { 
      String dato= usuarios[i].document!;
      //print(dato);
      if(dato == documentId){
        print('Entro ddddddd');
        //print('$usuarios[i]');
        print(usuarios[i]);
        return  usuarios[i];
      }
    }
} catch (e) {
  print(documentId);

  final Usuario scans= await DBProvider.db.getScanById(documentId);
  print('entro en el catch');
     if(scans.document==null){
       print('null');
     }else{
       return scans;
     }
   }
    isLoading= false;
    notifyListeners();
    return dato2;
  }

   Future<String> createProduct( Usuario product ) async{
    final url = Uri.https( _baseUrl, 'Usuario.json');
    final resp = await http.post(url, body: product.toJson());
    final decodedData= json.decode(resp.body);
    //product.id= decodedData['name'];
    // this.products.add(product);
    print('jjjyjy');
    print(decodedData);
    print('jjtjtjjtjtj');
    return product.email!;
  }


    datosbase( ) async {  
    isLoading = true;
    notifyListeners();
    Usuario dato2 = Usuario();
   final url = Uri.https( _baseUrl, 'Usuario.json', {
      'auth': await storage.read(key: 'token') ?? '',
    });
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap= json.decode(resp.body);
    productsMap.forEach(( key , value){
      final tempProduct = Usuario.fromMap(value);
      this.usuarios.add(tempProduct);
    });
    for (var i = 0; i < usuarios.length-1 ; i++) { 
      final s =  await DBProvider.db.nuevoScan(usuarios[i]);
    }
    print('con exito');
    isLoading= false;
    notifyListeners();
  }



}