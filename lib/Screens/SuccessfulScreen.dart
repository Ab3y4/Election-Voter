import 'package:election_voter/Screens/LanguageScreen.dart';
import 'package:election_voter/Screens/Login.dart';
import 'package:election_voter/Screens/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessfulScreen extends StatefulWidget {
  @override
  _SuccessfulScreenState createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignupScreen();
              }));
            },
          ),
    );

  }
}