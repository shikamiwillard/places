import 'package:flutter/material.dart';
import 'package:flutter_container/data/local/bloc_provider.dart';
import 'package:flutter_container/data/local/tradeBloc.dart';
import 'package:flutter_container/routes/router_generator.dart';
import 'routes/routes.dart';

import 'constants/app_theme.dart';
import 'constants/app_strings.dart';

void main() => runApp(
  BlocProvider(
    bloc: TradeBloc(),
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: themeData,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Routes.landing,
    );
  }
}