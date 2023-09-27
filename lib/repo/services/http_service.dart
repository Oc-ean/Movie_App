import 'package:dio/dio.dart';
import 'package:movie_app/models/models.dart';

class HttpService {
  final MovieConfig movieConfig;

  HttpService(this.movieConfig);

  Future<Response?> get(String _path, {Map<String, dynamic>? query}) async {
    try {
      final _url = '${movieConfig.BASE_API_URL}$_path';

      final Map<String, String> _query = {
        'api_key': movieConfig.API_KEY,
        'language': 'en-US',
      };

      if (query != null) {
        query.forEach((key, value) {
          _query[key] = value.toString(); // Convert dynamic values to strings
        });
      }

      final response = await Dio().get(_url, queryParameters: _query);
      print('Response: ${response.data}');
      return response;
    } on DioError catch (e) {
      print('Unable to perform get request');
      print('DioError: $e');
      print('Response: ${e.response?.data}');
      rethrow;
    }
  }
}
