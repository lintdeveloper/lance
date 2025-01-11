
import 'package:lance/shared/services/secureCache/secure_cache.dart';

Future<Map<String, dynamic>> getToken({required String tokenType}) async {
  final secureCacheService = SecureCacheService.instance();
  final token = await secureCacheService.getToken("authToken");
  Map<String, dynamic> _headers = {};
  return _headers["Authorization"] = token[tokenType];
}