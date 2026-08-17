import 'package:flutter/material.dart';
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
            icon: Icon(
              themeNotifier.value == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              themeNotifier.value = themeNotifier.value == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark;
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tableau de bord',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Bienvenue dans votre gestionnaire d\'installations énergétiques.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Voir la liste des installations',
              onPressed: () => context.go('/list'),
            ),
            const SizedBox(height: 12),
            CustomButton(
              text: 'Ajouter une installation (Formulaire)',
              onPressed: () => context.go('/form'),
            ),
          ],
        ),
      ),
    );
  }
}
