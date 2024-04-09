import 'package:dio/dio.dart';
import 'package:worder/api/models/rhymes_model.dart';
import 'package:worder/injection/rhymes_dio.dart';

abstract class RhymesService {
  Future<RhymesModel> fetchRhymes(String word);
}

class RhymesServiceImplementation implements RhymesService {
  RhymesServiceImplementation({required RhymesDio rhymesDio}) {
    rhymesDio.path = '/';
    dio = rhymesDio.dio;
  }

  late final Dio dio;

  @override
  Future<RhymesModel> fetchRhymes(String word) async {
    // Encode the word for URL
    String encodedWord = Uri.encodeQueryComponent(word);
    try {
      // Make the HTTP GET request
      Response response = await dio.get('/v1/rhyme?word=$encodedWord');

      // Check the response status
      if (response.statusCode == 200) {
        // Decode the response body
        final data = RhymesModel.fromJson(response.data);
        // print(data);
        return data;
      } else {
        // Handle the error
        // print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to fetch rhymes');
      }
    } catch (e) {
      // Handle any exceptions
      // print('Error: $e');
      throw Exception('Failed to fetch rhymes');
    }
  }
}
