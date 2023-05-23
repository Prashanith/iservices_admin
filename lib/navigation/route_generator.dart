import 'package:flutter/material.dart';
import 'package:iservices/navigation/routes.dart';
import 'package:iservices/page/page_scaffold.dart';
import 'package:iservices/screens/home.dart';
import 'package:iservices/screens/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
            builder: (_) =>
                const PageScaffold(showAppBar: false, showBack: false, child: SplashScreen()));
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => const PageScaffold(showBack: false, child: Home()));
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void pushNamed(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }
}
