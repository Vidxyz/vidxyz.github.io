import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/models/carousel_item_model.dart';
import 'package:web_portfolio/pages/home/components/shared/hover_container.dart';
import 'package:web_portfolio/utils/constants.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    text: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: kPrimaryColor.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Text(
              "SOFTWARE ENGINEER",
              style: GoogleFonts.inter(
                color: kPrimaryColorLight,
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                letterSpacing: 2.0,
              ),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          ShaderMask(
            shaderCallback: (bounds) => kPrimaryGradient.createShader(bounds),
            child: FittedBox(
              fit: BoxFit.contain,
              child: AutoSizeText(
                "VIDHYASAGAR",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 72.0,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                  letterSpacing: -1.0,
                ),
              ),
            ),
          ),
          ShaderMask(
            shaderCallback: (bounds) => kPrimaryGradient.createShader(bounds),
            child: FittedBox(
              fit: BoxFit.contain,
              child: AutoSizeText(
                "HARIHARA",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 72.0,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                  letterSpacing: -1.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Problem solver, Tech explorer",
            style: TextStyle(
              color: kCaptionColor,
              fontSize: 18.0,
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            child: Wrap(
              children: [
                Text(
                  "Need an opinion? ",
                  style: TextStyle(
                    color: kCaptionColor,
                    fontSize: 16.0,
                    height: 1.5,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse("mailto:vdhysgr@gmail.com"));
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      "Got a project?",
                      style: TextStyle(
                        height: 1.5,
                        color: kPrimaryColorLight,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: kPrimaryColorLight,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 32.0,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kPrimaryColor, kPrimaryColorLight],
                ),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.4),
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              height: 56.0,
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
              ),
              child: TextButton(
                onPressed: () {
                  launchUrl(Uri.parse("mailto:vdhysgr@gmail.com"));
                },
                child: Text(
                  "Let's talk",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
    image: HoverContainer(
      hoverLimit: 40,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor.withOpacity(0.3),
              blurRadius: 40,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Image.asset(
          "assets/person_asset_2.png",
          fit: BoxFit.contain,
        ),
      ),
    ),
  ),
);
