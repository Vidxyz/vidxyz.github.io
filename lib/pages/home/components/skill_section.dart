import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devicon/flutter_devicon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/models/skill.dart';
import 'package:web_portfolio/pages/home/components/shared/hover_container.dart';
import 'package:web_portfolio/pages/home/home.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

List<Skill> softSkills = [
  Skill(
    skill: "API Development",
    percentage: 95,
  ),
  Skill(
    skill: "Cloud Infrastructure (as code)",
    percentage: 90,
  ),
  Skill(
    skill: "Systems Design",
    percentage: 90,
  ),
  Skill(
    skill: "Databases",
    percentage: 85,
  ),
  Skill(
    skill: "Data Pipelines",
    percentage: 80,
  ),
  Skill(
    skill: "UI/UX Development",
    percentage: 70,
  ),

];

List<Skill> languages = [
  Skill(
    skill: "Scala - Akka / Play",
    percentage: 90,
  ),
  Skill(
    skill: "Kubernetes - Minikube / GKE / EKS / AKS",
    percentage: 85,
  ),
  Skill(
    skill: "Python - FastAPI / Flask / Django",
    percentage: 85,
  ),
  Skill(
    skill: "Terraform - GCP / AWS / Azure",
    percentage: 85,
  ),
  Skill(
    skill: "Flutter - Dart",
    percentage: 80,
  ),
  Skill(
    skill: "Elixir - Phoenix / Ecto",
    percentage: 80,
  ),
  Skill(
    skill: "JavaScript - React / React Native / Express",
    percentage: 80,
  ),
  Skill(
    skill: "Java/Kotlin - Spring / KTor / Android",
    percentage: 70,
  ),

];

final List<Tuple2<IconData, String>> icons = [
  Tuple2(FlutterDEVICON.scala_plain_wordmark, "https://www.scala-lang.org/"),

  Tuple2(FlutterDEVICON.amazonwebservices_plain_wordmark, "https://aws.amazon.com/"),


  Tuple2(FlutterDEVICON.flutter_plain, "https://flutter.dev/"),
  Tuple2(FlutterDEVICON.react_original_wordmark, "https://react.dev/"),
  Tuple2(FlutterDEVICON.java_plain_wordmark, "https://www.java.com/en/"),
  Tuple2(FlutterDEVICON.android_plain_wordmark, "https://developer.android.com/studio"),
  Tuple2(FlutterDEVICON.apple_original, "https://www.apple.com/ca/swift/"),


  Tuple2(FlutterDEVICON.python_plain_wordmark, "https://www.python.org/"),
  Tuple2(FlutterDEVICON.django_plain, "https://www.djangoproject.com/"),

  Tuple2(FlutterDEVICON.erlang_plain_wordmark, "https://www.erlang.org/"),

  Tuple2(FlutterDEVICON.nodejs_plain_wordmark, "https://nodejs.org/en"),
  Tuple2(FlutterDEVICON.express_original_wordmark, "https://expressjs.com/"),


  Tuple2(FlutterDEVICON.docker_plain_wordmark, "https://www.docker.com/"),
  Tuple2(FlutterDEVICON.gatling_plain_wordmark, "https://gatling.io/"),
  Tuple2(FlutterDEVICON.intellij_plain_wordmark, "https://www.jetbrains.com/idea/"),
  Tuple2(FlutterDEVICON.bitbucket_original_wordmark, "https://bitbucket.org/product"),
  Tuple2(FlutterDEVICON.github_original_wordmark, "https://github.com/"),
  Tuple2(FlutterDEVICON.gitlab_plain_wordmark, "https://gitlab.com/"),

  Tuple2(FlutterDEVICON.postgresql_plain_wordmark, "https://www.postgresql.org/"),
  Tuple2(FlutterDEVICON.redis_plain_wordmark, "https://redis.io/"),
  Tuple2(FlutterDEVICON.mysql_plain_wordmark, "https://www.mysql.com/"),
  Tuple2(FlutterDEVICON.mongodb_plain_wordmark, "https://www.mongodb.com/"),


  Tuple2(FlutterDEVICON.javascript_plain, "https://www.javascript.com/"),
  Tuple2(FlutterDEVICON.typescript_plain, "https://www.typescriptlang.org/"),
  Tuple2(FlutterDEVICON.jquery_plain_wordmark, "https://jquery.com/"),
  Tuple2(FlutterDEVICON.html5_plain_wordmark, "https://developer.mozilla.org/en-US/docs/Glossary/HTML5"),
  Tuple2(FlutterDEVICON.css3_plain_wordmark, "https://www.w3.org/Style/CSS/Overview.en.html"),
  Tuple2(FlutterDEVICON.bootstrap_plain_wordmark, "https://getbootstrap.com/"),

  Tuple2(FlutterDEVICON.cplusplus_plain, "https://cplusplus.com/"),
  Tuple2(FlutterDEVICON.apache_line_wordmark, "https://httpd.apache.org/"),

  Tuple2(FlutterDEVICON.debian_plain_wordmark, "https://www.debian.org/"),
  Tuple2(FlutterDEVICON.redhat_plain_wordmark, "https://www.redhat.com/en"),
  Tuple2(FlutterDEVICON.ubuntu_plain_wordmark, "https://ubuntu.com/"),


];

