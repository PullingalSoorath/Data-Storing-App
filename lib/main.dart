import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hiveproject/home_page.dart';

void main() async {
  WidgetsFlutterBinding();

  await Hive.initFlutter();
  await Hive.openBox('boxname');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      
    );
  }
}
