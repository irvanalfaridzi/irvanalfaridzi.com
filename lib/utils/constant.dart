import 'package:alfaridzi_me/utils/environment.dart';
import 'package:flutter/material.dart';

class Constant {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static String appName = 'Irvan Alfaridzi';
  static const bool showLog = true;

  static const String get = 'GET';
  static const String post = 'POST';

  // RESPONSE CODE
  static const String rSUCCESS = '200';
  static const String rTIMEOUT = '404';
  static const String rREFUSED = 'Connection refused';
  static const String rFAILED = 'Connection failed';
  static const String rSOCKETEXC = 'SocketException';
  static const String rEXCEPT = 'Exception:';
  static const String errSERVER = '500';

  //route definition
  static String _databaseRoute(String path) => "databases/$path/query";

  // PATH ENDPOINT
  static String get listExperience => _databaseRoute(Environment.experienceKey);
  static String get listTechTools => _databaseRoute(Environment.techToolsKey);

  // helper
  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  // URL
  static Uri urlTSP = Uri(scheme: 'https', host: 'thesoftwarepractice.com');
  static Uri urlGithub({String projectName = ""}) => Uri(
      scheme: 'https', host: 'github.com', path: 'irvanalfaridzi/$projectName');
  static Uri urlTwitter =
      Uri(scheme: 'https', host: 'twitter.com', path: 'IrvanAlfaridzi');
  static Uri urlGmail = Uri(
    scheme: 'mailto',
    path: 'irvanalfaridzi@gmail.com',
    // query: encodeQueryParameters(
    //   <String, String>{'subject': 'Nice to e-meet you, Irvan!'},
    // ),
  );
  static Uri urlTelegram =
      Uri(scheme: 'https', host: 't.me', path: 'irvanalfaridzi');
  static Uri urlLinkedin = Uri(
      scheme: 'https', host: 'www.linkedin.com', path: 'in/irvan-alfaridzi/');
  static Uri urlInstagram =
      Uri(scheme: 'https', host: 'www.instagram.com', path: 'irvanalfaridzi/');

  // image assets
  static const images = "assets/images";
  static const projectImages = "$images/project/";
  static const techImages = "$images/tech-tools/";
  static const experienceImages = "$images/experience/";
  static const alfaridziImage = "$images/alfaridzi.jpeg";
  static const mockBaseProjectImage =
      "${projectImages}mock-base-project-flutter.png";
  static const mockEscImage = "${projectImages}mock-esc.png";
  static const mockKulkaskuImage = "${projectImages}mock-kulkasku.png";
  static const mockMyDashboardImage = "${projectImages}mock-my-dashboard.png";
  static const mockShopcutImage = "${projectImages}mock-shopcut.png";
  static const csharpImage = "${techImages}c-sharp.png";
  static const css3Image = "${techImages}css-3.png";
  static const dartImage = "${techImages}dart.png";
  static const figmaImage = "${techImages}figma.png";
  static const flutterImage = "${techImages}flutter.png";
  static const gitImage = "${techImages}git.png";
  static const html5Image = "${techImages}html-5.png";
  static const javaImage = "${techImages}java.png";
  static const jsImage = "${techImages}js.png";
  static const kotlinImage = "${techImages}kotlin.png";
  static const laravelImage = "${techImages}laravel.png";
  static const objcImage = "${techImages}objc.png";
  static const photoshopImage = "${techImages}photoshop.png";
  static const phpImage = "${techImages}php.png";
  static const unityImage = "${techImages}unity.png";
  static const vscodeImage = "${techImages}vscode.png";
  static const xcodeImage = "${techImages}xcode.png";
  static const tspImage = "${experienceImages}tsp-image.png";
  static const primavisiImage = "${experienceImages}primavisi-image.png";
  static const dsiImage = "${experienceImages}dsi-image.png";
  static const mamalyfeImage = "${experienceImages}mamalyfe-image.jpeg";
}
