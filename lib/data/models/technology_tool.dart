part of 'models.dart';

class TechnologyTool {
  final String urlTech;
  final String imageAsset;
  final EdgeInsets padding;

  TechnologyTool({
    required this.urlTech,
    required this.imageAsset,
    this.padding = const EdgeInsets.all(4.0),
  });
}

List<TechnologyTool> listTechTools = [
  TechnologyTool(
    urlTech: "https://dart.dev",
    imageAsset: "${Constant.techImages}dart.png",
  ),
  TechnologyTool(
    urlTech: "https://flutter.dev",
    imageAsset: "${Constant.techImages}flutter.png",
    padding: const EdgeInsets.all(8.0),
  ),
  TechnologyTool(
    urlTech: "https://firebase.google.com/",
    imageAsset: "${Constant.techImages}firebase.png",
    padding: const EdgeInsets.all(0),
  ),
  TechnologyTool(
    urlTech: "https://vuejs.org/",
    imageAsset: "${Constant.techImages}vue.png",
    padding: const EdgeInsets.all(8.0),
  ),
  TechnologyTool(
    urlTech:
        "https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html",
    imageAsset: "${Constant.techImages}objc.png",
  ),
  TechnologyTool(
    urlTech: "https://learn.microsoft.com/en-us/dotnet/csharp/",
    imageAsset: "${Constant.techImages}c-sharp.png",
  ),
  // TechnologyTool(
  //   urlTech: "https://developer.android.com/kotlin",
  //   imageAsset: "${Constant.techImages}kotlin.png",
  //   padding: const EdgeInsets.only(left: 8.0, right: 4),
  // ),
  // TechnologyTool(
  //   urlTech: "https://dev.java/",
  //   imageAsset: "${Constant.techImages}java.png",
  //   padding: const EdgeInsets.all(8.0),
  // ),
  TechnologyTool(
    urlTech: "https://code.visualstudio.com/",
    imageAsset: "${Constant.techImages}vscode.png",
  ),
  TechnologyTool(
    urlTech: "https://developer.apple.com/xcode/",
    imageAsset: "${Constant.techImages}xcode.png",
    padding: const EdgeInsets.all(0),
  ),
  TechnologyTool(
    urlTech: "https://unity.com/",
    imageAsset: "${Constant.techImages}unity.png",
  ),
  TechnologyTool(
    urlTech: "https://git-scm.com/",
    imageAsset: "${Constant.techImages}git.png",
  ),
  TechnologyTool(
    urlTech: "https://www.figma.com/",
    imageAsset: "${Constant.techImages}figma.png",
    padding: const EdgeInsets.all(10.0),
  ),
  TechnologyTool(
    urlTech: "https://www.adobe.com/id_en/products/photoshop/landpa.html",
    imageAsset: "${Constant.techImages}photoshop.png",
  ),
];
