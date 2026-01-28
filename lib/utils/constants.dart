import 'package:flutter/material.dart';

// Modern teal palette
const Color kPrimaryColor = Color(0xFF14B8A6); // Teal 500
const Color kPrimaryColorDark = Color(0xFF0F766E); // Teal 700
const Color kPrimaryColorLight = Color(0xFF5EEAD4); // Teal 300
const Color kSecondaryColor = Color(0xFF22C55E); // Green 500
const Color kAccentColor = Color(0xFF06B6D4); // Cyan 500
const Color kBackgroundColor = Color(0xFF0F172A); // Slate 900
const Color kBackgroundColorLight = Color(0xFF111827); // Slate 900 variant
const Color kSurfaceColor = Color(0xFF1F2937); // Slate 800
const Color kDangerColor = Color(0xFFEF4444); // Red
const Color kCaptionColor = Color(0xFF94A3B8); // Slate 400
const Color kTextPrimary = Color(0xFFF1F5F9); // Slate 100
const Color kTextSecondary = Color(0xFFCBD5E1); // Slate 300

// Gradients
const LinearGradient kPrimaryGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF14B8A6), Color(0xFF06B6D4)],
);

const LinearGradient kBackgroundGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF0F172A), Color(0xFF111827)],
);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1200.0;
const double kTabletMaxWidth = 800.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .9;
