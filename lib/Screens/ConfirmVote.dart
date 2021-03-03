import 'package:election_voter/Components/RoundedButton.dart';
import 'package:election_voter/Components/StyledText.dart';
import 'package:election_voter/Screens/DoneVoting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Instructions.dart';

class ConfirmVote extends StatefulWidget {

  ConfirmVote({this.name, this.party, this.number});
  String name;
  String party;
  String number;

  @override
  _ConfirmVoteState createState() => _ConfirmVoteState();
}

class _ConfirmVoteState extends State<ConfirmVote> {

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

  @override
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
                RoundedButton(
                    size: size/1.8,
                    buttonText: 'Back',
                    onPressed: () {
                      Navigator.pop(context);
                    }
                ),
                SizedBox(width: 10,),
                RoundedButton(
                    size: size/1.8,
                    buttonText: 'Submit',
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return DoneVoting(name: candidateName, party: candidateParty, number: candidateNumber);
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
