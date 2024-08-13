import 'dart:async';
import 'package:docwise/pages/hindi_page/home_page_hindi.dart';
import 'package:docwise/pages/marathi_page/home_page_marathi.dart';
import 'package:flutter/material.dart';
import 'package:docwise/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices {
  static void navigate(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      SharedPreferences.getInstance().then((prefs) {
        final String selectedLanguage = prefs.getString('selected_language') ?? 'English';
        Widget homePage;
        if (selectedLanguage == 'मराठी') {
          homePage = HomePageMarathi();
        } else if (selectedLanguage == 'हिंदी') {
          homePage = HomePageHindi();
        } else {
          homePage = HomePage();
        }
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => homePage,
            transitionsBuilder: (context, animation1, animation2, child) {
              return FadeTransition(
                opacity: animation1,
                child: child,
              );
            },
            transitionDuration: Duration(milliseconds: 800),
          ),
        );
      });
    });
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SplashServices.navigate(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 246, 255),
      body: Center(
        child: Image.asset(
          'assets/images/doctransparent.gif',
          width: 250,
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}
