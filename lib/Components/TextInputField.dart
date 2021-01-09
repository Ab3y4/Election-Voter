import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key key,
    @required this.size,
    this.icon,
    this.hint,
    this.obsecureText,
    this.inputAction,
    this.inputType,
    this.onChanged,
    this.onSubmit,
  }) : super(key: key);

  final Size size;
  final icon;
  final hint;
  final obsecureText;
  final inputType;
  final inputAction;
  final onChanged;
  final onSubmit;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.09,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Color(0xFFee9595).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            child: Icon(
              icon,
              size: 28,
              color: Colors.white,
            ),
          ),
          contentPadding: EdgeInsets.only(top: 25),
          hintText: hint,
          hintStyle: GoogleFonts.lato(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        obscureText: obsecureText,
        style: GoogleFonts.lato(
          fontSize: 20,
          color: Colors.white,
        ),
        keyboardType: inputType,
        textInputAction: inputAction,
        onChanged: onChanged,
        onSubmitted: onSubmit,
        autocorrect: true,
      ),
    );
  }
}
