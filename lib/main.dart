import 'package:flutter/material.dart';

import 'package:flutter_application_2/api_folder/new_homepage.dart';

//import 'package:get/get.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // home: ToDo(),
      // home: DataFormApi(),
      // home: AddFile(),
      // home: PostsList(),
      home: NewHomePage(),
    );
  }
}
