// lib/data/courses.dart
import 'package:gmi_prospect_application/models/course.dart';

final List<Course> gmiCourses = [
  Course(
    name: 'Diploma in Mechatronics',
    description:
        'Combine mechanical, electrical, and computer engineering skills in this comprehensive program.',
    imageUrl:
        'https://www.gmi.edu.my/wp-content/uploads/2020/04/Mechatronics-PLC-9-3.jpg', // Using placeholder as per instructions
    websiteUrl: 'https://www.gmi.edu.my/electrical-engineering/mechatronics/',
    requirements: [
      {'Bahasa Melayu': 'A'},
      {'Fizik': 'B'},
    ],
  ),
  Course(
    name: 'Diploma in Software Engineering',
    description:
        'Learn to develop software applications and systems with industry-standard practices.',
    imageUrl: 'https://www.gmi.edu.my/wp-content/uploads/2024/08/SET-15-2048x1365.jpg',
    websiteUrl: 'https://www.gmi.edu.my/computer-and-information/software-engineering/',
    requirements: [
      {'Matematik': "A"},
      {'Bahasa Inggeris': "A"},
    ],
  ),
  Course(
    name: 'Diploma in Creative Multimedia',
    description:
        'Express your creativity through digital media design and development.',
    imageUrl: 'https://www.gmi.edu.my/wp-content/uploads/2024/08/CRM-6.jpg',
    websiteUrl: 'https://www.gmi.edu.my/computer-and-information/creative-multimedia/',
    requirements: [
      {'Bahasa Inggeris': "A"},
      {'Fizik': "A"},
    ],
  ),
];
