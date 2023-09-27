import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/view_models/view_models.dart';
import 'package:movie_app/views/home_view/home_view.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppModel appModel = ref.watch(appNotifierProvider);
    final MovieNotifier movieNotifier = ref.watch(appNotifierProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: _movieList(appModel, movieNotifier),
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 300,
        height: 100,
        margin: const EdgeInsets.fromLTRB(1, 0, 1, 1),
      ),
    );
  }

  Widget _movieList(AppModel appModel, MovieNotifier movieNotifier) {
    final List<MovieModel> _movie = appModel.movieModel!;
    final bool isLoading = _movie.isEmpty;

    print('This Movie list : ${appModel.movieModel}');
    print('Movie length ${_movie.length}');
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: isLoading ? 20 : _movie.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        if (isLoading) {
          return _buildShimmerEffect();
        } else {
          return GestureDetector(
            onTap: () {
              if (!isLoading) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MovieDetails(movieModel: _movie[index]),
                  ),
                );
              }
            },
            child: SizedBox(
              width: 300,
              height: 100,
              child: CachedNetworkImage(
                imageUrl: _movie[index].posterUrl(),
                imageBuilder: (context, imageProvider) => Container(
                  width: 300,
                  height: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 100,
                    width: 300,
                    margin: const EdgeInsets.fromLTRB(1, 0, 1, 1),
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
