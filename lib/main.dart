import 'package:alfaridzi_me/provider/project_provider.dart';
import 'package:alfaridzi_me/responsive/base_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProjectProvider())
      ],
      child: MaterialApp(
        title: 'Irvan Alfaridzi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        ),
        home: const BasePage(),
      ),
    );
  }
}
