import 'package:election_voter/Components/StyledText.dart';
import 'package:flutter/material.dart';

import 'ConfirmVote.dart';

class PeopleList extends StatefulWidget {
  @override
  _PeopleListState createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  @override
  Widget build(BuildContext context) {

    final List<String> name = <String>["Sunil", "Nimal", 'Namal'];
    final List<String> party = <String>["UNFP", "UNP", 'JVP'];
    final List<String> number = <String>["9", "4", '2'];
    final List<Color> colors = <Color>[Colors.cyanAccent, Colors.cyanAccent, Colors.cyanAccent];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: EdgeInsets.fromLTRB(80, 3, 0, 0),
            child: StyledText(
              text: 'Candidates',
            ),
          ),
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
        body: Container(
          child: ListView.separated(
            padding: const EdgeInsets.all(15),
            itemCount: name.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  String candidateName = name[index];
                  String candidateParty = party[index];
                  String candidateNumber = number[index];
                  print(candidateName);
                  print(candidateParty);
                  print(candidateNumber);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ConfirmVote(name: candidateName, party: candidateParty, number: candidateNumber);
                  }));
                },
                child: Container(
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white60,
                            radius: 60,
                          ),
                          // SizedBox(width: 5,),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            // color: colors[index],
                            child: Center(
                                child: StyledText(
                                  text: 'Name: ${name[index]}',
                                )
                            ),
                          ),
                          Container(
                            height: 50,
                            // color: colors[index],
                            child: Center(
                                child: StyledText(
                                  text: 'Party: ${party[index]}',
                                )
                            ),
                          ),
                          Container(
                            height: 50,
                            // color: colors[index],
                            child: Center(
                                child: StyledText(
                                  text: 'Number: ${number[index]}',
                                )
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
        )
    );
  }
}
