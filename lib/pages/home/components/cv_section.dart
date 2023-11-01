import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/models/design_process.dart';
import 'package:web_portfolio/pages/home/components/shared/hover_container.dart';
import 'package:web_portfolio/pages/home/home.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "DESIGN",
    imagePath: "assets/design.png",
    subtitle:
        "Scope out components and identify bottlenecks. Choose the right tools for the job.",
  ),
  DesignProcess(
    title: "EXECUTE",
    imagePath: "assets/develop.png",
    subtitle:
        "Bootstrap solution with open-source components. Iterate on design with a healthy dose of pragmatism.",
  ),
  DesignProcess(
    title: "RELEASE",
    imagePath: "assets/write.png",
    subtitle:
        "Setup portable and scalable infrastructure. Design pipelines for continuous deployment",
  ),
  DesignProcess(
    title: "MONITOR",
    imagePath: "assets/promote.png",
    subtitle:
        "Collect and analyze metrics for visibility into system. Setup alerts to react to incidents pre-emptively",
  ),
];

class CvSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      key: aboutMeSectionKey,
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    // we need the context to get maxWidth before the constraints below
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: width,
        minWidth: width,
      ),
      // defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "I'M A SOFTWARE ENGINEER WHO LOVES DESIGNING REACTIVE AND SCALABLE SYSTEMS",
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 1.8,
              fontSize: 18.0,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: HoverContainer(
                  hoverLimit: 5,
                  child: GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse("https://vidxyz.github.io/resume"));
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: AutoSizeText(
                        "VIEW RESUME",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.oswald(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: HoverContainer(
                  hoverLimit: 5,
                  child: GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse("https://raw.githubusercontent.com/Vidxyz/vidxyz.github.io/master/assets/pdf/resume.pdf"));
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: AutoSizeText(
                        "DOWNLOAD PDF",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.oswald(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100.0,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: designProcesses.map((p) {
              return SizedBox(
                height: 175,
                width: kDesktopMaxWidth / 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          p.imagePath,
                          width: 40.0,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          p.title,
                          style: GoogleFonts.oswald(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      p.subtitle,
                      style: TextStyle(
                        color: kCaptionColor,
                        height: 1.5,
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
