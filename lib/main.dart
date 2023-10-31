import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/pages/home/home.dart';
import 'package:web_portfolio/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Website",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: Theme.of(context).copyWith(
        platform: TargetPlatform.android,
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        canvasColor: kBackgroundColor,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      builder: (context, widget) => ResponsiveBreakpoints.builder(
        // ClampingScrollWrapper.builder(context, widget),
        // defaultScale: true,
        breakpoints: [
          Breakpoint(start: 0, end: 450, name: MOBILE),
          Breakpoint(start: 451, end: 800, name: TABLET),
          Breakpoint(start: 801, end: 1000, name: TABLET),
          Breakpoint(start: 1001, end: 1200, name: DESKTOP),
          Breakpoint(start: 1201, end: 2460, name: "4K"),
        ],
        // background: Container(
        //   color: kBackgroundColor,
        // ),
        child: widget!,
      ),
      home: Home(),
    );
  }
}
