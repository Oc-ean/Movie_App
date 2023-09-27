import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/view_models/view_models.dart';

final appNotifierProvider = StateNotifierProvider<MovieNotifier, AppModel>(
  (ref) => MovieNotifier(),
);
