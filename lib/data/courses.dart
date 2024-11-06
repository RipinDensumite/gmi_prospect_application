import 'package:gmi_prospect_application/models/course.dart';

final List<Course> gmiCourses = [
  // EED
  Course(
    name: 'Diploma in Mechatronics',
    description:
        'Combine mechanical, electrical, and computer engineering skills in this comprehensive program.',
    imageUrl:
        'https://www.gmi.edu.my/wp-content/uploads/2020/04/Mechatronics-PLC-9-3.jpg',
    websiteUrl: 'https://www.gmi.edu.my/electrical-engineering/mechatronics/',
    category: ProgramCategory.diploma,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Sejarah': 'C'},
      {'Matematik': 'C'},
    ],
  ),
  Course(
    name: 'Diploma in Electronic & Information Technology',
    description:
        'Master electronic systems and information technology, preparing for the digital age with hands-on experience in electronics and IT integration.',
    imageUrl:
        'https://www.gmi.edu.my/wp-content/uploads/2024/07/Unitrain-l-Waveguide-Components-1-1-2048x1365.jpg',
    websiteUrl:
        'https://www.gmi.edu.my/electrical-engineering/electric-information-technology/',
    category: ProgramCategory.diploma,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Sejarah': 'C'},
      {'Matematik': 'C'},
    ],
  ),
  Course(
    name: 'Diploma in Sustainable Energy & Power Distribution',
    description:
        'Learn about renewable energy systems and power distribution networks while focusing on sustainable solutions for future energy needs.',
    imageUrl:
        'https://www.gmi.edu.my/wp-content/uploads/2024/07/SEPD-10-2048x1367.jpg',
    websiteUrl:
        'https://www.gmi.edu.my/electrical-engineering/sustainable-energy-power-distribution/',
    category: ProgramCategory.diploma,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Sejarah': 'C'},
      {'Matematik': 'C'},
    ],
  ),
  Course(
    name: 'Diploma in Process Instrumentation & Control',
    description:
        'Develop expertise in industrial automation and control systems, learning to design and maintain sophisticated process control equipment.',
    imageUrl:
        'https://www.gmi.edu.my/wp-content/uploads/2024/08/DCS-EMERSON-11-2048x1365.jpg',
    websiteUrl:
        'https://www.gmi.edu.my/electrical-engineering/process-instrumentation-control/',
    category: ProgramCategory.diploma,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Sejarah': 'C'},
      {'Matematik': 'C'},
    ],
  ),
  Course(
    name: 'Diploma in Autotronics Engineering Technology',
    description:
        'Explore automotive electronics and advanced vehicle systems, preparing for careers in modern automotive technology and electric vehicles.',
    imageUrl:
        'https://www.gmi.edu.my/wp-content/uploads/2024/07/AHS-STUDENT-8-2048x1367.jpg',
    websiteUrl:
        'https://www.gmi.edu.my/electrical-engineering/autotronics-engineering-technology/',
    category: ProgramCategory.diploma,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Sejarah': 'C'},
      {'Matematik': 'C'},
    ],
  ),

  // MED
  Course(
    name: 'Diploma in Precision Tooling Engineering Technology',
    description:
        'Learn advanced manufacturing techniques and precision tool design, essential for modern industrial production and manufacturing excellence.',
    imageUrl:
        'https://www.gmi.edu.my/wp-content/uploads/2024/07/CONVENTIONAL-MILLING-13-2048x1365.jpg',
    websiteUrl:
        'https://www.gmi.edu.my/mechanical-engineering/precision-tooling/',
    category: ProgramCategory.diploma,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Sejarah': 'C'},
      {'Matematik': 'C'},
    ],
  ),
  Course(
    name: 'Diploma in Industrial Design',
    description:
        'Blend creativity with technical skills to design innovative industrial products, focusing on functionality, aesthetics, and user experience.',
    imageUrl:
        'https://www.gmi.edu.my/wp-content/uploads/2024/07/IDE-25-2048x1367.jpg',
    websiteUrl:
        'https://www.gmi.edu.my/mechanical-engineering/industrial-design-2/',
    category: ProgramCategory.diploma,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Sejarah': 'C'},
      {'Matematik': 'C'},
    ],
  ),
  Course(
    name: 'Diploma in Industrial Quality Engineering',
    description:
        'Master quality control processes and industrial standards, ensuring manufacturing excellence through precise measurement and testing techniques.',
    imageUrl:
        'https://www.gmi.edu.my/wp-content/uploads/2024/08/CMM-1-2048x1367.jpg',
    websiteUrl:
        'https://www.gmi.edu.my/mechanical-engineering/industrial-quality-engineering/',
    category: ProgramCategory.diploma,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Sejarah': 'C'},
      {'Matematik': 'C'},
    ],
  ),
  Course(
    name: 'Diploma in Innovative Product Design',
    description:
        'Develop creative solutions through product design, combining artistic vision with engineering principles to create cutting-edge consumer products.',
    imageUrl:
        'https://www.gmi.edu.my/wp-content/uploads/2024/07/TDT-5-2048x1367.jpg',
    websiteUrl:
        'https://www.gmi.edu.my/mechanical-engineering/innovative-product-design/',
    category: ProgramCategory.diploma,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Sejarah': 'C'},
      {'Matematik': 'C'},
    ],
  ),
  Course(
    name: 'Diploma in CNC Precision Technology',
    description:
        'Specialize in computer numerical control machining, learning advanced manufacturing techniques for precise component production.',
    imageUrl:
        'https://www.gmi.edu.my/wp-content/uploads/2024/07/DMG-CNC-STUDENT-2-2048x1367.jpg',
    websiteUrl:
        'https://www.gmi.edu.my/mechanical-engineering/cnc-precision-technology/',
    category: ProgramCategory.diploma,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Sejarah': 'C'},
      {'Matematik': 'C'},
    ],
  ),
  Course(
    name: 'Diploma in Machine Tools Maintenance',
    description:
        'Learn to maintain and troubleshoot industrial machinery, ensuring optimal performance and longevity of manufacturing equipment.',
    imageUrl:
        'https://www.gmi.edu.my/wp-content/uploads/2020/05/MTM07_GMI.jpeg',
    websiteUrl:
        'https://www.gmi.edu.my/mechanical-engineering/machine-tools-maintenance/',
    category: ProgramCategory.diploma,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Sejarah': 'C'},
      {'Matematik': 'C'},
    ],
  ),
  Course(
    name: 'Diploma in Manufacturing System',
    description:
        'Study integrated manufacturing systems, automation, and production optimization techniques for modern industrial environments.',
    imageUrl:
        'https://www.gmi.edu.my/wp-content/uploads/2024/07/Flexible-Manufacturing-System-4-2048x1367.jpg',
    websiteUrl:
        'https://www.gmi.edu.my/mechanical-engineering/manufacturing-system/',
    category: ProgramCategory.diploma,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Sejarah': 'C'},
      {'Matematik': 'C'},
    ],
  ),
  // CID
  Course(
    name: 'Diploma in Software Engineering',
    description:
        'Develop expertise in software development, programming, and system design, preparing for careers in the growing tech industry.',
    imageUrl:
        'https://www.gmi.edu.my/wp-content/uploads/2024/08/SET-15-2048x1365.jpg',
    websiteUrl:
        'https://www.gmi.edu.my/computer-and-information/software-engineering/',
    category: ProgramCategory.diploma,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Sejarah': 'C'},
      {'Matematik': 'C'},
    ],
  ),
  Course(
    name: 'Diploma in Cyber Security Technology',
    description:
        'Master the art of digital security, learning to protect systems and networks from cyber threats in an increasingly connected world.',
    imageUrl:
        'https://www.gmi.edu.my/wp-content/uploads/2024/08/CYBER-BATTLEFIELD-9-2048x1367.jpg',
    websiteUrl:
        'https://www.gmi.edu.my/computer-and-information/cyber-security-technology/',
    category: ProgramCategory.diploma,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Sejarah': 'C'},
      {'Matematik': 'C'},
    ],
  ),
  Course(
    name: 'Diploma in Creative Multimedia',
    description:
        'Explore digital media creation, combining artistic creativity with technical skills in animation, graphics, and interactive media design.',
    imageUrl: 'https://www.gmi.edu.my/wp-content/uploads/2024/08/CRM-6.jpg',
    websiteUrl:
        'https://www.gmi.edu.my/computer-and-information/creative-multimedia/',
    category: ProgramCategory.diploma,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Sejarah': 'C'},
    ],
  ),

