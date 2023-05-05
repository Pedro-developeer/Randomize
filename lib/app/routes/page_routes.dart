import 'module_routes.dart';

enum AppPageRoutes {
  home,
  info,
}

extension RoutesPath on AppPageRoutes {
  String get path {
    switch (this) {
      case AppPageRoutes.home:
        return '/home';
      case AppPageRoutes.info:
        return '/info';
    }
  }

  String get fullPath {
    String fullPath;
    switch (this) {
      case AppPageRoutes.home:
        fullPath = '${AppModuleRoutes.random.path}$path';
        break;

      case AppPageRoutes.info:
        fullPath = '${AppModuleRoutes.random.path}$path';
        break;
    }

    final url = _handleUrl(fullPath);
    return url;
  }
}

String _handleUrl(String url) {
  final handledUrl = url.replaceAll('//', '/');
  print('navegando para $handledUrl');
  return handledUrl;
}
