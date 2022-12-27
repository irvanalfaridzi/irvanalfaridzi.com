part of 'models.dart';

ApiResult apiResultFromJson(String str) => ApiResult.fromJson(json.decode(str));

String apiResultToJson(ApiResult data) => json.encode(data.toJson());

class ApiResult {
  ApiResult({
    required this.object,
    required this.results,
    required this.nextCursor,
    required this.hasMore,
    required this.type,
    required this.page,
  });

  final String object;
  final List<Result> results;
  final dynamic nextCursor;
  final bool hasMore;
  final String type;
  final Page page;

  factory ApiResult.fromJson(Map<String, dynamic> json) => ApiResult(
        object: json["object"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextCursor: json["next_cursor"],
        hasMore: json["has_more"],
        type: json["type"],
        page: Page.fromJson(json["page"]),
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "next_cursor": nextCursor,
        "has_more": hasMore,
        "type": type,
        "page": page.toJson(),
      };
}

class Page {
  Page();

  factory Page.fromJson(Map<String, dynamic> json) => Page();

  Map<String, dynamic> toJson() => {};
}

class Result {
  Result({
    required this.object,
    required this.id,
    required this.createdTime,
    required this.lastEditedTime,
    required this.createdBy,
    required this.lastEditedBy,
    required this.cover,
    required this.icon,
    required this.parent,
    required this.archived,
    required this.properties,
    required this.url,
  });

  final String object;
  final String id;
  final DateTime createdTime;
  final DateTime lastEditedTime;
  final TedBy createdBy;
  final TedBy lastEditedBy;
  final dynamic cover;
  final dynamic icon;
  final Parent parent;
  final bool archived;
  final Properties properties;
  final String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        object: json["object"],
        id: json["id"],
        createdTime: DateTime.parse(json["created_time"]),
        lastEditedTime: DateTime.parse(json["last_edited_time"]),
        createdBy: TedBy.fromJson(json["created_by"]),
        lastEditedBy: TedBy.fromJson(json["last_edited_by"]),
        cover: json["cover"],
        icon: json["icon"],
        parent: Parent.fromJson(json["parent"]),
        archived: json["archived"],
        properties: Properties.fromJson(json["properties"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "id": id,
        "created_time": createdTime.toIso8601String(),
        "last_edited_time": lastEditedTime.toIso8601String(),
        "created_by": createdBy.toJson(),
        "last_edited_by": lastEditedBy.toJson(),
        "cover": cover,
        "icon": icon,
        "parent": parent.toJson(),
        "archived": archived,
        "properties": properties.toJson(),
        "url": url,
      };
}

class TedBy {
  TedBy({
    required this.object,
    required this.id,
  });

  final String object;
  final String id;

  factory TedBy.fromJson(Map<String, dynamic> json) => TedBy(
        object: json["object"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "id": id,
      };
}

class Parent {
  Parent({
    required this.type,
    required this.databaseId,
  });

  final String type;
  final String databaseId;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        type: json["type"],
        databaseId: json["database_id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "database_id": databaseId,
      };
}

class Properties {
  Properties({
    required this.joinDate,
    required this.role,
    required this.companyName,
    required this.description,
  });

  final JoinDate joinDate;
  final RoleApiResult role;
  final CompanyName companyName;
  final RoleApiResult description;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        joinDate: JoinDate.fromJson(json["Join Date"]),
        role: RoleApiResult.fromJson(json["Role"]),
        companyName: CompanyName.fromJson(json["Company Name"]),
        description: RoleApiResult.fromJson(json["Description"]),
      );

  Map<String, dynamic> toJson() => {
        "Join Date": joinDate.toJson(),
        "Role": role.toJson(),
        "Company Name": companyName.toJson(),
        "Description": description.toJson(),
      };

  String get getCompanyName => companyName.title[0].text.content;
  String get getRole => role.richText[0].text.content;
  String get getStartDate => DateFormat("MMM yyyy").format(joinDate.date.start);
  String get getEndDate => joinDate.date.end == null
      ? "Now"
      : DateFormat("MMM yyyy").format(joinDate.date.end!);
  String get getDescription => description.richText[0].text.content;
}

class CompanyName {
  CompanyName({
    required this.id,
    required this.type,
    required this.title,
  });

  final String id;
  final String type;
  final List<Title> title;

  factory CompanyName.fromJson(Map<String, dynamic> json) => CompanyName(
        id: json["id"],
        type: json["type"],
        title: List<Title>.from(json["title"].map((x) => Title.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "title": List<dynamic>.from(title.map((x) => x.toJson())),
      };
}

class Title {
  Title({
    required this.type,
    required this.text,
    required this.annotations,
    required this.plainText,
    required this.href,
  });

  final String type;
  final TextApiResult text;
  final Annotations annotations;
  final String plainText;
  final dynamic href;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        type: json["type"],
        text: TextApiResult.fromJson(json["text"]),
        annotations: Annotations.fromJson(json["annotations"]),
        plainText: json["plain_text"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "text": text.toJson(),
        "annotations": annotations.toJson(),
        "plain_text": plainText,
        "href": href,
      };
}

class Annotations {
  Annotations({
    required this.bold,
    required this.italic,
    required this.strikethrough,
    required this.underline,
    required this.code,
    required this.color,
  });

  final bool bold;
  final bool italic;
  final bool strikethrough;
  final bool underline;
  final bool code;
  final String color;

  factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
        bold: json["bold"],
        italic: json["italic"],
        strikethrough: json["strikethrough"],
        underline: json["underline"],
        code: json["code"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "bold": bold,
        "italic": italic,
        "strikethrough": strikethrough,
        "underline": underline,
        "code": code,
        "color": color,
      };
}

class TextApiResult {
  TextApiResult({
    required this.content,
    required this.link,
  });

  final String content;
  final dynamic link;

  factory TextApiResult.fromJson(Map<String, dynamic> json) => TextApiResult(
        content: json["content"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "link": link,
      };
}

class JoinDate {
  JoinDate({
    required this.id,
    required this.type,
    required this.date,
  });

  final String id;
  final String type;
  final DateApiResult date;

  factory JoinDate.fromJson(Map<String, dynamic> json) => JoinDate(
        id: json["id"],
        type: json["type"],
        date: DateApiResult.fromJson(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "date": date.toJson(),
      };
}

class DateApiResult {
  DateApiResult({
    required this.start,
    required this.end,
    required this.timeZone,
  });

  final DateTime start;
  final DateTime? end;
  final dynamic timeZone;

  factory DateApiResult.fromJson(Map<String, dynamic> json) => DateApiResult(
        start: DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        timeZone: json["time_zone"],
      );

  Map<String, dynamic> toJson() => {
        "start":
            "${start.year.toString().padLeft(4, '0')}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}",
        "end": end == null
            ? null
            : "${end?.year.toString().padLeft(4, '0')}-${end?.month.toString().padLeft(2, '0')}-${end?.day.toString().padLeft(2, '0')}",
        "time_zone": timeZone,
      };
}

class RoleApiResult {
  RoleApiResult({
    required this.id,
    required this.type,
    required this.richText,
  });

  final String id;
  final String type;
  final List<Title> richText;

  factory RoleApiResult.fromJson(Map<String, dynamic> json) => RoleApiResult(
        id: json["id"],
        type: json["type"],
        richText:
            List<Title>.from(json["rich_text"].map((x) => Title.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "rich_text": List<dynamic>.from(richText.map((x) => x.toJson())),
      };
}