final extraIconAssets = [
  Tuple2("terraform.png", "https://www.terraform.io/"),
  Tuple2("gcp.png", "https://cloud.google.com/"),
  Tuple2("azure.png", "https://azure.microsoft.com/en-ca"),
  Tuple2("neo4j.png", "https://neo4j.com/"),
  Tuple2("k8s.png", "https://kubernetes.io/"),
  Tuple2("akka.png", "https://akka.io/"),
  Tuple2("play.png", "https://www.playframework.com/"),
  Tuple2("elixir.png", "https://elixir-lang.org/"),
  Tuple2("airflow.png", "https://airflow.apache.org/"),
  Tuple2("fastapi.png", "https://fastapi.tiangolo.com/"),
  Tuple2("circleci.png", "https://circleci.com/"),
];

class SkillSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: skillSectionKey,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: width,
                  minWidth: width,
                ),
                child: Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 2,
                      child: HoverContainer(
                        hoverLimit: 40,
                        child: Image.asset(
                          "assets/person_asset_small_2.png",
                          width: 300.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SKILLS",
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 28.0,
                              height: 1.3,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            "Here is a summary of some of my top skills",
                            style: TextStyle(
                              color: kCaptionColor,
                              height: 1.5,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Column(
                            children: softSkills
                                .map(
                                  (skill) => Container(
                                    margin: EdgeInsets.only(bottom: 15.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: skill.percentage,
                                          child: Container(
                                            padding: EdgeInsets.only(left: 10.0),
                                            alignment: Alignment.centerLeft,
                                            height: 38.0,
                                            child: AutoSizeText(
                                                skill.skill,
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          // remaining (blank part)
                                          flex: 100 - skill.percentage,
                                          child: Divider(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          "${skill.percentage}%",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 75,
              ),
              Text(
                "TECHNOLOGIES",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 28.0,
                  height: 1.3,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                "Here are some technologies I'm most familiar with",
                style: TextStyle(
                  color: kCaptionColor,
                  height: 1.5,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),

              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: width,
                  minWidth: width,
                ),
                child: Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 4,
                      child: _renderTechList(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 75,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: width,
                  minWidth: width,
                ),
                child: Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "FRAMEWORKS",
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 28.0,
                              height: 1.3,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            "Here are a few things I'm most proficient in",
                            style: TextStyle(
                              color: kCaptionColor,
                              height: 1.5,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Column(
                            children: languages
                                .map(
                                  (skill) => Container(
                                margin: EdgeInsets.only(bottom: 15.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: skill.percentage,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 10.0),
                                        alignment: Alignment.centerLeft,
                                        height: 38.0,
                                        child: AutoSizeText(skill.skill),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      // remaining (blank part)
                                      flex: 100 - skill.percentage,
                                      child: Divider(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "${skill.percentage}%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 2,
                      child: HoverContainer(
                        hoverLimit: 40,
                        child: Image.asset(
                          "assets/one_2.png",
                          width: 300.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _renderTechList() {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        ...extraIconAssets.map((e) =>
            HoverContainer(
              hoverLimit: 25,
              child: InkWell(
                onTap: () {
                  launchUrl(Uri.parse(e.item2));
                },
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                      width: 80, height: 80,
                      child: Center(
                        child: Container(
                          width: 50, height: 50,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: ImageIcon(
                              AssetImage("assets/${e.item1}"),
                              color: Colors.grey,
                              size: 10,
                            ),
                          ),
                        ),
                      )
                  ),
                ),
              ),
            )
        ).toList(),

        ...icons.map((e) =>
            HoverContainer(
              hoverLimit: 25,
              child: InkWell(
                onTap: () {
                  launchUrl(Uri.parse(e.item2));
                },
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                      width: 80, height: 80,
                      child: Icon(e.item1, size: 60, color: Colors.grey,)),
                ),
              ),
            )
        ).toList(),
      ],
    );
  }
}
