import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:random/app/data/repositories/user.dart';
import 'package:random/app/modules/home/controller/home_controller.dart';
import 'package:random/app/modules/home/home_screen.dart';
import 'package:random/app/modules/info/info_screen.dart';
import 'package:random/app/routes/page_routes.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => UserRepository(),
        ),
        Bind.factory(
          (i) => HomeController(),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppPageRoutes.home.path,
          child: (_, args) => HomeScreen(),
        ),
        ChildRoute(
          AppPageRoutes.info.path,
          child: (_, args) => InfoScreen(
            age: args.data['age'],
            email: args.data['email'],
            id: args.data['id'],
            location: args.data['location'],
            phoneNumber: args.data['phoneNumber'],
            userImg: args.data['userImg'],
            username: args.data['username'],
          ),
        ),
      ];
}
