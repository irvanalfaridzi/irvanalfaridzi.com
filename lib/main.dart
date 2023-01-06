import 'package:alfaridzi_me/responsive/base_page.dart';
import 'package:alfaridzi_me/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    // You can use the code below if you deploy the web and uncomment line 11
    // We must remove the leading . on env file for being able to use the env in the web deployment
    // For more detail read the note in this link https://pub.dev/packages/flutter_dotenv#usage
    // dotenv.load(fileName: 'env'),
    dotenv.load(),
    setupLocator(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Irvan Alfaridzi',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const BasePage(),
    );
  }
}
