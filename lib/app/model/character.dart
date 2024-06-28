// models/character.dart
class Character {
  final String name;
  final String description;
  final String thumbnailUrl;

  Character({required this.name, required this.description, required this.thumbnailUrl});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      description: json['description'] ?? '',
      thumbnailUrl: "${json['thumbnail']['path']}.${json['thumbnail']['extension']}",
    );
  }
}
