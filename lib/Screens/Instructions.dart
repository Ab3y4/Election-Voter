import 'package:election_voter/Components/RoundedButton.dart';
import 'package:election_voter/Screens/PartyScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:election_voter/translations/locale_keys.g.dart';

import 'ConfirmVote.dart';

class InstructionsScreen extends StatefulWidget {
  @override
  _InstructionsScreenState createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _current = 0;
    List imgList = [
      'https://i.imgur.com/gbmzfqM.jpg',
      'https://i.imgur.com/I2AwWqV.jpg',
      'https://i.imgur.com/qwkD2vC.jpg'
    ];

    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }

    ;
    CarouselSlider carouselSlider;
    final CarouselController _controller = CarouselController();

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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            carouselSlider = CarouselSlider(
              items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 0.0),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          imgUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              carouselController: _controller,
              options: CarouselOptions(
                height: 350.0,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: false,
                reverse: false,
                enableInfiniteScroll: false,
                // autoPlayInterval: Duration(seconds: 2),
                // autoPlayAnimationDuration: Duration(milliseconds: 2000),
                // pauseAutoPlayOnTouch: Duration(seconds: 10),
                scrollDirection: Axis.horizontal,
                onScrolled: (index) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.4)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: RoundedButton(
                size: size,
                buttonText: LocaleKeys.next_button.tr(),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PartyScreen();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
