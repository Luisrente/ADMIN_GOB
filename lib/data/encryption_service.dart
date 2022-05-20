import 'package:encrypt/encrypt.dart';
import 'package:gob_cordoba/models/carnet_model.dart';
import 'package:gob_cordoba/models/qr_data.dart';

const _key= '1234567';

class EncryptionService {
  String encryptData( String carnet){
  final key = Key.fromLength(32);
  final iv = IV.fromLength(8);
  final encrypter = Encrypter(Salsa20(key));
  final encrypted = encrypter.encrypt( carnet, iv : iv);
  return encrypted.base64;
  // final key = Key.fromUtf8(_key);
  // final iv = IV.fromUtf8(_key);
  // final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  // final encrypted = encrypter.encrypt( carnet, iv : iv);
  // return encrypted.base64;
  }
   descrypData(String encrypted){
    final key = Key.fromLength(32);
    final iv = IV.fromLength(8);
    try {
    final encrypter = Encrypter(Salsa20(key));
    print('entro');
    final  String decrypted = encrypter.decrypt(Encrypted.from64(encrypted), iv: iv);
    print('eeeeeeeeeeeeeeee');
    return decrypted;
    } catch (e) {
      return null;
    }
    // final key = Key.fromUtf8(_key);
    // final iv = IV.fromUtf8(_key);
    // try {
    // final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    // final decrypted = encrypter.decrypt(Encrypted.from64(encrypted), iv: iv);
    // return decrypted;
    // } catch (e) {
    //   return null;
    // }
  }

}