import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  final String initialRoute;
  const AppWidget({Key key, @required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(initialRoute);
    return MaterialApp.router(
      title: 'Randomize',
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
