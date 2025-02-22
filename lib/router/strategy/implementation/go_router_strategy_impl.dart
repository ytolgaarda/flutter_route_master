import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:route_master/router/strategy/base/router_base_strategy.dart';

class GoRouterStrategyImpl implements RouterBaseStrategy {
  @override
  Future<void> pop(BuildContext context) async {
    GoRouter.of(context).pop();
  }

  @override
  Future<void> push(BuildContext context, String routeName,
      {Object? args}) async {
    GoRouter.of(context).push(routeName, extra: args);
  }

  @override
  Future<void> pushNamed(BuildContext context, String routeName,
      {Object? args}) async {
    GoRouter.of(context).pushNamed(routeName, extra: args);
  }
}
