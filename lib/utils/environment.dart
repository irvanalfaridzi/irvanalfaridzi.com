import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Environment {
  static const String trueText = "true";
  static bool isTrue(String value) => value == trueText ? true : false;

  // TODO: Do an investigation on why .env can't be accessed in production deployment live
  // Failed to load resource: the server responded with a status of 404 ()

  static String get apiUrl =>
      "https://api.notion.com/v1/"; //dotenv.env['API_URL'] ?? 'null';
  static String get apiKey =>
      "secret_khejJceAPQgo3QfvtMvS97YPQVHovBo0UOhFxZFk3BZ"; //dotenv.env['API_KEY'] ?? 'null';
  static String get notionVersion =>
      "2022-02-22"; //dotenv.env['NOTION_VERSION'] ?? 'null';
  static String get techToolsKey =>
      "3dbb41e448cc468ca7462e4e9a4bbf53"; //dotenv.env['TECHTOOLS_KEY'] ?? 'null';
  static String get experienceKey =>
      "f9e16463bba442569a728613cb9fc1fb"; //dotenv.env['EXPERIENCE_KEY'] ?? 'null';
  static bool get showLog => false; //isTrue(dotenv.env['SHOW_LOG'] ?? 'false');

}
