import 'package:election_voter/Screens/Login.dart';
import 'package:election_voter/Screens/SignupScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:election_voter/Components/RoundedButton.dart';
import 'package:election_voter/Components/StyledText.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF9ba4b4),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 150,),
              Center(
                child: StyledText(
                      text: 'Choose your language',
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  )
                ),
              ),
              SizedBox(height: 40,),
              RoundedButton(
                  size: size,
                  buttonText: 'English',
                  onPressed: () {
                    print('English');
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return SignupScreen();
                    }));
                  },
              ),
              SizedBox(height: 30,),
              RoundedButton(
                size: size,
                buttonText: 'Sinhala',
                onPressed: () {
                  print('Sinhala');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignupScreen();
                  }));
                },
              ),
              SizedBox(height: 30,),
              RoundedButton(
                size: size,
                buttonText: 'Tamil',
                onPressed: () {
                  print('Tamil');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignupScreen();
                  }));
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

