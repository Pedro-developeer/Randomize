enum AppModuleRoutes {
  random,
}

extension RoutesPath on AppModuleRoutes {
  String get path {
    switch (this) {
      case AppModuleRoutes.random:
        return '/random';
    }
  }
}
