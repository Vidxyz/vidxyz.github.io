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
                          (footerItem) => Container(
                            height: 120.0,
                            width: ScreenHelper.isMobile(context)
                                ? constraints.maxWidth / 2.0 - 20.0
                                : constraints.maxWidth / 4.0 - 20.0,
                            child: InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(footerItem.url));
                              },
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          footerItem.iconPath,
                                          width: 25.0,
                                          color: widget.toHighLight ? kDangerColor : kPrimaryColor,
                                        ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        Text(
                                          footerItem.title,
                                          style: GoogleFonts.oswald(
                                            fontSize: widget.toHighLight ? 20 : 18.0,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    Expanded(
                                      child: RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "${footerItem.text1}\n",
                                              style: TextStyle(
                                                color: kCaptionColor,
                                                height: 1.8,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "${footerItem.text2}\n",
                                              style: TextStyle(
                                                color: kCaptionColor,
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
                    )
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  mainAxisAlignment: ScreenHelper.isMobile(context)
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Copyright (c) 2023 Vidhyasagar Harihara. All rights Reserved",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kCaptionColor,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                color: kCaptionColor,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "|",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              "Terms & Conditions",
                              style: TextStyle(
                                color: kCaptionColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
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


