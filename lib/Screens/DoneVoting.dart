import 'package:election_voter/Screens/SuccessfulScreen.dart';
import 'package:flutter/material.dart';
import 'package:election_voter/Components/RoundedButton.dart';
import 'package:election_voter/Components/StyledText.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Instructions.dart';

class DoneVoting extends StatefulWidget {
  DoneVoting({this.name, this.party, this.number, this.imageUrl});
  String name;
  String imageUrl;
  String party;
  String number;

  @override
  _DoneVoteState createState() => _DoneVoteState();
}

class _DoneVoteState extends State<DoneVoting> {
  String candidateName;
  String candidateParty;
  String candidateNumber;
  String candidateImage;

  @override
  void initState() {
    super.initState();

    UpdateUI(widget.name, widget.party, widget.number, widget.imageUrl);
  }

  void UpdateUI(
    String name,
    String party,
    String number,
    String imageUrl,
  ) {
    setState(() {
      candidateName = name;
      candidateParty = party;
      candidateNumber = number;
      candidateImage = imageUrl;
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  image: DecorationImage(
                    image: NetworkImage(candidateImage),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyledText(text: 'Candidate Name: '),
                    StyledText(text: '$candidateName'),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyledText(text: 'Candidate Name: '),
                    StyledText(text: '$candidateParty'),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyledText(text: 'Candidate No: '),
                    StyledText(text: '$candidateNumber'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: RoundedButton(
                  size: size,
                  buttonText: 'Done',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SuccessfulScreen();
                    }));
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _willPopCallback() async {
    return Future.value(false);
  }
}
