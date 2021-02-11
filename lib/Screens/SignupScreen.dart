import 'package:election_voter/Components/RoundedButton.dart';
import 'package:election_voter/Components/StyledText.dart';
import 'package:election_voter/Screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:election_voter/Components/TextInputField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    String NIC;
    String phoneNumber;
    String electionNumber;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9ba4b4),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 150,),
                ClipRect(
                  child: Column(
                    children: [
                      
                      Center(
                        child: StyledText(
                          text: 'Signup to your account',
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextInputField(
                        size: size,
                        hint: 'NIC',
                        icon: FontAwesomeIcons.idCard,
                        obsecureText: false,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.name,
                        onSubmit: (value) {
                          NIC = value;
                          print(NIC);
                          return NIC;
                        },
                      ),
                      SizedBox(height: 20,),
                      TextInputField(
                        size: size,
                        icon: FontAwesomeIcons.phone,
                        hint: 'Phone Number',
                        obsecureText: false,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        onSubmit: (value) {
                          phoneNumber = value;
                          print(phoneNumber);
                          return phoneNumber;
                        },
                      ),
                      SizedBox(height: 20,),
                      TextInputField(
                        size: size,
                        icon: FontAwesomeIcons.fileAlt,
                        hint: 'Election Number',
                        obsecureText: false,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        onSubmit: (value) {
                          electionNumber = value;
                          print(electionNumber);
                          return electionNumber;
                        },
                      ),
                      SizedBox(height: 30,),
                      RoundedButton(
                          size: size,
                          buttonText: 'Submit',
                          onPressed: () {
                            print(NIC);
                            print(phoneNumber);
                            print(electionNumber);
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }));
                          }
                      )
                    ],
                  )
                ),
              ],
            ),
        ]
    ),
      ),
    );
  }
}
