import 'package:election_voter/Components/StyledText.dart';
import 'package:election_voter/Screens/PeopleList.dart';
import 'package:flutter/material.dart';

class PartyScreen extends StatefulWidget {
  @override
  _PartyScreenState createState() => _PartyScreenState();
}

class _PartyScreenState extends State<PartyScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      "Janatha Vimukthi Peramuna",
      "Sri Lanka Freedom Party",
      'United National Party',
      "Samagi Jana Balawegaya",
      "Sri Lanka Podujana Peramuna"
    ];
    final List<Color> colors = <Color>[
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Color(0xFF9E1D28)
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: EdgeInsets.fromLTRB(80, 3, 0, 0),
            child: StyledText(
              text: 'Parties',
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
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  print('${entries[index]}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PeopleList(partyId: entries[index]),
                    ),
                  );
                },
                child: Container(
                  height: 80,
                  color: colors[index],
                  child: Center(
                      child: StyledText(
                    text: '${entries[index]}',
                  )),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ));
  }
}
