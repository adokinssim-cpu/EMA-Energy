import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/installation.mod.dart';
import '../widgets/status_badge.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<Installation> allInstallations = [
    Installation(
      id: '1',
      name: 'Kit Solaire Résidence',
      powerKW: 5.0,
      location: 'Cotonou',
      type: 'Solaire',
    ),
    Installation(
      id: '2',
      name: 'Centrale Mini-Grid',
      powerKW: 50.0,
      location: 'Lokossa',
      type: 'Hybride',
    ),
    Installation(
      id: '3',
      name: 'Pompage Solaire',
      powerKW: 12.0,
      location: 'Parakou',
      type: 'Solaire',
    ),
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredList = allInstallations.where((item) {
      return item.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          item.location.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Installations Énergétiques')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Rechercher par nom ou ville...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => searchQuery = value),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final item = filteredList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(
                      item.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${item.location} • ${item.powerKW} kW'),
                    trailing: const StatusBadge(label: 'Actif'),
                    onTap: () => context.go('/detail/${item.id}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
