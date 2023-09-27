import 'package:get_it/get_it.dart';
import 'package:movie_app/models/models.dart';

class MovieModel {
  final String name;
  final String language;
  final bool isAdult;
  final String description;
  final String posterPath;
  final String backDropPath;
  final num rating;
  final String releaseDate;
  MovieModel({
    required this.name,
    required this.language,
    required this.isAdult,
    required this.description,
    required this.posterPath,
    required this.backDropPath,
    required this.rating,
    required this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      name: json['title'],
      language: json['original_language'],
      isAdult: json['adult'],
      description: json['overview'],
      posterPath: json['poster_path'],
      backDropPath: json['backdrop_path'],
      rating: json['vote_average'],
      releaseDate: json['release_date'],
    );
  }
  String posterUrl() {
    final MovieConfig movieConfig = GetIt.instance.get<MovieConfig>();
    return '${movieConfig.BASE_IMAGE_API_URL}$posterPath';
  }
}
