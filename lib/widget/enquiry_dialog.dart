// lib/widgets/enquiry_dialog.dart
import 'package:flutter/material.dart';

class EnquiryDialog extends StatelessWidget {
  const EnquiryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enquiry'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'German-Malaysian Institute (GMI) is an institution known for its '
              'exceptional education in engineering and technology. GMI prepares '
              'students with industry-relevant skills for a successful future.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text('Phone: +603-1234 5678'),
            const Text('Email: info@gmi.edu.my'),
            const Text('Website: https://www.gmi.edu.my'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
