import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:system_call_test/pages/home/home.dart';
import 'package:system_call_test/pages/home/homeBinding.dart';

class Pages {
  static final pages = [
    GetPage(name: "/home", page: () => HomePage(), binding: HomeBinding())
  ];
}
