
import 'package:docwise/pages/edit_profile.dart';
import 'package:docwise/pages/main_page.dart';
import 'package:docwise/pages/splash_screen/splash_screen.dart';

class AppRoutes {
static final pages = {
        '/':(context) => SplashScreen(),
        '/main':(context) => MainPage(),
        '/edit_profile':(context) => EditProfilePage(),
        
      };

  static const splashScreen = '/';
  static const home = '/home';
  static const main = '/main';
  static const editProfile = '/edit_profile';
  
}