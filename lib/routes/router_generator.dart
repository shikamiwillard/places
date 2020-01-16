import 'package:flutter/material.dart';
import 'package:flutter_container/ui/landing.dart';
import 'package:flutter_container/ui/layouts/shell.dart';
import 'package:flutter_container/ui/login.dart';
import 'package:flutter_container/ui/trades/trades.dart';

import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute<dynamic>(builder: (_) => LandingPage());

      case Routes.signIn:
        return MaterialPageRoute<dynamic>(builder: (_) => LoginPage());

      case Routes.trades:
        return MaterialPageRoute<dynamic>(builder: (_) => AppShell(widget: Trades(), title: 'MasterClass Demo'));
      default:
        return _errorRoute();
    }
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
