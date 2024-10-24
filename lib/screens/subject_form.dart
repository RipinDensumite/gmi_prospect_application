// lib/screens/subject_form.dart
import 'package:flutter/material.dart';
import 'package:gmi_prospect_application/models/subject.dart';
import 'package:gmi_prospect_application/screens/results_screen.dart';

class SubjectFormScreen extends StatefulWidget {
  const SubjectFormScreen({super.key});

  @override
  State<SubjectFormScreen> createState() => _SubjectFormScreenState();
}

class _SubjectFormScreenState extends State<SubjectFormScreen> {
  final List<Subject> subjects = [];
  final List<String> subjectOptions = [
    'Mathematics',
    'Physics',
    'English',
    'Art',
    'Chemistry',
    'Biology',
  ];

  final List<String> gradeOptions = [
    'A+',
    'A',
    'A-',
    'B+',
    'B',
    'B-',
    'C+',
    'C',
    'C-',
    'D+',
    'D',
    'F',
  ];

  void addSubject() {
    setState(() {
      subjects.add(Subject(
        name: subjectOptions[0],
        grade: gradeOptions[0],
      ));
    });
  }

  void removeSubject(int index) {
    setState(() {
      subjects.removeAt(index);
    });
  }

  void submitForm() {
    if (subjects.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one subject')),
      );
      return;
    }

    for (var subject in subjects) {
      subject.checkQualification();
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(subjects: subjects),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subject Application'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Subject Dropdown
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: DropdownButtonFormField<String>(
                                isExpanded: true, // Add this line
                                value: subjects[index].name,
                                items: subjectOptions.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      overflow: TextOverflow
                                          .ellipsis, // Add this line
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    subjects[index] = Subject(
                                      name: newValue!,
                                      grade: subjects[index].grade,
                                    );
                                  });
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Subject',
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Grade Dropdown
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: DropdownButtonFormField<String>(
                                isExpanded: true, // Add this line
                                value: subjects[index].grade,
                                items: gradeOptions.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    subjects[index] = Subject(
                                      name: subjects[index].name,
                                      grade: newValue!,
                                    );
                                  });
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Grade',
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Remove Button
                          IconButton(
                            icon: const Icon(Icons.remove_circle),
                            onPressed: () => removeSubject(index),
                            color: Colors.red,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: addSubject,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Subject'),
                ),
                ElevatedButton(
                  onPressed: submitForm,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}