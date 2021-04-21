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
    this.controller,
  }) : super(key: key);

  final Size size;
  final icon;
  final hint;
  final obsecureText;
  final inputType;
  final inputAction;
  final onChanged;
  final onSubmit;
  final controller;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.09,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
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
              color: Color(0xFF28abb9),
            ),
          ),
          contentPadding: EdgeInsets.only(top: 25),
          hintText: hint,
          hintStyle: GoogleFonts.lato(
            fontSize: 25,
            color: Color(0xFF28abb9),
          ),
        ),
        obscureText: obsecureText,
        style: GoogleFonts.lato(
          fontSize: 20,
          color: Color(0xFF28abb9),
        ),
        keyboardType: inputType,
        textInputAction: inputAction,
        onChanged: onChanged,
        onSubmitted: onSubmit,
        autocorrect: true,
        controller: controller,
      ),
    );
  }
}
