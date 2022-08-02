import 'package:flutter/material.dart';
import 'package:task/view/emptyActivityPage.dart';
void main() {



  //help
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmptyActivityPage(),
    );
  }
}

