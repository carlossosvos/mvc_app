
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  // Instancia privada del singleton
  static final PreferencesService _instance = PreferencesService._internal();

  // Factory constructor para retornar la misma instancia
  factory PreferencesService() {
    return _instance;
  }

  // Constructor privado
  PreferencesService._internal();

  // Instancia de SharedPreferences
  SharedPreferences? _prefs;

  // Método para inicializar SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Ejemplo de un método para guardar un valor entero
  Future<void> saveInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  // Ejemplo de un método para obtener un valor entero
  int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  // Ejemplo de un método para guardar un valor string
  Future<void> saveString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  // Ejemplo de un método para obtener un valor string
  String? getString(String key) {
    return _prefs?.getString(key);
  }
}

