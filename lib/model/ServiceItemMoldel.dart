class ServiceItemModel {
  ServiceItemModel({
    this.name,
    this.description,
    this.srcLogo,
  });

  String name;
  String description;
  String srcLogo;

  factory ServiceItemModel.fromJson(Map<String, dynamic> json) =>
      ServiceItemModel(
        name: json["name"],
        description: json["description"],
        srcLogo: json["srcLogo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "srcLogo": srcLogo,
      };
}
