import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  Future<String> readStorage(String key) async {
    final result = await storage.read(key: key);
    return result ?? '';
  }

  Future writeStorage(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future deleteStorage(String key) async {
    await storage.delete(key: key);
  }
}
