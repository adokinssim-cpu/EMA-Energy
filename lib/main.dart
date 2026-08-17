import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'models/installation.mod.dart';
import 'screens/home_screen.dart';
import 'screens/list_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/form_screen.dart';

void main() {
  runApp(const MyApp());
}

// ValueNotifier simple pour basculer le thème clair/sombre globalement
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Configuration de GoRouter avec nos 4 écrans
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/list',
          name: 'list',
          builder: (context, state) => const ListScreen(),
        ),
        GoRoute(
          path: '/detail/:id',
          name: 'detail',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '1';
            // On récupère ou simule l'objet selon l'ID
            final installation = Installation(
              id: id,
              name: 'Centrale Solaire $id',
              powerKW: 15.5,
              location: 'Lokossa',
              type: 'Photovoltaïque',
            );
            return DetailScreen(installation: installation);
          },
        ),
        GoRoute(
          path: '/form',
          name: 'form',
          builder: (context, state) => import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_button.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMA Energy - Accueil'),
        actions: [
          IconButton(
            icon: Icon(themeNotifier.value == ThemeMode.dark ? Ico),
          darkTheme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
          themeMode: currentThemeMode,
          routerConfig: _router,
        );
      },
    );
  }
}