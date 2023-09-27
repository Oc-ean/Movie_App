import 'package:movie_app/models/models.dart';
import 'package:movie_app/repo/repo.dart';

class MovieService {
  final HttpService httpService;

  MovieService(this.httpService);

  Future<List<MovieModel>?> getPopularMovies({int? page}) async {
    final response = await httpService.get('/movie/popular', query: {
      'page': page.toString(), // Convert page to string
    });
    if (response?.statusCode == 200) {
      final data = response!.data;
      final List<MovieModel> movieModel =
          data['results'].map<MovieModel>((movieData) {
        return MovieModel.fromJson(movieData, httpService.movieConfig);
      }).toList();
      return movieModel;
    } else {
      throw Exception('Couldn\'t load latest movies');
    }
  }
}
