import 'package:election_voter/Components/RoundedButton.dart';
import 'package:election_voter/Components/TextInputField.dart';
import 'package:election_voter/Screens/AuthService.dart';
import 'package:election_voter/Screens/Instructions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:election_voter/Screens/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginScreen extends StatefulWidget {

  LoginScreen({this.phone});
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



  void getPhone (dynamic phone) {
    setState(() {
      phoneNum = phone;
    });
  }

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
  void initState() {
    // TODO: implement initState
    super.initState();
    //getPhone(widget.phone);
    // verifyPhoneNumber(phoneNum);
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    int enteredOTP ;
    int otp = 9999;
    // var rand = new Random();
    // otp = rand.nextInt(10000);
    // print(otp);

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
      backgroundColor: Color(0xFF9ba4b4),
      body: ClipRect(
          child: Center(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 150,),
                    TextInputField(
                      controller: _phoneNumberController,
                      size: size,
                      icon: FontAwesomeIcons.envelope,
                      hint: 'OTP',
                      obsecureText: true,
                      inputAction: TextInputAction.done,
                      inputType: TextInputType.number,
                      onSubmit: (value) {
                        enteredOTP = value;
                      },
                    ),
                    SizedBox(height: 50,),
                    RoundedButton(
                        size: size,
                        buttonText: 'Submit',
                        onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) {
                              return InstructionsScreen();
                            }));
                          }
                    )
                  ],
                )
              ],
            ),
          ),
      ),
    );
  }
}
