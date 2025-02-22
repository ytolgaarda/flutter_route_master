import 'package:flutter/material.dart';
import 'package:route_master/router/strategy/base/router_base_strategy.dart';

class NativeRouterStrategyImpl implements RouterBaseStrategy {
  @override
  Future<void> pop(BuildContext context) async {
    Navigator.of(context).pop();
  }

  @override
  Future<void> push(BuildContext context, String routeName,
      {Object? args}) async {
    Navigator.of(context).pushNamed(routeName, arguments: args);
  }

  @override
  Future<void> pushNamed(BuildContext context, String routeName,
      {Object? args}) async {
    Navigator.of(context).pushNamed(routeName, arguments: args);
  }
}
