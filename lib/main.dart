import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/my_app.dart';

void main() {
  // runApp(
  //   SplashScreen(
  //     key: UniqueKey(),
  //     onInitializationCompleted: () => runApp(
  //       const ProviderScope(
  //         child: MyApp(),
  //       ),
  //     ),
  //   ),
  // );
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
