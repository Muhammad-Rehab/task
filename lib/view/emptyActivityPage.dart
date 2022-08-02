import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task/view/waitingPage.dart';

class EmptyActivityPage extends StatelessWidget {
  const EmptyActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.teal.shade900,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.deepPurple),
          ),
          onPressed: (){
            Navigator.push(context, PageTransition(
              type: PageTransitionType.fade,
              child: const WaitingPage(),
            ));
          },
          child:  const Text(
              'MY UNITY GAME',
              style: TextStyle(
                letterSpacing: 1.5,
                color: Colors.black
              ),
          ),
        ),
      ),
    );
  }
}
