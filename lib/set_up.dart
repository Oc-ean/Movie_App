import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/constant/providers.dart';

import 'views/home_view/home_view.dart';
import 'views/splash_view/splash_view.dart';

class SetupScreen extends ConsumerWidget {
  const SetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool _isSetupComplete = false;

    final movieConfigAsync = ref.watch(movieConfigProvider);

    return movieConfigAsync.when(
      data: (movieConfig) {
        final httpService = ref.read(httpServiceProvider);
        final movieService = ref.read(movieServiceProvider);

        Future.delayed(const Duration(milliseconds: 700), () {
          _isSetupComplete = true;
          if (_isSetupComplete) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => HomeScreen()),
            );
          }
        });

        return _isSetupComplete ? const SizedBox() : SplashScreen();
      },
      loading: () {
        return SplashScreen();
      },
      error: (error, stackTrace) {
        return Text('Error: $error');
      },
    );
  }
}
