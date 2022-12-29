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
  final PageApi page;

  factory ApiResult.fromJson(Map<String, dynamic> json) => ApiResult(
        object: json["object"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextCursor: json["next_cursor"],
        hasMore: json["has_more"],
        type: json["type"],
        page: PageApi.fromJson(json["page"]),
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

class PageApi {
  PageApi();

  factory PageApi.fromJson(Map<String, dynamic> json) => PageApi();

  Map<String, dynamic> toJson() => {};
}

class Result {
  Result({
    required this.object,
    required this.id,
    required this.createdTime,
    required this.lastEditedTime,
    required this.cover,
    required this.icon,
    required this.archived,
    required this.resultData,
    required this.url,
  });

  final String object;
  final String id;
  final DateTime createdTime;
  final DateTime lastEditedTime;
  final dynamic cover;
  final dynamic icon;
  final bool archived;
  final Map<String, dynamic> resultData;
  final String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        object: json["object"],
        id: json["id"],
        createdTime: DateTime.parse(json["created_time"]),
        lastEditedTime: DateTime.parse(json["last_edited_time"]),
        cover: json["cover"],
        icon: json["icon"],
        archived: json["archived"],
        resultData: json["properties"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "id": id,
        "created_time": createdTime.toIso8601String(),
        "last_edited_time": lastEditedTime.toIso8601String(),
        "cover": cover,
        "icon": icon,
        "archived": archived,
        "properties": resultData,
        "url": url,
      };
}

class TitleDataApi {
  TitleDataApi({
    required this.id,
    required this.type,
    required this.title,
  });

  final String id;
  final String type;
  final List<TitleApi> title;

  factory TitleDataApi.fromJson(Map<String, dynamic> json) => TitleDataApi(
        id: json["id"],
        type: json["type"],
        title:
            List<TitleApi>.from(json["title"].map((x) => TitleApi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "title": List<dynamic>.from(title.map((x) => x.toJson())),
      };

  String get value => title[0].text.content;
}

class TitleApi {
  TitleApi({
    required this.type,
    required this.text,
    required this.plainText,
    required this.href,
  });

  final String type;
  final TextApi text;
  final String plainText;
  final dynamic href;

  factory TitleApi.fromJson(Map<String, dynamic> json) => TitleApi(
        type: json["type"],
        text: TextApi.fromJson(json["text"]),
        plainText: json["plain_text"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "text": text.toJson(),
        "plain_text": plainText,
        "href": href,
      };
}

class TextApi {
  TextApi({
    required this.content,
    required this.link,
  });

  final String content;
  final dynamic link;

  factory TextApi.fromJson(Map<String, dynamic> json) => TextApi(
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
  final DateApi date;

  factory JoinDate.fromJson(Map<String, dynamic> json) => JoinDate(
        id: json["id"],
        type: json["type"],
        date: DateApi.fromJson(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "date": date.toJson(),
      };

  String get getStartDate => DateFormat("MMM yyyy").format(date.start);
  String get getEndDate =>
      date.end == null ? "Now" : DateFormat("MMM yyyy").format(date.end!);
  String get getJoinDate => "$getStartDate - $getEndDate";
}

class DateApi {
  DateApi({
    required this.start,
    required this.end,
    required this.timeZone,
  });

  final DateTime start;
  final DateTime? end;
  final dynamic timeZone;

  factory DateApi.fromJson(Map<String, dynamic> json) => DateApi(
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

class RichTextApi {
  RichTextApi({
    required this.id,
    required this.type,
    required this.richText,
  });

  final String id;
  final String type;
  final List<TitleApi> richText;

  factory RichTextApi.fromJson(Map<String, dynamic> json) => RichTextApi(
        id: json["id"],
        type: json["type"],
        richText: List<TitleApi>.from(
            json["rich_text"].map((x) => TitleApi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "rich_text": List<dynamic>.from(richText.map((x) => x.toJson())),
      };

  String get value => richText[0].text.content;
  List<String> get valueToList => richText[0].text.content.split(", ");
  List<String> get valueToListDotPattern =>
      richText[0].text.content.split(". ");
}

class UrlWebsiteApi {
  UrlWebsiteApi({
    required this.id,
    required this.type,
    required this.url,
  });

  final String id;
  final String type;
  final String url;

  factory UrlWebsiteApi.fromJson(Map<String, dynamic> json) => UrlWebsiteApi(
        id: json["id"],
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "url": url,
      };
}
