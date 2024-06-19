// models/character.dart
class Character {
  final int id;
  final String name;
  final String description;

  Character({required this.id, required this.name, required this.description});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
