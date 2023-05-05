import 'package:flutter_modular/flutter_modular.dart';
import 'package:random/app/routes/module_routes.dart';
import 'app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    HomeModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      AppModuleRoutes.random.path,
      module: HomeModule(),
    )
  ];
}
