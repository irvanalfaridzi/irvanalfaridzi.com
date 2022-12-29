part of 'models.dart';

class Experience {
  final int id;
  final String companyName;
  final String role;
  final DateTime startDate;
  final String joinDate;
  final String description;
  final String urlWebsite;
  final List<String> hashtag;
  final List<FileElementApi> image;
  final String detail;
  final String technologies;
  final List<String> responsibility;
  final Color bgImageColor;

  Experience({
    this.id = 0,
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
        id: no,
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
        image: ImageApi.fromJson(json["Image"]).files,
      );
}
