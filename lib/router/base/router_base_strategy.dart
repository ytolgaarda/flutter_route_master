import 'package:flutter/material.dart';

@immutable
abstract class RouterBaseStrategy {
  Widget buildRouter();
  void push(BuildContext context, String route, {Object? args});
  void replace(BuildContext context, String route, {Object? args});
  void pop(BuildContext context);
  void removeUntil(BuildContext context, String route);
}
