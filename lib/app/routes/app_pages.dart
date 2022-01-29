import 'package:get/get.dart';
import 'package:user_info/app/modules/views/home_view.dart';

import '../modules/bindings/home_bindings.dart';

class AppPages {

  static final routes = [
    GetPage(
      name: '/home',
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}