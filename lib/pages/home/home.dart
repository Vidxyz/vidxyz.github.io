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

    headerItems = [
      HeaderItem(
        title: "HOME",
        onTap: () {
          Scrollable.ensureVisible(
              homeSectionKey.currentContext!,
              duration: defaultDuration
          );
        },
      ),
      HeaderItem(title: "ABOUT ME", onTap: () {
        Scrollable.ensureVisible(
            aboutMeSectionKey.currentContext!,
          duration: defaultDuration
        ).then((value) =>
            scrollController
                .animateTo(
                scrollController.offset - toolbarHeight - 25,
                duration: Duration(milliseconds: 100),
                curve: Curves.easeOut
            )
        );
      }),
      HeaderItem(title: "SKILLS", onTap: () {
        Scrollable.ensureVisible(
            skillSectionKey.currentContext!,
            duration: defaultDuration
        ).then((value) =>
            scrollController
                .animateTo(
                scrollController.offset - toolbarHeight - 25,
                duration: Duration(milliseconds: 100),
                curve: Curves.easeOut
            )
        );
      }),
      HeaderItem(title: "PROJECTS", onTap: () {
        Scrollable.ensureVisible(
            projectsKey.currentContext!,
            duration: defaultDuration
        ).then((value) =>
            scrollController
                .animateTo(
                scrollController.offset - toolbarHeight - 25,
                duration: Duration(milliseconds: 100),
                curve: Curves.easeOut
            )
        );
      }),
      HeaderItem(title: "PATENTS", onTap: () {
        Scrollable.ensureVisible(
            patentsKey.currentContext!,
            duration: defaultDuration
        ).then((value) =>
            scrollController
                .animateTo(
                scrollController.offset - toolbarHeight - 25,
                duration: Duration(milliseconds: 100),
                curve: Curves.easeOut
            )
        );
      }),
      HeaderItem(title: "EXPERIENCE", onTap: () {
        Scrollable.ensureVisible(
            experienceKey.currentContext!,
            duration: defaultDuration
        ).then((value) =>
            scrollController
                .animateTo(
                scrollController.offset - toolbarHeight - 25,
                duration: Duration(milliseconds: 100),
                curve: Curves.easeOut
            )
        );
      }),
      HeaderItem(title: "EDUCATION", onTap: () {
        Scrollable.ensureVisible(
            educationKey.currentContext!,
            duration: defaultDuration
        ).then((value) =>
            scrollController
                .animateTo(
                scrollController.offset - toolbarHeight - 25,
                duration: Duration(milliseconds: 100),
                curve: Curves.easeOut
            )
        );
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

          Scrollable.ensureVisible(
              reachOutKey.currentContext!,
              duration: defaultDuration
          ).then((value) =>
              scrollController
                  .animateTo(
                  scrollController.offset - toolbarHeight - 25,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.easeOut
              )
          );
        },
        isButton: true,
      ),
    ];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItems[index].onTap,
                            child: Text(
                              headerItems[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        onTap: headerItems[index].onTap,
                        title: Text(
                          headerItems[index].title,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.0,
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
                backgroundColor: kBackgroundColor,
                floating: true,
                pinned: true,
                title: Container(
                  child: Header(headerItems),
                ),
              )
            ];
          },
          body: Container(
            child: Builder(builder: (context) {
              return Scrollbar(
                controller: scrollController,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    padding: EdgeInsets.only(left: 75, right: 75),
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
                          child: Text(
                            "PROJECTS",
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 35.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Center(
                          child: Text(
                            "Here are a few cool side projects that I've worked on",
                            style: TextStyle(
                              color: kCaptionColor,
                              height: 1.5,
                              fontSize: 16.0,
                            ),
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
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 35.0,
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
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 35.0,
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
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 35.0,
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
              );
            },),
          ),
        ),
      ),
    );
  }

  _patentCard() {
    return Column(
      children: patents.map((e) {
        return Center(
          child: Container(
            alignment: Alignment.center,
            height: 350,
            width: 1000,
            child: Container(
              width: 450,
              height: 300,
              padding: new EdgeInsets.fromLTRB(20,20,20,20),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: kPrimaryColor.withOpacity(0.75),
                  boxShadow: [new BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10.0,
                    spreadRadius: 5,
                    offset: Offset(
                      5.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 10 Vertically
                    ),

                  ),]
              ),
              child: InkWell(
                onTap: () {
                  launchUrl(Uri.parse(e.url));
                },
                child: CustomCard(
                  width: 200,
                  height: 200,
                  hasAnimation: true,
                  leading: CircularContainer(
                    width: 100,
                    height: 100,
                    iconSize: 50,
                    backgroundColor: kPrimaryColor,
                    iconColor: Colors.white,
                    iconData: Icons.science_outlined,
                  ),
                  title: SizedBox(
                    width: 175,
                    child: Text(
                      e.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  subtitle: Flexible(
                    child: Text(
                      e.code,
                      style: TextStyle(
                          fontSize: 14
                      ),
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 32,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

}
