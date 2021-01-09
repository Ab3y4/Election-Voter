import 'package:flutter/material.dart';
import 'StyledText.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.size,
    @required this.buttonText,
    @required this.onPressed,
  }) : super(key: key);

  final Size size;
  final buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.09,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Color(0xFFffcda3),
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: StyledText(text: buttonText,),
      ),
    );
  }
}