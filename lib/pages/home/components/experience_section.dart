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
      jobTitle: "SENIOR SOFTWARE ENGINEER, DEVELOPER FOUNDATIONS",
      period: "May 2024 - Present \t\t|\t\t Toronto, ON",
      points: [
        "Standardized CI solutions across the organization by architecting an extensible step registry platform that replaced fragmented pipelines across different CI systems with a unified middleware",
        "Led the zero-downtime migration of a core authentication service from Falcon to FastAPI by upgrading 100% of the API surface to increase throughput and concurrency without customer impact",
        "Integrated mandatory malware scanning into the core release platform, encoding supply-chain security compliance into the default delivery path without compromising developer velocity",
        "Eliminated a 10-day organizational bottleneck by engineering a self-service artifact promotion model via build-time middleware, decentralizing ownership to product teams for immediate execution",
        "Pitched & engineered a full-stack self-service portal (React/FastAPI/Airflow) that collapsed a multiple day SLO into instant execution, creating an extensible framework now adopted by multiple teams",
        "Engineered a policy enforcement engine to translate high-level security mandates into concrete requirements, migrating the organization to short-lived GitHub tokens at scale"
      ],
      iconPath: "experience/okta.png"
  ),
  Experience(
    companyName: "IMPROVING, OTTAWA",
    jobTitle: "SENIOR DEVOPS ENGINEER",
    period: "May 2022 - May 2024 \t\t|\t\t Toronto, ON",
    points: [
      "Architected a cost-efficient migration of a 50+ GB/day logging platform from Elasticsearch to OpenSearch, utilizing FluentBit to reduce compute overhead & licensing costs",
      "Standardized Kubernetes delivery by implementing ArgoCD GitOps workflows, increasing deployment transparency and velocity across all production clusters",
      "Unified organizational access control by engineering OIDC, SAML, and LDAP integrations for internal portals, fulfilling security mandates through centralized SSO",
      "Decentralized infrastructure management by designing modular Terraform and Kustomize packages, enabling teams to self-serve scalable Azure and AKS resources",
      "Utilized Terraform for Azure resource management and collaborated with operations teams for scheduled production releases",
      "Audited routes and designed rules to secure VPC networks using Azure Firewall",
    ],
    iconPath: "experience/improving.png"
  ),
  Experience(
    companyName: "BILLIE APP",
    jobTitle: "SENIOR FULL STACK ENGINEER",
    period: "May 2021 - May 2022 \t\t|\t\t Toronto, ON",
    points: [
      "Engineered scalable Scala APIs to govern complex authentication workflows, high-volume data exports, and real-time booking constraints",
      "Developed high-interaction UI components in React and React Native, including dynamic floor plans and data-rich schedule views, to improve user engagement",
      "Architected bidirectional calendar synchronization with Google and Microsoft APIs, ensuring seamless scheduling consistency across external and in-app platforms",
      "Orchestrated cloud-native infrastructure across GCP and Kubernetes, managing Kafka clusters and CI/CD pipelines to ensure high availability for core services",
    ],
    iconPath: "experience/billie.png"
  ),
  Experience(
    companyName: "ASKUITY INC, A DIVISION OF THE HOME DEPOT",
    jobTitle: "SOFTWARE ENGINEER",
    period: "July 2019 - May 2021 \t\t|\t\t Toronto, ON",
    points: [
      "Engineered a burstable data pipeline on EKS using Kotlin and Elixir, utilizing SQS message brokering to handle high-concurrency workloads",
      "Architected a metrics microservice that enabled dynamic, user-generated data widgets, expanding the platform’s custom reporting capabilities",
      "Accelerated API performance 10x by implementing an Akka Streams pre-caching solution for high-traffic endpoints",
      "Developed multi-stack REST and GraphQL APIs in Scala and Elixir to handle core authentication and complex CRUD operations at scale",
      "Established a staging environment on AWS for the development teams and configured CI/CD pipelines for automated deployments to Kubernetes clusters",
    ],
    iconPath: "experience/askuity.png"
  ),
  Experience(
    companyName: "CAPITAL ONE BANK, CANADA BRANCH",
    jobTitle: "SOFTWARE ENGINEER",
    period: "May 2017 - Dec 2017, May 2018 - Oct 2018 \t\t|\t\t Toronto, ON",
    points: [
      "Developed a patented algorithm for real-time fraud detection using graph databases, saving an estimated \$250,000 in its pilot program",
      "Engineered event-driven insolvency workflows within a Kafka-based Spring microservice to streamline complex financial processing",
      "Released version 1.3 of the Capital One Android app loaded with new features built from the ground up on the play store",
    ],
    iconPath: "experience/capital_one.png"
  ),
  Experience(
    companyName: "INTELLIGENT MECHATRONIC SYSTEMS",
    jobTitle: "INTERN - MOBILE DEVELOPER",
    period: "Sep 2016 - Dec 2016 \t\t|\t\t Waterloo, ON",
    points: [
      "Designed and implemented the Personal Leaderboards component in the IMS Android app that allowed users to create personal groups compare trip scores",
      "Attained immense collaboration skills by taking an active role in daily Scrums Agile team tasked with the design, implementation and testing of newly added features before release",
      "Gained experience in incorporating RESTful API network calls into a mobile application in a consistent, robust and self-contained manner",
    ],
    iconPath: "experience/ims.png"
  ),
  Experience(
    companyName: "INTEL",
    jobTitle: "INTERN - SOFTWARE DEVELOPER",
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
    jobTitle: "INTERN - SOFTWARE QUALITY ASSURANCE",
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
                                              child: Wrap(
                                                spacing: 12,
                                                runSpacing: 6,
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
