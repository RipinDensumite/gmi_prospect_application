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
      {'Mathematics': 2.0},
      {'Physics': 2.0},
    ],
  ),
  Course(
    name: 'Diploma in Software Engineering',
    description:
        'Learn to develop software applications and systems with industry-standard practices.',
    imageUrl: 'https://www.gmi.edu.my/wp-content/uploads/2024/08/SET-15-2048x1365.jpg',
    websiteUrl: 'https://www.gmi.edu.my/computer-and-information/software-engineering/',
    requirements: [
      {'Mathematics': 2.0},
      {'English': 2.0},
    ],
  ),
  Course(
    name: 'Diploma in Creative Multimedia',
    description:
        'Express your creativity through digital media design and development.',
    imageUrl: 'https://www.gmi.edu.my/wp-content/uploads/2024/08/CRM-6.jpg',
    websiteUrl: 'https://www.gmi.edu.my/computer-and-information/creative-multimedia/',
    requirements: [
      {'English': 2.0},
      {'Art': 2.0},
    ],
  ),
];
