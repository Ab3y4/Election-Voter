import 'package:election_voter/Screens/ConfirmVote.dart';
import 'package:election_voter/Screens/DoneVoting.dart';
import 'package:election_voter/Screens/Instructions.dart';
import 'package:election_voter/Screens/Login.dart';
import 'package:election_voter/Screens/SignupScreen.dart';
import 'package:election_voter/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:election_voter/Screens/LanguageScreen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Election Voter',
      initialRoute: '/',
      routes: {
        '/' : (context) => LoginScreen(),
        '/language' : (context) => LanguageScreen(),
        '/signup' : (context) => SignupScreen(),
        '/login' : (context) => LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}