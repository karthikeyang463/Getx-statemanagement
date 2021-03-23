import 'package:flutter_getx2/view/home_view.dart';
import 'package:flutter_getx2/view/login_view.dart';
import 'package:get/get.dart';

class Routers {
  static final route = [
    GetPage(
      name: '/loginView',
      page: () => LoginView(),
    ),
    GetPage(
      name: '/homeView',
      page: () => HomeView(),
    ),
  ];
}
