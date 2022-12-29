part of 'models.dart';

class Experience {
  final int no;
  final String companyName;
  final String role;
  final DateTime startDate;
  final String joinDate;
  final String description;
  final String urlWebsite;
  final List<String> hashtag;
  final List<String> image;
  final String detail;
  final String technologies;
  final List<String> responsibility;
  final Color bgImageColor;

  Experience({
    this.no = 0,
    this.companyName = "",
    this.role = "",
    required this.startDate,
    this.joinDate = "",
    this.description = "",
    this.urlWebsite = "",
    this.hashtag = const [],
    this.image = const [],
    this.detail = "",
    this.technologies = "",
    this.responsibility = const [],
    this.bgImageColor = Colors.white,
  });

  factory Experience.fromJson(Map<String, dynamic> json, int no) => Experience(
        no: no,
        companyName: TitleDataApi.fromJson(json["Company Name"]).value,
        role: RichTextApi.fromJson(json["Role"]).value,
        startDate: JoinDate.fromJson(json["Join Date"]).date.start,
        joinDate: JoinDate.fromJson(json["Join Date"]).getJoinDate,
        description: RichTextApi.fromJson(json["Description"]).value,
        urlWebsite: UrlWebsiteApi.fromJson(json["URL Website"]).url,
        hashtag: RichTextApi.fromJson(json["Hashtag"]).valueToList,
        detail: RichTextApi.fromJson(json["Detail"]).value,
        technologies: RichTextApi.fromJson(json["Technologies"]).value,
        responsibility:
            RichTextApi.fromJson(json["Responsibility"]).valueToListDotPattern,
      );
}

// dummy data of experience
// List<Experience> experienceList = [
//   Experience(
//     no: 3,
//     companyName: 'The Software Practice Singapore',
//     joinDate: 'Mar 2022 - Now',
//     description:
//         'Software Development Engineer that focuses on working as a Mobile Developer with Flutter.',
//     urlWebsite: 'https://thesoftwarepractice.com/',
//     hashtag: [
//       'Flutter',
//       'Mobile Developer',
//       'Dart',
//       'Software Development Engineer',
//     ],
//     image: [
//       Constant.tspImage,
//     ],
//     detail:
//         'I work remotely as a Software Development Engineer focusing on Mobile Applications with Flutter at The Software Practice (TSP) located in Singapore. TSP is a technology development firm that builds software for clients and its own business.',
//     technologies: 'Dart, Flutter, Firebase, Android, iOS',
//     responsibility: [
//       'Developing App with Flutter.',
//       'Using State Management like Provider.',
//       'Secure the local storage data encrypted using Flutter Package.',
//       'Implement the security check such as jailbroken or root, hook, and tamper detection.',
//     ],
//   ),
//   Experience(
//     no: 2,
//     companyName: 'PT Prima Visi Globalindo',
//     joinDate: 'Aug 2021 - Mar 2022',
//     description:
//         'Developing and maintaining a Mobile Banking Application (Android/iOS) using Flutter.',
//     urlWebsite: 'https://www.dwidasa.com/home',
//     hashtag: ['Mobile Developer', 'Bank', 'Flutter', 'Mobile Banking'],
//     image: [
//       Constant.primavisiImage,
//       Constant.dsiImage,
//     ],
//     detail:
//         'Developing and maintaining a Mobile Banking Application (Android/iOS) using Flutter such as Bank INA, Bank MAS, Bank Sampoerna, and Bank Artha Graha Internasional.',
//     technologies: 'Dart, Flutter, Obj-c, Kotlin, Android, iOS, Swift, Firebase',
//     responsibility: [
//       'Developing Mobile Banking from zero or revamping the existing app into new Mobile Banking with Flutter.',
//       'Maintaining Existing Mobile Banking such as fixing bugs, adding new features, and improving some features with Flutter, Obj-c, and Kotlin.',
//       'Consuming third party/library like face recognize for registration bank account (Online Onboarding) from native (Obj-c/Java) to Flutter.',
//     ],
//   ),
//   Experience(
//     no: 1,
//     companyName: 'Programmer',
//     joinDate: 'Mar 2021 - Jul 2021',
//     description:
//         'My first experience as Mobile Developer and also working in Startup Company.',
//     urlWebsite: 'https://mamalyfe.id/',
//     hashtag: ['Mobile Developer', 'Flutter', 'Parenting Consultation'],
//     image: [
//       Constant.mamalyfeImage,
//     ],
//     detail: 'Developing Mamalyfe Mobile app using Flutter.',
//     technologies: 'Dart, Flutter, Go',
//     responsibility: [
//       'Developing features like spinning the wheel for a present to the user, some catalogs, and a leaderboard.',
//       'Learning Go for the first time to help manage the Backend.',
//     ],
//     bgImageColor: const Color(0xFFF55E7E),
//   )
// ];
