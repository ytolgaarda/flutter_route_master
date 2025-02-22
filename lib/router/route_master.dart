import 'package:flutter/material.dart';
import 'package:route_master/router/strategy/base/router_base_strategy.dart';
import 'package:route_master/router/strategy/implementation/go_router_strategy_impl.dart';
import 'package:route_master/router/strategy/implementation/native_router_strategy_impl.dart';

import 'enum/router_type.dart';

class RouteMaster {
  static RouteMaster? _instance;
  RouteMaster._();
  static RouteMaster get instance {
    _instance ??= RouteMaster._();
    return _instance!;
  }

  late RouterBaseStrategy _routerStrategy;

  void setRouterStrategy({required RouterType routerType}) {
    switch (routerType) {
      case RouterType.native:
        _routerStrategy = NativeRouterStrategyImpl();
        break;
      case RouterType.goRouter:
        _routerStrategy = GoRouterStrategyImpl();
        break;
    }
  }

  Future<void> pop(BuildContext context) async {
    await _routerStrategy.pop(context);
  }

  Future<void> push(BuildContext context, String routeName,
      {Object? args}) async {
    await _routerStrategy.push(context, routeName, args: args);
  }

  Future<void> pushNamed(BuildContext context, String routeName,
      {Object? args}) async {
    await _routerStrategy.pushNamed(context, routeName, args: args);
  }
}
