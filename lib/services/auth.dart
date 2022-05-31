import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  var token = '';

  Future<String> getToken() async {
    String? token = await storage.read(key: 'token');
    return token!;
  }

  Future<void> setToken(String token) async {
    await storage.write(key: 'token', value: token);
  }
}
