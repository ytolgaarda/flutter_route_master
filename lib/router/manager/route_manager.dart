import 'package:flutter/material.dart';

import '../adapters/go_router_adapter.dart';
import '../adapters/navigator_adapter.dart';
import '../base/router_base_strategy.dart';
import '../enum/router_type.dart';

class RouterManager {
  static RouterManager? _instance;

  late RouterBaseStrategy router;

  factory RouterManager({RouterType type = RouterType.native}) {
    _instance ??= RouterManager._(type);

    return _instance!;
  }

  RouterManager._(RouterType type) {
    setStrategy(type);
  }

  void setStrategy(RouterType type) {
    switch (type) {
      case RouterType.native:
        router = NavigatorAdapter();
      case RouterType.goRouter:
        router = GoRouterAdapter();
    }
  }

  Widget get buildRouter => router.buildRouter();

  void push(BuildContext context, String route, {Object? args}) {
    router.push(context, route, args: args);
  }

  void replace(BuildContext context, String route, {Object? args}) {
    router.replace(context, route, args: args);
  }

  void pop(BuildContext context) => router.pop(context);
  void removeUntil(BuildContext context, String route) =>
      router.removeUntil(context, route);
}
