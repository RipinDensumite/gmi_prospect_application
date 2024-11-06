import 'package:flutter/material.dart';
import 'package:gmi_prospect_application/models/subject.dart';
import 'package:gmi_prospect_application/screens/results_screen.dart';
import 'package:gmi_prospect_application/widget/enquiry_dialog.dart';

class SubjectFormScreen extends StatefulWidget {
  const SubjectFormScreen({super.key});

  @override
  State<SubjectFormScreen> createState() => _SubjectFormScreenState();
}

class _SubjectFormScreenState extends State<SubjectFormScreen> {
  final List<Subject> subjects = [];
  final List<String> subjectOptions = [
    'Bahasa Melayu',
    'Bahasa Inggeris',
    'Matematik',
    'Sains',
    'Sejarah',
    'Pendidikan Islam',
    'Pendidikan Moral',
    'Matematik Tambahan',
    'Fizik',
    'Kimia',
    'Bilogi',
    'Prinsip Perakaunan',
    'Ekonomi Asas',
    'Perdagangan',
    'Geografi',
    'Seni Visual',
    'Teknologi Maklumat dan Komunikasi (ICT)',
    'Sains Komputer',
    'Kesusasteraan Melayu',
    'Pendidikan Seni Visual',
    'Sains Sukan',
    'Tasawwur Islam',
    'Asas Sains Komputer'
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

  // Get list of currently selected subjects
  Set<String> get selectedSubjects => subjects.map((s) => s.name).toSet();

  void addSubject() {
    // Find first available subject
    String? firstAvailableSubject = subjectOptions.firstWhere(
      (subject) => !selectedSubjects.contains(subject),
      orElse: () => '',
    );

    if (firstAvailableSubject.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All subjects have been added')),
      );
      return;
    }

    setState(() {
      subjects.add(Subject(
        name: firstAvailableSubject,
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

  void _showEnquiryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => const EnquiryDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GMI Prospect Application'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _showEnquiryDialog,
          ),
        ],
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
                                isExpanded: true,
                                value: subjects[index].name,
                                items: subjectOptions.map((String value) {
                                  bool isSelected = selectedSubjects.contains(value) && 
                                                  value != subjects[index].name;
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    enabled: !isSelected,
                                    child: Text(
                                      value,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: isSelected ? Colors.grey : null,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      subjects[index] = Subject(
                                        name: newValue,
                                        grade: subjects[index].grade,
                                      );
                                    });
                                  }
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
                                isExpanded: true,
                                value: subjects[index].grade,
                                items: gradeOptions.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      subjects[index] = Subject(
                                        name: subjects[index].name,
                                        grade: newValue,
                                      );
                                    });
                                  }
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
                  onPressed: subjectOptions.length == selectedSubjects.length 
                    ? null 
                    : addSubject,
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