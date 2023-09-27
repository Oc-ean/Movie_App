import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/repo/repo.dart';

class MovieNotifier extends StateNotifier<AppModel> {
  final MovieService movieService;

  MovieNotifier(AppModel initialState, this.movieService)
      : super(initialState) {
    getMovies();
  }

  Future<void> getMovies() async {
    try {
      List<MovieModel>? _movieModel = [];
      _movieModel = await movieService.getPopularMovies(page: state.page);
      state = state.copyWith(movieModel: [
        ...state.movieModel!,
        ..._movieModel!,
      ], page: state.page! + 1);
      print('Movie Notifier:  ${_movieModel}');
      print('Movie Notifier List:  ${_movieModel.length}');
    } catch (e) {
      print('Get Movie Error ${e.toString()}');
    }
  }
}
