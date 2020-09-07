import 'package:flutter/material.dart';
import 'package:flutter_widgets/common/routes.dart';
import 'package:flutter_widgets/pages/loading_page.dart';
import 'package:flutter_widgets/pages/main_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute<dynamic>(builder: (_){
          return LandingPage();
        });
        break;
      case Routes.main:
        return PageRouteBuilder<dynamic>(pageBuilder: (_,__,___) {
          return MainApp();
        },transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) =>
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ));
        break;
    }
  }

  SlideTransition leftSliideTransition(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child){
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
