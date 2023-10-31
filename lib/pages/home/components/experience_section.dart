import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/models/experience.dart';
import 'package:web_portfolio/pages/home/components/shared/bullet_list.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<Experience> experienceList = [
  Experience(
    companyName: "IMPROVING, OTTAWA",
    jobTitle: "DEVOPS ENGINEER",
    period: "May 2022 - Present \t\t|\t\t Toronto, ON",
    points: [
      "Enabled declarative GitOps CD using ArgoCD to configure self healing kubernetes manifests across multiple clusters",
      "Implemented OIDC, SAML and LDAP based SSO for Prometheus, ArgoCD, Opensearch Nexus using Azure AD as the identity provider",
      "Successfully migrated the teams' distributed logging solution to ingest GBs of logs on a daily basis from Elasticsearch to Opensearch using Helm charts and Terraform",
      "Worked with feature teams to introduce shared kustomize packages to avoid code duplication across kubernetes manifests",
      "Identified routes and designed rules to secure network access via Azure Firewall",
      "Worked extensively with Terraform to manage various Azure resources and coordinated with operations teams to perform scheduled production releases",
    ],
    iconPath: "experience/improving.png"
  ),
  Experience(
    companyName: "BILLIE APP",
    jobTitle: "FULL STACK ENGINEER",
    period: "May 2021 - May 2022 \t\t|\t\t Toronto, ON",
    points: [
      "Designed Scala based APIs for key features such as exporting user login data, reconfiguring SSO providers and applying constraints & schedules to booking spaces",
      "Worked on a variety of features in react/react-native such as rendering user avatars on building floorplans, creating modals for various data exports as well as integrating booking schedules into a calendar-like view",
      "Worked on integrating in-app calendar info with user's email calendar using Microsoft/Google Calendar APIs to propagate changes and maintain sync",
      "Configure log based alerts and published them to Slack channels via web hooks for easy visibility into cloud deployments",
      "Worked extensively on maintaining and upgrading the GCP inftrastructure, including updating SSL certificates, maintaining Kubernetes manifests, configuring Kafka clusters as well as keeping CI/CD pipelines up to date",
    ],
    iconPath: "experience/billie.png"
  ),
  Experience(
    companyName: "ASKUITY INC, A DIVISION OF THE HOME DEPOT",
    jobTitle: "SOFTWARE ENGINEER",
    period: "July 2019 - May 2021 \t\t|\t\t Toronto, ON",
    points: [
      "Designed and implemented a reliable and efficient data-pipelin in Kotlin and Elixir to perform ETL on large amounts of POS data",
      "Architected and implemented a database schema & microservice to allow users to create widgets with filters showing a variety of metrics",
      "Developed a novel solution to precache common user requests using Akka streams to speed up response times by 10x",
      "Built REST/GraphQL APIs to retrieve data as well as perform authentication workflows in Scala & Elixir",
      "Created a staging environment on AWS for the development teams and set up CI/CD pipelins for automated deployments to stable code to Kubernetes clusters",
    ],
    iconPath: "experience/askuity.png"
  ),
  Experience(
    companyName: "CAPITAL ONE BANK, CANADA BRANCH",
    jobTitle: "SOFTWARE ENGINEER",
    period: "May 2017 - Dec 2017, May 2018 - Oct 2018 \t\t|\t\t Toronto, ON",
    points: [
      "Saved roughly \$250,000 in potential fraud losses by developing a patented algorithm for real-time fraud detection using graph databases",
      "Released version 1.3 of the Capital One Android app loaded with new features built from the ground up on the play store",
      "Gained immense experience working with a variety of AWS technologies, including RedShift, S3, & EC2 through the deployment of infrastructure using Terraform",
      "Worked on Kafka based Spring microservices to add insolvency specific features to streamline operations and cut costs",
    ],
    iconPath: "experience/capital_one.png"
  ),
  Experience(
    companyName: "INTELLIGENT MECHATRONIC SYSTEMS",
    jobTitle: "MOBILE DEVELOPER",
    period: "Sep 2016 - Dec 2016 \t\t|\t\t Waterloo, ON",
    points: [
      "Designed and implemented the Personal Leaderboards component in the IMS  Android app that allowed users to create personal groups compare trip scores",
      "Attained immense collaboration skills by taking an active role in daily Scrums Agile team tasked with the design, implementation and testing of newly added features before release",
      "Gained experience in incorporating RESTful API network calls into a mobile application in a consistent, robust and self-contained manner",
    ],
    iconPath: "experience/ims.png"
  ),
  Experience(
    companyName: "INTEL CORPORATION, INTEL SECURITY",
    jobTitle: "SOFTWARE DEVELOPER",
    period: "Jan 2016 - Apr 2016 \t\t|\t\t Waterloo, ON",
    points: [
      "Saved 30+ hours/week of collective manual effort by designing a web application using Python/Django to fully automate the generation of quality metrics",
      "Gained immense experience designing dynamic attractive charts & graphs using JavaScript, jQuery, AJAX and Google Charts",
      "Acquired back-end development skills through designing database models, setting up routes & forms and deploying both locally & on the production server",
    ],
    iconPath: "experience/intel.png"
  ),
  Experience(
    companyName: "SAP",
    jobTitle: "SOFTWARE QUALITY ASSURANCE",
    period: "May 2015 - Aug 2015 \t\t|\t\t Waterloo, ON",
    points: [
      "One of two software QAs responsible for performing regression and GUI tests using Python",
      "Attained valuable knowledge regarding writing & documenting test cases for automations",
      "Acquired immense knowledge in writing cross-platform test scripts to be compatible across a variety of different architectures.",
      "Facilitated the verification of bug fixes as well as reported new bugs into the system",
    ],
    iconPath: "experience/sap.png"
  ),
];

class ExperienceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            SizedBox(
              height: 40.0,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  child: Wrap(
                    spacing: 50.0,
                    runSpacing: 50.0,
                    children: experienceList
                    .asMap()
                    .entries
                        .map(
                          (exp) => Align(
                            alignment: exp.key % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
                            child: Container(
                              padding: EdgeInsets.only(left: 30),
                              decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide( //                   <--- right side
                                      color: kPrimaryColor,
                                      width: 3.0,
                                    ),
                                  )
                              ),
                        width: constraints.maxWidth / 1.25 - 20.0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exp.value.companyName,
                                style: GoogleFonts.oswald(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 32.0,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                exp.value.period,
                                style: GoogleFonts.oswald(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    exp.value.jobTitle,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              InlineBulletList(exp.value.points),
                              SizedBox(
                                height: 50.0,
                              ),
                            ],
                        ),
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
