import 'package:flutter/material.dart';

class Experience {
  final String companyName;
  final String jobTitle;
  final String period;

  final List<String> points;

  final String iconPath;

  Experience({
    required this.companyName,
    required this.jobTitle,
    required this.period,
    required this.points,
    required this.iconPath,
  });
}
