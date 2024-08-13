import 'package:flutter/material.dart';
import 'package:docwise/config/app_routes.dart';
import 'package:docwise/styles/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Urbanist',
        scaffoldBackgroundColor: AppColors.white,
      ),
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.pages,
    );
  }
}