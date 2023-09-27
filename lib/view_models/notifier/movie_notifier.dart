import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/repo/repo.dart';

class MovieNotifier extends StateNotifier<AppModel> {
  MovieNotifier([AppModel? state]) : super(state ?? AppModel.inital()) {
    getMovies();
  }
  final MovieService movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovies() async {
    try {
      List<MovieModel>? _movieModel = [];
      _movieModel = await movieService.getPopularMovies(page: state.page);
      state = state.copyWith(movieModel: [
        ...state.movieModel!,
        ..._movieModel!,
      ], page: state.page! + 1);
      print('Move Notifier :  ${_movieModel}');
      print('Move Notifier List :  ${_movieModel.length}');
    } catch (e) {
      print('Get Movie Error ${e.toString()}');
    }
  }
}
