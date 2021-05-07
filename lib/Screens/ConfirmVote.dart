import 'package:election_voter/Components/RoundedButton.dart';
import 'package:election_voter/Components/StyledText.dart';
import 'package:election_voter/Screens/DoneVoting.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Instructions.dart';

class ConfirmVote extends StatefulWidget {
  ConfirmVote({this.name, this.party, this.number, this.votes, this.imageUrl});
  String name;
  String party;
  String number;
  int votes;
  String imageUrl;

  @override
  _ConfirmVoteState createState() => _ConfirmVoteState();
}

class _ConfirmVoteState extends State<ConfirmVote> {
  var _db = FirebaseDatabase.instance.reference();
  String candidateName;
  String candidateParty;
  String candidateNumber;
  int candidateVote;

  @override
  void initState() {
    super.initState();

    // widget.imageUrl = "";
    UpdateUI(widget.name, widget.party, widget.number, widget.votes);
  }

  void UpdateUI(
    String name,
    String party,
    String number,
    int votes,
  ) {
    setState(() {
      candidateName = name;
      candidateParty = party;
      candidateNumber = number;
      candidateVote = votes;
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
                  image: NetworkImage(widget.imageUrl),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          StyledText(text: '$candidateName'),
          SizedBox(
            height: 30,
          ),
          StyledText(text: '$candidateParty'),
          SizedBox(
            height: 30,
          ),
          StyledText(text: '$candidateNumber'),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButton(
                    size: size / 1.8,
                    buttonText: 'Back',
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                SizedBox(
                  width: 10,
                ),
                RoundedButton(
                    size: size / 1.8,
                    buttonText: 'Submit',
                    onPressed: () {
                      candidateVote++;
                      updateDatabase();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateDatabase() {
    _db.child(candidateParty).update({
      candidateName: candidateVote,
    });

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DoneVoting(
          name: candidateName, party: candidateParty, number: candidateNumber);
    }));
  }
}
