import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/home_screen.dart';
import 'screens/list_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/form_screen.dart';

void main() {
  runApp(const MyApp());
}

// Configuration du GoRouter pour la navigation de l'application
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'list',
          builder: (BuildContext context, GoRouterState state) {
            return const ListScreen();
          },
        ),
        GoRoute(
          path: 'detail',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailScreen();
          },
        ),
        GoRoute(
          path: 'form',
          builder: (BuildContext context, GoRouterState state) {
            return const FormScreen();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'EMA Energy',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
 