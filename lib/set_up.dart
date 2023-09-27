import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/repo/repo.dart';
import 'package:movie_app/views/views.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  bool _isSetupComplete = false;

  @override
  void initState() {
    super.initState();
    _setUp();
  }

  Future<void> _setUp() async {
    final getIt = GetIt.instance;
    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);
    getIt.registerSingleton<MovieConfig>(
      MovieConfig(
        BASE_API_URL: configData['BASE_API_URL'],
        BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL'],
        API_KEY: configData['API_KEY'],
        ACCESS_TOKEN: configData['ACCESS_TOKEN'],
      ),
    );

    getIt.registerSingleton<HttpService>(
      HttpService(),
    );
    getIt.registerSingleton<MovieService>(
      MovieService(),
    );

    await Future.delayed(const Duration(milliseconds: 700));

    setState(() {
      _isSetupComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return _isSetupComplete ? HomeScreen() : SplashScreen();
  }
}
