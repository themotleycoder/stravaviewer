import 'dart:ui';
import 'package:flutter/material.dart';

const int defaultDataDate = 1388563200;

enum HomeScreenTab { activities, stats, calendar, settings }
enum ActivityDetailScreenTab { details, profile, sections }

enum DateFilter {
  all,
  month,
  week,
  year,
}

TextStyle headerTextStyle =
    new TextStyle(inherit: true, fontSize: 20.0, color: Colors.blueGrey[300]);
TextStyle bodyTextStyleComplete = new TextStyle(
    inherit: true,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.blue[300]);
TextStyle bodyTextStyle = new TextStyle(
    inherit: true,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.blueGrey);
TextStyle inlineBodyTextStyle =
    new TextStyle(inherit: true, fontSize: 20.0, color: Colors.blueGrey[300]);
TextStyle headerFontStyle = new TextStyle(
  inherit: true,
  fontSize: 20.0,
);
const double iconPadding = 8.0;
const double rowHeight = 80;
const double iconSize = 32.0;
const Color iconColor = Colors.orangeAccent;
const Color dividerColor = Colors.black12;
const double boxSize = 10.0;
Color calenderColor = Colors.grey[600];
