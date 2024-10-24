// lib/screens/results_screen.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gmi_prospect_application/models/subject.dart';
import 'package:gmi_prospect_application/models/course.dart';
import 'package:gmi_prospect_application/data/courses.dart';
import 'package:gmi_prospect_application/widget/enquiry_dialog.dart';

class ResultsScreen extends StatelessWidget {
  final List<Subject> subjects;

  const ResultsScreen({super.key, required this.subjects});

  bool canEnrollInCourse(Course course) {
    for (var requirement in course.requirements) {
      String subjectName = requirement.keys.first;
      String requiredGrade = requirement.values.first;

      bool subjectFound = false;
      for (var subject in subjects) {
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

    final actualValue =
        gradeOrder[actualGrade] ?? 12; // Default to worst if grade not found
    final requiredValue = gradeOrder[requiredGrade] ?? 12;

    return actualValue <= requiredValue; // Lower number means better grade
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  // void _showEnquiryDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => const EnquiryDialog(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    List<Course> eligibleCourses =
        gmiCourses.where((course) => canEnrollInCourse(course)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Programs'),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.info_outline),
        //     onPressed: _showEnquiryDialog,
        //   ),
        // ],
        elevation: 0,
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
                    'Eligible Programs at GMI',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Based on your qualifications',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: eligibleCourses.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.school,
                            size: 80,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No eligible programs found',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Please check the program requirements',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      itemCount: eligibleCourses.length,
                      itemBuilder: (context, index) {
                        final course = eligibleCourses[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: InkWell(
                            onTap: () => _launchURL(course.websiteUrl),
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
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                      child: Image.network(
                                        course.imageUrl,
                                        height: 200,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            course.name,
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Text(
                                            course.description,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[600],
                                              height: 1.5,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () => _launchURL(
                                                    course.websiteUrl),
                                                child: const Text('Learn More'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () => _launchURL(
                                                    'https://gmi.vialing.com'),
                                                child: const Text('Apply'),
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
