part of 'models.dart';

class Project {
  final int id;
  final String projectName;
  final String description;
  final List<String> technologies;
  final List<String> images;
  final BoxFit boxFit;
  final DateTime date;
  final String urlProject;

  Project({
    required this.id,
    required this.projectName,
    required this.description,
    required this.technologies,
    required this.images,
    this.boxFit = BoxFit.contain,
    required this.date,
    this.urlProject = "",
  });
}

List<Project> listProject = [
  Project(
    id: 6,
    projectName: "Travel App",
    description:
        "A Travel App developed with Flutter 💙 version 3. Focusing on UI designed by @nashirjamali, a Travel App implemented Theme features with dark and light themes.",
    technologies: [
      "Dart",
      "Flutter",
      "Android",
      "iOS",
      "Dark Theme",
      "Light Theme",
    ],
    images: ["${Constant.projectImages}mock-travel-app.png"],
    boxFit: BoxFit.cover,
    date: DateTime(2023, 8),
    urlProject: "https://github.com/irvanalfaridzi/travel-app",
  ),
  Project(
    id: 5,
    projectName: "Shopcut",
    description:
        "This app created with Flutter 💙 version 2.5.2 with UI by @ilhhasap called shopcut",
    technologies: ["Dart", "Flutter", "Desktop", "Tablet", "Android", "iOS"],
    images: ["${Constant.projectImages}mock-shopcut.png"],
    boxFit: BoxFit.cover,
    date: DateTime(2022, 11),
    urlProject: "https://github.com/irvanalfaridzi/shopcut",
  ),
  Project(
    id: 4,
    projectName: "My Dashboard",
    description:
        "This app is a dashboard template with a responsive design for Desktop, Tablet, and Mobile resolution. Made with Flutter 💙 3.0.5",
    technologies: ["Dart", "Flutter", "Desktop", "Tablet", "Android", "iOS"],
    images: ["${Constant.projectImages}mock-my-dashboard.png"],
    boxFit: BoxFit.cover,
    date: DateTime(2022, 10),
    urlProject: "https://github.com/irvanalfaridzi/my_dashboard",
  ),
  Project(
      id: 3,
      projectName: "Base Project Flutter",
      description:
          "This app created for anyone who need some base project flutter with good architecture that easy for maintaining",
      technologies: ["Dart", "Flutter", "Android", "iOS"],
      images: ["${Constant.projectImages}mock-base-project-flutter.png"],
      boxFit: BoxFit.cover,
      date: DateTime(2022, 4),
      urlProject: "https://github.com/irvanalfaridzi/base-project-flutter"),
  Project(
    id: 2,
    projectName: "Kulkasku",
    description:
        "Application for recording products that will be put in the refrigerator with an expiration reminder feature via notification. The user enters product name, product type, and expiration date. This app develops using flutter",
    technologies: ["Dart", "Flutter", "Android", "Notification"],
    images: ["${Constant.projectImages}mock-kulkasku.png"],
    boxFit: BoxFit.cover,
    date: DateTime(2021, 2),
  ),
  Project(
    id: 1,
    projectName: "Essential Code",
    description:
        "T-shirt buying app using flutter. This application can display a list of t-shirts and the user can add it to the basket and can see the total cost to be paid. Users can choose the size of the shirt and the number of shirts purchased",
    technologies: ["Dart", "Flutter", "Android", "iOS", "Website"],
    images: ["${Constant.projectImages}mock-esc.png"],
    date: DateTime(2021, 7),
  ),
];
