class Subject {
  final String name;
  final String grade;
  bool isQualified;
  double gradePoint;

  Subject({
    required this.name,
    required this.grade,
    this.isQualified = false,
    this.gradePoint = 0.0,
  });

  void checkQualification() {
    final gradePoints = {
      'A+': 4.0, 'A': 4.0, 'A-': 3.7,
      'B+': 3.3, 'B': 3.0, 'B-': 2.7,
      'C+': 2.3, 'C': 2.0, 'C-': 1.7,
      'D+': 1.3, 'D': 1.0, 'F': 0.0,
    };

    gradePoint = gradePoints[grade] ?? 0.0;
    isQualified = gradePoint >= 2.0;
  }
}
