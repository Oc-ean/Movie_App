import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/models.dart';

class HttpService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  String? _baseUrl;
  String? _apiKey;

  HttpService() {
    MovieConfig _config = getIt.get<MovieConfig>();
    _baseUrl = _config.BASE_API_URL;
    _apiKey = _config.API_KEY;
  }
  Future<Response?> get(String _path, {Map<String, dynamic>? query}) async {
    try {
      String _url = '$_baseUrl$_path';
      Map<String, dynamic> _query = {
        'api_key': _apiKey,
        'language': 'en-US',
      };
      if (query != null) {
        _query.addAll(query);
      }
      final response = await dio.get(_url, queryParameters: _query);
      print('Response: ${response.data}');

      return response;
    } on DioException catch (e) {
      print('Unable to perform get request');
      print('DioError : $e');
      print('Response: ${e.response?.data}');
      rethrow;
    }
  }
}
