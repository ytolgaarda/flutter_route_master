import 'package:flutter/material.dart';

abstract class RouterBaseStrategy {
  Future<void> pop(BuildContext context);
  Future<void> push(BuildContext context, String routeName, {Object? args});
  Future<void> pushNamed(BuildContext context, String routeName,
      {Object? args});
}
