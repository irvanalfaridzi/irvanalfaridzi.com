import 'package:alfaridzi_me/utils/constant.dart';
import 'package:alfaridzi_me/utils/environment.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Config extends InheritedWidget {
  const Config({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static String currentUrl = Environment.apiUrl;
  static String apiKey = Environment.apiKey;
  static String notionVersion = Environment.notionVersion;

  static int connectTimeout = 90000;
  static int receiveTimeout = 90000;

  static void log(String message) {
    if (kDebugMode) {
      if (Constant.showLog) debugPrint(Constant.appName + (" : ") + message);
    }
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
