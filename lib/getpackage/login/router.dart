import 'package:flutter_widgets/getpackage/login/page/home_view.dart';
import 'package:flutter_widgets/getpackage/login/page/login_view.dart';
import 'package:get/get.dart';

class RouterLogin {
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