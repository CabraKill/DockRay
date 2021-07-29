import 'package:get/get.dart';
import 'package:system_call_test/pages/home/widgets/layoutFloatingButton.dart';

class _Rx {
  final layoutHome = LayoutHome.grid.obs;
}

class HomeController extends GetxController {
// final MyRepository repository;
  void changeLayout() {}

  final _rx = _Rx();

  LayoutHome get layoutHome => _rx.layoutHome.value;
}
