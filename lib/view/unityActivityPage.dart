import 'package:flutter/material.dart';

class UnityActivityPage extends StatefulWidget {
  const UnityActivityPage({Key? key}) : super(key: key);

  @override
  State<UnityActivityPage> createState() => _UnityActivityPageState();
}


class _UnityActivityPageState extends State<UnityActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset('assets/test.jpg', fit: BoxFit.fill,),
      ),
    );
  }
}
