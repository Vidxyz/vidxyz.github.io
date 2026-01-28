import 'package:flutter/material.dart';

// Modern color palette
const Color kPrimaryColor = Color(0xFF6366F1); // Indigo
const Color kPrimaryColorDark = Color(0xFF4F46E5);
const Color kPrimaryColorLight = Color(0xFF818CF8);
const Color kSecondaryColor = Color(0xFF10B981); // Emerald
const Color kAccentColor = Color(0xFFF59E0B); // Amber
const Color kBackgroundColor = Color(0xFF0F172A); // Slate 900
const Color kBackgroundColorLight = Color(0xFF1E293B); // Slate 800
const Color kSurfaceColor = Color(0xFF1E293B); // Slate 800
const Color kDangerColor = Color(0xFFEF4444); // Red
const Color kCaptionColor = Color(0xFF94A3B8); // Slate 400
const Color kTextPrimary = Color(0xFFF1F5F9); // Slate 100
const Color kTextSecondary = Color(0xFFCBD5E1); // Slate 300

// Gradients
const LinearGradient kPrimaryGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
);

const LinearGradient kBackgroundGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1200.0;
const double kTabletMaxWidth = 800.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .9;
