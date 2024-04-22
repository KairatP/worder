import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RhymesDio {
  Dio dio = Dio();

  RhymesDio() {
    String? apiUrl = dotenv.env['API_URL'];
    String? apiKey = dotenv.env['API_Key'];

    if (apiUrl != null && apiKey != null) {
      dio = Dio(BaseOptions(baseUrl: apiUrl));
      dio.options.headers["X-Api-Key"] = apiKey; // Set API key as a header
    } else {
      throw Exception('API_URL and API_Key are not defined in the environment.');
    }
  }

  Dio get instance => dio;

  set path(String path) => dio.options.baseUrl = dotenv.env['API_URL']! + path;
}

