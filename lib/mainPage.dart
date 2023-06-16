
import 'package:det/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'intro_screens/onboard.dart';

void main() {
  runApp(mainPage());
}
class mainPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return onBoard();
          }
          else{
            return login();
          }
        },
      ),

    );
  }
}