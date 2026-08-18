import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/installation.mod.dart';
import '../widgets/custom_button.dart';

class DetailScreen extends StatelessWidget {
  final Installation? installation;

  const DetailScreen({super.key, this.installation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(installation?.name ?? 'Détails de l\'installation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Détails techniques',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('ID : ${installation?.id}', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text(
              'Type : ${installation?.type}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Puissance : ${installation?.powerKW} kW',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Localisation : ${installation?.location}',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            CustomButton(
              text: 'Retour à la liste',
              onPressed: () => context.go('/list'),
            ),
          ],
        ),
      ),
    );
  }
}
