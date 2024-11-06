import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gmi_prospect_application/models/subject.dart';
import 'package:gmi_prospect_application/models/course.dart';
import 'package:gmi_prospect_application/data/courses.dart';
import 'package:gmi_prospect_application/widget/enquiry_dialog.dart';

enum ProgramCategory { all, diploma, gapp, gufp }

class ResultsScreen extends StatefulWidget {
  final List<Subject> subjects;

  const ResultsScreen({super.key, required this.subjects});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Course> filteredCourses;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    filteredCourses = gmiCourses;

    _tabController.addListener(() {
      filterCourses(_tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void filterCourses(int index) {
    setState(() {
      switch (ProgramCategory.values[index]) {
        case ProgramCategory.all:
          filteredCourses = gmiCourses;
          break;
        case ProgramCategory.diploma:
          filteredCourses = gmiCourses
              .where(
                  (course) => course.name.toLowerCase().startsWith('diploma'))
              .toList();
          break;
        case ProgramCategory.gapp:
          filteredCourses = gmiCourses
              .where((course) => course.name.toLowerCase().contains('gapp'))
              .toList();
          break;
        case ProgramCategory.gufp:
          filteredCourses = gmiCourses
              .where((course) => course.name.toLowerCase().contains('gufp'))
              .toList();
          break;
      }
    });
  }

  bool canEnrollInCourse(Course course) {
    for (var requirement in course.requirements) {
      String subjectName = requirement.keys.first;
      String requiredGrade = requirement.values.first;

      bool subjectFound = false;
      for (var subject in widget.subjects) {
        if (subject.name == subjectName) {
          subjectFound = true;
          if (!isGradeEqualOrBetter(subject.grade, requiredGrade)) {
            return false;
          }
          break;
        }
      }
      if (!subjectFound) return false;
    }
    return true;
  }

  bool isGradeEqualOrBetter(String actualGrade, String requiredGrade) {
    final gradeOrder = {
      'A+': 0,
      'A': 1,
      'A-': 2,
      'B+': 3,
      'B': 4,
      'B-': 5,
      'C+': 6,
      'C': 7,
      'C-': 8,
      'D+': 9,
      'D': 10,
      'F': 11,
    };

    final actualValue = gradeOrder[actualGrade] ?? 12;
    final requiredValue = gradeOrder[requiredGrade] ?? 12;

    return actualValue <= requiredValue;
  }

  void _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(
      url,
      mode: LaunchMode
          .externalApplication, // This ensures it opens in external browser
    )) {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Programs'),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Diploma'),
            Tab(text: 'GAPP'),
            Tab(text: 'GUFP'),
          ],
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Theme.of(context).primaryColor,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.1),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'GMI Programs',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'GMI offers a range of programs and services',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  final course = filteredCourses[index];
                  final isEligible = canEnrollInCourse(course);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      isEligible
                                          ? Colors.transparent
                                          : Colors.grey,
                                      BlendMode.saturation,
                                    ),
                                    child: Image.network(
                                      course.imageUrl,
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                if (!isEligible)
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Text(
                                        'Requirements not met',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    course.name,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: isEligible
                                          ? Colors.black
                                          : Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    course.description,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: isEligible
                                          ? Colors.grey[600]
                                          : Colors.grey[400],
                                      height: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        onPressed: isEligible
                                            ? () =>
                                                _launchURL(course.websiteUrl)
                                            : null,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: isEligible
                                              ? Theme.of(context).primaryColor
                                              : Colors.grey[300],
                                        ),
                                        child: Text(
                                          'Learn More',
                                          style: TextStyle(
                                            color: isEligible
                                                ? Colors.white
                                                : Colors.grey[600],
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: isEligible
                                            ? () => _launchURL(
                                                'https://gmi.vialing.com/oa/register')
                                            : null,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: isEligible
                                              ? Theme.of(context).primaryColor
                                              : Colors.grey[300],
                                        ),
                                        child: Text(
                                          'Apply',
                                          style: TextStyle(
                                            color: isEligible
                                                ? Colors.white
                                                : Colors.grey[600],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
