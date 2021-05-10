import 'package:election_voter/Components/RoundedButton.dart';
import 'package:election_voter/Components/StyledText.dart';
import 'package:election_voter/Components/error_alert_dialog.dart';
import 'package:election_voter/Screens/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  DatabaseReference _db = FirebaseDatabase.instance.reference();
  List<String> mobileNoList = List<String>();
  List<dynamic> nicList = List<dynamic>();
  List keyList;
  List valueList;
  var mobileOnDB;
  var nameOnDB;

  @override
  void initState() {
    fetchMobileNumbers();
    super.initState();
  }

  fetchMobileNumbers() async {
    _db.child("voter").once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, values) async {
        mobileNoList.add(values['mobile'].toString());
        nicList.add(values['nic'].toString());
      });
    });
    Future.delayed(Duration(seconds: 2), () {
      print(mobileNoList);
      print(nicList);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String NIC;
    String phoneNumber;
    String name;

    return Scaffold(
      backgroundColor: Colors.white,
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
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
              ),
              ClipRect(
                  child: Column(
                children: [
                  Center(
                    child: Text(
                      LocaleKeys.signup_to_your_text.tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28.0),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                  SizedBox(
                    height: 20,
                  ),
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
                  SizedBox(
                    height: 20,
                  ),
                  TextInputField(
                    controller: _nameController,
                    size: size,
                    icon: FontAwesomeIcons.fileAlt,
                    hint: LocaleKeys.name_hint.tr(),
                    obsecureText: false,
                    inputAction: TextInputAction.done,
                    inputType: TextInputType.text,
                    onSubmit: (value) {
                      name = value;
                      print(name);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: RoundedButton(
                        size: size,
                        buttonText: LocaleKeys.submit_button_s_up.tr(),
                        onPressed: () {
                          print(_nicNumberController.text);
                          print(_phoneNumberController.text);
                          print(_nameController.text);
                          if (_phoneNumberController.text.isEmpty ||
                              _nicNumberController.text.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (c) {
                                  return ErrorAlertDialog(
                                    message: "Please fill all the fields",
                                  );
                                });
                          } else if (_phoneNumberController.text.isNotEmpty &&
                              _nicNumberController.text.isNotEmpty) {
                            if (nicList.contains(_nicNumberController.text) ==
                                true) {
                              _db
                                  .child("voter")
                                  .child(_nicNumberController.text)
                                  .once()
                                  .then((DataSnapshot snapshot) {
                                keyList = snapshot.value.keys.toList();
                                valueList = snapshot.value.values.toList();
                                print(keyList);
                                print(valueList);
                              });
                              Future.delayed(Duration(seconds: 2), () {
                                if (valueList[0] != "" && valueList[1] != "") {
                                  showDialog(
                                      context: context,
                                      builder: (c) {
                                        return ErrorAlertDialog(
                                          message: "You have already voted!",
                                        );
                                      });
                                } else if (valueList[0] == "" &&
                                    valueList[1] == "") {
                                  updateDatabase();
                                }
                              });
                            } else if (nicList
                                    .contains(_nicNumberController.text) ==
                                false) {
                              showDialog(
                                  context: context,
                                  builder: (c) {
                                    return ErrorAlertDialog(
                                      message: "Invalid NIC",
                                    );
                                  });
                            }
                          } else {
                            showDialog(
                                context: context,
                                builder: (c) {
                                  return ErrorAlertDialog(
                                    message: "Please try again",
                                  );
                                });
                          }
                        }),
                  ),
                ],
              )),
            ],
          ),
        ]),
      ),
    );
  }

  void updateDatabase() async {
    _db.child('voter').child(_nicNumberController.text).update({
      "mobile": _phoneNumberController.text,
      "name": _nameController.text,
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(phone: _phoneNumberController.text),
      ),
    );
  }
}
