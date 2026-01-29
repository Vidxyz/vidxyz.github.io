import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/models/header_item.dart';
import 'package:web_portfolio/models/patent.dart';
import 'package:web_portfolio/pages/home/components/carousel.dart';
import 'package:web_portfolio/pages/home/components/cv_section.dart';
import 'package:web_portfolio/pages/home/components/education_section.dart';
import 'package:web_portfolio/pages/home/components/experience_section.dart';
import 'package:web_portfolio/pages/home/components/footer.dart';
import 'package:web_portfolio/pages/home/components/header.dart';
import 'package:web_portfolio/pages/home/components/portfolio_stats.dart';
import 'package:web_portfolio/pages/home/components/projects_section.dart';
import 'package:web_portfolio/pages/home/components/shared/circular_container.dart';
import 'package:web_portfolio/pages/home/components/shared/custom_card.dart';
import 'package:web_portfolio/pages/home/components/skill_section.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/globals.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

class Home extends StatefulWidget {

  const Home();

  @override
  State createState() {
    return HomeState();
  }
}

final homeSectionKey = GlobalKey();
final aboutMeSectionKey = GlobalKey();
final skillSectionKey = GlobalKey();
final projectsKey = GlobalKey();
final patentsKey = GlobalKey();
final experienceKey = GlobalKey();
final educationKey = GlobalKey();
final reachOutKey = GlobalKey();

final List<Patent> patents = [
  Patent(
      name: "Fraud Detection using Graph Databases",
      code: "US11316874B2",
      url: "https://patents.google.com/patent/US11316874B2/en"
  )
];

class HomeState extends State<Home> {

  final  ScrollController scrollController = ScrollController();

  List<HeaderItem> headerItems = [];

  static const double toolbarHeight = 100;
  final defaultDuration = Duration(milliseconds: 350);

