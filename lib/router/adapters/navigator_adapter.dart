import 'package:flutter/material.dart';
import 'package:route_master/main.dart';
import 'package:route_master/router/base/router_base_strategy.dart';

class NavigatorAdapter extends RouterBaseStrategy {
  @override
  Widget buildRouter() {
    return MaterialApp(
      home: MyHomePage(title: 'Navigator Strategy Title'),
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  void pop(BuildContext context) {}

  @override
  void push(BuildContext context, String route, {Object? args}) {}

  @override
  void replace(BuildContext context, String route, {Object? args}) {}

  @override
  void removeUntil(BuildContext context, String route) {}
}
