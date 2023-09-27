import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/views/views.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetails extends StatelessWidget {
  final MovieModel movieModel;
  const MovieDetails({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          ..._background(height, width),
          _movieDetailsTile(movieModel, context, width),
          Positioned(
            bottom: 60,
            // width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.12),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => HomeScreen(),
                        ),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      backgroundColor: Colors.white),
                  child: const Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _background(double height, double width) {
    return [
      Container(
        height: double.infinity,
        color: const Color(0xFF000B49),
      ),
      CachedNetworkImage(
        imageUrl: movieModel.posterUrl(),
        imageBuilder: (context, imageProvider) => Container(
          height: height * 0.5,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: height * 0.5,
            width: double.infinity,
            color: Colors.grey[300],
          ),
        ),
      ),
      const Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Color(0xFF000B49),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.5],
            ),
          ),
        ),
      ),
    ];
  }

  Widget _movieDetailsTile(
      MovieModel movieModel, BuildContext context, double width) {
    return Positioned(
      bottom: 150,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movieModel.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${movieModel.language.toUpperCase()} | R: ${movieModel.isAdult} | ${movieModel.releaseDate}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RatingBar.builder(
              initialRating: movieModel.rating.toDouble(),
              maxRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              ignoreGestures: true,
              itemCount: movieModel.rating.toInt(),
              itemSize: 20,
              itemPadding: const EdgeInsets.symmetric(horizontal: 3),
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
              onRatingUpdate: (rating) {},
            ),
            Text(
              movieModel.description,
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(height: 1.75, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
