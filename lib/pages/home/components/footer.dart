import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/models/footer_item.dart';
import 'package:web_portfolio/pages/home/home.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<FooterItem> footerItems = [
  // FooterItem(
  //   iconPath: "assets/mappin.png",
  //   title: "ADDRESS",
  //   text1: "999 Carter Street",
  //   text2: "Sailor Springs, IL 64234",
  // ),
  // FooterItem(
  //   iconPath: "assets/phone.png",
  //   title: "PHONE",
  //   text1: "+1 618-689-9604",
  //   text2: "+1 781-689-9632",
  // ),
  FooterItem(
    iconPath: "assets/email.png",
    title: "EMAIL",
    text1: "vdhysgr@gmail.com",
    text2: "",
    url: "mailto:vdhysgr@gmail.com",
  ),
  FooterItem(
    iconPath: "assets/linkedin.png",
    title: "LINKEDIN",
    text1: "https://www.linkedin.com/in/vidxyz/",
    text2: "",
    url: "https://www.linkedin.com/in/vidxyz/"
  ),
  FooterItem(
      iconPath: "assets/github.png",
      title: "GITHUB",
      text1: "https://github.com/Vidxyz",
      text2: "",
      url: "https://github.com/Vidxyz"
  )
];

class Footer extends StatefulWidget {
  final bool toHighLight;

  Footer(this.toHighLight);

  @override
  State createState() {
    return FooterState();
  }
}

class FooterState extends State<Footer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width,
          minWidth: width,
        ),
        // defaultScale: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.0),
                  child: Row(
                    // spacing: 20.0,
                    // runSpacing: 20.0,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: footerItems
                        .map(
                          (footerItem) => Expanded(
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  launchUrl(Uri.parse(footerItem.url));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(24),
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        kSurfaceColor,
                                        kSurfaceColor.withOpacity(0.8),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: widget.toHighLight
                                          ? kAccentColor.withOpacity(0.5)
                                          : Colors.white.withOpacity(0.1),
                                      width: widget.toHighLight ? 2 : 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: widget.toHighLight
                                            ? kAccentColor.withOpacity(0.2)
                                            : Colors.black.withOpacity(0.2),
                                        blurRadius: widget.toHighLight ? 15 : 8,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: (widget.toHighLight ? kAccentColor : kPrimaryColor).withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Image.asset(
                                          footerItem.iconPath,
                                          width: 24.0,
                                          color: widget.toHighLight ? kAccentColor : kPrimaryColorLight,
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        footerItem.title,
                                        style: GoogleFonts.inter(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                          color: kTextPrimary,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: RichText(
                                          textAlign: TextAlign.start,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "${footerItem.text1}\n",
                                                style: TextStyle(
                                                  color: kCaptionColor,
                                                  height: 1.8,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              if (footerItem.text2.isNotEmpty)
                                                TextSpan(
                                                  text: "${footerItem.text2}\n",
                                                  style: TextStyle(
                                                    color: kCaptionColor,
                                                    fontSize: 14,
                                                  ),
                                                )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                    )
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.white.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Copyright (c) 2025 Vidhyasagar Harihara. All rights Reserved",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kCaptionColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}


