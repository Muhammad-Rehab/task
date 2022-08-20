import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/auth_controller.dart';
import 'package:task/controller/medicin_controller.dart';
import 'package:task/view/AuthScreen.dart';
import 'package:task/view/home_screen.dart';
import 'package:task/view/splash_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => MedicineProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Provider.of<AuthProvider>(context).userIsLoggedIn(),
        builder: (_,snapShot)=> (snapShot.data == null ) ? const  SplashScreen()
            : (snapShot.data == true)
            ? const HomeScreen() : const  AuthScreen() ,
      ),
    );
  }
}
