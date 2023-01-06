import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Environment {
  static const String trueText = "true";
  static bool isTrue(String value) => value == trueText ? true : false;

  static String get apiUrl => dotenv.env['API_URL'] ?? 'null';
  static String get apiKey => dotenv.env['API_KEY'] ?? 'null';
  static String get notionVersion => dotenv.env['NOTION_VERSION'] ?? 'null';
  static String get techToolsKey => dotenv.env['TECHTOOLS_KEY'] ?? 'null';
  static String get experienceKey => dotenv.env['EXPERIENCE_KEY'] ?? 'null';
  static bool get showLog => isTrue(dotenv.env['SHOW_LOG'] ?? 'false');
}
