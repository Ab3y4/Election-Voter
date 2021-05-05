import 'package:election_voter/Components/RoundedButton.dart';
import 'package:election_voter/Components/StyledText.dart';
import 'package:election_voter/Screens/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:election_voter/Components/TextInputField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:election_voter/translations/locale_keys.g.dart';

import 'AuthService.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nicNumberController = TextEditingController();
  final TextEditingController _electionNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  String _verificationId;

  Future<void> verifyPhoneNumber(phoneNum) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationFailed = (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verID, [int forceResent]) {
      this._verificationId = verID;
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verID) {
      this._verificationId = verID;
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNum,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);

  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    String NIC;
    String phoneNumber;
    String electionNumber;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                SizedBox(height: 90,),
                ClipRect(
                  child: Column(
                    children: [
                      
                      Center(
                        child: Text(
                          LocaleKeys.signup_to_your_text.tr(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                            fontSize: 20.0),

                        ),
                      ),
                      SizedBox(height: 20,),
                      TextInputField(
                        controller: _nicNumberController,
                        size: size,
                        hint: LocaleKeys.nic_hint.tr(),
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
                        controller: _phoneNumberController,
                        size: size,
                        icon: FontAwesomeIcons.phone,
                        hint: LocaleKeys.phone_hint.tr(),
                        obsecureText: false,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        onChanged: (value) {
                          phoneNumber = value;
                          print(phoneNumber);
                        },
                      ),
                      SizedBox(height: 20,),
                      TextInputField(
                        controller: _electionNumberController,
                        size: size,
                        icon: FontAwesomeIcons.fileAlt,
                        hint: LocaleKeys.election_hint.tr(),
                        obsecureText: false,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        onSubmit: (value) {
                          electionNumber = value;
                          print(electionNumber);
                        },
                      ),
                      SizedBox(height: 30,),
                      RoundedButton(
                          size: size,
                          buttonText: LocaleKeys.submit_button_s_up.tr(),
                          onPressed: () {
                            print(_nicNumberController.text);
                            print(_phoneNumberController.text);
                            print(_electionNumberController.text);
                            verifyPhoneNumber(_phoneNumberController.text);
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return LoginScreen(phone: _phoneNumberController.text,);
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
