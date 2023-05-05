import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:random/app/routes/page_routes.dart';
import 'package:random/app_module.dart';
import 'package:random/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(
        initialRoute: AppPageRoutes.home.fullPath,
      ),
    ),
  );
}
