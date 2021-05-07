import 'package:election_voter/Components/StyledText.dart';
import 'package:election_voter/Screens/LanguageScreen.dart';
import 'package:election_voter/Screens/Login.dart';
import 'package:election_voter/Screens/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SuccessfulScreen extends StatefulWidget {
  @override
  _SuccessfulScreenState createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  @override
  void initState() {
    super.initState();

    new Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LanguageScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                ),
                Center(
                  child: StyledText(
                    text: 'Successfully Voted',
                  ),
                ),
                SizedBox(
                  height: 250,
                ),
                StyledText(
                  text:
                      'You will be automatically redirected to the Language screen',
                ),
              ],
            )));
  }
}
