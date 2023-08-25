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
    id: 10,
    projectName: "Todo App",
    description:
        "Todo App was developed with VueJs version 2 and uses local storage to store the data.",
    technologies: [
      "Vue",
      "VueJS",
      "Web",
      "Todo App",
    ],
    images: ["${Constant.projectImages}mock-todo-app.png"],
    boxFit: BoxFit.cover,
    date: DateTime(2023, 7),
    urlProject: "https://github.com/irvanalfaridzi/todo-app-vue2",
  ),
  Project(
    id: 9,
    projectName: "Calculator Vue",
    description:
        "First project developed with VueJS version 2. The goals is to learn how to use methods and v-model.",
    technologies: [
      "Vue",
      "VueJS",
      "Web",
      "Calculator",
    ],
    images: ["${Constant.projectImages}mock-calculator-vue.png"],
    boxFit: BoxFit.cover,
    date: DateTime(2023, 5),
    urlProject: "https://github.com/irvanalfaridzi/calculator-vue2",
  ),
  Project(
    id: 8,
    projectName: "Wedding Invitation",
    description:
        "A Wedding App developed with Flutter 💙 version 3 and hosted on Vercel. A countdown feature, gallery image, and RSVP feature are stored on a Firestore Database Firebase. Go check the live demo on irvan-safrida.vercel.app or click \"View Project\".",
    technologies: [
      "Dart",
      "Flutter",
      "Vercel",
      "Firebase",
      "Wedding",
      "Invitation",
    ],
    images: ["${Constant.projectImages}mock-wedding-app.png"],
    boxFit: BoxFit.cover,
    date: DateTime(2023, 5),
    urlProject: "https://irvan-safrida.vercel.app",
  ),
  Project(
    id: 7,
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
    id: 6,
    projectName: "Food App",
    description:
        "Food App is Online Food Delivery App developed with Flutter. Created with Flutter 💙 version 3 with a good design source. We are open and welcome any contribution to this project. Go view the project and let's contribute!",
    technologies: [
      "Dart",
      "Flutter",
      "Android",
      "iOS",
      "Collaboration",
    ],
    images: ["${Constant.projectImages}mock-food-app.png"],
    boxFit: BoxFit.cover,
    date: DateTime(2022, 12),
    urlProject: "https://github.com/stikom-valley/food-app",
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
