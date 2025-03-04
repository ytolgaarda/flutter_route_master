import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:route_master/main.dart';
import 'package:route_master/router/base/router_base_strategy.dart';

import '../../presentation/account_view.dart';

class GoRouterAdapter implements RouterBaseStrategy {
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MyHomePage(
          title: 'Go Router strategy Title',
        ),
      ),
      GoRoute(
        path: '/account',
        pageBuilder: (context, state) {
          var params = state.extra as String;
          return CustomTransitionPage(
            key: state.pageKey,
            child: AccountView(
              name: params,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                    .animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
  @override
  Widget buildRouter() {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      //theme: ThemeManager().getThemeData(ThemeMode.light),
    );
  }

  @override
  void pop(BuildContext context) => _router.pop();

  @override
  void push(BuildContext context, String route, {Object? args}) {
    context.push(route, extra: args);
  }

  @override
  void replace(BuildContext context, String route, {Object? args}) {
    context.replace(route, extra: args);
  }

  @override
  void removeUntil(BuildContext context, String route) {
    context.go(route);
  }
}
