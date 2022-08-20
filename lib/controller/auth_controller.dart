import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../view/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  Map<String, dynamic> userData = {};

  Database? database;

  String error = '';

  Future<bool> userIsLoggedIn() async {
    String databasesPath = await getDatabasesPath();
    String path = '${databasesPath}demo.db';
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Users ( name TEXT , email Text PRIMARY KEY, password TEXT,isLogIn TEXT)');
    });
    if (FirebaseAuth.instance.currentUser == null) {
      return false;
    }
    userData = (await database!.rawQuery(
        'SELECT * FROM Users WHERE email = "${FirebaseAuth.instance.currentUser!.email}"'))[0];
    if (userData['isLogIn'] == 'true') {
      return true;
    } else {
      return false;
    }
  }

  void singIn(String email, String password, BuildContext ctx, bool isLogIn,
      BuildContext context,
      {String? userName}) async {
    String databasesPath = await getDatabasesPath();
    String path = '${databasesPath}demo.db';
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Users ( name TEXT , email Text PRIMARY KEY, password TEXT,isLogIn TEXT)');
    });
    try {
      if (isLogIn) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        await database!
            .rawUpdate('UPDATE Users SET isLogIn = ? WHERE email = "$email"', [
          'true',
        ]);
        userData = (await database!
            .rawQuery('SELECT * FROM Users WHERE email = "$email"'))[0];
      } else {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        database!.rawInsert(
            'INSERT INTO Users(name, email, password,isLogIn) VALUES("$userName", "$email", "$password","true")');
      }
      userData = {
        'name': userName,
        'email': email,
        'password': password,
        'isLogIn': true,
      };
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-exists') {
        error = 'this account is already in user by another device';
      } else if (e.code == 'invalid-email') {
        error = 'The provided value for the email user property is invalid';
      } else if (e.code == 'invalid-password') {
        error = 'The provided value for the password user property is invalid';
      } else if (e.code == 'user-not-found') {
        error =
            'There is no existing user record corresponding to the provided identifier';
      } else if (e.code == 'wrong-password') {
        error = 'this is wrong password please remember your password';
      } else if (e.code == 'email-already-in-use') {
        error = 'The account already exists for that email.';
      } else {
        error = e.code;
      }
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text('Error'),
                content: Text(
                  error,
                ),
              ));
      notifyListeners();
      return;
    } catch (e) {
      print(e.toString());
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                title: Text('Error'),
                content: Text(
                  'An Error Occurred please try again later',
                ),
              ));
      notifyListeners();
      return;
    }
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    notifyListeners();
  }

  void singOut() async {
    await _auth.signOut();
    await database!.rawUpdate(
        'UPDATE Users SET isLogIn = ? WHERE email = "${userData['email']}"', [
      'false',
    ]);
    userData.clear();
    await database!.close();
    notifyListeners();
  }
}
