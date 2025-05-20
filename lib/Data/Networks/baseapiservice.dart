// Base API service class
abstract class BaseapiService {
  Future<dynamic> get(dynamic url);
  Future<dynamic> post(dynamic url, dynamic data);
}
