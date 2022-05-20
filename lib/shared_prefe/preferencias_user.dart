import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUser {
  static late SharedPreferences _prefs;
  static const String prefClave = 'token_user'; //clave
  static const String prefClave2 = 'id_user'; //clave
  static String tokenVar = '';
  static String idVar = '';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get token {
    return _prefs.getString(prefClave) ?? tokenVar;
  }

  static set token(String value) {
    tokenVar = value;
    _prefs.setString(prefClave, value);
  }

  static String get id {
    return _prefs.getString(prefClave2) ?? idVar;
  }

  static set id(String value) {
    idVar = value;
    _prefs.setString(prefClave2, value);
  }
}
