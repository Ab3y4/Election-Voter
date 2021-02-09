import 'package:election_voter/Screens/LanguageScreen.dart';
import 'package:election_voter/Screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9ba4b4),
      body: Column(
        children: [
          SizedBox(height: 60,),
          Container(
            height: 400,
            width: 400,
            child: Lottie.asset('assets/lottie/vote.json'),
          ),
          SizedBox(height: 30,),
          Text(
              'Election Voter',
              style: GoogleFonts.lato(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LanguageScreen();
              }));
            },
            child: Text(
              'Start',
                style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                ),
            ),
          )
        ],
      ),
    );
  }
}
