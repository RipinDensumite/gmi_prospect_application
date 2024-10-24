// lib/models/course.dart
class Course {
  final String name;
  final String description;
  final String imageUrl;
  final String websiteUrl;
  final List<Map<String, double>> requirements;

  Course({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.websiteUrl,
    required this.requirements,
  });
}
