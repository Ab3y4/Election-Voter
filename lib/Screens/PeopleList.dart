import 'dart:convert';

import 'package:election_voter/Components/StyledText.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'ConfirmVote.dart';

class PeopleList extends StatefulWidget {
  PeopleList({this.partyId});
  final String partyId;

  @override
  _PeopleListState createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  var db = FirebaseDatabase.instance.reference();
  String candidate1Name, candidate2Name, candidate3Name, candidateParty;
  int candidate1Vote, candidate2Vote, candidate3Vote;
  List<String> imageList;
  List<String> number;

  @override
  void initState() {
    //List<String> imageList = <String>["", "", ""];
    candidate1Name = "";
    candidate2Name = "";
    candidate3Name = "";
    candidateParty = "";

    if (widget.partyId == "Janatha Vimukthi Peramuna") {
      number = <String>[
        "Vote for No 5",
        "Vote for No 10",
        "Vote for No 2",
      ];
      imageList = <String>[
        "https://firebasestorage.googleapis.com/v0/b/election-voter-32e34.appspot.com/o/images%2FJVP%2Fsunil.jpg?alt=media&token=9331baf0-ad37-422b-bc0e-9cb4b5e8cb8d",
        "https://firebasestorage.googleapis.com/v0/b/election-voter-32e34.appspot.com/o/images%2FJVP%2Ftilvin.jpg?alt=media&token=6e8c5e70-0c85-4eea-9b9a-ccdae7a552c7",
        'https://firebasestorage.googleapis.com/v0/b/election-voter-32e34.appspot.com/o/images%2FJVP%2Fanura.jpg?alt=media&token=b35fc312-856b-4215-8ad2-86ca7292ff9a'
      ];
      getCandidateList1();
    } else if (widget.partyId == "Sri Lanka Freedom Party") {
      number = <String>[
        "Vote for No 1",
        "Vote for No 3",
        "Vote for No 9",
      ];
      imageList = <String>[
        "https://firebasestorage.googleapis.com/v0/b/election-voter-32e34.appspot.com/o/images%2FSLFP%2Fnimal.jpeg?alt=media&token=85576ab1-f9e5-45d3-9b87-551565c794c7",
        "https://firebasestorage.googleapis.com/v0/b/election-voter-32e34.appspot.com/o/images%2FSLFP%2Fduminda.jpg?alt=media&token=f5a5358e-ca44-4525-9326-9fd7677e639f",
        'https://firebasestorage.googleapis.com/v0/b/election-voter-32e34.appspot.com/o/images%2FSLFP%2Fdayasiri.jpg?alt=media&token=f996d82f-0db3-4f7d-b854-69a3bf7148ed'
      ];
      getCandidateList2();
    } else if (widget.partyId == "United National Party") {
      number = <String>[
        "Vote for No 2",
        "Vote for No 4",
        "Vote for No 8",
      ];
      imageList = <String>[
        "https://firebasestorage.googleapis.com/v0/b/election-voter-32e34.appspot.com/o/images%2FUNP%2Fwajira.jpg?alt=media&token=8e40708d-07f1-4657-90dc-5c5c826d705b",
        "https://firebasestorage.googleapis.com/v0/b/election-voter-32e34.appspot.com/o/images%2FUNP%2Franil.jpg?alt=media&token=df26e874-b498-4270-8bce-d58b8570d041",
        'https://firebasestorage.googleapis.com/v0/b/election-voter-32e34.appspot.com/o/images%2FUNP%2Fakila.jpg?alt=media&token=e98d4d47-ed87-446b-904d-a9bea0d363e2'
      ];
      getCandidateList3();
    } else if (widget.partyId == "Samagi Jana Balawegaya") {
      number = <String>[
        "Vote for No 13",
        "Vote for No 6",
        "Vote for No 11",
      ];
      imageList = <String>[
        "https://firebasestorage.googleapis.com/v0/b/election-voter-32e34.appspot.com/o/images%2FSJB%2Fbuddika.jpg?alt=media&token=bfcdb6ba-c9e3-4324-8190-e0789f9352fa",
        "https://firebasestorage.googleapis.com/v0/b/election-voter-32e34.appspot.com/o/images%2FSJB%2Fsajith.jpg?alt=media&token=73b5575f-1905-436e-8743-66f8ee2eedb9",
        'https://firebasestorage.googleapis.com/v0/b/election-voter-32e34.appspot.com/o/images%2FSJB%2Fharsha.jpg?alt=media&token=d2359471-04a6-46c9-8ced-0c622e2ec697'
      ];
      getCandidateList4();
    } else if (widget.partyId == "Sri Lanka Podujana Peramuna") {
      number = <String>[
        "Vote for No 21",
        "Vote for No 14",
        "Vote for No 19",
      ];
      imageList = <String>[
        "https://firebasestorage.googleapis.com/v0/b/election-voter-32e34.appspot.com/o/images%2FSLPP%2Fmaithripala.jpg?alt=media&token=08728a91-f885-4d1d-9178-d28758c79ac6",
        "https://firebasestorage.googleapis.com/v0/b/election-voter-32e34.appspot.com/o/images%2FSLPP%2Fmahinda.jpg?alt=media&token=2258abaf-b041-4612-8ed7-50cf7a1a72da",
        'https://firebasestorage.googleapis.com/v0/b/election-voter-32e34.appspot.com/o/images%2FSLPP%2Fgoyabaya.jpg?alt=media&token=517f103e-ab68-44a3-b11e-3aea4308f8b2'
      ];
      getCandidateList5();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> name = <String>[
      candidate1Name,
      candidate2Name,
      candidate3Name
    ];
    final List<String> party = <String>["UNFP", "UNP", 'JVP'];
    final List<Color> colors = <Color>[
      Colors.cyanAccent,
      Colors.cyanAccent,
      Colors.cyanAccent
    ];

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
                    //String candidateParty = candidateParty;
                    String candidateNumber = number[index];
                    print(candidateName);
                    print(candidateParty);
                    print(candidateNumber);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ConfirmVote(
                          name: candidateName,
                          party: candidateParty,
                          number: candidateNumber);
                    }));
                  },
                  child: Container(
                    color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                image: DecorationImage(
                                  image: NetworkImage(imageList[index]),
                                ),
                              ),
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
                              )),
                            ),
                            Container(
                              height: 50,
                              // color: colors[index],
                              child: Center(
                                  child: StyledText(
                                text: 'Party: $candidateParty',
                              )),
                            ),
                            Container(
                              height: 50,
                              // color: colors[index],
                              child: Center(
                                  child: StyledText(
                                text: number[index],
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ));
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ));
  }

  void getCandidateList1() {
    db.child("JVP").once().then((DataSnapshot snapshot) {
      List _nameList = snapshot.value.keys.toList();
      List _votesList = snapshot.value.values.toList();

      setState(() {
        candidateParty = snapshot.key;
        candidate1Name = _nameList[0];
        candidate1Vote = _votesList[0];
        candidate2Name = _nameList[1];
        candidate2Vote = _votesList[1];
        candidate3Name = _nameList[2];
        candidate3Vote = _votesList[2];
      });
      print(candidate1Name +
          " " +
          candidate1Vote.toString() +
          "\n" +
          candidate2Name +
          " " +
          candidate2Vote.toString() +
          "\n" +
          candidate3Name +
          " " +
          candidate3Vote.toString() +
          "\n");
    });
  }

  void getCandidateList2() {
    db.child("SLFP").once().then((DataSnapshot snapshot) {
      List _nameList = snapshot.value.keys.toList();
      List _votesList = snapshot.value.values.toList();

      setState(() {
        candidateParty = snapshot.key;
        candidate1Name = _nameList[0];
        candidate1Vote = _votesList[0];
        candidate2Name = _nameList[1];
        candidate2Vote = _votesList[1];
        candidate3Name = _nameList[2];
        candidate3Vote = _votesList[2];
      });

      print(candidate1Name +
          " " +
          candidate1Vote.toString() +
          "\n" +
          candidate2Name +
          " " +
          candidate2Vote.toString() +
          "\n" +
          candidate3Name +
          " " +
          candidate3Vote.toString() +
          "\n");
    });
  }

  void getCandidateList3() {
    db.child("UNP").once().then((DataSnapshot snapshot) {
      List _nameList = snapshot.value.keys.toList();
      List _votesList = snapshot.value.values.toList();

      setState(() {
        candidateParty = snapshot.key;
        candidate1Name = _nameList[0];
        candidate1Vote = _votesList[0];
        candidate2Name = _nameList[1];
        candidate2Vote = _votesList[1];
        candidate3Name = _nameList[2];
        candidate3Vote = _votesList[2];
      });

      print(candidate1Name +
          " " +
          candidate1Vote.toString() +
          "\n" +
          candidate2Name +
          " " +
          candidate2Vote.toString() +
          "\n" +
          candidate3Name +
          " " +
          candidate3Vote.toString() +
          "\n");
    });
  }

  void getCandidateList4() {
    db.child("SJB").once().then((DataSnapshot snapshot) {
      List _nameList = snapshot.value.keys.toList();
      List _votesList = snapshot.value.values.toList();

      setState(() {
        candidateParty = snapshot.key;
        candidate1Name = _nameList[0];
        candidate1Vote = _votesList[0];
        candidate2Name = _nameList[1];
        candidate2Vote = _votesList[1];
        candidate3Name = _nameList[2];
        candidate3Vote = _votesList[2];
      });

      print(candidate1Name +
          " " +
          candidate1Vote.toString() +
          "\n" +
          candidate2Name +
          " " +
          candidate2Vote.toString() +
          "\n" +
          candidate3Name +
          " " +
          candidate3Vote.toString() +
          "\n");
    });
  }

  void getCandidateList5() {
    db.child("SLPP").once().then((DataSnapshot snapshot) {
      List _nameList = snapshot.value.keys.toList();
      List _votesList = snapshot.value.values.toList();

      setState(() {
        candidateParty = snapshot.key;
        candidate1Name = _nameList[0];
        candidate1Vote = _votesList[0];
        candidate2Name = _nameList[1];
        candidate2Vote = _votesList[1];
        candidate3Name = _nameList[2];
        candidate3Vote = _votesList[2];
      });

      print(candidate1Name +
          " " +
          candidate1Vote.toString() +
          "\n" +
          candidate2Name +
          " " +
          candidate2Vote.toString() +
          "\n" +
          candidate3Name +
          " " +
          candidate3Vote.toString() +
          "\n");
    });
  }
}
