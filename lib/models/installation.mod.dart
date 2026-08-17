class Installation {
  final String id;
  final String name;
  final double powerKW;
  final String location;
  final String type; // Solaire, Éolien, etc.

  Installation({
    required this.id,
    required this.name,
    required this.powerKW,
    required this.location,
    required this.type,
  });
}
