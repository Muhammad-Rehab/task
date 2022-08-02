import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task/view/unityActivityPage.dart';

class WaitingPage extends StatefulWidget {
  const WaitingPage({Key? key}) : super(key: key);

  @override
  State<WaitingPage> createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage>  with TickerProviderStateMixin{

  late Animation<double>  _fadeAnimation ;
  late AnimationController  _fadeController ;

  late Animation<double>  _scaleAnimation ;
  late AnimationController  _scaleController ;

  @override
  void initState() {
    _fadeController = AnimationController(
      vsync: this ,
      duration: const Duration(seconds: 2),
     lowerBound: 0.0,
      upperBound: 1.0,
    )..forward().then((value) => _fadeController.reverse());
    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.linear,);

    _scaleController = AnimationController(
      vsync: this ,
      duration: const Duration(seconds: 4),
      lowerBound: 0.9,
      upperBound: 1.0,
    )..forward();
    _scaleAnimation = CurvedAnimation(parent: _scaleController, curve: Curves.linear,);
    Future.delayed(const Duration(seconds: 4),(){
      Navigator.pushReplacement(context,PageTransition(
          child: const UnityActivityPage(),
          type: PageTransitionType.fade,
      ));
    });
    super.initState();
  }


  @override
  void dispose() {
    _scaleController.dispose();
    _fadeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey.shade900,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Made with',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10,left: 80,right: 5),
                      width: 55,
                      height: 55,
                      child: Image.asset('assets/unity.jpg',fit: BoxFit.fill,),
                    ),
                    const Text(
                      'unity',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
