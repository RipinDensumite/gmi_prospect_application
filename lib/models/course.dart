class Course {
  final String name;
  final String description;
  final String imageUrl;
  final String websiteUrl;
  final List<Map<String, String>> requirements;
  final ProgramCategory category;

  Course({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.websiteUrl,
    required this.requirements,
    required this.category,
  });
}

enum ProgramCategory { diploma, gapp, gufp }
