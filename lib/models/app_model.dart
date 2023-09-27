import 'package:movie_app/models/models.dart';

class AppModel {
  final List<MovieModel>? movieModel;
  final int? page;

  AppModel({
    this.movieModel,
    this.page,
  });

  AppModel.inital()
      : movieModel = [],
        page = 1;

  AppModel copyWith({
    List<MovieModel>? movieModel,
    int? page,
  }) {
    return AppModel(
      movieModel: movieModel ?? this.movieModel,
      page: page ?? this.page,
    );
  }
}
