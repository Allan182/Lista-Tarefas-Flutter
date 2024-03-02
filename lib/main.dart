import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:listadetarefas/view/homePage.dart';

void main() async {
  // step 3 - innit Hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('tarefinhasBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ); // MaterialApp
  }
}
