import 'package:flutter/material.dart';
import 'package:resonate/login_page.dart';

class Variables extends State<LoginPage> {
  static String fontFamily = 'OpenSans';
  static double fontSize = 24;
  static String notesPage ="";
 static String currentEmail="";
 static String currentProject="";
 static String currentNote="";
 static var currentNoteTitle="";
 static var currentNoteContent="";
  static var currentProjectCode="";
  static var updatedBy="";
  static var updatedAt="";
  static String projectCreatedBy="";
  static String currentProjectId="";
  static bool darkMode=false ;

  void changeFontFamily(String font) {
    fontFamily = font;
  }

  void changeFontSize({required double size}) async {
    setState(() {
      fontSize = size;
    });
    // (fontSize = size;)
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}