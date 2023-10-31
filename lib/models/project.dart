class Project {
  final String projectName;
  final String description;
  final String tech;
  final String? appStoreLink;
  final String? playStoreLink;
  final String? websiteLink;
  final String asset;
  final String repoUrl;

  final String platforms;
  final List<String> keyFeatures;

  Project({
      required this.projectName,
      required this.description,
      required this.tech,
      required this.asset,
      required this.platforms,
      this.keyFeatures = const [],
      this.repoUrl = "",
      this.appStoreLink,
      this.playStoreLink,
      this.websiteLink,
  });
}
