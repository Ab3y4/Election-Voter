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
      height: size.height * 0.07,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff007AFF),
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
