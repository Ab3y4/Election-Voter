import 'package:election_voter/Components/StyledText.dart';
import 'package:election_voter/Screens/LanguageScreen.dart';
import 'package:election_voter/Screens/Login.dart';
import 'package:election_voter/Screens/SignupScreen.dart';
import 'package:election_voter/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class SuccessfulScreen extends StatefulWidget {
  @override
  _SuccessfulScreenState createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  @override
  void initState() {
    super.initState();

    new Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LanguageScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                  ),
                  Center(
                    child: Text(
                      LocaleKeys.successfully_voted_text.tr(),
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      LocaleKeys.you_will_be_automatically_text.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ))),
    );
  }

  Future<bool> _willPopCallback() async {
    return Future.value(false);
  }
}
