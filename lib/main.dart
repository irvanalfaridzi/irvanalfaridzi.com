import 'package:alfaridzi_me/responsive/base_page.dart';
import 'package:alfaridzi_me/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    // ERROR: Failed to load resource: the server responded with a status of 404 ()
    // dotenv.load(),
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
