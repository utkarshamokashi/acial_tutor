import 'package:flutter/material.dart';


const kInputDecoration = InputDecoration(
  hintText: 'Email',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color:Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color:Colors.black, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(0)),
  ),
);
