import 'package:dockray/pages/splash/splashBinding.dart';
import 'package:dockray/pages/splash/splashPage.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'home/home.dart';
import 'home/homeBinding.dart';

class Pages {
  static final pages = [
    GetPage(name: '/', page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: "/home", page: () => HomePage(), binding: HomeBinding())
  ];
}
