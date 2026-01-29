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
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kSurfaceColor,
                  kSurfaceColor.withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Text(
              "I'M A SOFTWARE ENGINEER WHO LOVES DESIGNING REACTIVE AND SCALABLE SYSTEMS",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: kTextPrimary,
                fontWeight: FontWeight.w700,
                height: 1.6,
                fontSize: 20.0,
                letterSpacing: 0.5,
              ),
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
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse("https://vidxyz.github.io/resume"));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      decoration: BoxDecoration(
                        color: kSurfaceColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: kPrimaryColor.withOpacity(0.3),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: AutoSizeText(
                          "VIEW RESUME",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: kPrimaryColorLight,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse("https://raw.githubusercontent.com/Vidxyz/vidxyz.github.io/master/assets/pdf/resume.pdf"));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: kPrimaryColor.withOpacity(0.3),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: AutoSizeText(
                          "DOWNLOAD PDF",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                            letterSpacing: 0.5,
                          ),
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
            spacing: 20.0,
            runSpacing: 20.0,
            children: designProcesses.map((p) {
              return Container(
                width: (width - 60) / 4,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: kSurfaceColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        p.imagePath,
                        width: 32.0,
                        color: kPrimaryColorLight,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      p.title,
                      style: GoogleFonts.inter(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: kTextPrimary,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      p.subtitle,
                      style: TextStyle(
                        color: kCaptionColor,
                        height: 1.6,
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