// GAPP
  Course(
    name: 'German A Levels Preparatory Programme (GAPP) (Sponsored)',
    description:
        'Germany land of many opportunities, renowned for its technological achievements and the German higher education is one of the best in the world! A German university degree is highly respected by employers around the world and those from the Universities of Applied Science are very practice-oriented.',
    imageUrl: 'https://www.gmi.edu.my/wp-content/uploads/2020/01/GMI_8255.jpg',
    websiteUrl:
        'https://www.gmi.edu.my/pre-university-programme/german-a-level-preparatory-programme-gapp/',
    category: ProgramCategory.gapp,
    requirements: [
      {'Bahasa Inggeris': 'A'},
      {'Matematik': 'A'},
      {'Matematik Tambahan': 'A'},
      {'Fizik': 'A'},
      {'Kimia': 'A'},
    ],
  ),
  Course(
    name: 'German A Levels Preparatory Programme (GAPP) (Private)',
    description:
        'Germany land of many opportunities, renowned for its technological achievements and the German higher education is one of the best in the world! A German university degree is highly respected by employers around the world and those from the Universities of Applied Science are very practice-oriented.',
    imageUrl: 'https://www.gmi.edu.my/wp-content/uploads/2020/01/GMI_8255.jpg',
    websiteUrl:
        'https://www.gmi.edu.my/pre-university-programme/german-a-level-preparatory-programme-gapp/',
    category: ProgramCategory.gapp,
    requirements: [
      {'Bahasa Inggeris': 'C'},
      {'Matematik': 'C'},
      {'Matematik Tambahan': 'C'},
      {'Fizik': 'C'},
      {'Kimia': 'C'},
    ],
  ),

  Course(
    name:
        'Foundation Programme In Collaboration With Universiti Teknologi PETRONAS (GUFP)',
    description:
        'GMI-UTP Foundation Programme (GUFP) is strategic partnership between GMI (German Malaysian Institute) and UTP (Universiti Teknologi PETRONAS). This programme is a one year foundation programme based on UTP foundation syllabus. Upon completion, students will be qualified to start their Undergraduate Programme at UTP.',
    imageUrl: 'https://www.gmi.edu.my/wp-content/uploads/2020/10/7.jpg',
    websiteUrl: 'https://www.gmi.edu.my/gmi-utp-foundation-studies-programme/',
    category: ProgramCategory.gufp,
    requirements: [
      {'Bahasa Melayu': 'C'},
      {'Matematik': 'C'},
      {'Bahasa Inggeris': 'C'},
      {'Matematik Tambahan': 'C'},
      {'Fizik': 'C'},
      {'Kimia': 'C'},
    ],
  ),
];
