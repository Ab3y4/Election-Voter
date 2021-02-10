import 'package:election_voter/Components/RoundedButton.dart';
import 'package:election_voter/Components/StyledText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Instructions.dart';

class ConfirmVote extends StatefulWidget {
  @override
  _ConfirmVoteState createState() => _ConfirmVoteState();
}

class _ConfirmVoteState extends State<ConfirmVote> {
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
      backgroundColor: Colors.white,
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
          StyledText(text: 'Name'),
          SizedBox(height: 30,),
          StyledText(text: 'Name'),
          SizedBox(height: 30,),
          StyledText(text: 'Name'),
          SizedBox(height: 40,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButton(
                    size: size/1.8,
                    buttonText: 'Back',
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return Instructions();
                      }));
                    }
                ),
                SizedBox(width: 10,),
                RoundedButton(
                    size: size/1.8,
                    buttonText: 'Submit',
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return Instructions();
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
