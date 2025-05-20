import 'dart:convert';

import 'package:deals_dray_test/Data/Networks/baseapiservice.dart';
import 'package:deals_dray_test/Data/app_exceptions.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseapiService {
  // Get Data
  @override
  Future get(url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Post Data
  @override
  Future post(url, dynamic data) async {
    try {
      final payload = jsonEncode(data);
      final response = await http.post(
        Uri.parse(url),
        body: payload,
        headers: {'Content-Type': 'application/json'},
      );
      // Handle response function called
      return handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  // Handle Response
  handleResponse(http.Response response) {
    final responseJson = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
      case 201:
        return responseJson;
      case 400:
        throw BadRequestException(responseJson["data"]["message"]);
      case 401:
      case 403:
        throw UnAuthorizedException(responseJson["data"]["message"]);
      case 409:
        throw ConflictException(responseJson["data"]["message"]);
      case 500:
      default:
        throw FetchDataException(responseJson["data"]["message"]);
    }
  }
}
