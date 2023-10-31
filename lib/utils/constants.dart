import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff009688);
const Color kBackgroundColor = Color.fromRGBO(17, 31, 50, 1);
// const Color kBackgroundColor = Color(0xff2C3E50);
const Color kDangerColor = Color.fromRGBO(242, 162, 56, 1);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;
