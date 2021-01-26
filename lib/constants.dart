import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const logoColor = Color.fromARGB(
  255,
  250,
  123,
  1,
);

const darkGreen = Color.fromARGB(255, 0, 121, 101);

const yellowColor = Color.fromARGB(255, 255, 204, 41);

const lightGreen = Color.fromARGB(255, 0, 175, 145);

const textFieldDecoration = InputDecoration(
  
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 2.0,
      color: Colors.black,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    gapPadding: 10.0,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.teal,
      width: 20.0,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    gapPadding: 10.0,
  ),
  counterText: "",
  labelText: "email",
  labelStyle: TextStyle(
    color: logoColor,
    letterSpacing: 5.0,
  ),
  prefixIcon: Icon(
    FontAwesomeIcons.userAlt,
    size: 25.0,
    color: logoColor,
  ),
);
