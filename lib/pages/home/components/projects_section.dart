import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/models/project.dart';
import 'package:web_portfolio/pages/home/components/shared/hover_container.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<Project> projectsList = [
  Project(
      projectName: "Fitcentive",
      platforms: "IOS / ANDROID / WEB",
      description: "Social fitness app aimed at helping you discover people with similar interests to help you on your journey.",
      tech: "Scala, Elixir, Flutter, Terraform, Kubernetes, GCP, Neo4j, Postgres",
      asset: "dev_header.png",
      keyFeatures: [
        "Reactive system made up of 12+ microservices",
        "Highly scalable Infrastructure-as-Code",
        "Secure logins with optional user SSO",
        "Real-time distributed chat server",
        "Scheduled and real-time push notifications",
        "Integrated with FourSquare, FatSecret and Wger APIs"
      ],
      repoUrl: "https://github.com/orgs/Fitcentive/repositories"
  ),
  Project(
      projectName: "ClueIn",
      platforms: "IOS / ANDROID / WEB",
      description: "Companion app to help you play the board game 'Clue'. \nNote your observations and let ClueIn infer useful conclusions for you to solve the puzzle!",
      tech: "Flutter",
      appStoreLink: "https://apps.apple.com/ca/app/cluein/id6468943892",
      playStoreLink: "https://play.google.com/store/apps/details?id=app.cluein.cluein_app",
      websiteLink: "https://vidxyz.github.io/ClueIn",
      asset: "dev_cluein.png",
      repoUrl: "https://github.com/Vidxyz/ClueIn",
      keyFeatures: [
        "Paper free alternative to playing a game of Clue",
        "Automatic inferences assist you while keeping up with observations",
        "Save games to local storage for retrieval later",
      ]
  ),
  Project(
      projectName: "SpaceJunk",
      platforms: "IOS / ANDROID ",
      description: "Platformer-style mobile game to keep you entertained momentarily",
      tech: "Java, Android, iOS, LibGDX, XML",
      asset: "dev_spacejunk.png",
      appStoreLink: "https://apps.apple.com/ca/app/spacejunk/id6469627395",
      playStoreLink: "https://play.google.com/store/apps/details?id=com.spacejunk.game",
      repoUrl: "https://github.com/Vidxyz/SpaceJunk2.0",
      keyFeatures: [
        "Infinite level generation",
        "Made up of rendering sprites and assets to simulate game flow",
        "Can capture and share gameplay content via Facebook",
      ]
  ),
  Project(
    projectName: "President AI",
    platforms: "DESKTOP",
    tech: "Scala, Swing",
    description: "Swing GUI application that lets you play the card game President",
    repoUrl: "https://github.com/Vidxyz/PresidentAI",
    asset: "dev_president.png",
    keyFeatures: [
      "Multi-round game hierarchy respected. Each round has repercussions on the next",
      "Hint feature provides you with the optimal move for the current game situation",
      "Built using functional principles interspersed with object-oriented design"
    ]
  ),
  Project(
      projectName: "CarPedia",
      platforms: "IOS / ANDROID",
      tech: "Dart, Flutter, Elixir, Phoenix, Absinthe, Python, Docker, Postgres",
      description: "Cross platform mobile application that allows you to view, filter and save data pertaining ot thousands of cars, with data being served by a Rest/GraphQL API",
      repoUrl: "https://github.com/Vidxyz/CarDataMobileApp",
      asset: "dev_carpedia.png",
      keyFeatures: [
        "Elixir backend-for-frontend serves data via GraphQL APIs",
        "Includes lightweight Python data-pipeline to ingest data from dataset into database",
        "Data scraper included to optionally fetch images if required"
      ]
  ),
  Project(
      projectName: "FlappyBird",
      platforms: "ANDROID",
      tech: "Java, Android, LibGDX, XML",
      description: "My take on the popular mobile game FlappyBird",
      repoUrl: "https://github.com/Vidxyz/FlappyBird",
      asset: "dev_flappybird.png",
      keyFeatures: [
        "Manipulate virtual coordinate systems to simulate bird physics",
        "Infinite level generation",
      ]
  ),
  // Project(
  //     projectName: "MyExpenses",
  //     tech: "Java, XML, Android Studio, Parse",
  //     description: "Android application that I developed to help me manage my expenses by providing metrics and insights into my spending",
  //     repoUrl: "https://github.com/Vidxyz/My-Expenses",
  //     asset: "dev_header.png"
  // ),
  // Project(
  //     projectName: "YelpCamp",
  //     tech: "Express, Node.JS, HTML, CSS, JS, jQuery, MongoDB",
  //     description: "Web application with a Yelp-like interface for campgrounds which provides facilities to create accounts, log-in, and post",
  //     repoUrl: "https://github.com/Vidxyz/YelpCamp",
  //     asset: "dev_header.png"
  // ),
  // Project(
  //     projectName: "LifeTexts",
  //     tech: "Express, Node.JS, Twilio API",
  //     description: "A text based app which can be used to fetch the weather, transit directions, news and various other pieces of information without internet access",
  //     repoUrl: "https://github.com/rahulch95/LifeTexts",
  //     asset: "dev_header.png"
  // ),
];

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, isDesktop: true),
        tablet: _buildUi(kTabletMaxWidth, isTablet: true),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width, {bool isDesktop = false, bool isTablet = false}) {
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
            SizedBox(
              height: 40.0,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  child: Wrap(
                    spacing: 50.0,
                    runSpacing: 100.0,
                    children: projectsList
                        .asMap()
                        .entries
                        .map(
                          (exp) {
                            if (!isDesktop && !isTablet) {
                              return Center(
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    return ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: width,
                                        minWidth: width,
                                      ),
                                      // defaultScale: false,
                                      child: Container(
                                        child: Flex(
                                          direction: constraints.maxWidth > 720
                                              ? Axis.horizontal
                                              : Axis.vertical,
                                          children: [
                                            // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                                            Expanded(
                                              flex: constraints.maxWidth > 720.0 ? 1 : 0,
                                              child: HoverContainer(
                                                hoverLimit: 50,
                                                child: Image.asset(
                                                  "assets/${exp.value.asset}",
                                                  // Set width for image on smaller screen
                                                  width: constraints.maxWidth > 720.0 ? null : 350.0,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Expanded(
                                              flex: constraints.maxWidth > 720.0 ? 1 : 0,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 25),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      exp.value.platforms,
                                                      style: GoogleFonts.oswald(
                                                        color: kPrimaryColor,
                                                        fontWeight: FontWeight.w900,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    Text(
                                                      exp.value.projectName,
                                                      style: GoogleFonts.oswald(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w900,
                                                        height: 1.3,
                                                        fontSize: 35.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Text(
                                                      exp.value.description,
                                                      style: TextStyle(
                                                        color: kCaptionColor,
                                                        height: 1.5,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    Wrap(
                                                      children: [
                                                        Text(
                                                          "Technologies: ",
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white,
                                                            height: 1.5,
                                                            fontSize: 15.0,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text(
                                                          exp.value.tech,
                                                          style: TextStyle(
                                                            color: kCaptionColor,
                                                            height: 1.5,
                                                            fontSize: 15.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    Text(
                                                      "Key features: ",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                        height: 1.5,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    ...exp.value.keyFeatures.map((e) {
                                                      return Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Padding(
                                                            // hacky fix to center
                                                            padding: const EdgeInsets.only(top: 4.25),
                                                            child: CircleAvatar(
                                                              radius: 5,
                                                              backgroundColor: kCaptionColor,
                                                            ),
                                                          ),
                                                          SizedBox(width: 10,),
                                                          Expanded(
                                                            child: Text(
                                                              e,
                                                              maxLines: 3,
                                                              style: TextStyle(
                                                                color: kCaptionColor,
                                                                height: 1.5,
                                                                fontSize: 15.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    }),
                                                    SizedBox(
                                                      height: 25.0,
                                                    ),
                                                    Wrap(
                                                      alignment: WrapAlignment.center,
                                                      spacing: 5,
                                                      runSpacing: 5,
                                                      children: [
                                                        Center(
                                                          child: MouseRegion(
                                                            cursor: SystemMouseCursors.click,
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                color: kPrimaryColor,
                                                                borderRadius: BorderRadius.circular(8.0),
                                                              ),
                                                              height: 48.0,
                                                              padding: EdgeInsets.symmetric(
                                                                horizontal: 28.0,
                                                              ),
                                                              child: TextButton(
                                                                onPressed: () {
                                                                  launchUrl(Uri.parse(exp.value.repoUrl));
                                                                },
                                                                child: FittedBox(
                                                                  fit: BoxFit.contain,
                                                                  child: Text(
                                                                    "VIEW SOURCE",
                                                                    style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 12.0,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        ...(exp.value.websiteLink != null ? [
                                                          SizedBox(
                                                            width: 12.5,
                                                          ),
                                                          Center(
                                                            child: MouseRegion(
                                                              cursor: SystemMouseCursors.click,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: kPrimaryColor,
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                ),
                                                                height: 48.0,
                                                                padding: EdgeInsets.symmetric(
                                                                  horizontal: 28.0,
                                                                ),
                                                                child: TextButton(
                                                                  onPressed: () {
                                                                    launchUrl(Uri.parse(exp.value.websiteLink!));
                                                                  },
                                                                  child: Center(
                                                                    child: Text(
                                                                      "VIEW IN BROWSER",
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 12.0,
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ] : []),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Wrap(
                                                      alignment: WrapAlignment.center,
                                                      spacing: 5,
                                                      children: [
                                                        ...(exp.value.appStoreLink != null ? [
                                                          Center(
                                                            child: MouseRegion(
                                                              cursor: SystemMouseCursors.click,
                                                              child: SizedBox(
                                                                height: 60,
                                                                width: 120,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    launchUrl(Uri.parse(exp.value.appStoreLink!));
                                                                  },
                                                                  child: FittedBox(
                                                                    child: Image.asset(
                                                                      'assets/app-store-badge.png',
                                                                      fit: BoxFit.contain,
                                                                    ),
                                                                    fit: BoxFit.contain,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ] : []),
                                                        ...(exp.value.playStoreLink != null ? [
                                                          Center(
                                                            child: MouseRegion(
                                                              cursor: SystemMouseCursors.click,
                                                              child: SizedBox(
                                                                height: 70,
                                                                width: 135,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    launchUrl(Uri.parse(exp.value.playStoreLink!));
                                                                  },
                                                                  child: FittedBox(
                                                                    child: Image.asset(
                                                                      'assets/google-play-badge.png',
                                                                      fit: BoxFit.contain,
                                                                    ),
                                                                    fit: BoxFit.contain,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ] : []),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }

                            if (isTablet) {
                              return Center(
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    return ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: width,
                                        minWidth: width,
                                      ),
                                      // defaultScale: false,
                                      child: Container(
                                        child: Flex(
                                          direction: constraints.maxWidth > 720
                                              ? Axis.horizontal
                                              : Axis.vertical,
                                          children: [
                                            // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                                            Expanded(
                                              flex: constraints.maxWidth > 720.0 ? 1 : 0,
                                              child: HoverContainer(
                                                hoverLimit: 50,
                                                child: Image.asset(
                                                  "assets/${exp.value.asset}",
                                                  // Set width for image on smaller screen
                                                  width: constraints.maxWidth > 720.0 ? null : 350.0,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Expanded(
                                              flex: constraints.maxWidth > 720.0 ? 1 : 0,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 25),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      exp.value.platforms,
                                                      style: GoogleFonts.oswald(
                                                        color: kPrimaryColor,
                                                        fontWeight: FontWeight.w900,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    Text(
                                                      exp.value.projectName,
                                                      style: GoogleFonts.oswald(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w900,
                                                        height: 1.3,
                                                        fontSize: 35.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Text(
                                                      exp.value.description,
                                                      style: TextStyle(
                                                        color: kCaptionColor,
                                                        height: 1.5,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    Wrap(
                                                      children: [
                                                        Text(
                                                          "Technologies: ",
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white,
                                                            height: 1.5,
                                                            fontSize: 15.0,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text(
                                                          exp.value.tech,
                                                          style: TextStyle(
                                                            color: kCaptionColor,
                                                            height: 1.5,
                                                            fontSize: 15.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    Text(
                                                      "Key features: ",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                        height: 1.5,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    ...exp.value.keyFeatures.map((e) {
                                                      return Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Padding(
                                                            // hacky fix to center
                                                            padding: const EdgeInsets.only(top: 4.25),
                                                            child: CircleAvatar(
                                                              radius: 5,
                                                              backgroundColor: kCaptionColor,
                                                            ),
                                                          ),
                                                          SizedBox(width: 10,),
                                                          Expanded(
                                                            child: Text(
                                                              e,
                                                              maxLines: 3,
                                                              style: TextStyle(
                                                                color: kCaptionColor,
                                                                height: 1.5,
                                                                fontSize: 15.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    }),
                                                    SizedBox(
                                                      height: 25.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: MouseRegion(
                                                            cursor: SystemMouseCursors.click,
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                color: kPrimaryColor,
                                                                borderRadius: BorderRadius.circular(8.0),
                                                              ),
                                                              height: 48.0,
                                                              padding: EdgeInsets.symmetric(
                                                                horizontal: 28.0,
                                                              ),
                                                              child: TextButton(
                                                                onPressed: () {
                                                                  launchUrl(Uri.parse(exp.value.repoUrl));
                                                                },
                                                                child: FittedBox(
                                                                  fit: BoxFit.contain,
                                                                  child: Text(
                                                                    "VIEW SOURCE",
                                                                    style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 12.0,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        ...(exp.value.websiteLink != null ? [
                                                          SizedBox(
                                                            width: 12.5,
                                                          ),
                                                          Expanded(
                                                            child: MouseRegion(
                                                              cursor: SystemMouseCursors.click,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: kPrimaryColor,
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                ),
                                                                height: 48.0,
                                                                padding: EdgeInsets.symmetric(
                                                                  horizontal: 28.0,
                                                                ),
                                                                child: TextButton(
                                                                  onPressed: () {
                                                                    launchUrl(Uri.parse(exp.value.websiteLink!));
                                                                  },
                                                                  child: Center(
                                                                    child: FittedBox(
                                                                      fit: BoxFit.scaleDown,
                                                                      child: Text(
                                                                        "VIEW IN BROWSER",
                                                                        style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontSize: 12.0,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ] : []),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        ...(exp.value.appStoreLink != null ? [
                                                          MouseRegion(
                                                            cursor: SystemMouseCursors.click,
                                                            child: SizedBox(
                                                              height: 60,
                                                              width: 120,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  launchUrl(Uri.parse(exp.value.appStoreLink!));
                                                                },
                                                                child: FittedBox(
                                                                  child: Image.asset(
                                                                    'assets/app-store-badge.png',
                                                                    fit: BoxFit.contain,
                                                                  ),
                                                                  fit: BoxFit.contain,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ] : []),
                                                        ...(exp.value.playStoreLink != null ? [
                                                          MouseRegion(
                                                            cursor: SystemMouseCursors.click,
                                                            child: SizedBox(
                                                              height: 70,
                                                              width: 135,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  launchUrl(Uri.parse(exp.value.playStoreLink!));
                                                                },
                                                                child: FittedBox(
                                                                  child: Image.asset(
                                                                    'assets/google-play-badge.png',
                                                                    fit: BoxFit.contain,
                                                                  ),
                                                                  fit: BoxFit.contain,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ] : []),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }

                            else {
                              if (exp.key % 2 == 0) {
                                return Center(
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: width,
                                          minWidth: width,
                                        ),
                                        // defaultScale: false,
                                        child: Container(
                                          child: Flex(
                                            direction: constraints.maxWidth > 720
                                                ? Axis.horizontal
                                                : Axis.vertical,
                                            children: [
                                              // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                                              Expanded(
                                                flex: constraints.maxWidth > 720.0 ? 1 : 0,
                                                child: HoverContainer(
                                                  hoverLimit: 50,
                                                  child: Image.asset(
                                                    "assets/${exp.value.asset}",
                                                    // Set width for image on smaller screen
                                                    width: constraints.maxWidth > 720.0 ? null : 350.0,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: constraints.maxWidth > 720.0 ? 1 : 0,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 25),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        exp.value.platforms,
                                                        style: GoogleFonts.oswald(
                                                          color: kPrimaryColor,
                                                          fontWeight: FontWeight.w900,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15.0,
                                                      ),
                                                      Text(
                                                        exp.value.projectName,
                                                        style: GoogleFonts.oswald(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w900,
                                                          height: 1.3,
                                                          fontSize: 35.0,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Text(
                                                        exp.value.description,
                                                        style: TextStyle(
                                                          color: kCaptionColor,
                                                          height: 1.5,
                                                          fontSize: 15.0,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15.0,
                                                      ),
                                                      Wrap(
                                                        children: [
                                                          Text(
                                                            "Technologies: ",
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.white,
                                                              height: 1.5,
                                                              fontSize: 15.0,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10.0,
                                                          ),
                                                          Text(
                                                            exp.value.tech,
                                                            style: TextStyle(
                                                              color: kCaptionColor,
                                                              height: 1.5,
                                                              fontSize: 15.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 15.0,
                                                      ),
                                                      Text(
                                                        "Key features: ",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white,
                                                          height: 1.5,
                                                          fontSize: 15.0,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      ...exp.value.keyFeatures.map((e) {
                                                        return Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Padding(
                                                              // hacky fix to center
                                                              padding: const EdgeInsets.only(top: 4.25),
                                                              child: CircleAvatar(
                                                                radius: 5,
                                                                backgroundColor: kCaptionColor,
                                                              ),
                                                            ),
                                                            SizedBox(width: 10,),
                                                            Expanded(
                                                              child: Text(
                                                                e,
                                                                maxLines: 3,
                                                                style: TextStyle(
                                                                  color: kCaptionColor,
                                                                  height: 1.5,
                                                                  fontSize: 15.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      }),
                                                      SizedBox(
                                                        height: 25.0,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: MouseRegion(
                                                              cursor: SystemMouseCursors.click,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: kPrimaryColor,
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                ),
                                                                height: 48.0,
                                                                padding: EdgeInsets.symmetric(
                                                                  horizontal: 28.0,
                                                                ),
                                                                child: TextButton(
                                                                  onPressed: () {
                                                                    launchUrl(Uri.parse(exp.value.repoUrl));
                                                                  },
                                                                  child: FittedBox(
                                                                    fit: BoxFit.contain,
                                                                    child: Text(
                                                                      "VIEW SOURCE",
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 12.0,
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          ...(exp.value.websiteLink != null ? [
                                                            SizedBox(
                                                              width: 12.5,
                                                            ),
                                                            Expanded(
                                                              child: MouseRegion(
                                                                cursor: SystemMouseCursors.click,
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    color: kPrimaryColor,
                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                  ),
                                                                  height: 48.0,
                                                                  padding: EdgeInsets.symmetric(
                                                                    horizontal: 28.0,
                                                                  ),
                                                                  child: TextButton(
                                                                    onPressed: () {
                                                                      launchUrl(Uri.parse(exp.value.websiteLink!));
                                                                    },
                                                                    child: Center(
                                                                      child: Text(
                                                                        "VIEW IN BROWSER",
                                                                        style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontSize: 12.0,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ] : []),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          ...(exp.value.appStoreLink != null ? [
                                                            MouseRegion(
                                                              cursor: SystemMouseCursors.click,
                                                              child: SizedBox(
                                                                height: 60,
                                                                width: 120,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    launchUrl(Uri.parse(exp.value.appStoreLink!));
                                                                  },
                                                                  child: FittedBox(
                                                                    child: Image.asset(
                                                                      'assets/app-store-badge.png',
                                                                      fit: BoxFit.contain,
                                                                    ),
                                                                    fit: BoxFit.contain,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ] : []),
                                                          ...(exp.value.playStoreLink != null ? [
                                                            MouseRegion(
                                                              cursor: SystemMouseCursors.click,
                                                              child: SizedBox(
                                                                height: 70,
                                                                width: 135,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    launchUrl(Uri.parse(exp.value.playStoreLink!));
                                                                  },
                                                                  child: FittedBox(
                                                                    child: Image.asset(
                                                                      'assets/google-play-badge.png',
                                                                      fit: BoxFit.contain,
                                                                    ),
                                                                    fit: BoxFit.contain,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ] : []),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                              else {
                                return Center(
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: width,
                                          minWidth: width,
                                        ),
                                        // defaultScale: false,
                                        child: Container(
                                          child: Flex(
                                            direction: constraints.maxWidth > 720
                                                ? Axis.horizontal
                                                : Axis.vertical,
                                            children: [
                                              // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                                              Expanded(
                                                flex: constraints.maxWidth > 720.0 ? 1 : 0,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      exp.value.platforms,
                                                      style: GoogleFonts.oswald(
                                                        color: kPrimaryColor,
                                                        fontWeight: FontWeight.w900,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    Text(
                                                      exp.value.projectName,
                                                      style: GoogleFonts.oswald(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w900,
                                                        height: 1.3,
                                                        fontSize: 35.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Text(
                                                      exp.value.description,
                                                      style: TextStyle(
                                                        color: kCaptionColor,
                                                        height: 1.5,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    Wrap(
                                                      children: [
                                                        Text(
                                                          "Technologies: ",
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white,
                                                            height: 1.5,
                                                            fontSize: 15.0,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text(
                                                          exp.value.tech,
                                                          style: TextStyle(
                                                            color: kCaptionColor,
                                                            height: 1.5,
                                                            fontSize: 15.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    Text(
                                                      "Key features: ",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                        height: 1.5,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    ...exp.value.keyFeatures.map((e) {
                                                      return Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Padding(
                                                            // hacky fix to center
                                                            padding: const EdgeInsets.only(top: 4.25),
                                                            child: CircleAvatar(
                                                              radius: 5,
                                                              backgroundColor: kCaptionColor,
                                                            ),
                                                          ),
                                                          SizedBox(width: 10,),
                                                          Expanded(
                                                            child: Text(
                                                              e,
                                                              maxLines: 3,
                                                              style: TextStyle(
                                                                color: kCaptionColor,
                                                                height: 1.5,
                                                                fontSize: 15.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    }),
                                                    SizedBox(
                                                      height: 25.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: MouseRegion(
                                                            cursor: SystemMouseCursors.click,
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                color: kPrimaryColor,
                                                                borderRadius: BorderRadius.circular(8.0),
                                                              ),
                                                              height: 48.0,
                                                              padding: EdgeInsets.symmetric(
                                                                horizontal: 28.0,
                                                              ),
                                                              child: TextButton(
                                                                onPressed: () {
                                                                  launchUrl(Uri.parse(exp.value.repoUrl));
                                                                },
                                                                child: FittedBox(
                                                                  fit: BoxFit.contain,
                                                                  child: Text(
                                                                    "VIEW SOURCE",
                                                                    style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 12.0,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        ...(exp.value.websiteLink != null ? [
                                                          SizedBox(
                                                            width: 12.5,
                                                          ),
                                                          Expanded(
                                                            child: MouseRegion(
                                                              cursor: SystemMouseCursors.click,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: kPrimaryColor,
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                ),
                                                                height: 48.0,
                                                                padding: EdgeInsets.symmetric(
                                                                  horizontal: 28.0,
                                                                ),
                                                                child: TextButton(
                                                                  onPressed: () {
                                                                    launchUrl(Uri.parse(exp.value.websiteLink!));
                                                                  },
                                                                  child: Center(
                                                                    child: Text(
                                                                      "VIEW IN BROWSER",
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 12.0,
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ] : []),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        ...(exp.value.appStoreLink != null ? [
                                                          MouseRegion(
                                                            cursor: SystemMouseCursors.click,
                                                            child: SizedBox(
                                                              height: 60,
                                                              width: 120,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  launchUrl(Uri.parse(exp.value.appStoreLink!));
                                                                },
                                                                child: FittedBox(
                                                                  child: Image.asset(
                                                                    'assets/app-store-badge.png',
                                                                    fit: BoxFit.contain,
                                                                  ),
                                                                  fit: BoxFit.contain,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ] : []),
                                                        ...(exp.value.playStoreLink != null ? [
                                                          MouseRegion(
                                                            cursor: SystemMouseCursors.click,
                                                            child: SizedBox(
                                                              height: 70,
                                                              width: 135,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  launchUrl(Uri.parse(exp.value.playStoreLink!));
                                                                },
                                                                child: FittedBox(
                                                                  child: Image.asset(
                                                                    'assets/google-play-badge.png',
                                                                    fit: BoxFit.contain,
                                                                  ),
                                                                  fit: BoxFit.contain,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ] : []),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25.0,
                                              ),
                                              Expanded(
                                                flex: constraints.maxWidth > 720.0 ? 1 : 0,
                                                child: HoverContainer(
                                                  hoverLimit: 50,
                                                  child: Image.asset(
                                                    "assets/${exp.value.asset}",
                                                    // Set width for image on smaller screen
                                                    width: constraints.maxWidth > 720.0 ? null : 350.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            }

                          },
                    )
                        .toList(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 75,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  launchUrl(Uri.parse("https://vidxyz.github.io/resume"));
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    "VIEW MORE OF MY PROJECTS HERE",
                    style: GoogleFonts.oswald(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
