import 'package:election_voter/Components/RoundedButton.dart';
import 'package:election_voter/Components/TextInputField.dart';
import 'package:election_voter/Components/error_alert_dialog.dart';
import 'package:election_voter/Screens/AuthService.dart';
import 'package:election_voter/Screens/Instructions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:election_voter/Screens/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:election_voter/translations/locale_keys.g.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    this.phone,
  });
  final phone;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneNum;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  String _verificationId;

  void getPhone(dynamic phone) {
    setState(() {
      phoneNum = phone;
    });
  }

  @override
  void initState() {
    verifyPhoneNumber(widget.phone);
    super.initState();
    //getPhone(widget.phone);
  }

  Future<void> verifyPhoneNumber(phoneNum) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
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
    int enteredOTP;
    int otp = 9999;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      backgroundColor: Colors.white,
      body: ClipRect(
        child: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 270,
                  ),
                  TextInputField(
                    controller: _smsController,
                    size: size,
                    icon: FontAwesomeIcons.envelope,
                    hint: LocaleKeys.otp_hint.tr(),
                    obsecureText: true,
                    inputAction: TextInputAction.done,
                    inputType: TextInputType.number,
                    onSubmit: (value) {
                      enteredOTP = value;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: RoundedButton(
                        size: size,
                        buttonText: LocaleKeys.login_button.tr(),
                        onPressed: () {
                          if (_verificationId == null) {
                            showDialog(
                                context: context,
                                builder: (c) {
                                  return ErrorAlertDialog(
                                    message: "OTP Error",
                                  );
                                });
                          } else {
                            signIn(_smsController.text);
                          }

                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return InstructionsScreen();
                          // }));
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn(String otp) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: _verificationId,
        smsCode: otp,
      );
      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InstructionsScreen(),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
