import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/repo/repo.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;

  late HttpService _httpService;
  MovieService() {
    _httpService = getIt<HttpService>();
  }

  Future<List<MovieModel>?> getPopularMovies({int? page}) async {
    Response? response = await _httpService.get('/movie/popular', query: {
      'page': page,
    });
    if (response!.statusCode == 200) {
      Map data = response.data;
      List<MovieModel>? movieModel =
          data['results'].map<MovieModel>((movieData) {
        return MovieModel.fromJson(movieData);
      }).toList();
      return movieModel;
    } else {
      throw Exception('Couldn\'t load latest movies');
    }
  }
}
