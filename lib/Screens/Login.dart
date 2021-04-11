import 'package:election_voter/Components/RoundedButton.dart';
import 'package:election_voter/Components/TextInputField.dart';
import 'package:election_voter/Screens/Instructions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {

  LoginScreen({this.phone});
  final phone;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String phoneNum;

  void getPhone (dynamic phone) {
    setState(() {
      phoneNum = phone;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPhone(widget.phone);

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
