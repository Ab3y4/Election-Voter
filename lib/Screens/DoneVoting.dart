import 'package:election_voter/Screens/SuccessfulScreen.dart';
import 'package:flutter/material.dart';
import 'package:election_voter/Components/RoundedButton.dart';
import 'package:election_voter/Components/StyledText.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Instructions.dart';



class DoneVoting extends StatefulWidget {

  DoneVoting({this.name, this.party, this.number});
  String name;
  String party;
  String number;

  @override
  _DoneVoteState createState() => _DoneVoteState();
}

class _DoneVoteState extends State<DoneVoting> {

  String candidateName;
  String candidateParty;
  String candidateNumber;

  @override

  void initState() {
    super.initState();

    UpdateUI(
        widget.name,
        widget.party,
        widget.number
    );
  }

  void UpdateUI(
      String name,
      String party,
      String number,
      ){
    setState(() {
      candidateName = name;
      candidateParty = party;
      candidateNumber = number;
    });
  }

  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

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
      body: Column(
        children: [
          SizedBox(height: 200,),
          Center(
            child: CircleAvatar(
              radius: size.width * 0.14,
              backgroundColor: Colors.grey[400].withOpacity(0.5),
              child: Center(
                child: Icon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                  size: size.width * 0.15,
                ),
              ),
            ),
          ),
          SizedBox(height: 50,),
          StyledText(text: '$candidateName'),
          SizedBox(height: 30,),
          StyledText(text: '$candidateParty'),
          SizedBox(height: 30,),
          StyledText(text: '$candidateNumber'),
          SizedBox(height: 40,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 12,),
                RoundedButton(
                    size: size/1.8,
                    buttonText: 'Done',
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return SuccessfulScreen();
                      }));
                    }
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}