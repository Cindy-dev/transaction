import 'package:flutter/cupertino.dart';
import 'package:transaction/presentation/screens/home_screen.dart';
import '../screens/display_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name!) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
        break;
      case '/display':
        return CupertinoPageRoute(
            builder: (_) => DisplayScreen(
                  name: args,
                ));
        break;

      default:
        return null;
    }
  }
}
