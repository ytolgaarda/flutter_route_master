import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:route_master/dependency_injection.dart';
import 'package:route_master/presentation/account_view.dart';

import 'router/enum/router_type.dart';
import 'router/route_master.dart';

void main() {
  setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    sl<RouteMaster>().setRouterStrategy(routerType: RouterType.native);

    final GoRouter goRouter = GoRouter(
      routes: [
        GoRoute(
          name: '/',
          path: '/',
          builder: (context, state) {
            final title = state.pathParameters['title'] ?? 'Default Title';
            return MyHomePage(title: title);
          },
        ),
        GoRoute(
          name: 'account',
          path: '/account',
          builder: (context, state) {
            final name = state.extra as String;
            return AccountView(name: name);
          },
        ),
      ],
    );
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: goRouter,

      /// TODO ! burada ongenarateroutes olcak. ve bir üst widget adaptive hale getirilecek...
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  sl<RouteMaster>()
                      .pushNamed(context, 'account', args: 'Tolgaa');
                },
                child: Text('go to account page')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
