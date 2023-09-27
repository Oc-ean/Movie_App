import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/repo/repo.dart';

final dio = Dio();

final movieConfigProvider = FutureProvider<MovieConfig>((ref) async {
  final configFile = await rootBundle.loadString('assets/config/main.json');
  final configData = jsonDecode(configFile);
  return MovieConfig(
    BASE_API_URL: configData['BASE_API_URL'],
    BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL'],
    API_KEY: configData['API_KEY'],
    ACCESS_TOKEN: configData['ACCESS_TOKEN'],
  );
});

final httpServiceProvider = Provider<HttpService>((ref) {
  final movieConfigAsyncValue = ref.watch(movieConfigProvider);

  final movieConfig = movieConfigAsyncValue.when(
    data: (config) => config,
    loading: () => throw 'MovieConfig is still loading',
    error: (error, stackTrace) => throw error,
  );

  return HttpService(movieConfig);
});

final movieServiceProvider = Provider<MovieService>((ref) {
  final httpService = ref.watch(httpServiceProvider);

  return MovieService(httpService);
});