  bool toHighLight = false;
  Timer? timer;


  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // Scroll controller is active
    });

    headerItems = [
      HeaderItem(
        title: "HOME",
        onTap: () {
          final context = homeSectionKey.currentContext;
          if (context != null) {
            Scrollable.ensureVisible(
              context,
              duration: defaultDuration,
              curve: Curves.easeInOut,
            );
          }
        },
      ),
      HeaderItem(title: "ABOUT ME", onTap: () {
        final context = aboutMeSectionKey.currentContext;
        if (context != null) {
          Scrollable.ensureVisible(
            context,
            duration: defaultDuration,
            curve: Curves.easeInOut,
          ).then((value) {
            if (scrollController.hasClients) {
              scrollController.animateTo(
                scrollController.offset - toolbarHeight - 25,
                duration: Duration(milliseconds: 100),
                curve: Curves.easeOut
              );
            }
          });
        }
      }),
      HeaderItem(title: "SKILLS", onTap: () {
        final context = skillSectionKey.currentContext;
        if (context != null) {
          Scrollable.ensureVisible(
            context,
            duration: defaultDuration,
            curve: Curves.easeInOut,
          ).then((value) {
            if (scrollController.hasClients) {
              scrollController.animateTo(
                scrollController.offset - toolbarHeight - 25,
                duration: Duration(milliseconds: 100),
                curve: Curves.easeOut
              );
            }
          });
        }
      }),
      HeaderItem(title: "PROJECTS", onTap: () {
        final context = projectsKey.currentContext;
        if (context != null) {
          Scrollable.ensureVisible(
            context,
            duration: defaultDuration,
            curve: Curves.easeInOut,
          ).then((value) {
            if (scrollController.hasClients) {
              scrollController.animateTo(
                scrollController.offset - toolbarHeight - 25,
                duration: Duration(milliseconds: 100),
                curve: Curves.easeOut
              );
            }
          });
        }
      }),
      HeaderItem(title: "PATENTS", onTap: () {
        final context = patentsKey.currentContext;
        if (context != null) {
          Scrollable.ensureVisible(
            context,
            duration: defaultDuration,
            curve: Curves.easeInOut,
          ).then((value) {
            if (scrollController.hasClients) {
              scrollController.animateTo(
                scrollController.offset - toolbarHeight - 25,
                duration: Duration(milliseconds: 100),
                curve: Curves.easeOut
              );
            }
          });
        }
      }),
      HeaderItem(title: "EXPERIENCE", onTap: () {
        final context = experienceKey.currentContext;
        if (context != null) {
          Scrollable.ensureVisible(
            context,
            duration: defaultDuration,
            curve: Curves.easeInOut,
          ).then((value) {
            if (scrollController.hasClients) {
              scrollController.animateTo(
                scrollController.offset - toolbarHeight - 25,
                duration: Duration(milliseconds: 100),
                curve: Curves.easeOut
              );
            }
          });
        }
      }),
      HeaderItem(title: "EDUCATION", onTap: () {
        final context = educationKey.currentContext;
        if (context != null) {
          Scrollable.ensureVisible(
            context,
            duration: defaultDuration,
            curve: Curves.easeInOut,
          ).then((value) {
            if (scrollController.hasClients) {
              scrollController.animateTo(
                scrollController.offset - toolbarHeight - 25,
                duration: Duration(milliseconds: 100),
                curve: Curves.easeOut
              );
            }
          });
        }
      }),
      HeaderItem(
        title: "REACH OUT",
        onTap: () {
          setState(() {
            toHighLight = true;
          });
          timer?.cancel();
          timer = Timer(Duration(milliseconds: 500), () {
            setState(() {
              toHighLight = false;
            });
          });

          final context = reachOutKey.currentContext;
          if (context != null) {
            Scrollable.ensureVisible(
              context,
              duration: defaultDuration,
              curve: Curves.easeInOut,
            ).then((value) {
              if (scrollController.hasClients) {
                scrollController.animateTo(
                  scrollController.offset - toolbarHeight - 25,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.easeOut
                );
              }
            });
          }
        },
        isButton: true,
      ),
    ];

  }

  @override
  void dispose() {
    scrollController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        backgroundColor: kBackgroundColor,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [kPrimaryColorDark, kPrimaryColor],
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryColorDark.withOpacity(0.3),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
                          child: TextButton(
                            onPressed: () {
                              headerItems[index].onTap();
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              headerItems[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        onTap: () {
                          headerItems[index].onTap();
                          Navigator.of(context).pop();
                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        title: Text(
                          headerItems[index].title,
                          style: TextStyle(
                            color: kTextPrimary,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 8.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: Container(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                toolbarHeight: toolbarHeight,
                automaticallyImplyLeading: false,
                actions: <Widget>[Container()],
                backgroundColor: Colors.transparent,
                elevation: 0,
                floating: true,
                pinned: true,
                title: Container(
                  child: Header(headerItems),
                ),
              )
            ];
          },
          body: Container(
            child: Builder(
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        kBackgroundColor,
                        kBackgroundColorLight,
                      ],
                    ),
                  ),
                  child: SelectionArea(
                    child: Scrollbar(
                      controller: scrollController,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenHelper.isMobile(context) ? 24 : 75,
                          ),
                          child: Column(
                            children: [
                        Carousel(),
                        SizedBox(
                          height: 20.0,
                        ),
                        CvSection(),
                        SizedBox(
                          height: 50.0,
                        ),
                        PortfolioStats(),
                        SizedBox(
                          height: 100.0,
                        ),
                        SkillSection(),
                        SizedBox(
                          height: 50.0,
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Center(
                          key: projectsKey,
                          child: Column(
                            children: [
                              Text(
                                "PROJECTS",
                                style: GoogleFonts.inter(
                                  color: kTextPrimary,
                                  fontWeight: FontWeight.w900,
                                  height: 1.3,
                                  fontSize: 42.0,
                                  letterSpacing: -1.0,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Here are a few cool side projects that I've worked on",
                                style: TextStyle(
                                  color: kCaptionColor,
                                  height: 1.5,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        ProjectsSection(),
                        SizedBox(
                          height: 100.0,
                        ),
                        Center(
                          key: patentsKey,
                          child: Text(
                            "PATENTS",
                            style: GoogleFonts.inter(
                              color: kTextPrimary,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 42.0,
                              letterSpacing: -1.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        _patentCard(),
                        SizedBox(
                          height: 100.0,
                        ),
                        Center(
                          key: experienceKey,
                          child: Text(
                            "EXPERIENCE",
                            style: GoogleFonts.inter(
                              color: kTextPrimary,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 42.0,
                              letterSpacing: -1.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        ExperienceSection(),
                        SizedBox(
                          height: 50.0,
                        ),
                        EducationSection(),
                        SizedBox(
                          height: 50.0,
                        ),
                        Center(
                          child: Text(
                            "GET IN TOUCH",
                            key: reachOutKey,
                            style: GoogleFonts.inter(
                              color: kTextPrimary,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 42.0,
                              letterSpacing: -1.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Footer(toHighLight),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  _patentCard() {
    return Column(
      children: patents.map((e) {
        return Center(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                launchUrl(Uri.parse(e.url));
              },
              child: Container(
                width: 600,
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      kSurfaceColor,
                      kSurfaceColor.withOpacity(0.9),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: kPrimaryColor.withOpacity(0.3),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 5,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: kPrimaryColor.withOpacity(0.4),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.science_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kTextPrimary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            e.code,
                            style: TextStyle(
                              fontSize: 16,
                              color: kCaptionColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                      color: kPrimaryColorLight,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

}
