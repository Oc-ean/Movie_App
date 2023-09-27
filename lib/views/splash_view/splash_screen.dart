import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000B49),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

// class SplashScreen extends StatefulWidget {
//   // final VoidCallback onInitializationCompleted;
//   const SplashScreen({
//     super.key,
//     // required this.onInitializationCompleted,
//   });
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _setUp();
//   }
//
//   Future<void> _setUp() async {
//     final getIt = GetIt.instance;
//     final configFile = await rootBundle.loadString('assets/config/main.json');
//     final configData = jsonDecode(configFile);
//     getIt.registerSingleton<MovieConfig>(
//       MovieConfig(
//         BASE_API_URL: configData['BASE_API_URL'],
//         BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL'],
//         API_KEY: configData['API_KEY'],
//         ACCESS_TOKEN: configData['ACCESS_TOKEN'],
//       ),
//     );
//
//     getIt.registerSingleton<HttpService>(
//       HttpService(),
//     );
//     getIt.registerSingleton<MovieService>(
//       MovieService(),
//     );
//
//     Timer(const Duration(seconds: 2), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (_) => HomeScreen(),
//         ),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF000B49),
//       body: Center(
//         child: Container(
//           height: 400,
//           width: 400,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('assets/images/logo.png'),
//                 fit: BoxFit.contain),
//           ),
//         ),
//       ),
//     );
//   }
// }
