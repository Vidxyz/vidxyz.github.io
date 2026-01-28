import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/education.dart';
import 'package:web_portfolio/pages/home/components/shared/bullet_list.dart';
import 'package:web_portfolio/pages/home/home.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<Education> educationList = [
  Education(
    institution: "University of Waterloo",
    description:
        "Five year in-person degree constituting 8 academic terms along with 6 co-op work terms",
    linkName: "Honours Computer Science",
    period: "2013 - 2018",
    courseWork: courseWork,
  ),

];

final List<String> courseWork = [
  "Computer Security and Privacy",
  "Machine Learning",
  "Artificial Intelligence",
  "Computer Networks",
  "Distributed Systems",
  "User Interfaces",
  "Operating Systems",
  "Algorithms & Data Structures",
  "Database Design & Management",
  "Object Oriented Software Development",
  "Software Design & Architecture",
  "Computer Organization & Design",
  "Logic Numerical Computation",
];

class EducationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: educationKey,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Container(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width,
          minWidth: width,
        ),
        // defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "EDUCATION",
                style: GoogleFonts.inter(
                  color: kTextPrimary,
                  fontWeight: FontWeight.w900,
                  fontSize: 42.0,
                  height: 1.3,
                  letterSpacing: -1.0,
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  child: Wrap(
                    // spacing: 20.0,
                    // runSpacing: 20.0,
                    children: educationList
                        .map(
                          (education) => Container(
                            padding: EdgeInsets.all(32),
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
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 15,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                            width: constraints.maxWidth / 1.25 - 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        gradient: kPrimaryGradient,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Icon(
                                        Icons.school,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            education.institution,
                                            style: GoogleFonts.inter(
                                              color: kTextPrimary,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 28.0,
                                              letterSpacing: -0.5,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            education.period,
                                            style: GoogleFonts.inter(
                                              color: kCaptionColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: kPrimaryColor.withOpacity(0.5),
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    education.linkName,
                                    style: TextStyle(
                                      color: kPrimaryColorLight,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  education.description,
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: kCaptionColor,
                                    height: 1.6,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 24),
                                InlineBulletList(
                                  education.courseWork,
                                  singleLine: true,
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
