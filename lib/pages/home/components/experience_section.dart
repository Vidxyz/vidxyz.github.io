import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/models/experience.dart';
import 'package:web_portfolio/pages/home/components/shared/bullet_list.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<Experience> experienceList = [
  Experience(
      companyName: "OKTA",
      jobTitle: "SENIOR SOFTWARE ENGINEER, RELEASE AND CORESERVICES",
      period: "May 2024 - Present \t\t|\t\t Toronto, ON",
      points: [
        "Led the design & implementation of a step registry framework using FastAPI, Airflow, and CircleCI, which serves as CI middleware across different systems",
        "Devised & engineered a system to perform mandatory malware scans on all release candidates, mitigating supply chain attacks & ensuring security compliance",
        "Engineered full-stack self-service workflows (React, FastAPI, Airflow) to automate common user requests, reducing turnaround times from days to minutes",
        "Engineered a company-wide policy enforcer for the enforcement of short-lived Github tokens, revoking those past their deadline and compiling reports for review",
        "Optimized to the core Okta release pipeline, cutting delivery times by 25%",
      ],
      iconPath: "experience/okta.png"
  ),
  Experience(
    companyName: "IMPROVING, OTTAWA",
    jobTitle: "DEVOPS ENGINEER",
    period: "May 2022 - May 2024 \t\t|\t\t Toronto, ON",
    points: [
      "Led the zero-downtime migration of a 50+ GB/day logging platform from Elasticsearch to OpenSearch using Terraform and Helm",
      "Implemented GitOps (CD) with ArgoCD to configure self-healing kubernetes manifests across different clusters",
      "Developed single sign-on SSO solutions for Prometheus, AlertManager, Opensearch, and Nexus using OIDC, SAML and LDAP with Azure AD integration",
      "Introduced kustomize packages to streamline deployments to various environments",
      "Audited routes and designed rules to secure VPC networks using Azure Firewall",
      "Utilized Terraform for Azure resource management and collaborated with operations teams for scheduled production releases",
    ],
    iconPath: "experience/improving.png"
  ),
  Experience(
    companyName: "BILLIE APP",
    jobTitle: "FULL STACK ENGINEER",
    period: "May 2021 - May 2022 \t\t|\t\t Toronto, ON",
    points: [
      "Designed Scala based APIs for key features, including exporting user login data, reconfiguring SSO providers & applying constraints & schedules to booking spaces",
      "Implemented features in react/react-native including rendering user avatars on building floorplans, creating modals for data exports as well as integrating booking schedules into a calendar-like view",
      "Integrated in-app calendar info with user’s email calendar using Microsoft/Google Calendar APIs to ensure bidrectional synchronization of changes",
      "Configured log based alerts and published them to Slack channels via web hooks for easy visibility into cluster services",
      "Managed GCP infrastructure, including updating SSL Certificates, maintaining kubernetes manifests, configuring Kafka clusters and keeping CI/CD pipelines up to date",
    ],
    iconPath: "experience/billie.png"
  ),
  Experience(
    companyName: "ASKUITY INC, A DIVISION OF THE HOME DEPOT",
    jobTitle: "SOFTWARE ENGINEER",
    period: "July 2019 - May 2021 \t\t|\t\t Toronto, ON",
    points: [
      "Designed and implemented a robust and efficient data-pipeline in Kotlin and Elixir to perform ETL on large POS datasets",
      "Architected & implemented a database schema & microservice enabling users to create widgets displaying a variety of metrics",
      "Implemented an innovative solution using Akka streams to precache common user requests resulting in a 10x improvement in response times",
      "Developed REST/GraphQL APIs for data retrieval and authentication workflows in Scala & Elixir",
      "Established a staging environment on AWS for the development teams and configured CI/CD pipelines for automated deployments to Kubernetes clusters",
    ],
    iconPath: "experience/askuity.png"
  ),
  Experience(
    companyName: "CAPITAL ONE BANK, CANADA BRANCH",
    jobTitle: "SOFTWARE ENGINEER",
    period: "May 2017 - Dec 2017, May 2018 - Oct 2018 \t\t|\t\t Toronto, ON",
    points: [
      "Developed a patented algorithm for real-time fraud detection using graph databases, saving approximately \$250,000 in potential fraud losses",
      "Released version 1.3 of the Capital One Android app loaded with new features built from the ground up on the play store",
      "Utilized various AWS technologies like Redshift, S3, & EC2, by deploying infrastructure with Terraform",
      "Implemented insolvency workflow solutions via Kafka based Spring microservices",
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
      "Implemented a web application using Python/Django to fully automate the generation of quality metrics, saving 30+ hours/week of collective manual effort in doing so",
      "Designed and implemented dynamic visuals to indicate key metrics using JavaScript, jQuery, AJAX and Google Charts",
      "Gained experience with Django, Postgres and ORMs through designing database models, setting up routes and deploying to multiple environments",
    ],
    iconPath: "experience/intel.png"
  ),
  Experience(
    companyName: "SAP",
    jobTitle: "SOFTWARE QUALITY ASSURANCE",
    period: "May 2015 - Aug 2015 \t\t|\t\t Waterloo, ON",
    points: [
      "Performed regressions and GUI tests using Python",
      "Wrote handbooks & documented test cases for maintenance and extensibility of automations",
      "Implemented cross-platform scripts to automate test scenarios across different architectures",
      "Verified bug fixes as well as reported new bugs into the system",
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
                          (exp) => Container(
                            margin: EdgeInsets.only(bottom: 40),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 4,
                                  height: 60,
                                  margin: EdgeInsets.only(right: 24),
                                  decoration: BoxDecoration(
                                    gradient: kPrimaryGradient,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
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
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 60,
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.95),
                                                borderRadius: BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: Colors.white.withOpacity(0.3),
                                                  width: 1,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.15),
                                                    blurRadius: 8,
                                                    offset: Offset(0, 4),
                                                  ),
                                                ],
                                              ),
                                              child: Image.asset(
                                                "assets/${exp.value.iconPath}",
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    exp.value.companyName,
                                                    style: GoogleFonts.inter(
                                                      color: kTextPrimary,
                                                      fontWeight: FontWeight.w800,
                                                      fontSize: 28.0,
                                                      letterSpacing: -0.5,
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    exp.value.period,
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
                                        SizedBox(height: 16),
                                        Text(
                                          exp.value.jobTitle,
                                          style: TextStyle(
                                            color: kPrimaryColorLight,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 24),
                                        InlineBulletList(exp.value.points),
                                      ],
                                    ),
                                  ),
                                ),
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
